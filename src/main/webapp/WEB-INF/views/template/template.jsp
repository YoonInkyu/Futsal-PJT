<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!-- 타일즈를 쓸려면 상기 내용을 입력 하여야된다. -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- 타이틀 안에 tiles:insertAttribute를 적용 하면 tiles-config.xml에 있는 타이틀 내용을 가져 온다 -->
<!-- 태그 초기화 작업 -->
<link rel="stylesheet" href="/resources/common/reset.css?ver=1">

<!-- 제이쿼리 문법을 로딩 -->
<script src="https://code.jquery.com/jquery-latest.min.js"></script>

<!-- 부트스트랩 사용을 위해 css, js를 로딩 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>


<style type="text/css">
.container-fluid {
	width: 80%;
	margin-top: 1rem;
	margin-bottom: 1rem;
}

body {
	line-height: 1;
	font-family: 'S-CoreDream-5Medium';
	font-size: 18px;
}

.menu1 {
	background-color: yellow;
}

.side1 {
	background-color: red;
}

.body1 {
	background-color: gray;
}

.bottom1 {
	background-color: orange;
}
</style>


</head>
<body>

	<div class="container-fluid">

		<div class="row menu1">

			<div class="col">

				<tiles:insertAttribute name="menu" />

			</div>

		</div>

		<div class="row my-3">

			<div class="col-10 p-5 body1">

				<tiles:insertAttribute name="body" />

			</div>

			<div class="col-2 p-5 side1">

				<tiles:insertAttribute name="side" />

			</div>

		</div>

		<div class="row bottom1">

			<div class="col p-5">

				<tiles:insertAttribute name="bottom" />

			</div>

		</div>

	</div>































</body>
</html>