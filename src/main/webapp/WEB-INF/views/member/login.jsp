<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
a {
	color: inherit;
	text-decoration: none;
}

body {
	background-image: url("/resources/img/common/main2.jpg");
	background-repeat: no-repeat;
	background-size: cover;
}
</style>

</head>
<body>



	<div class="container col-8 mx-auto" style="margin-top: 13rem;">

		<div class="row">

			<div class="col-4 mx-auto justify-content-center">

				<div class="row shadow-lg p-3 mb-5 bg-body rounded">

					<div class="col mx-auto">

						<div class="my-3 text-center">
							<a class="navbar-brand" href="/templateLayout/main_page"><img src="/resources/img/common/bg1.png" width="50%" height=""></a>
						</div>

						<form action="/member/login" method="post">

							<div class="col-12 mb-3">
								<label for="inputId" class="form-label">아이디</label> <input type="text" class="form-control" id="inputId memberId" placeholder="아이디를 입력하세요!" name="memberId">
							</div>

							<div class="col-12 mb-3">
								<label for="inputPw" class="form-label">비밀번호</label> <input type="password" class="form-control" id="inputPw memberPw" placeholder="비밀번호를 입력하세요!" name="memberPw">
							</div>

							<div class="d-grid gap-2">
								<input class="btn btn-primary my-3" type="submit" value="로그인">
							</div>

							<div class="d-grid gap-2  my-3">
								<button type="button" class="btn btn-outline-danger" onclick="location.href='/board/goNoticeList';">취 소</button>
							</div>
						</form>

					</div>

				</div>

			</div>

		</div>

	</div>



</body>
</html>