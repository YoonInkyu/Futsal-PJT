<!-- 10/25 박성환 : 나의팀 -> 팀장 / 팀원 수정 , 로그인 후 로그인 대상자 드롭바 생성 -->


<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <title>Insert title here</title> -->
<script type="text/javascript" src="/resources/template/js/top_menu.js?ver=5"></script>
</head>
<body>


	<nav class="navbar navbar-expand-lg navbar-dark bg-dark p-2 text-dark bg-opacity-75 fixed-top" id="navbar">

		<div class="container-fluid">

			<div>
				<a class="navbar-brand" href="/templateLayout/main_page"><img src="/resources/img/common/logo.png" width="26%" height="">FootBall</a>
			</div>

			<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDarkDropdown" aria-controls="navbarNavDarkDropdown" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarNavDarkDropdown">

				<ul class="navbar-nav">

					<li class="nav-item dropdown mx-5"><a class="nav-link dropdown-toggle" href="#" id="navbarDarkDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">매치</a>

						<ul class="dropdown-menu dropdown-menu-dark" aria-labelledby="navbarDarkDropdownMenuLink">
							<li><a class="dropdown-item" href="/match/matchList">매치 신청</a></li>
						</ul></li>

					<li class="nav-item dropdown mx-5"><a class="nav-link dropdown-toggle" href="/sample/" id="navbarDarkDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">용병</a>

						<ul class="dropdown-menu dropdown-menu-dark" aria-labelledby="navbarDarkDropdownMenuLink">
							<li><a class="dropdown-item" href="/mercenary/recruit">용병 구인</a></li>
						</ul></li>

					<li class="nav-item dropdown mx-5"><a class="nav-link dropdown-toggle" href="/sample/" id="navbarDarkDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">팀 관리</a>

						<ul class="dropdown-menu dropdown-menu-dark" aria-labelledby="navbarDarkDropdownMenuLink">
							<li><a class="dropdown-item" href="/team/selectTeamMemberManage">MY TEAM</a></li>
							<li><a class="dropdown-item" href="/team/goRegTeam">팀 생성</a></li>
							<li><a class="dropdown-item" href="/team/selectTeamList">팀 목록</a></li>
						</ul></li>

					<li class="nav-item dropdown mx-5"><a class="nav-link dropdown-toggle" href="/sample/" id="navbarDarkDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">커뮤니티</a>

						<ul class="dropdown-menu dropdown-menu-dark" aria-labelledby="navbarDarkDropdownMenuLink">
							<li><a class="dropdown-item" href="/board/goNoticeList">공지 사항</a></li>
							<li><a class="dropdown-item" href="/board/goFreeList">자유 게시판</a></li>
						</ul></li>

				</ul>

			</div>



			<c:if test="${empty sessionScope.loginInfo }">

				<div style="text-align: right;">
					<a class="navbar-brand" href="/member/goJoin"><img src="/resources/img/common/login.png" width="8%" height="">JOIN</a>
					<!-- <a class="navbar-brand" href="/member/goLogin"><img src="/resources/img/common/login.png" width="8%" height="">LOGIN</a> -->
					<span class="navbar-brand" data-bs-toggle="modal" data-bs-target="#loginModal" style="cursor: pointer;"><img src="/resources/img/common/login.png" width="8%" height="">LOGIN</span>
				</div>

			</c:if>



			<c:if test="${not empty sessionScope.loginInfo }">

				<div class="d-flex flex-wrap ">

					<div class="dropdown" style="text-align: right;">
						<a href="#" class="navbar-brand d-block link-dark text-decoration-none dropdown-toggle" id="dropdownUser1" data-bs-toggle="dropdown" aria-expanded="false"> <c:choose>
								<c:when test="${sessionScope.loginInfo.memberImgAttachedName != null }">
									<img src="/resources/img/member/${sessionScope.loginInfo.memberImgAttachedName }" alt="mdo" width="32" height="32" class="rounded-circle"> ${sessionScope.loginInfo.memberName } 님 환영합니다.
						</c:when>
								<c:otherwise>
									<img src="/resources/img/member/nullImg.png" alt="mdo" width="32" height="32" class="rounded-circle"> ${sessionScope.loginInfo.memberName } 님 환영합니다.
						</c:otherwise>
							</c:choose>
						</a>
						<ul class="dropdown-menu dropdown-menu-dark" aria-labelledby="dropdownUser1">
							<li><a class="dropdown-item" href="/member/myPage">마이페이지</a></li>
							<li><a class="dropdown-item" href="/member/goMemberBlacklist">블랙리스트 관리</a></li>
							<li><hr class="dropdown-divider"></li>
							<li><a class="dropdown-item" href="/member/logout">LOGOUT</a></li>
						</ul>
					</div>

				</div>

			</c:if>



		</div>

	</nav>

	<!-- Login Modal -->
	<div class="modal fade" id="loginModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">로 그 인</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form action="/member/login" method="post" id="loginForm">
						<div class="form-floating mb-3">
							<input type="text" class="form-control" id="loginId" placeholder="name@example.com" name="memberId" required> <label for="floatingInput">아 이 디</label>
						</div>
						<div class="form-floating">
							<input type="password" class="form-control" id="loginPw" placeholder="Password" name="memberPw" required> <label for="floatingPassword">비 밀 번 호</label>
						</div>
						<div class="col-12 d-grid mt-3">
							<input type="button" class="btn btn-primary" value="로 그 인 하 기" onclick="checkLogin();">
						</div>
					</form>
				</div>
				<!-- <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div> -->
			</div>
		</div>
	</div>








</body>
</html>











