package com.spring.wms.adminBoardDto;


import java.util.Date;

import org.springframework.stereotype.Component;

@Component
public class AdminBoardDto {
	
	private int boardId;
	private String boardTitle;
	private Date boardDate;
	private String boardGenre;
	private int boardViews;
	private int boardLikes;
	private String boardIntro;
	private String boardCasting;
	private String boardDirector;
	private int boardEpisode;
	private String boardCountry;
	private String boardFileName;
	
	public int getBoardId() {
		return boardId;
	}
	public void setBoardId(int boardId) {
		this.boardId = boardId;
	}
	public String getBoardTitle() {
		return boardTitle;
	}
	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}
	public Date getBoardDate() {
		return boardDate;
	}
	public void setBoardDate(Date boardDate) {
		this.boardDate = boardDate;
	}
	public String getBoardGenre() {
		return boardGenre;
	}
	public void setBoardGenre(String boardGenre) {
		this.boardGenre = boardGenre;
	}
	public int getBoardViews() {
		return boardViews;
	}
	public void setBoardViews(int boardViews) {
		this.boardViews = boardViews;
	}
	public int getBoardLikes() {
		return boardLikes;
	}
	public void setBoardLike(int boardLikes) {
		this.boardLikes = boardLikes;
	}
	public String getBoardIntro() {
		return boardIntro;
	}
	public void setBoardIntro(String boardIntro) {
		this.boardIntro = boardIntro;
	}
	public String getBoardCasting() {
		return boardCasting;
	}
	public void setBoardCasting(String boardCasting) {
		this.boardCasting = boardCasting;
	}
	public String getBoardDirector() {
		return boardDirector;
	}
	public void setBoardDirector(String boardDirector) {
		this.boardDirector = boardDirector;
	}
	public int getBoardEpisode() {
		return boardEpisode;
	}
	public void setBoardEpisode(int boardEpisode) {
		this.boardEpisode = boardEpisode;
	}
	public String getBoardCountry() {
		return boardCountry;
	}
	public void setBoardCountry(String boardCountry) {
		this.boardCountry = boardCountry;
	}
	public String getBoardFileName() {
		return boardFileName;
	}
	public void setBoardFileName(String boardFileName) {
		this.boardFileName = boardFileName;
	}
	
}
