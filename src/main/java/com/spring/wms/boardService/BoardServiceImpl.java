package com.spring.wms.boardService;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.wms.adminBoardDto.AdminBoardDto;
import com.spring.wms.boardDao.BoardDao;
import com.spring.wms.commentDto.CommentDto;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private BoardDao boardDao;
	
	@Override
	public List<AdminBoardDto> listBoard(String boardStatus) {
		return boardDao.selectBoardList(boardStatus);
	}

	@Override
	public List<AdminBoardDto> allBoard() {
		return boardDao.selectAllBoard();
	}

	@Override
	public AdminBoardDto boardDetail(int boardId) {
		boardDao.updateReadCount(boardId);
		return boardDao.selectBoardDetail(boardId);
	}

	@Override
	public String heartExist(Map<String, Object> heartMap) {
		String isHeartExist = "true";
		
		if (boardDao.heartExist(heartMap) == null) {
			return "false";
		}
		
		return isHeartExist;
	}

	@Override
	public void heartAdd(Map<String, Object> heartMap) {
		boardDao.insertHeart(heartMap);
		boardDao.plusHeart(heartMap);
	}

	@Override
	public void heartErase(Map<String, Object> heartMap) {
		boardDao.deleteHeart(heartMap);
		boardDao.minusHeart(heartMap);
	}

	@Override
	public List<AdminBoardDto> viewBoard() {
		return boardDao.selectViewBoard();
	}

	@Override
	public List<AdminBoardDto> likeBoard() {
		return boardDao.selectLikeBoard();
	}

	@Override
	public List<Map<String, Object>> allComment(int boardId) {
		return boardDao.selectAllComment(boardId);
	}

	@Override
	public void writeComment(CommentDto commentDto) {
		boardDao.addComment(commentDto);
	}

	@Override
	public List<AdminBoardDto> boardLike(String memberId) {
		return boardDao.selectBoardLike(memberId);
	}

}
