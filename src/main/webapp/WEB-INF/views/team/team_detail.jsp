<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="modal-header">
		<h5 class="modal-title" id="staticBackdropLabel">팀 이름 불러서 넣어라</h5>
		<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	</div>
		<div class="modal-body">
			<table class="table">
					<tr>
						<td>이미지</td>
						<td>이름</td>
						<td>성별</td>
						<td>연락처</td>
						<td>포지션</td>
						<td>등급</td>
					</tr>
				<c:forEach items="${teamDetail }" var="teamDetail">
					<tr>
						<td><img src="/resources/img/member/${teamDetail.memberImgAttachedName }"></td>
						<td>${teamDetail.memberName }</td>
						<td>${teamDetail.memberGender }</td>
						<td>${teamDetail.memberTell }</td>
						<td>${teamDetail.position }</td>
						<td>${teamDetail.teamAdmin }</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	<div class="modal-footer justify-content-between">
		<button type="button" class="btn btn-outline-success">가입 신청</button>
		<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
	</div>
</body>
</html>