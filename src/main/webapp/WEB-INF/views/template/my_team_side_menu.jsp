<!-- 박성환 10/25 : 나의 팀 사이드 메뉴 초기 생성 -->



<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>






	<div class="container d-flex justify-content-end">

		<div class="b-example-divider"></div>

		<div class="flex-shrink-0 p-3 bg-white my-5" style="width: 280px;">
			<a href="/" class="d-flex align-items-center pb-3 mb-3 link-dark text-decoration-none border-bottom"> 
			<img alt="" src="/resources/img/team/${myTeam.teamLogoImgAttachedName }" width="30%" height="30%"> <span class="fs-5 fw-semibold">${myTeam.teamName }</span>
			</a>

			<ul class="list-unstyled ps-0">

				<li class="mb-3">
					<button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse" data-bs-target="#home-collapse" aria-expanded="true">My Team</button>
					<div class="collapse show" id="home-collapse">
						<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
							<li class="mt-1"><a href="/team/teamInfo" class="link-dark rounded">팀 정보</a></li>
							<li class="my-3"><a href="/team/selectTeamMemberManage" class="link-dark rounded">팀 관리</a></li>
							<li><a href="/team/myMatchManage" class="link-dark rounded">매치 관리</a></li>
						</ul>
					</div>
				</li>


				<li class="border-top my-3"></li>

			</ul>

		</div>

	</div>



</body>
</html>