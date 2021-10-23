<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table style="text-align: center;">
	<colgroup>
		<col width="20%">
		<col width="40%">
		<col width="20%">
		<col width="20%">
	</colgroup>
	<thead>
		<tr>
			<th>블랙이름</th>
			<th>코맨트</th>
			<th>블랙팀</th>
			<th></th>
		</tr>
	</thead>
	<tbody>
	<c:forEach items="${black }" var="blackInfo">
		<c:if test="${blackInfo.blackName != null }">
		<tr>
			<td>${blackInfo.blackName }</td>
			<td>${blackInfo.blackComment }</td>
			<td>${blackInfo.blackTeam }</td>
			<td><input type="button" value="삭제" onclick="location.href='/member/deleteMemberBlack?blackmemberCode=${blackInfo.blackmemberCode}';"></td>
		</tr>
		</c:if>
	</c:forEach>
	</tbody>
</table>
</body>
</html>