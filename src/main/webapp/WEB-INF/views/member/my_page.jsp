<!-- 박성환 10/27 : 초기 포멧 생성 -->

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="m-5">
		<h1 style="border-bottom: 3px solid gray;">선수 소개</h1>
	</div>
	<section class="about-me-section p-3 p-lg-5 theme-bg-light">
		<div class="container">
			<div class="profile-teaser row">
				<div class="col-1"></div>
				<div class="col-6">
					<h1 class="name font-weight-bold mb-3">${member.memberName }</h1>
					<div class="mx-3 mb-5">
						<h4>주 포지션 : ${member.position }</h4>
					</div>
					<div class="mx-5 mb-4">
						<div class="mb-3">아이디 : ${member.memberId }</div>
						<div class="mb-3">생 일 : ${member.memberBirth }</div>
						<div class="mb-3">성별 : ${member.memberGender }</div>
						<div class="mb-3">연락처 : ${member.memberTell }</div>
					</div>
					<div class="mb-4 d-grid col-6">
						<button class="btn btn-primary " onclick="location.href='/member/goUpdateMember'">개인 정보 수정</button>
					</div>
				</div>
				<div class="col-md-5 col-lg-5 align-self-center" style="width: 300px;">
				<c:choose>
				<c:when test="${empty member.memberImgAttachedName}">
					<img class="profile-image img-fluid mb-3 mb-lg-0 me-md-0" src="/resources/img/member/nullImg.png" alt="">
				</c:when>
				<c:otherwise>
					<img class="profile-image img-fluid mb-3 mb-lg-0 me-md-0" src="/resources/img/member/${member.memberImgAttachedName }" alt="">
				</c:otherwise>
				</c:choose>
				</div>
			</div>
		</div>
	</section>
	<div class="m-5">
		<h1 style="border-bottom: 3px solid gray;">나의 게시글로 하기(수정필요함)</h1>
	</div>
<!-- 	승수씨 데이터 작업 부탁드립니다. 팀소속이 있을때 나올 화면 -->

	<%-- <c:choose> --%>

	<%-- <c:when test=""> --%>


	<section class="about-me-section p-3 p-lg-5 theme-bg-light">

		<div class="container">

			<div class="profile-teaser row">

				<div class="col-md-5 col-lg-5 align-self-center" style="width: 300px;">
					<img class="profile-image img-fluid mb-3 mb-lg-0 me-md-0" src="/resources/img/common/1.png" alt="">
				</div>

				<div class="col-2"></div>

				<div class="col-5">

					<h1 class="name font-weight-bold mb-3">팀 명 : 울산 FC</h1>

					<div class="mx-3 mb-5">
						<h4>팀 내 포지션 : 공 격 수</h4>
					</div>

					<div class="mx-5 mb-4">
						<div class="mb-3">지 역 : 울산</div>
						<div class="mb-3">랭 킹 : 1 위</div>
						<div class="mb-3">인 원 : 20 명</div>
					</div>


					<div class="form-floating">
						<textarea name="teamIntro" class="form-control" placeholder="Leave a comment here" id="floatingTextarea2" style="height: 200px" readonly></textarea>
						<label for="floatingTextarea2">팀 소개</label>
					</div>

				</div>

			</div>

		</div>

	</section>



	<%-- </c:when> --%>

	<%-- <c:otherwise> --%>






<!-- 팀 소속이 없을때 이미지 및 팀 찾기 -->


	<section class="about-me-section p-3 p-lg-5 theme-bg-light">

		<div class="container">

			<div class="profile-teaser row ">

				<div class="align-self-center mb-5 shadow-lg p-3 mb-5 bg-body rounded">
					<img class="profile-image img-fluid mb-3 mb-lg-0 me-md-0 rounded-lg" src="/resources/img/common/main3.jpg" alt="">
				</div>

			</div>

			<div class="row">

				<div class="col-6 mx-auto d-grid">
					<a class="btn btn-outline-success" href="/team/selectTeamList">팀 찾기</a>
				</div>

			</div>


		</div>

	</section>
	<%-- </c:otherwise> --%>
	<%-- </c:choose> --%>
</body>
</html>