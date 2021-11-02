package com.kh.project.mercenary.vo;

// 윤인규, 1025 작성
// 수정 윤인규, 1026 구인구직 테이블 합침
public class MercenaryListVO {
	// 용병 구인구직 지원 리스트 변수
	private String mercListCode;
	private String mercBoardCode;
	private String memberCode;
	private String teamCode;
	private String memberName;
	private String memberId;
	private String position;
	private String mercListResponse;
	
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getMercListResponse() {
		return mercListResponse;
	}
	public void setMercListResponse(String mercListResponse) {
		this.mercListResponse = mercListResponse;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public String getMercListCode() {
		return mercListCode;
	}
	public void setMercListCode(String mercListCode) {
		this.mercListCode = mercListCode;
	}
	public String getMercBoardCode() {
		return mercBoardCode;
	}
	public void setMercBoardCode(String mercBoardCode) {
		this.mercBoardCode = mercBoardCode;
	}
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
	
}
