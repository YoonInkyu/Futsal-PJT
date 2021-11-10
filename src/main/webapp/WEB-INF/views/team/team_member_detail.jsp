<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		recruitDetailModal.addEventListener('hidden.bs.modal', function(event) {
			location.reload();
		})
	});
</script>
</head>
<body>
	<div class="modal-header">
		<h5 class="modal-title" id="staticBackdropLabel">팀원 상세정보</h5>
		<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	</div>

	<div class="modal-body">
		<div class="row">

			<div class="col text-start">
				<div class="mb-3">이름 : ${memberDetail.memberName }</div>
				<div class="mb-3">성별 : ${memberDetail.memberGender }</div>
				<div class="mb-3">포지션 : ${memberDetail.position }</div>
				<div class="mb-3">회원등급 : ${memberDetail.teamAdmin }</div>
				<div>연락처 : ${memberDetail.memberTell }</div>
			</div>

			<div class="col">
				<img src="/resources/img/member/${memberDetail.memberImgAttachedName }" style="height: 180px; object-fit: cover;">
			</div>
		</div>

	</div>
	<div class="modal-footer d-flex justify-content-around">
		<c:if test="${teamAdmin eq '3' }">
			<button style="width: 10rem;" type="button" class="btn btn-outline-danger" onclick="location.href='teamMemberDelete?memberCode=${memberDetail.memberCode}'">팀원 추방</button>
		</c:if>
		<button style="width: 10rem;" type="button" class="btn btn-outline-primary" data-bs-dismiss="modal">취 소</button>
	</div>

</body>
</html>