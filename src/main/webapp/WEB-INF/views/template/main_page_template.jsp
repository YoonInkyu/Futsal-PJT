<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><tiles:insertAttribute name="title" /></title>
<!-- 태그 초기화 작업 -->
<link rel="stylesheet" href="/resources/common/reset.css">

<!-- 제이쿼리 문법을 로딩 -->
<script src="https://code.jquery.com/jquery-latest.min.js"></script>

<!-- 부트스트랩 사용을 위해 css, js를 로딩 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>

<style type="text/css">
body {
	font-family: 'S-CoreDream-5Medium';
}

.bg_wrap {
	position: fixed;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0;
	max-width: 100% !important;
	width: 100%;
	background: #000
}

.bg_wrap .mv {
	position: fixed;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0;
	z-index: 1;
	max-width: 100% !important
}

.bg_wrap .mv video {
	position: absolute;
	top: 50%;
	left: 50%;
	min-width: 100%;
	min-height: 100%;
	-webkit-transform: translateX(-50%) translateY(-50%);
	-moz-transform: translateX(-50%) translateY(-50%);
	-ms-transform: translateX(-50%) translateY(-50%);
	-o-transform: translateX(-50%) translateY(-50%);
	transform: translateX(-50%) translateY(-50%)
}

/* .pblock { */
/* 	display: none */
/* } */
.mblock {
	display: block !important
}
</style>

</head>
<body>

	<div class="bg_wrap">

		<div class="mv">

			<video id="video01" class="mblock" autoplay="" playsinline="" muted="" loop="" title="">
				<source src="/resources/img/common/main_mv.mp4" type="video/mp4">
			</video>

			<!-- 			<video id="video02" class="pblock" autoplay="" playsinline="" muted="" loop="" title=""> -->
			<!-- 				<source src="/resources/img/common/main_m.mp4" type="video/mp4"> -->
			<!-- 			</video> -->

		</div>

	</div>


	<div>
		<tiles:insertAttribute name="menu" />
	</div>



</body>
</html>

















