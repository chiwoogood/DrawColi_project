package kr.spring.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import kr.spring.entity.Member;
import kr.spring.repository.MemberRepository;

@Service
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	private MemberRepository memberRepository;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@Override
	public void join(Member vo) {
		String encPw = vo.getPassword();
		vo.setPassword(passwordEncoder.encode(encPw));
		memberRepository.save(vo);
	}
	
	@Override
	public void update(Member vo) {
        Member existingMember = memberRepository.findById(vo.getUsername()).orElse(null);

        if (existingMember != null) {
            // 업데이트할 필드 설정
            existingMember.setPassword(vo.getPassword());
            existingMember.setPhone(vo.getPhone());
            existingMember.setEmail(vo.getEmail());
            existingMember.setNickname(vo.getNickname());

            // 기타 필요한 업데이트 로직 추가

            // 저장
            memberRepository.save(existingMember);
	}
	
}
}
