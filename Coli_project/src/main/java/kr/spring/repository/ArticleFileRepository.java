package kr.spring.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import kr.spring.entity.ArticleFile;

@Repository
public interface ArticleFileRepository extends JpaRepository<ArticleFile, Long>{
	
}
