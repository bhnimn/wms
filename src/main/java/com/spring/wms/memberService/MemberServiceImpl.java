package com.spring.wms.memberService;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.spring.wms.memberDao.MemberDao;
import com.spring.wms.memberDto.MemberDto;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	@Override
	public MemberDto loginMember(Map<String,String> loginMap) throws Exception{
		
		MemberDto memberDto = memberDao.login(loginMap);

		if (memberDto != null) {
			if (passwordEncoder.matches(loginMap.get("memberPw") , memberDto.getMemberPw())) {
				return memberDto;
			}
		}
		
		return null;
		
	}

	@Override
	public void joinMember(MemberDto memberDto) {
		memberDto.setMemberPw(passwordEncoder.encode(memberDto.getMemberPw())); 
		memberDao.insertMember(memberDto);		
	}

	@Override
	public String overlapped(String memberId) throws Exception {
		String isOverLapped = "true";
		
		if (memberDao.overlapped(memberId) == null) {
			return "false";
		}
		
		return isOverLapped;
	}

	@Override
	public String overlappedNickname(String nickname) throws Exception {
		String isOverLapped = "true";
		
		if (memberDao.overlappedNickname(nickname) == null) {
			return "false";
		}
		
		return isOverLapped;
	}

}
