<!-- 박성환 10/25 : 나의 팀 사이드 메뉴 초기 생성 -->







<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


	<div class="container">

		<div class="b-example-divider"></div>

		<div class="flex-shrink-0 p-3 bg-white" style="width: 280px;">
			<a href="/" class="d-flex align-items-center pb-3 mb-3 link-dark text-decoration-none border-bottom"> <img alt="" src="/resources/img/common/1.png" width="30%" height="30%"> <span class="fs-5 fw-semibold">뭉찬 FC</span>
			</a>

			<ul class="list-unstyled ps-0">

				<li class="mb-3">
					<button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse" data-bs-target="#home-collapse" aria-expanded="true">팀 정보</button>
					<div class="collapse show" id="home-collapse">
						<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
							<li class="mt-1"><a href="/templateLayout/templateLayout_myTeam" class="link-dark rounded">구 성</a></li>
							<li class="my-3"><a href="#" class="link-dark rounded">지 역</a></li>
							<li><a href="#" class="link-dark rounded">소 개</a></li>
						</ul>
					</div>
				</li>



				<li class="mb-3">
					<button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse" data-bs-target="#dashboard-collapse" aria-expanded="false">메뉴2</button>
					<div class="collapse" id="dashboard-collapse">
						<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
							<li class="mt-1"><a href="#" class="link-dark rounded">내용1</a></li>
							<li class="my-3"><a href="#" class="link-dark rounded">내용2</a></li>
							<li><a href="#" class="link-dark rounded">내용3</a></li>
						</ul>
					</div>
				</li>



				<li class="mb-3">
					<button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse" data-bs-target="#orders-collapse" aria-expanded="false">메뉴3</button>
					<div class="collapse" id="orders-collapse">
						<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
							<li class="mt-1"><a href="#" class="link-dark rounded">내용1</a></li>
							<li class="my-3"><a href="#" class="link-dark rounded">내용2</a></li>
							<li><a href="#" class="link-dark rounded">내용3</a></li>
						</ul>
					</div>
				</li>

				<li class="border-top my-3"></li>

			</ul>

		</div>

	</div>



</body>
</html>