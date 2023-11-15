package kr.spring.service;

import kr.spring.entity.Member;
import kr.spring.exception.PasswordNotMatchException;

public interface MemberService {
    boolean join(Member vo) throws PasswordNotMatchException;
    boolean login(Member vo);
    void update(Member vo);
    boolean isPasswordMatch(String password, String passwordConfirmation);
}
