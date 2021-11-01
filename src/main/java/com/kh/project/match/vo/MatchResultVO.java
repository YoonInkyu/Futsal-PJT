package com.kh.project.match.vo;

public class MatchResultVO {
	private String matchResultCode;
	private String matchCode;
	private String matchResultHometeamScore;
	private String matchResultAwayteamScore;
	private String teamCode;
	private String teamCodeAway;
	private int rankWin;
	private int rankDraw;
	private int rankLose;
	private int rankTotalScore;
	
	public String getTeamCodeAway() {
		return teamCodeAway;
	}
	public void setTeamCodeAway(String teamCodeAway) {
		this.teamCodeAway = teamCodeAway;
	}
	public String getTeamCode() {
		return teamCode;
	}
	public void setTeamCode(String teamCode) {
		this.teamCode = teamCode;
	}
	public int getRankWin() {
		return rankWin;
	}
	public void setRankWin(int rankWin) {
		this.rankWin = rankWin;
	}
	public int getRankDraw() {
		return rankDraw;
	}
	public void setRankDraw(int rankDraw) {
		this.rankDraw = rankDraw;
	}
	public int getRankLose() {
		return rankLose;
	}
	public void setRankLose(int rankLose) {
		this.rankLose = rankLose;
	}
	public int getRankTotalScore() {
		return rankTotalScore;
	}
	public void setRankTotalScore(int rankTotalScore) {
		this.rankTotalScore = rankTotalScore;
	}
	public String getMatchResultCode() {
		return matchResultCode;
	}
	public void setMatchResultCode(String matchResultCode) {
		this.matchResultCode = matchResultCode;
	}
	public String getMatchCode() {
		return matchCode;
	}
	public void setMatchCode(String matchCode) {
		this.matchCode = matchCode;
	}
	public String getMatchResultHometeamScore() {
		return matchResultHometeamScore;
	}
	public void setMatchResultHometeamScore(String matchResultHometeamScore) {
		this.matchResultHometeamScore = matchResultHometeamScore;
	}
	public String getMatchResultAwayteamScore() {
		return matchResultAwayteamScore;
	}
	public void setMatchResultAwayteamScore(String matchResultAwayteamScore) {
		this.matchResultAwayteamScore = matchResultAwayteamScore;
	}
}
