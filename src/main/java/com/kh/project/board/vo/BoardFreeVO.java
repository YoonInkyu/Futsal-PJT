package com.kh.project.board.vo;

import java.util.List;

import com.kh.project.common.vo.PageVO;

public class BoardFreeVO extends PageVO {

	private int boardNumFree;
	private String titleFree;
	private String contentFree;
	private String createDateFree;
	private String writerFree;
	private int readCntFree;
	private String fileNameFree;
	private String boardPwFree;
	private String teamCode;
	private String memberCode;
	
	

	public String getMemberCode() {
		return memberCode;
	}

	public void setMemberCode(String memberCode) {
		this.memberCode = memberCode;
	}

	public String getTeamCode() {
		return teamCode;
	}

	public void setTeamCode(String teamCode) {
		this.teamCode = teamCode;
	}

	private List<FreeImgVO> freeImgList;

	public List<FreeImgVO> getFreeImgList() {
		return freeImgList;
	}

	public void setFreeImgList(List<FreeImgVO> freeImgList) {
		this.freeImgList = freeImgList;
	}

	public int getBoardNumFree() {
		return boardNumFree;
	}

	public void setBoardNumFree(int boardNumFree) {
		this.boardNumFree = boardNumFree;
	}

	public String getTitleFree() {
		return titleFree;
	}

	public void setTitleFree(String titleFree) {
		this.titleFree = titleFree;
	}

	public String getContentFree() {
		return contentFree;
	}

	public void setContentFree(String contentFree) {
		this.contentFree = contentFree;
	}

	public String getCreateDateFree() {
		return createDateFree;
	}

	public void setCreateDateFree(String createDateFree) {
		this.createDateFree = createDateFree;
	}

	public String getWriterFree() {
		return writerFree;
	}

	public void setWriterFree(String writerFree) {
		this.writerFree = writerFree;
	}

	public int getReadCntFree() {
		return readCntFree;
	}

	public void setReadCntFree(int readCntFree) {
		this.readCntFree = readCntFree;
	}

	public String getFileNameFree() {
		return fileNameFree;
	}

	public void setFileNameFree(String fileNameFree) {
		this.fileNameFree = fileNameFree;
	}

	public String getBoardPwFree() {
		return boardPwFree;
	}

	public void setBoardPwFree(String boardPwFree) {
		this.boardPwFree = boardPwFree;
	}

}
