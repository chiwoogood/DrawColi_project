package kr.spring.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import kr.spring.entity.File;
import kr.spring.service.FileService;

@Controller
@RequestMapping("board/*")
public class BoardController {
   
   @Autowired
    private FileService fileService;

   
   @GetMapping("/gallery")
   public String gallery() {
      return "board/gallery";
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
   
   
}