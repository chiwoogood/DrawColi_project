package kr.spring.service;

import java.util.List;

import kr.spring.entity.Article;

public interface ArticleService {
   
   public List<Article> getList(); // 게시글 전체조회
   
   public void register(Article vo); // 게시글 등록

   public Article get(Long atc_id);

   public void delete(Long atc_id);

   public void update(Article vo);
   
}