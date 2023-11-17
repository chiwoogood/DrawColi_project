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

public class File {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long file_id;
	
	@ManyToOne
	@JoinColumn(name = "atc_idx", referencedColumnName = "atc_id")
	private Article atc_idx;
	
	private String file_path;

	private String file_ext;
	
	@Column(insertable = false, updatable = false, columnDefinition = "datetime default now()")
	@Temporal(TemporalType.TIMESTAMP)
	private Date uploaded_at;
	
}
