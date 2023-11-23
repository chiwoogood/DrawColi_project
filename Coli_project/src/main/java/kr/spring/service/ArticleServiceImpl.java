 package kr.spring.service;

import java.util.List;
import java.util.Optional;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import kr.spring.entity.Article;
import kr.spring.entity.Member;
import kr.spring.repository.ArticleRepository;
import kr.spring.repository.MemberRepository;


@Service
public class ArticleServiceImpl implements ArticleService{

   @Autowired
   private ArticleRepository articleRepository;
   
   @Autowired
   private MemberRepository memberRepository;
   
   @Override
   public List<Article> getList() {
      List<Article> list = articleRepository.findAll();
      return list;
   }
   
   @Override
   public Article getArticleById(Long id) {
       // 특정 ID에 해당하는 Article 조회
       return articleRepository.findById(id).orElse(null);
   }   

   @Override
   public void register(Article vo) {
       String username = SecurityContextHolder.getContext().getAuthentication().getName();
       System.out.println("현재 사용자의 username: " + username);
       Member writer = memberRepository.findById(username).orElse(null);
       vo.setWriter_id(writer);
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
   public void modify(Article vo) {


      articleRepository.save(vo);
   }
   
   @Override
   public Article Detail(long atc_id) {
       // 게시글 정보를 데이터베이스에서 가져오는 로직
       return articleRepository.findById(atc_id).orElse(null);
   }

}

