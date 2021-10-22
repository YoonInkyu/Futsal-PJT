<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div class="row">

		<div class="col-4 mx-auto justify-content-center">

			<div class="row">

				<div class="col mx-auto">

					<div class="my-3 text-center">

						<a class="navbar-brand" href="/templateLayout/main_page"><img src="/resources/img/common/logo.png" width="50%" height=""></a>

					</div>



					<form action="/member/join" method="post">



						<div class="input-group mb-5">
							<label class="input-group-text bg-primary text-white" for="inputGroupFile01">선수 사진 등록</label> <input type="file" class="form-control" id="inputGroupFile01">
						</div>



						<div class="row">

							<label for="inputId" class="form-label">아이디</label>

							<div class="col mb-5 d-grid gap-2 d-md-flex">
								<input type="text" class="form-control" id="inputId memberId" placeholder="1~16 글자수 생성 가능"> <input class="btn btn-primary" type="submit" value="중복 체크">
							</div>

						</div>



						<div class="col-12 mb-5">
							<label for="inputPw" class="form-label">비밀번호</label> <input type="password" class="form-control" id="inputPw memberPw" placeholder="비밀번호 입력">
						</div>



						<div class="col-12 mb-5">
							<label for="inputPwCheck" class="form-label">비밀번호 확인</label> <input type="password" class="form-control" id="inputPwCheck memberPwCrheck" placeholder="비밀번호 확인">
						</div>



						<div class="col-12 mb-5">
							<label for="inputName" class="form-label">이름</label> <input type="text" class="form-control" id="inputName memberPwCrheck" placeholder="이름을 입력">
						</div>



						<div class="col-12 mb-5">
							<label for="inputBirth" class="form-label">생년월일</label> <input type="date" class="form-control" id="inputBirth memberBirth">
						</div>



						<div class="col-12 mb-5">

							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio1" value="남" checked> <label class="form-check-label" for="inlineRadio1">남</label>
							</div>

							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="여"> <label class="form-check-label" for="inlineRadio2">여</label>
							</div>

						</div>



						<div class="col-12 mb-5">

							<div class="row">

								<label for="inputTell" class="form-label">연락처</label>

								<div class="col">

									<select class="form-select" aria-label="Default select example">
										<option value="010" selected>010</option>
										<option value="011">011</option>
										<option value="012">012</option>
										<option value="013">013</option>
									</select>
								</div>

								<div class="col">
									<input type="text" class="form-control" id="inputTell tells">
								</div>

								<div class="col">
									<input type="text" class="form-control" id="inputTell tells">
								</div>

							</div>

						</div>



						<div class="col-12 mb-5">

							<div class="form-check form-check-inline">
								<input class="form-check-input" type="checkbox" id="inlineCheckbox1" value="공격"> <label class="form-check-label align-middle pt-1" for="inlineCheckbox1">공격</label>
							</div>

							<div class="form-check form-check-inline">
								<input class="form-check-input" type="checkbox" id="inlineCheckbox2" value="수비"> <label class="form-check-label align-middle pt-1" for="inlineCheckbox2">수비</label>
							</div>

							<div class="form-check form-check-inline">
								<input class="form-check-input" type="checkbox" id="inlineCheckbox3" value="키퍼"> <label class="form-check-label align-middle pt-1" for="inlineCheckbox3">키퍼</label>
							</div>

						</div>



						<div class="d-grid gap-2">
							<input class="btn btn-primary" type="submit" value="회원 가입">
						</div>



					</form>



					<div style="height: 10rem;"></div>


				</div>

			</div>


		</div>

	</div>






</body>
</html>