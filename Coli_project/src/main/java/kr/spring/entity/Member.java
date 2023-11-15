package kr.spring.entity;

import java.time.LocalDate;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.Id;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import lombok.Data;
import lombok.ToString;

@Entity
@Data
@ToString
public class Member {
	
	@Id
	private String username; // Spring Sequrity에서는 id가 아닌 username으로 지정
	private String password; // Spring Sequrity에서는 pw가 아닌 password로 지정
	private String name; 
	
	@Enumerated(EnumType.STRING) // Enumerated -> 열거형 (권한이 여러개이기 때문에)ㄴ
	private Role role; // 권한정보
	
	private String nickname; // 이름
	private LocalDate birth;
	private String email;
	private int phone;
	
	@Temporal(TemporalType.TIMESTAMP)
	private Date uploaded_at;
	
}
