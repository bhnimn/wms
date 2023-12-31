package com.spring.wms.boardService;

import java.util.List;
import java.util.Map;

import com.spring.wms.adminBoardDto.AdminBoardDto;
import com.spring.wms.commentDto.CommentDto;

public interface BoardService {
	
	public List<AdminBoardDto> listBoard(String boardStatus);
	public List<AdminBoardDto> allBoard();
	public AdminBoardDto boardDetail(int boardId);
	public String heartExist (Map<String, Object> heartMap);
	public void heartAdd (Map<String, Object> heartMap);
	public void heartErase (Map<String, Object> heartMap);
	public List<AdminBoardDto> viewBoard();
	public List<AdminBoardDto> likeBoard();
	public List<Map<String, Object>> allComment(int boardId);
	public void writeComment (CommentDto commentDto);
	public List<AdminBoardDto> boardLike(String memberId);
}
