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


@Controller
@RequestMapping("board/*")
public class BoardController {
   

   @Autowired
   private ArticleService articleService;
   
   @Autowired
   private ArticleFileService articleFileService;
    
   @PostMapping("/upload")
   public String Upload() {
	   return "member/mygallery";
   }
   
   @GetMapping("/boardform")
   public String boardform() {
	   return "board/boardform";
   }
   
   @PostMapping("/register")
   public String register(Article vo) {
	   articleService.register(vo);
	   System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@" + vo);
	   return "member/mypage";
   }
   
   @PostMapping("/remove")
   public String remove(@RequestParam("atc_id")long atc_id) {
	   articleService.delete(atc_id);
	   return "redirect:/board/gallery";
   }
   
   @GetMapping("/modify/{atc_id}")
   public String modify() {
	   return "board/modifyform";
   }
   
   
   @PostMapping("/modify")
   public String modify(@RequestParam("atc_id")long atc_id, Article vo) {
	   articleService.modify(vo);
	   return "board/detail";
   }
   
   @PostMapping("/articleFileUpload")
   public String articleFileUpload(ArticleFile articleFile) {
//	   articleFileService.save(articleFile);
	   return "";
   }
   
   @GetMapping("/gallery")
   public String getAllArticles(Model model) {
       // 모든 유저가 작성한 article을 가져오기
       List<Article> allArticles = articleService.getList();
       model.addAttribute("allArticles", allArticles);
       
       return "board/gallery"; // "gallery"라는 뷰 페이지로 이동하여 모든 article 정보를 출력
   }
   
   @GetMapping("/detail/{atc_id}")
   public String detail(@PathVariable long atc_id, Model model) {
       // GET 요청으로 변경된 내용을 처리하는 코드를 작성
       Article article = articleService.Detail(atc_id);
       model.addAttribute("article", article); 
       return "board/detail";
   }

   
}