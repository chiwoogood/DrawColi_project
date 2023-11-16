package kr.spring.service;

import kr.spring.entity.Member;
import kr.spring.exception.PasswordNotMatchException;

public interface MemberService {
    boolean join(Member vo) throws PasswordNotMatchException;
    
    boolean login(Member vo);
    
    boolean modify(Member vo) throws PasswordNotMatchException;
    
    boolean isPasswordMatch(String password, String passwordConfirmation);
    
    
}
