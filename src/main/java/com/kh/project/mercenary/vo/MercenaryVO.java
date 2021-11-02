package com.kh.project.mercenary.vo;

import com.kh.project.common.vo.PageVO;

// 윤인규, 1020 작성
// 윤인규, 1023 변수 추가(각각 Date, Time 데이터 DB와 프로젝트에 추가)
// 수정 윤인규, 1026 구인구직 테이블 합침
public class MercenaryVO extends PageVO {
	// 용병 구인구직 변수
	private String mercBoardCode;
	private String mercBoardSort;
	private String mercBoardWriter;
	private String mercBoardIntro;
	private String mercBoardRegdate;
	private String mercBoardApplyNumber;
	private String mercBoardDate;
	private String mercBoardStartTime;
	private String mercBoardEndTime;
	private String mercBoardPossible;
	private String mercBoardLocation;
	private String memberCode;
	private String teamCode;
	private String memberTell;
	private String memberId;
	
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getMemberTell() {
		return memberTell;
	}
	public void setMemberTell(String memberTell) {
		this.memberTell = memberTell;
	}
	public String getMercBoardSort() {
		return mercBoardSort;
	}
	public void setMercBoardSort(String mercBoardSort) {
		this.mercBoardSort = mercBoardSort;
	}
	public String getMercBoardCode() {
		return mercBoardCode;
	}
	public void setMercBoardCode(String mercBoardCode) {
		this.mercBoardCode = mercBoardCode;
	}
	public String getMercBoardWriter() {
		return mercBoardWriter;
	}
	public void setMercBoardWriter(String mercBoardWriter) {
		this.mercBoardWriter = mercBoardWriter;
	}
	public String getMercBoardIntro() {
		return mercBoardIntro;
	}
	public void setMercBoardIntro(String mercBoardIntro) {
		this.mercBoardIntro = mercBoardIntro;
	}
	public String getMercBoardRegdate() {
		return mercBoardRegdate;
	}
	public void setMercBoardRegdate(String mercBoardRegdate) {
		this.mercBoardRegdate = mercBoardRegdate;
	}
	public String getMercBoardApplyNumber() {
		return mercBoardApplyNumber;
	}
	public void setMercBoardApplyNumber(String mercBoardApplyNumber) {
		this.mercBoardApplyNumber = mercBoardApplyNumber;
	}
	public String getMercBoardDate() {
		return mercBoardDate;
	}
	public void setMercBoardDate(String mercBoardDate) {
		this.mercBoardDate = mercBoardDate;
	}
	public String getMercBoardStartTime() {
		return mercBoardStartTime;
	}
	public void setMercBoardStartTime(String mercBoardStartTime) {
		this.mercBoardStartTime = mercBoardStartTime;
	}
	public String getMercBoardEndTime() {
		return mercBoardEndTime;
	}
	public void setMercBoardEndTime(String mercBoardEndTime) {
		this.mercBoardEndTime = mercBoardEndTime;
	}
	public String getMercBoardPossible() {
		return mercBoardPossible;
	}
	public void setMercBoardPossible(String mercBoardPossible) {
		this.mercBoardPossible = mercBoardPossible;
	}
	public String getMercBoardLocation() {
		return mercBoardLocation;
	}
	public void setMercBoardLocation(String mercBoardLocation) {
		this.mercBoardLocation = mercBoardLocation;
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
