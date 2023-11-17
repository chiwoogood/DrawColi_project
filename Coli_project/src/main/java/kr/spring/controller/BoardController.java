package kr.spring.controller;

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
        // 파일 업로드 및 DB에 저장 로직 추가
        // File 엔티티를 생성하고 파일 정보를 저장
        File fileEntity = new File();
        // 여기에서 필요한 파일 정보를 File 엔티티에 설정
        // fileEntity.setFilePath("your_file_path");
        // fileEntity.setFileSize(your_file_size);
        // fileEntity.setFileExt("your_file_extension");
        fileService.save(fileEntity); // FileService를 통해 파일 정보를 저장
        return "업로드가 완료되었습니다.";
    }
   
   
}