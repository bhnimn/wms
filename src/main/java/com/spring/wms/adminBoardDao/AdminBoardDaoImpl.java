package com.spring.wms.adminBoardDao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.wms.adminBoardDto.AdminBoardDto;

@Repository
public class AdminBoardDaoImpl implements AdminBoardDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void insertNewBoard(AdminBoardDto adminBoardDto) {
		sqlSession.insert("adminBoardMapper.insertNewBoard", adminBoardDto);
	}

	@Override
	public List<AdminBoardDto> selectNewBoard() {
		return sqlSession.selectList("adminBoardMapper.selectNewBoard");
	}

	@Override
	public void deleteBoard(int boardId) {
		sqlSession.delete("adminBoardMapper.deleteBoard", boardId);
	}


}
