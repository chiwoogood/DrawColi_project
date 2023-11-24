package kr.spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;


import kr.spring.entity.Article;
import kr.spring.entity.ArticleFile;
import kr.spring.service.ArticleFileService;
import kr.spring.service.ArticleService;
import kr.spring.service.CommentService;

import java.io.File;



import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;

import org.springframework.util.FileCopyUtils;

import org.springframework.web.multipart.MultipartFile;


import kr.spring.entity.Member;


import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;



@Controller
@RequestMapping("board/*")
public class BoardController {
   

   @Autowired
   private ArticleService articleService;
   
   @Autowired
   private ArticleFileService articleFileService;
   
   @Autowired 
   private CommentService commentService;
    
   @PostMapping("/upload")
   @ResponseBody
   public ResponseEntity<String> uploadFiles(@RequestParam("files") List<MultipartFile> files,
           @RequestParam("articleId") Long articleId) {
       try {
           // 글 ID를 이용하여 ArticleFile 객체에 연결
           Article article = new Article();
           article.setAtc_id(articleId);

           for (MultipartFile file : files) {
               ArticleFile articleFile = new ArticleFile();
               articleFile.setAtc_idx(article);
               articleFile.setFile_size(file.getSize());
               articleFile.setFile_ext(getFileExtension(file.getOriginalFilename()));

               // 파일 저장 경로 설정
               String uploadDir = "C:\\ColiFileDirectory\\"; // 로컬에 저장될 디렉터리 경로

               // 실제 파일 저장 로직
               String fileName = articleFile.getAtc_idx().getAtc_id() + "_" + System.currentTimeMillis() + "." + articleFile.getFile_ext();
               String filePath = uploadDir + fileName;
               File dest = new File(filePath);
               FileCopyUtils.copy(file.getBytes(), dest);

               articleFile.setFile_path(filePath);
               articleFileService.upload(articleFile, file);
           }

           return new ResponseEntity<>("success", HttpStatus.OK);
       } catch (Exception e) {
           e.printStackTrace();
           return new ResponseEntity<>("error", HttpStatus.INTERNAL_SERVER_ERROR);
       }
   }
   
   private String getFileExtension(String originalFilename) {
       int dotIndex = originalFilename.lastIndexOf('.');
       return (dotIndex == -1) ? "" : originalFilename.substring(dotIndex + 1).toLowerCase();
   }

   
   @GetMapping("/boardform")
   public String boardform() {
	   return "board/boardform";
   }
   
   @PostMapping("/register")
   @ResponseBody
   public ResponseEntity<Long> register(@ModelAttribute Article vo) {
      // 현재 로그인한 사용자의 아이디 가져오기
       String writerId = getCurrentUserId();

       // vo에 writerId 설정
       Member member = new Member();
       member.setUsername(writerId);
       vo.setWriter_id(member);

       // 글 등록
       Long articleId = articleService.register(vo);

       // 글 ID를 반환
       return new ResponseEntity<>(articleId, HttpStatus.OK);
   }
   
   private String getCurrentUserId() {
       Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
       if (authentication.getPrincipal() instanceof UserDetails) {
           UserDetails userDetails = (UserDetails) authentication.getPrincipal();
           return userDetails.getUsername(); // 사용자 아이디 반환
       }
       return null;
   }

   
   @PostMapping("/remove")
   public String remove(@RequestParam("atc_id")long atc_id) {
	   articleService.delete(atc_id);
	   return "redirect:/board/gallery";
   }
   
   @GetMapping("/modify")
   public String modify(@RequestParam("atc_id") long atc_id, Model model) {
       // GET 요청으로 변경된 내용을 처리하는 코드를 작성
       Article article = articleService.Detail(atc_id);
       model.addAttribute("article", article);
       return "board/modifyform";
   }

   
   
   @PostMapping("/modify")
   public String modify(@RequestParam("atc_id")long atc_id, Article vo) {
	    Article existingArticle = articleService.findById(atc_id);
	    if (existingArticle != null) {
	        // existingArticle에 vo의 변경사항 적용
	        existingArticle.setAtc_title(vo.getAtc_title());
	        existingArticle.setAtc_content(vo.getAtc_content());
	        // 기타 필요한 필드도 여기서 설정

	        articleService.modify(existingArticle);
	        return "redirect:/board/detail/" + atc_id;
	    } else {
	        // 해당 ID의 Article이 없을 경우의 처리
	        return "board/errorPage";
	    }
   }
   
   @PostMapping("/articleFileUpload")
   public String articleFileUpload(ArticleFile articleFile) {
//	   articleFileService.save(articleFile);
	   return "";
   }
   
   @GetMapping("/gallery")
   public String gallery(Model model) {
       // 게시물 목록을 가져오는 로직
       List<Article> articles = articleService.getList();
       model.addAttribute("articles", articles);

       return "board/gallery";
   }

   
   @GetMapping("/detail/{atc_id}")
   public String detail(@PathVariable long atc_id, Model model) {
       // GET 요청으로 변경된 내용을 처리하는 코드를 작성
       Article article = articleService.Detail(atc_id);
       model.addAttribute("article", article); 
       return "board/detail";
   }
   
   @PostMapping("/commentRegister")
   public @ResponseBody void commentRegister(@RequestParam("atc_id") long atc_id, @RequestParam("comment_content") String comment_content) {
	      // 현재 로그인한 사용자의 아이디 가져오기
	   System.out.println(atc_id+ "아이디");   
	   System.out.println(comment_content+"내용");
	   
       Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
       String username = authentication.getName(); // 현재 로그인한 사용자의 아이디 가져오기   
	   
       System.out.println(username);
       commentService.saveComment(atc_id, comment_content, username);   
       
   }
   
}