package com.spring.wms.memberDao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.wms.memberDto.MemberDto;

@Repository
public class MemberDaoImpl implements MemberDao {
	
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public MemberDto login(Map<String,String> loginMap) throws Exception{
		return sqlSession.selectOne("memberMapper.loginMember", loginMap);
	}

	@Override
	public void insertMember(MemberDto memberDto) {
		sqlSession.insert("memberMapper.joinMember", memberDto);
	}

	@Override
	public MemberDto overlapped(String memberId) throws Exception {
		return sqlSession.selectOne("memberMapper.duplicatedMemberCheck", memberId);
	}

	@Override
	public MemberDto overlappedNickname(String nickname) throws Exception {
		return sqlSession.selectOne("memberMapper.duplicatedMemberNicknameCheck", nickname);
	}

}
