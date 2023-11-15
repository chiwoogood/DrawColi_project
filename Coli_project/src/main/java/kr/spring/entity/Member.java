package kr.spring.entity;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
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
	private String username; // Spring Security에서는 id가 아닌 username으로 지정
	private String password; // Spring Security에서는 pw가 아닌 password로 지정
	private String name; 
	
	@Enumerated(EnumType.STRING)
	private Role role; // 권한정보
	
	private String nickname; // 이름
	private LocalDate birth;
	private String email;
	private String phone;
	
	@Temporal(TemporalType.TIMESTAMP)
	private Date created_at;
	
	private String passwordConfirmation; // 비밀번호 확인용 필드
	
    public void setBirth(String birth) {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        this.birth = LocalDate.parse(birth, formatter);
    }
    
    public Member() {
    	this.role = Role.FREE;
    }
	
}
