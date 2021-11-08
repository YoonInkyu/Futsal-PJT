<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><tiles:insertAttribute name="title" /></title>
<!-- 태그 초기화 작업 -->
<link rel="stylesheet" href="/resources/common/reset.css">
<link rel="stylesheet" href="/resources/template/css/main_page_template.css">

<!-- 제이쿼리 문법을 로딩 -->
<script src="https://code.jquery.com/jquery-latest.min.js"></script>

<!-- 부트스트랩 사용을 위해 css, js를 로딩 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>

<style type="text/css">

</style>

</head>
<body>



	<div class="bg_wrap">

		<div class="mv">

			<video id="video01" class="mblock" autoplay="" playsinline="" muted="" loop="" title="">
				<source src="/resources/img/common/main_mv.mp4" type="video/mp4">
			</video>

		</div>


		<div class="menu on">

			<ul>

				<li><span><img src="/resources/img/common/bg2.png" width="60%" height=""></span></li>

				<li><a href="/match/matchList"><span>MATCHING</span><span class="ov">매치 신청</span></a></li>

				<li><a href="/mercenary/recruit"><span>MERCENARIES</span><span class="ov">용병 구인</span></a></li>

				<li><a href="/team/selectTeamMemberManage"><span>MY TEAM</span><span class="ov">나의 팀</span></a></li>

				<li><a href="/team/goRegTeam"><span>FORMATION</span><span class="ov">팀 생성</span></a></li>

				<li><a href="/team/selectTeamList"><span>TEAM LIST</span><span class="ov">팀 목록</span></a></li>

				<li><a href="/board/goNoticeList"><span>NOTICE</span><span class="ov">공지사항</span></a></li>

				<li><a href="/board/goFreeList"><span>BOARD</span><span class="ov">자유게시판</span></a></li>

				<li><a></a></li>

				<c:if test="${empty sessionScope.loginInfo }">

					<li><a href="/member/goJoin"><span>JOIN</span><span class="ov">회원 가입</span></a></li>
					
					<li><a href="/member/goLogin"><span>LOGIN</span><span class="ov">로그인</span></a></li>


				</c:if>

				<c:if test="${not empty sessionScope.loginInfo }">

					<div class="d-flex flex-wrap">

						<div class="dropdown" style="text-align: right;">

							<a href="#" class="navbar-brand d-block link-dark text-decoration-none dropdown-toggle" id="dropdownUser1" data-bs-toggle="dropdown" aria-expanded="false"> 
								<c:choose>
									<c:when test="${sessionScope.loginInfo.memberImgAttachedName != null }">
										<img src="/resources/img/member/${sessionScope.loginInfo.memberImgAttachedName }" alt="mdo" width="32" height="32" class="rounded-circle">
										<span style="color: #bababa; font-size: 24px;"> ${sessionScope.loginInfo.memberName } 님 환영합니다. </span>
									</c:when>

									<c:otherwise>
										<img src="/resources/img/member/nullImg.png" alt="mdo" width="32" height="32" class="rounded-circle">
										<span style="color: #bababa; font-size: 24px;"> ${sessionScope.loginInfo.memberName } 님 환영합니다. </span>
									</c:otherwise>
								</c:choose>
							</a>

							<ul class="dropdown-menu dropdown-menu-dark" aria-labelledby="dropdownUser1" style="width: 300px;">
								<li><a style="font-size: 24px; height: 32px; padding-top: 16px;" class="dropdown-item" href="/member/myPage">마이페이지</a></li>
								<li><a style="font-size: 24px; height: 32px; padding-top: 16px;" class="dropdown-item" href="/member/goMemberBlacklist">블랙리스트 관리</a></li>
								<li><hr class="dropdown-divider"></li>
								<li><a style="font-size: 24px; height: 32px; padding-top: 16px;" class="dropdown-item" href="/member/logout">LOGOUT</a></li>
							</ul>

						</div>

					</div>

				</c:if>

			</ul>

		</div>

	</div>


</body>
</html>





















