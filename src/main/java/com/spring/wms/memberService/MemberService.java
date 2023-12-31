package com.spring.wms.memberService;

import java.util.Map;

import com.spring.wms.memberDto.MemberDto;

public interface MemberService {
	
	public MemberDto loginMember(Map<String,String> loginMap) throws Exception;
	public void joinMember(MemberDto memberDto);
	public String overlapped(String memberId) throws Exception; 
	public String overlappedNickname(String nickname) throws Exception; 

}
