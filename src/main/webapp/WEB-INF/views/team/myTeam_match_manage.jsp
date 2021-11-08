<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
table {
	text-align: center;
}
</style>
</head>
<body>
	<div>
	
	
	지난 경기=======================
		<table class="table table-striped">
 		<colgroup>
			<col width="*">
			<col width="25%">
			<col width="1%">
			<col width="25%">
		</colgroup>
	  <thead>
	    <tr>
	      <th scope="col">경기 결과(날짜 / 시간)</th>
	      <th scope="col" colspan="2">HOME TEAM</th>
	      <th scope="col"></th>
	      <th scope="col" colspan="2">AWAY TEAM</th>
	    </tr>
	  </thead>
	  <tbody>
	  	<c:forEach items="${matchAfterManage }" var="afterMatch">
	    <tr>
	      <th scope="row">${afterMatch.matchDate } / ${afterMatch.matchStartTime} ~ ${afterMatch.matchEndTime}</th>
	      <td>${afterMatch.homeTeamName}</td>
	      <td>${afterMatch.matchResultHometeamScore }</td>
	      <td>:</td>
	      <td>${afterMatch.matchResultAwayteamScore }</td>
	      <td>${afterMatch.awayTeamName }</td>
	    </tr>
	  	</c:forEach>
	  </tbody>
	</table>
	</div>
	<div>
	
	
	
	경기 예정===================
	<table class="table table-striped">
 		<colgroup>
			<col width="*">
			<col width="25%">
			<col width="1%">
			<col width="25%">
		</colgroup>
	  <thead>
	    <tr>
	      <th scope="col">경기 전</th>
	      <th scope="col" colspan="2">HOME TEAM</th>
	      <th scope="col"></th>
	      <th scope="col" colspan="2">AWAY TEAM</th>
	    </tr>
	  </thead>
	  <tbody>
	  	<c:forEach items="${matchBeforeManage }" var="beforeMatch">
	    <tr>
	      <th scope="row">${beforeMatch.matchDate }  ${beforeMatch.matchStartTime} ${beforeMatch.matchEndTime}</th>
	      <td>${beforeMatch.homeTeamName}</td>
	      <td>${beforeMatch.matchResultHometeamScore }</td>
	      <td>:</td>
	      <td>${beforeMatch.matchResultAwayteamScore }</td>
	      <td>${beforeMatch.awayTeamName }</td>
	    </tr>
	  	</c:forEach>
	  </tbody>
	</table>
	</div>
</body>
</html>