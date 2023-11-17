package kr.spring.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;

import lombok.Data;
import lombok.ToString;

import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
@ToString
@Data

public class File {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long file_id;
	
	@ManyToOne
	@JoinColumn(name = "atc_idx", referencedColumnName = "atc_id")
	private Article atc_idx; // Article을 참조하는 외래키
	
	private String file_path; //파일 경로

	private String file_ext; //파일 확장자
	
	
}
