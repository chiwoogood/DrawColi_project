package kr.spring.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.PrePersist;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import java.time.LocalDateTime;
import java.util.Date;

import lombok.Data;
import lombok.ToString;
@Entity
@Data
@ToString

public class Comment {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long cmt_id;
	
	@ManyToOne
    @JoinColumn(name = "atc_idx", referencedColumnName = "atc_id") // 외래키 설정, tb_article 테이블을 참조
    private Article atc_idx;
	

	private String cmt_content;
	
	private LocalDateTime created_at;

	@PrePersist
	protected void onCreate() {
	    created_at = LocalDateTime.now();
	}
    
	@ManyToOne
    @JoinColumn(name = "user_id", referencedColumnName = "username") // 외래키 설정, Member 테이블의 username을 참조
    private Member user_id;
}
