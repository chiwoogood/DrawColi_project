package kr.spring.controller;

import java.io.IOException;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import kr.spring.entity.Article;
import kr.spring.service.ArticleService;
import kr.spring.service.FileService;

@Controller
@RequestMapping("board/*")
public class BoardController {
   
   @Autowired
    private FileService fileService;
   
   @Autowired
   private ArticleService articleService;
   
   @GetMapping("/mygallery/{username}")
   public String userGallery(@PathVariable String username, Model model) {
       List<String> imageFiles = fileService.listFilesForUser(username); // 사용자별 파일 목록 가져오기
       model.addAttribute("imageFiles", imageFiles);
       model.addAttribute("username", username);

       return "member/mygallery"; // mygallery.jsp 뷰 반환
   }


   
   @PostMapping("/upload")
   public String handleFileUpload(@RequestParam("file") MultipartFile file, @RequestParam("username") String username) {
       if (file.isEmpty()) {
           return "업로드할 파일을 선택해주세요.";
       } 
       try {
           fileService.saveFile(file,username);
           return "member/mygallery";
       } catch (IOException e) {
           e.printStackTrace();
           return "member/mygallery";
       }
   }
   
   @GetMapping("/boardform")
   public String boardform() {
	   return "board/boardform";
   }
   
   @PostMapping("/register")
   public String register(Article vo) {
	   articleService.register(vo);
	   return "redirect:/board/gallery";
   }
   
   @GetMapping("/remove")
   public String remove(@RequestParam("atc_id")long atc_id) {
	   articleService.delete(atc_id);
	   return "redirect:/board/gallery";
   }
   
   @PostMapping("/modify")
   public String modify(Article vo) {
	   articleService.modify(vo);
	   return "redirect:/board/gallery";
   }
   
}