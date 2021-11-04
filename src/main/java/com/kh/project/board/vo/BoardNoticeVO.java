package com.kh.project.board.vo;

import java.util.List;

import com.kh.project.common.vo.PageVO;

public class BoardNoticeVO extends PageVO {

	private int boardNumNotice;
	private String titleNotice;
	private String contentNotice;
	private String createDateNotice;
	private String writerNotice;
	private int readCntNotice;
	private String fileNameNotice;
	private String boardPwNotice;

	private List<NoticeImgVO> noticeImgList;

	public List<NoticeImgVO> getNoticeImgList() {
		return noticeImgList;
	}

	public void setNoticeImgList(List<NoticeImgVO> noticeImgList) {
		this.noticeImgList = noticeImgList;
	}

	public int getBoardNumNotice() {
		return boardNumNotice;
	}

	public void setBoardNumNotice(int boardNumNotice) {
		this.boardNumNotice = boardNumNotice;
	}

	public String getTitleNotice() {
		return titleNotice;
	}

	public void setTitleNotice(String titleNotice) {
		this.titleNotice = titleNotice;
	}

	public String getContentNotice() {
		return contentNotice;
	}

	public void setContentNotice(String contentNotice) {
		this.contentNotice = contentNotice;
	}

	public String getCreateDateNotice() {
		return createDateNotice;
	}

	public void setCreateDateNotice(String createDateNotice) {
		this.createDateNotice = createDateNotice;
	}

	public String getWriterNotice() {
		return writerNotice;
	}

	public void setWriterNotice(String writerNotice) {
		this.writerNotice = writerNotice;
	}

	public int getReadCntNotice() {
		return readCntNotice;
	}

	public void setReadCntNotice(int readCntNotice) {
		this.readCntNotice = readCntNotice;
	}

	public String getFileNameNotice() {
		return fileNameNotice;
	}

	public void setFileNameNotice(String fileNameNotice) {
		this.fileNameNotice = fileNameNotice;
	}

	public String getBoardPwNotice() {
		return boardPwNotice;
	}

	public void setBoardPwNotice(String boardPwNotice) {
		this.boardPwNotice = boardPwNotice;
	}

}
