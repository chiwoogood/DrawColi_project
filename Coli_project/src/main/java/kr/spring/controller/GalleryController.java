package kr.spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.spring.entity.Article;
import kr.spring.service.ArticleService;

@Controller
@RequestMapping("/gallery/*")
public class GalleryController {
   
   @Autowired
   private ArticleService articleService;
   
   @RequestMapping("/list")
   public String list(Model model) { // 게시글 전체조회 
      List<Article> list = articleService.getList();
      model.addAttribute("list", list);
      return "gallery/list";
   }
   
   @PostMapping("/register")
   public String register(Article vo) {
      articleService.register(vo);
      return "redirect:/gallery/list";
   }
   
   @GetMapping("/get")
   public @ResponseBody Article get(@RequestParam("idx") Long idx) {
      Article vo = articleService.get(idx);
      return vo;
   }
   
   @GetMapping("/remove")
   public String remove(@RequestParam("atc_id") Long idx) {
      articleService.delete(idx);
      return "redirect:/gallery/list";
   }
   
   @PostMapping("/modify")
   public String modify(Article vo) {
      articleService.update(vo);
      return "redirect:/gallery/list";
   }
   
   
}






