package com.spring.wms.adminBoardDao;

import java.util.List;

import com.spring.wms.adminBoardDto.AdminBoardDto;

public interface AdminBoardDao {
	
	public void insertNewBoard(AdminBoardDto adminBoardDto);
	public List<AdminBoardDto> selectNewBoard();
	public void deleteBoard(int boardId);
}
