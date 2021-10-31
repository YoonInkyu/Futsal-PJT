package com.kh.project.common.vo;

public class BaseSearchVO {
	private String searchLocation;
	private String searchKeyword;
	private String searchValue;
	
	
	public String getSearchLocation() {
		return searchLocation;
	}
	public void setSearchLocation(String searchLocation) {
		this.searchLocation = searchLocation;
	}
	public String getSearchKeyword() {
		return searchKeyword;
	}
	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}
	public String getSearchValue() {
		return searchValue;
	}
	public void setSearchValue(String searchValue) {
		this.searchValue = searchValue;
	}
}