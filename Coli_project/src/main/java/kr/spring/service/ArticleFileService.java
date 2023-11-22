package kr.spring.service;

import org.springframework.stereotype.Service;

import kr.spring.entity.ArticleFile;

@Service
public interface ArticleFileService {

	void save(ArticleFile articleFile);

}