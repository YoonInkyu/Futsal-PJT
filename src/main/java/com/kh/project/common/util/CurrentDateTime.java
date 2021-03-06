package com.kh.project.common.util;

//1025 윤인규 코로나 api 조회시 필요한 오늘 날짜와 오늘 날짜에서 5일 전 날짜 구하는 메소드 구현함.

import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.Calendar;

public class CurrentDateTime {
	// 오늘 날짜 구하는 메소드
	public static String today() {
		// 오늘 날짜 구하기
		LocalDate now = LocalDate.now();
		// 포맷 정의
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		// 포맷 적용
		String nowDate = now.format(formatter);
		// 오늘 날짜 리턴
		return nowDate;
	}

	// 5일전 날짜 구하는 메소드
	public static String firstDay() {
		// 캘린더 객체 생성
		Calendar cal = Calendar.getInstance();
		// 현재 날짜를 문자열로 저장할 변수 선언
		String firstDay = "";
		// 현재 날짜와 시간을 문자열 생성
		firstDay += cal.get(Calendar.YEAR);
		firstDay += cal.get(Calendar.MONTH) + 1;
		// 오늘 날짜에서 -5일 한 날짜를 구하기
		firstDay += cal.get(Calendar.DATE) - 5;
		// 5일전 날짜 리턴
		return firstDay;
	}

	// 현재 시간 구하는 메소드
	public static String nowTime() {
		// 현재 시간
		LocalTime now = LocalTime.now();
		// 포맷 정의하기
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HH:mm");
		// 포맷 적용하기
		String nowTime = now.format(formatter);
		// 현재 시간 리턴
		return nowTime;

	}

	
	// 파일 업로드시 시분초까지 나오는 날짜
	public static String getNowDateTime() {
		
		// 캘런더 객체 생성
		Calendar cal = Calendar.getInstance();
		
		// 현재 날짜 및 시간을 문자열로 저장할 변수
		String nowDateTime = "";
		
		// 현재 날짜 및 시간을 문자열로 생성
		nowDateTime += cal.get(Calendar.YEAR);
		nowDateTime += cal.get(Calendar.MONTH) + 1; // 달은 0 ~ 11로 배열로 나온다 그래서 값에 +1을 해야됨
		nowDateTime += cal.get(Calendar.DATE);
		nowDateTime += cal.get(Calendar.HOUR);
		nowDateTime += cal.get(Calendar.MINUTE);
		nowDateTime += cal.get(Calendar.SECOND);
		nowDateTime += cal.get(Calendar.MILLISECOND);
		
		return nowDateTime;
	}
	
	
	
	
}
