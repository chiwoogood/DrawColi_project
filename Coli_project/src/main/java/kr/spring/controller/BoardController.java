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
   
   @PostMapping("/articleFileUpload")
   public String articleFileUpload(ArticleFile articleFile) {
//	   articleFileService.save(articleFile);
	   return "";
   }
   
   @RequestMapping("/gallery")
   public String gallery() {
	   return "board/gallery";
   }
   
   @GetMapping("/detail/{atc_id}")
   public String detail(@PathVariable long atc_id, Model model) {
	   
//   
	   Article article = articleService.Detail(atc_id);
	   model.addAttribute("article", article); 
	  
//	   
//	   List<ArticleFile> articleFiles = articleFileService.getArticleFiles(atc_id);
//	   

//	   model.addAttribute("articleFiles", articleFiles);
	   return "board/detail";
   }
   
}