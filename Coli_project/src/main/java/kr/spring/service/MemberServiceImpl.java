package kr.spring.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import kr.spring.entity.Member;
import kr.spring.exception.PasswordNotMatchException;
import kr.spring.repository.MemberRepository;

@Service
public class MemberServiceImpl implements MemberService {

    @Autowired
    private MemberRepository memberRepository;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Override
    public boolean join(Member vo) throws PasswordNotMatchException {
        if (isPasswordMatch(vo.getPassword(), vo.getPasswordConfirmation())) {
            String encPw = vo.getPassword();
            vo.setPassword(passwordEncoder.encode(encPw));
            memberRepository.save(vo);
            return true;  // 가입 성공
        } else {
            throw new PasswordNotMatchException("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
        }
    }

    @Override
    public boolean login(Member vo) {
        Member existingMember = memberRepository.findById(vo.getUsername()).orElse(null);

        return existingMember != null && passwordEncoder.matches(vo.getPassword(), existingMember.getPassword());
    }

    @Override
    public boolean modify(Member vo) throws PasswordNotMatchException {
        if (!isPasswordMatch(vo.getPassword(), vo.getPasswordConfirmation())) {
            throw new PasswordNotMatchException("비밀번호가 일치하지 않습니다.");
        }
        Member existingMember = memberRepository.findById(vo.getUsername()).orElse(null);

        if (existingMember == null) {
            return false; // 회원 정보가 존재하지 않는 경우
        }

        // 기존 회원 정보 업데이트
        existingMember.setPassword(passwordEncoder.encode(vo.getPassword()));
        existingMember.setPhone(vo.getPhone());
        existingMember.setEmail(vo.getEmail());
        existingMember.setNickname(vo.getNickname());

        memberRepository.save(existingMember);
        return true;
    }


    @Override
    public boolean isPasswordMatch(String password, String passwordConfirmation) {
        return password.equals(passwordConfirmation);
    }
    

}