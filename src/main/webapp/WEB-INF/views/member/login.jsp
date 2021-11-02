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
</style>

</head>
<body>
	<div class="row">
		<div class="col-4 mx-auto justify-content-center">
			<div class="row">
				<div class="col mx-auto">
					<div class="my-3 text-center">
						<a class="navbar-brand" href="/templateLayout/main_page"><img src="/resources/img/common/logo.png" width="50%" height=""></a>	
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
					</form>
				</div>
			</div>
			<!-- <div class="col text-center">
				<div class="row my-5 pt-5" style="border-top: 2px solid gray;">
					<div class="col">
						<div>
							<a href="#">아이디 찾기</a> <span class="mx-3"> | </span> <a href="#">비밀번호 찾기</a> <span class="mx-3"> | </span> <a href="/member/goJoin">회원 가입</a>
						</div>
					</div>
				</div>
			</div>
			<div class="col justify-content-center">
				<div class="row">
					<div class="col">
						<div class="my-3">SNS 간편 로그인</div>
						<div class="mb-3" style="background-color: #fff200;">
							<a href="#"><img src="/resources/img/common/sns_login_k.png">카카오 계정으로 로그인<img style="float: right;" src="/resources/img/common/sns_login_arr_b.png"></a>
						</div>
						<div class="mb-3" style="background-color: #1ec800;">
							<a href="#"><img src="/resources/img/common/sns_login_n.png">네이버 계정으로 로그인<img style="float: right;" src="/resources/img/common/sns_login_arr_w.png"></a>
						</div>
						<div class="mb-3" style="background-color: #475993;">
							<a href="#"><img src="/resources/img/common/sns_login_f.png">페이스북 계정으로 로그인<img style="float: right;" src="/resources/img/common/sns_login_arr_w.png"></a>
						</div>
					</div>
				</div>
			</div> -->
		</div>
	</div>
</body>
</html>