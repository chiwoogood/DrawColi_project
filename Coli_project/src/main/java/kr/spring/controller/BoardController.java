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
   @ResponseBody
   public String handleFileUpload(@RequestParam("file") MultipartFile file) {
       if (file.isEmpty()) {
           return "업로드할 파일을 선택해주세요.";
       }
       try {
           fileService.saveFile(file);
           return "업로드가 완료되었습니다.";
       } catch (IOException e) {
           e.printStackTrace();
           return "파일 업로드 중 오류가 발생했습니다.";
       }
   }
   
   
}