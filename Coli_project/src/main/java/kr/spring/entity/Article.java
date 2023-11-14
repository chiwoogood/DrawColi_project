package kr.spring.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;

import lombok.Data;
import lombok.ToString;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

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
	
	@Column(insertable = false, updatable = false, columnDefinition = "datetime default now()")
	@Temporal(TemporalType.TIMESTAMP)
	private Date created_at;
	
	@Column(insertable = false, updatable = false, columnDefinition = "datetime default now()")
	@Temporal(TemporalType.TIMESTAMP)
	private Date updated_at;
	
	@ManyToOne
	@JoinColumn(name = "user_id")
	private Member user_id;
	
	private int atc_views;
	private int atc_likes;
	
	
}
