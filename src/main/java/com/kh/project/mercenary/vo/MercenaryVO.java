package com.kh.project.mercenary.vo;

// 윤인규, 1020 작성
// 윤인규, 1023 변수 추가(각각 Date, Time 데이터 DB와 프로젝트에 추가)
public class MercenaryVO {
	// 용병 구직 변수
	private String mercenaryApplyCode;
	private String mercenaryApplyTitle;
	private String mercenaryApplyWriter;
	private String mercenaryApplyRegdate;
	private String mercenaryApplyNumberTeam;
	private String mercenaryApplyDate;
	private String mercenaryApplyStartTime;
	private String mercenaryApplyEndTime;
	private String mercenaryApplyPosible;
	private String mercenaryApplyIntro;
	private String mercenaryApplyLocation;
	
	// 용병 구인 변수
	private String mercenaryBoardCode;
	private String mercenaryBoardTitle;
	private String mercenaryBoardWriter;
	private String mercenaryBoardRegdate;
	private String mercenaryBoardNumberMember;
	private String mercenaryBoardDate;
	private String mercenaryBoardStartTime;
	private String mercenaryBoardEndTime;
	private String mercenaryBoardPosible;
	private String mercenaryBoardIntro;
	private String mercenaryBoardLocation;
	
	// 공통 변수
	private String memberCode;
	private String matchCode;
	private String teamCode;
	
	public String getMercenaryApplyCode() {
		return mercenaryApplyCode;
	}
	public void setMercenaryApplyCode(String mercenaryApplyCode) {
		this.mercenaryApplyCode = mercenaryApplyCode;
	}
	public String getMercenaryApplyTitle() {
		return mercenaryApplyTitle;
	}
	public void setMercenaryApplyTitle(String mercenaryApplyTitle) {
		this.mercenaryApplyTitle = mercenaryApplyTitle;
	}
	public String getMercenaryApplyWriter() {
		return mercenaryApplyWriter;
	}
	public void setMercenaryApplyWriter(String mercenaryApplyWriter) {
		this.mercenaryApplyWriter = mercenaryApplyWriter;
	}
	public String getMercenaryApplyRegdate() {
		return mercenaryApplyRegdate;
	}
	public void setMercenaryApplyRegdate(String mercenaryApplyRegdate) {
		this.mercenaryApplyRegdate = mercenaryApplyRegdate;
	}
	public String getMercenaryApplyNumberTeam() {
		return mercenaryApplyNumberTeam;
	}
	public void setMercenaryApplyNumberTeam(String mercenaryApplyNumberTeam) {
		this.mercenaryApplyNumberTeam = mercenaryApplyNumberTeam;
	}
	public String getMercenaryApplyDate() {
		return mercenaryApplyDate;
	}
	public void setMercenaryApplyDate(String mercenaryApplyDate) {
		this.mercenaryApplyDate = mercenaryApplyDate;
	}
	public String getMercenaryApplyStartTime() {
		return mercenaryApplyStartTime;
	}
	public void setMercenaryApplyStartTime(String mercenaryApplyStartTime) {
		this.mercenaryApplyStartTime = mercenaryApplyStartTime;
	}
	public String getMercenaryApplyEndTime() {
		return mercenaryApplyEndTime;
	}
	public void setMercenaryApplyEndTime(String mercenaryApplyEndTime) {
		this.mercenaryApplyEndTime = mercenaryApplyEndTime;
	}
	public String getMercenaryApplyPosible() {
		return mercenaryApplyPosible;
	}
	public void setMercenaryApplyPosible(String mercenaryApplyPosible) {
		this.mercenaryApplyPosible = mercenaryApplyPosible;
	}
	public String getMemberCode() {
		return memberCode;
	}
	public void setMemberCode(String memberCode) {
		this.memberCode = memberCode;
	}
	public String getMatchCode() {
		return matchCode;
	}
	public void setMatchCode(String matchCode) {
		this.matchCode = matchCode;
	}
	public String getMercenaryApplyIntro() {
		return mercenaryApplyIntro;
	}
	public void setMercenaryApplyIntro(String mercenaryApplyIntro) {
		this.mercenaryApplyIntro = mercenaryApplyIntro;
	}
	public String getMercenaryApplyLocation() {
		return mercenaryApplyLocation;
	}
	public void setMercenaryApplyLocation(String mercenaryApplyLocation) {
		this.mercenaryApplyLocation = mercenaryApplyLocation;
	}
	public String getMercenaryBoardCode() {
		return mercenaryBoardCode;
	}
	public void setMercenaryBoardCode(String mercenaryBoardCode) {
		this.mercenaryBoardCode = mercenaryBoardCode;
	}
	public String getMercenaryBoardTitle() {
		return mercenaryBoardTitle;
	}
	public void setMercenaryBoardTitle(String mercenaryBoardTitle) {
		this.mercenaryBoardTitle = mercenaryBoardTitle;
	}
	public String getMercenaryBoardWriter() {
		return mercenaryBoardWriter;
	}
	public void setMercenaryBoardWriter(String mercenaryBoardWriter) {
		this.mercenaryBoardWriter = mercenaryBoardWriter;
	}
	public String getMercenaryBoardRegdate() {
		return mercenaryBoardRegdate;
	}
	public void setMercenaryBoardRegdate(String mercenaryBoardRegdate) {
		this.mercenaryBoardRegdate = mercenaryBoardRegdate;
	}
	public String getMercenaryBoardNumberMember() {
		return mercenaryBoardNumberMember;
	}
	public void setMercenaryBoardNumberMember(String mercenaryBoardNumberMember) {
		this.mercenaryBoardNumberMember = mercenaryBoardNumberMember;
	}
	public String getMercenaryBoardDate() {
		return mercenaryBoardDate;
	}
	public void setMercenaryBoardDate(String mercenaryBoardDate) {
		this.mercenaryBoardDate = mercenaryBoardDate;
	}
	public String getMercenaryBoardStartTime() {
		return mercenaryBoardStartTime;
	}
	public void setMercenaryBoardStartTime(String mercenaryBoardStartTime) {
		this.mercenaryBoardStartTime = mercenaryBoardStartTime;
	}
	public String getMercenaryBoardEndTime() {
		return mercenaryBoardEndTime;
	}
	public void setMercenaryBoardEndTime(String mercenaryBoardEndTime) {
		this.mercenaryBoardEndTime = mercenaryBoardEndTime;
	}
	public String getMercenaryBoardPosible() {
		return mercenaryBoardPosible;
	}
	public void setMercenaryBoardPosible(String mercenaryBoardPosible) {
		this.mercenaryBoardPosible = mercenaryBoardPosible;
	}
	public String getTeamCode() {
		return teamCode;
	}
	public void setTeamCode(String teamCode) {
		this.teamCode = teamCode;
	}
	public String getMercenaryBoardIntro() {
		return mercenaryBoardIntro;
	}
	public void setMercenaryBoardIntro(String mercenaryBoardIntro) {
		this.mercenaryBoardIntro = mercenaryBoardIntro;
	}
	public String getMercenaryBoardLocation() {
		return mercenaryBoardLocation;
	}
	public void setMercenaryBoardLocation(String mercenaryBoardLocation) {
		this.mercenaryBoardLocation = mercenaryBoardLocation;
	}
}
