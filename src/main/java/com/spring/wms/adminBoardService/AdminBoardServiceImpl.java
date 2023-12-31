package com.spring.wms.adminBoardService;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.wms.adminBoardDao.AdminBoardDao;
import com.spring.wms.adminBoardDto.AdminBoardDto;

@Service
public class AdminBoardServiceImpl implements AdminBoardService {
	
	@Autowired
	private AdminBoardDao adminBoardDao;
	
	@Override
	public void addNewBoard(AdminBoardDto adminBoardDto) {
		adminBoardDao.insertNewBoard(adminBoardDto);
	}

	@Override
	public List<AdminBoardDto> listBoard() {
		return adminBoardDao.selectNewBoard();
	}

	@Override
	public void deleteBoard(int boardId) {
		adminBoardDao.deleteBoard(boardId);
	}


}
