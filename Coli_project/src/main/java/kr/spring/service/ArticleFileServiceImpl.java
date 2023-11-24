 package kr.spring.service;

import java.io.File;
import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import kr.spring.entity.ArticleFile;
import kr.spring.repository.ArticleFileRepository;

@Service
public class ArticleFileServiceImpl implements ArticleFileService {
   
   @Autowired
      private ArticleFileRepository articlefileRepository;
   
   @Override
    @Transactional
    public void upload(ArticleFile articleFile, MultipartFile file) {
        // 파일 저장 경로 설정
        String uploadDir = "C:\\ColiFileDirectory\\"; // 로컬에 저장될 디렉터리 경로

        // 실제 파일 저장 로직
        String fileName = articleFile.getAtc_idx().getAtc_id() + "_" + System.currentTimeMillis() + "." + articleFile.getFile_ext();
        String filePath = uploadDir + fileName;
        File dest = new File(filePath);
        try {
            file.transferTo(dest); // 파일을 서버에 저장
            articleFile.setFile_path(filePath);
            
            // 데이터베이스에 파일 정보 저장
            articlefileRepository.save(articleFile);
        } catch (IOException e) {
            e.printStackTrace();
            throw new RuntimeException("Failed to store file", e);
        }
    }
   
   @Override
   public void save(ArticleFile articleFile) {
      // TODO Auto-generated method stub
      
   }

 }