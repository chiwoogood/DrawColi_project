 package kr.spring.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.spring.entity.Article;

import kr.spring.repository.ArticleRepository;


@Service
public class ArticleServiceImpl implements ArticleService{

   @Autowired
   private ArticleRepository articleRepository;
   
   @Override
   public List<Article> getList() {
      List<Article> list = articleRepository.findAll();
      return list;
   }

   @Override
   public void register(Article vo) {
      articleRepository.save(vo);
   }

   @Override
   public Article get(Long atc_id) {
      Optional<Article> vo = articleRepository.findById(atc_id);
      return vo.get();
   }

   @Override
   public void delete(Long atc_id) {
      articleRepository.deleteById(atc_id);
   }

   @Override
   public void update(Article vo) {
      // JPA -> sava메소드는
      // 새로운 pk값 또는 없는 값이 들어온다면 insert 기능을
      // 기존에 존재하는 pk값이 들어온다면 update 기능을
      articleRepository.save(vo);
   }

}

