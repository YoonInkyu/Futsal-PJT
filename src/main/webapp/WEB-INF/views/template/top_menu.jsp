<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
/* .sticky { */
/* 	position: fixed; */
/* 	top: 0; */
/* 	width: 100%; */
/* } */
.carousel-inner>.item>img {
	top: 0;
	left: 0;
	min-width: 100%;
	min-height: 400px;
}
</style>

</head>
<body>


	<nav class="navbar navbar-expand-lg navbar-dark bg-dark p-2 text-dark bg-opacity-75 fixed-top" id="navbar">

		<div class="container-fluid">

			<div>
				<a class="navbar-brand" href="/templateLayout/main_page"><img src="/resources/img/common/logo.png" width="24%" height="">FootBall</a>
			</div>

			<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDarkDropdown" aria-controls="navbarNavDarkDropdown" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarNavDarkDropdown">

				<ul class="navbar-nav">

					<li class="nav-item dropdown mx-5"><a class="nav-link dropdown-toggle" href="#" id="navbarDarkDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">매치</a>

						<ul class="dropdown-menu dropdown-menu-dark" aria-labelledby="navbarDarkDropdownMenuLink">
							<li><a class="dropdown-item" href="/sample/submenu_match_submit">매치 신청</a></li>
							<li><a class="dropdown-item" href="/sample/submenu_match_manage">매치 관리</a></li>
						</ul></li>

					<li class="nav-item dropdown mx-5"><a class="nav-link dropdown-toggle" href="/sample/" id="navbarDarkDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">용병</a>

						<ul class="dropdown-menu dropdown-menu-dark" aria-labelledby="navbarDarkDropdownMenuLink">
							<li><a class="dropdown-item" href="/mercenary/recruit">용병 구인</a></li>
							<li><a class="dropdown-item" href="/mercenary/apply">용병 구직</a></li>
						</ul></li>

					<li class="nav-item dropdown mx-5"><a class="nav-link dropdown-toggle" href="/sample/" id="navbarDarkDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">팀 관리</a>

						<ul class="dropdown-menu dropdown-menu-dark" aria-labelledby="navbarDarkDropdownMenuLink">
							<li><a class="dropdown-item" href="/sample/submenu_team_manage">나 의 팀(팀장)</a></li>
							<li><a class="dropdown-item" href="/sample/submenu_member">나 의 팀(팀원)</a></li>
							<li><a class="dropdown-item" href="/sample/submenu_team_create">팀 생성</a></li>
							<li><a class="dropdown-item" href="/sample/submenu_team_list">팀 목록</a></li>
						</ul></li>

					<li class="nav-item dropdown mx-5"><a class="nav-link dropdown-toggle" href="/sample/" id="navbarDarkDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">커뮤니티</a>

						<ul class="dropdown-menu dropdown-menu-dark" aria-labelledby="navbarDarkDropdownMenuLink">
							<li><a class="dropdown-item" href="/sample/submenu_helpdesk_notice">공지 사항</a></li>
							<li><a class="dropdown-item" href="/sample/submenu_helpdesk_qna">고객 센터</a></li>
						</ul></li>

				</ul>

				<div style="text-align: right;">
					<a class="navbar-brand" href="/templateLayout/templateLayout_login"><img src="/resources/img/common/login.png" width="11%" height="">MEMBER LOGIN</a>
				</div>

			</div>

		</div>

	</nav>





<!-- 	<div class="col text-center"> -->

<!-- 		<div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel"> -->

<!-- 			<div class="carousel-indicators"> -->
<!-- 				<button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button> -->
<!-- 				<button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button> -->
<!-- 				<button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button> -->
<!-- 			</div> -->

<!-- 			<div class="carousel-inner"> -->

<!-- 				<div class="carousel-item active"> -->
<!-- 					<img src="/resources/img/common/main1.jpg" class="d-block w-100" alt="..." > -->
<!-- 					<div class="carousel-caption d-none d-md-block"> -->
<!-- 						<h5>First slide label</h5> -->
<!-- 						<p>Some representative placeholder content for the first slide.</p> -->
<!-- 					</div> -->
<!-- 				</div> -->

<!-- 				<div class="carousel-item"> -->
<!-- 					<img src="/resources/img/common/main2.jpg" class="d-block w-100" alt="..."> -->
<!-- 					<div class="carousel-caption d-none d-md-block"> -->
<!-- 						<h5>Second slide label</h5> -->
<!-- 						<p>Some representative placeholder content for the second slide.</p> -->
<!-- 					</div> -->
<!-- 				</div> -->

<!-- 				<div class="carousel-item"> -->
<!-- 					<img src="/resources/img/common/main3.jpg" class="d-block w-100" alt="..."> -->
<!-- 					<div class="carousel-caption d-none d-md-block"> -->
<!-- 						<h5>Third slide label</h5> -->
<!-- 						<p>Some representative placeholder content for the third slide.</p> -->
<!-- 					</div> -->
<!-- 					Wx` -->
<!-- 				</div> -->

<!-- 			</div> -->

<!-- 			<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev"> -->
<!-- 				<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span class="visually-hidden">Previous</span> -->
<!-- 			</button> -->

<!-- 			<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next"> -->
<!-- 				<span class="carousel-control-next-icon" aria-hidden="true"></span> <span class="visually-hidden">Next</span> -->
<!-- 			</button> -->

<!-- 		</div> -->

<!-- 	</div> -->







	<!-- 	<script> -->
	<!-- // 		window.onscroll = function() { -->
	<!-- // 			myFunction() -->
	<!-- // 		}; -->

	<!-- // 		var navbar = document.getElementById("navbar"); -->
	<!-- // 		var sticky = navbar.offsetTop; -->

	<!-- // 		function myFunction() { -->
	<!-- // 			if (window.pageYOffset >= sticky) { -->
	<!-- // 				navbar.classList.add("sticky") -->
	<!-- // 			} else { -->
	<!-- // 				navbar.classList.remove("sticky"); -->
	<!-- // 			} -->
	<!-- // 		} -->
	<!-- 	</script> -->






</body>
</html>











