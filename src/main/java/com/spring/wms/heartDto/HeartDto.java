package com.spring.wms.heartDto;

import org.springframework.stereotype.Component;

@Component
public class HeartDto {
	
	private String memberId;
	private int boardId;
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public int getBoardId() {
		return boardId;
	}
	public void setBoardId(int boardId) {
		this.boardId = boardId;
	}
}
