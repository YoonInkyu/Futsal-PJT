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
body {
	font-family: 'S-CoreDream-5Medium';
}

.bottom1 {
	background-color: #2a2a2a;
	color: #a9a9a9;
	margin-top: 10rem;
}

.menu1 {
	height: 36rem;
}
</style>


</head>
<body>


	<div class="row menu1">

		<tiles:insertAttribute name="menu" />

	</div>

	<div class="row body1">

		<tiles:insertAttribute name="body" />

	</div>

	<div class="row bottom1">

		<tiles:insertAttribute name="bottom" />

	</div>


</body>
</html>