package com.spring.wms.boardDao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.wms.adminBoardDto.AdminBoardDto;
import com.spring.wms.commentDto.CommentDto;
import com.spring.wms.heartDto.HeartDto;

@Repository
public class BoardDaoImpl implements BoardDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<AdminBoardDto> selectBoardList(String boardStatus) {
		return sqlSession.selectList("boardMapper.selectBoardList", boardStatus);
	}

	@Override
	public List<AdminBoardDto> selectAllBoard() {
		return sqlSession.selectList("boardMapper.selectAllBoard");
	}

	@Override
	public AdminBoardDto selectBoardDetail(int boardId) {
		return sqlSession.selectOne("boardMapper.selectBoardDetail", boardId);
	}

	@Override
	public void updateReadCount(int boardId) {
		sqlSession.update("boardMapper.increaseReadCount", boardId);
	}

	@Override
	public HeartDto heartExist(Map<String, Object> heartMap) {
		return sqlSession.selectOne("boardMapper.isHeartExist", heartMap);
	}

	@Override
	public void insertHeart(Map<String, Object> heartMap) {
		sqlSession.insert("boardMapper.insertHeart", heartMap);
	}

	@Override
	public void deleteHeart(Map<String, Object> heartMap) {
		sqlSession.delete("boardMapper.deleteHeart", heartMap);
	}

	@Override
	public void plusHeart(Map<String, Object> heartMap) {
		sqlSession.update("boardMapper.plusHeart", heartMap);
	}

	@Override
	public void minusHeart(Map<String, Object> heartMap) {
		sqlSession.update("boardMapper.minusHeart", heartMap);
	}

	@Override
	public List<AdminBoardDto> selectViewBoard() {
		return sqlSession.selectList("boardMapper.selectViewBoard");
	}

	@Override
	public List<AdminBoardDto> selectLikeBoard() {
		return sqlSession.selectList("boardMapper.selectLikeBoard");
	}

	@Override
	public List<Map<String, Object>> selectAllComment(int boardId) {
		return sqlSession.selectList("boardMapper.selectAllComment", boardId);
	}

	@Override
	public void addComment(CommentDto commentDto) {
		sqlSession.insert("boardMapper.insertComment", commentDto);
	}

	@Override
	public List<AdminBoardDto> selectBoardLike(String memberId) {
		return sqlSession.selectList("boardMapper.selectBoardLike", memberId);
	}
	
	
}
