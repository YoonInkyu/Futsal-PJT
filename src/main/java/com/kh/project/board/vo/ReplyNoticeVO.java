package com.kh.project.board.vo;

public class ReplyNoticeVO {

	private int replyNumNotice;
	private String contentNotice;
	private String writerNotice;
	private String createDateNotice;
	private int boardNumNotice;
	private String writerImg;

	public String getWriterImg() {
		return writerImg;
	}

	public void setWriterImg(String writerImg) {
		this.writerImg = writerImg;
	}

	public int getReplyNumNotice() {
		return replyNumNotice;
	}

	public void setReplyNumNotice(int replyNumNotice) {
		this.replyNumNotice = replyNumNotice;
	}

	public String getContentNotice() {
		return contentNotice;
	}

	public void setContentNotice(String contentNotice) {
		this.contentNotice = contentNotice;
	}

	public String getWriterNotice() {
		return writerNotice;
	}

	public void setWriterNotice(String writerNotice) {
		this.writerNotice = writerNotice;
	}

	public String getCreateDateNotice() {
		return createDateNotice;
	}

	public void setCreateDateNotice(String createDateNotice) {
		this.createDateNotice = createDateNotice;
	}

	public int getBoardNumNotice() {
		return boardNumNotice;
	}

	public void setBoardNumNotice(int boardNumNotice) {
		this.boardNumNotice = boardNumNotice;
	}

}
