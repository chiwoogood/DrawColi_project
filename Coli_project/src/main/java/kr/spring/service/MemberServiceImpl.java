package kr.spring.service;

import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Date;

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
            vo.setCreated_at(convertToDate(vo.getBirth()));
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
    public void update(Member vo) {
        Member existingMember = memberRepository.findById(vo.getUsername()).orElse(null);

        if (existingMember != null) {
            existingMember.setPassword(passwordEncoder.encode(vo.getPassword()));
            existingMember.setPhone(vo.getPhone());
            existingMember.setEmail(vo.getEmail());
            existingMember.setNickname(vo.getNickname());

            // 기타 필요한 업데이트 로직 추가

            // 저장
            memberRepository.save(existingMember);
        }
    }

    @Override
    public boolean isPasswordMatch(String password, String passwordConfirmation) {
        return password.equals(passwordConfirmation);
    }

    // LocalDate를 Date로 변환하는 메서드
    private Date convertToDate(LocalDate localDate) {
        return Date.from(localDate.atStartOfDay(ZoneId.systemDefault()).toInstant());
    }
}