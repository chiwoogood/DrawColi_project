package kr.spring.entity;

import java.time.LocalDateTime;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;

import lombok.Data;
import lombok.ToString;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.PrePersist;

@Entity
@ToString
@Data
public class Article {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long atc_id;
	
	@Column(length = 30)
	private String atc_title;
	
	private String atc_content;
	
	private LocalDateTime created_at;
	
	@PrePersist
	protected void onCreate() {
	    created_at = LocalDateTime.now();
	}
	
	@ManyToOne
	@JoinColumn(name = "writer_id", referencedColumnName = "username")
	private Member writer_id;

}
