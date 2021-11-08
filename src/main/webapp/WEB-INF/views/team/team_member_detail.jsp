<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$(document).ready(function() {
	var recruitDetailModal = document.getElementById('staticBackdrop');
	//모달 닫히면 페이지 리로드
	//가끔 모달 닫고 메뉴바가 눌러지지 않아서 강제로 리로드 시킴
	recruitDetailModal.addEventListener('hidden.bs.modal', function (event) {
		location.reload();
	})
});
</script>
</head>
<body>
	<div class="modal-header">
		<h5 class="modal-title" id="staticBackdropLabel">${memberDetail.memberName }</h5>
		<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	</div>

	<div class="modal-body">
		<p>
			<img src="/resources/img/common/${memberDetail.memberImgAttachedName }" width="30%">
		</p>
		<table>
			<tr>
				<td>이름</td>
				<td>연락처</td>
				<td>성별</td>
				<td>포지션</td>
				<td>회원등급</td>
			</tr>
			<tr>
				<td>${memberDetail.memberName }</td>
				<td>${memberDetail.memberTell }</td>
				<td>${memberDetail.memberGender }</td>
				<td>${memberDetail.position }</td>
				<td>${memberDetail.teamAdmin }</td>
			</tr>
		</table>

	</div>
	<div class="modal-footer d-flex justify-content-between">
		<c:if test="${teamAdmin eq '3' }">
		<button type="button" class="btn btn-outline-danger" onclick="location.href='teamMemberDelete?memberCode=${memberDetail.memberCode}'">팀원 추방</button>
		</c:if>
		<button type="button" class="btn btn-secondary"
			data-bs-dismiss="modal">Close</button>
	</div>

	
</body>
</html>