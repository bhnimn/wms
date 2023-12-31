package com.spring.wms.memberDao;

import java.util.Map;

import com.spring.wms.memberDto.MemberDto;

public interface MemberDao {
	
	public MemberDto login(Map<String,String> loginMap) throws Exception;
	public void insertMember(MemberDto memberDto);
	public MemberDto overlapped(String memberId) throws Exception;
	public MemberDto overlappedNickname(String nickname) throws Exception;

}
