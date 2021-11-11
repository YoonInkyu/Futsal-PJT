<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/resources/member/js/join.js?ver=2"></script>
<style type="text/css">
body {
	background-image: url("/resources/img/common/main3.jpg");
	background-repeat: no-repeat;
	background-size: cover;
}
</style>

</head>
<body>

	<div style="height: 10rem;"></div>

	<div class="container col-8 mx-auto">

		<form action="/member/join" method="post" enctype="multipart/form-data">
			<div class="row">
				<div class="col-4 mx-auto justify-content-center">
					<div class="row shadow-lg p-3 mb-5 bg-body rounded">
						<div class="col mx-auto">
							<div class="my-3 text-center">
								<a class="navbar-brand" href="/templateLayout/main_page"><img src="/resources/img/common/bg4.png" width="50%" height=""></a>
							</div>
							<div class="text-center mb-5">
								<i class="bi bi-camera-fill"></i> <img style="height: 190px; object-fit: cover;" src="/resources/img/member/nullImg.png" id="preview" class="img-thumbnail" width="50%;" height="50%;">
							</div>
							<div class="input-group mb-5">
								<label class="input-group-text bg-primary text-white" for="inputGroupFile01">선수 사진 등록</label> <input type="file" class="form-control" id="inputGroupFile01" name="memberImg" onchange="readURL(this);">
								<!-- 업로드되는 회원사진 미리보기 -->
								<script type="text/javascript">
									function readURL(input) {
										if (input.files && input.files[0]) {
											var reader = new FileReader();
											reader.onload = function(e) {
												document.getElementById('preview').src = e.target.result;
											};
											reader.readAsDataURL(input.files[0]);
										} else {
											document.getElementById('preview').src = "";
										}
									}
								</script>
							</div>
							<div class="row">
								<label for="inputId" class="form-label">아이디</label>
								<div class="col d-grid gap-2 d-md-flex" id="checkIdDiv">
									<input type="text" class="form-control" id="memberId" name="memberId" required placeholder="소문자(영문),숫자 4~12자리"> <input class="btn btn-primary" type="button" value="중복 체크" id="checkButt" onclick="checkId();">
								</div>
								<div class="mt-2 mb-5" id="idButtCheck" style="color: red; font-size: 12px; margin-top: 2px;">중복체크바랍니다.</div>
							</div>



							<div class="col-12 mb-5">
								<label for="inputPw" class="form-label">비밀번호</label> <input type="password" class="form-control" id="memberPw" name="memberPw" placeholder="비밀번호 입력" required>
								<div class="mt-2" id="pwJDiv" style="color: red; font-size: 12px; margin-top: 2px;"></div>
							</div>



							<div class="col-12 mb-5">
								<label for="inputPwCheck" class="form-label">비밀번호 확인</label> <input type="password" class="form-control" id="memberPwCheck" placeholder="비밀번호 확인">
								<div class="mt-2" id="pwCheckDiv" style="color: red; font-size: 12px; margin-top: 2px;"></div>
							</div>



							<div class="col-12 mb-5">
								<label for="inputName" class="form-label">이름</label> <input type="text" class="form-control" id="memberName" name="memberName" required placeholder="이름을 입력">
								<div class="mt-2" id="nameJDiv" style="color: red; font-size: 12px; margin-top: 2px;"></div>
							</div>

							<div class="col-12 mb-5">
								<label for="inputBirth" class="form-label">생년월일</label> <input type="text" class="form-control" id="memberBirth" name="memberBirth" required placeholder="주민번호 앞6자리 예시)880425">
								<div class="mt-2" id="birthJDiv" style="color: red; font-size: 12px; margin-top: 2px;"></div>
							</div>

							<div class="col-12 mb-5">

								<div class="form-check form-check-inline">
									<input class="form-check-input gender" type="radio" name="memberGender" id="inlineRadio1" value="남자" checked> <label class="form-check-label" for="inlineRadio1">남</label>
								</div>

								<div class="form-check form-check-inline">
									<input class="form-check-input gender" type="radio" name="memberGender" id="inlineRadio2" value="여자"> <label class="form-check-label" for="inlineRadio2">여</label>
								</div>

							</div>



							<div class="col-12 mb-5">

								<div class="row">

									<label for="inputTell" class="form-label">연락처</label>

									<div class="col">
										<input type="text" class="form-control tells" id="tell1" name="tells" required>
									</div>

									<div class="col">
										<input type="text" class="form-control tells" id="tell2" name="tells" required>
									</div>

									<div class="col">
										<input type="text" class="form-control tells" id="tell3" name="tells" required>
									</div>

								</div>
								<div class="mt-2" id="tellJDiv" style="color: red; font-size: 12px; margin-top: 2px;"></div>

							</div>



							<div class="col-12 mb-5">
								<div class="col">
									<label for="inputTell" class="form-label">포지션</label>
								</div>
								<div class="form-check form-check-inline">
									<input class="form-check-input" type="radio" id="inlineCheckbox1" value="공격" name="position" class="position" checked> <label class="form-check-label align-middle pt-1" for="inlineCheckbox1">공격</label>
								</div>

								<div class="form-check form-check-inline">
									<input class="form-check-input" type="radio" id="inlineCheckbox2" value="수비" name="position" class="position"> <label class="form-check-label align-middle pt-1" for="inlineCheckbox2">수비</label>
								</div>

								<div class="form-check form-check-inline">
									<input class="form-check-input" type="radio" id="inlineCheckbox3" value="키퍼" name="position" class="position"> <label class="form-check-label align-middle pt-1" for="inlineCheckbox3">키퍼</label>
								</div>

							</div>



							<div class="d-grid gap-2">
								<input class="btn btn-outline-primary disabled" type="submit" value="회원 가입" id="joinButt">
							</div>
							<div class="d-grid gap-2  my-4">
								<button type="button" class="btn btn-outline-danger" onclick="location.href='/board/goNoticeList';">취 소</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</form>

	</div>
	<div style="height: 18rem;"></div>



</body>
</html>