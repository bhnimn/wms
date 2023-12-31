package com.spring.wms.boardDao;

import java.util.List;
import java.util.Map;

import com.spring.wms.adminBoardDto.AdminBoardDto;
import com.spring.wms.commentDto.CommentDto;
import com.spring.wms.heartDto.HeartDto;

public interface BoardDao {

	public List<AdminBoardDto> selectBoardList(String boardStatus);
	public List<AdminBoardDto> selectAllBoard();
	public AdminBoardDto selectBoardDetail(int boardId);
	public void updateReadCount(int boardId);
	public HeartDto heartExist (Map<String, Object> heartMap);
	public void insertHeart (Map<String, Object> heartMap);
	public void deleteHeart (Map<String, Object> heartMap);
	public void plusHeart (Map<String, Object> heartMap);
	public void minusHeart (Map<String, Object> heartMap);
	public List<AdminBoardDto> selectViewBoard();
	public List<AdminBoardDto> selectLikeBoard();
	public List<Map<String, Object>> selectAllComment (int boardId);
	public void addComment(CommentDto commentDto);
	public List<AdminBoardDto> selectBoardLike(String memberId);
}
