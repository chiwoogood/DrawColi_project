package kr.spring.service;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.spring.entity.ArticleFile;

@Service
public interface ArticleFileService {

   void save(ArticleFile articleFile);
   
   void upload(ArticleFile articleFile, MultipartFile file);

}