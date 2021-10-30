package com.kh.project.member.vo;

public class MemberVO {
	private String memberCode;
	private String memberId;
	private String memberPw;
	private String memberName;
	private int memberBirth;
	private String memberGender;
	private String memberTell;
	private String isAdmin;
	private String teamCode;
	private String position;
	private String memberJoinDate;
	private String[] tells;
	private String teamName;
	private String memberImgAttachedName;
	private String teamAdmin;
	private String[] updateTells;
	
	
	
	
	public String[] getUpdateTells() {
		return updateTells;
	}
	public void setUpdateTells(String[] updateTells) {
		this.updateTells = updateTells;
	}
	public String getTeamAdmin() {
		return teamAdmin;
	}
	public void setTeamAdmin(String teamAdmin) {
		this.teamAdmin = teamAdmin;
	}
	public String getTeamName() {
		return teamName;
	}
	public void setTeamName(String teamName) {
		this.teamName = teamName;
	}
	public String getMemberImgAttachedName() {
		return memberImgAttachedName;
	}
	public void setMemberImgAttachedName(String memberImgAttachedName) {
		this.memberImgAttachedName = memberImgAttachedName;
	}
	public String[] getTells() {
		return tells;
	}
	public void setTells(String[] tells) {
		String tell = tells[0] + "-" + tells[1] + "-" + tells[2];
		setMemberTell(tell);
	}
	public String getMemberCode() {
		return memberCode;
	}
	public void setMemberCode(String memberCode) {
		this.memberCode = memberCode;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getMemberPw() {
		return memberPw;
	}
	public void setMemberPw(String memberPw) {
		this.memberPw = memberPw;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public int getMemberBirth() {
		return memberBirth;
	}
	public void setMemberBirth(int memberBirth) {
		this.memberBirth = memberBirth;
	}
	public String getMemberGender() {
		return memberGender;
	}
	public void setMemberGender(String memberGender) {
		this.memberGender = memberGender;
	}
	public String getMemberTell() {
		return memberTell;
	}
	public void setMemberTell(String memberTell) {
		this.memberTell = memberTell;
	}
	public String getIsAdmin() {
		return isAdmin;
	}
	public void setIsAdmin(String isAdmin) {
		this.isAdmin = isAdmin;
	}
	public String getTeamCode() {
		return teamCode;
	}
	public void setTeamCode(String teamCode) {
		this.teamCode = teamCode;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public String getMemberJoinDate() {
		return memberJoinDate;
	}
	public void setMemberJoinDate(String memberJoinDate) {
		this.memberJoinDate = memberJoinDate;
	}
	
	
}
