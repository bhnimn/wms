package com.spring.wms.adminBoardService;

import java.util.List;

import com.spring.wms.adminBoardDto.AdminBoardDto;

public interface AdminBoardService {
	
	public void addNewBoard(AdminBoardDto adminBoardDto);
	public List<AdminBoardDto> listBoard();
	public void deleteBoard(int boardId);
}
