<!-- 10월 25일 송영준 데이터입력   -->
<!-- 박성환 10/26 : 팀 이미지 부분, 고정 사이즈 적용 예정 -->


<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/resources/team/js/submenu_team_create.js"></script>
</head>
<body>





	<div class="container col-6 mx-auto">

		<form action="/team/regTeam" method="post" enctype="multipart/form-data">


			<div class="row m-5 text-center justify-content-center">
				<h2>팀 생 성</h2>
				<div class="col-3" style="border-bottom: 3px solid gray;"></div>
			</div>




			<div class="row justify-content-center">

				<div class="col-8 p-3 shadow-lg p-3 mb-5 bg-body rounded">

					<div class="row my-4 ">

						<!-- 사진 이미지, 고정 사이즈 적용 예정 -->
						<div class="col-4">
							<i class="bi bi-camera-fill"></i> <img src="/resources/img/common/nonimg.png" id="preview" class="img-thumbnail">
						</div>

						<div class="col-8">
							<div class="row">
								<label for="inputTeamName" class="form-label">팀 명</label>
								<div class="col mb-3 d-grid gap-2 d-md-flex">
									<input type="text" name="teamName" class="form-control" id="inputTeamName" placeholder="1~16 글자수 생성 가능" required> <input class="btn btn-primary" id="checkTeamName" type="button" value="중복 체크">
								</div>
							</div>
							<div class="row">
								<label for="inputTell" class="form-label">지 역</label>
								<div class="col mb-3 d-grid gap-2 d-md-flex">
									<select name="teamLocation" class="form-select" aria-label="Default select example" id="inputTell">
										<option value="서울" selected>서울</option>
										<option value="대전">대전</option>
										<option value="대구">대구</option>
										<option value="부산">부산</option>
										<option value="울산">울산</option>
									</select>

								</div>
							</div>
							<div class="row">
								<div class="input-group mt-3">
									<label class="input-group-text bg-primary text-white" for="inputGroupFile01">팀 대표 이미지 등록</label> 
									<input type="file" class="form-control" id="inputGroupFile01" name="teamLogo" onchange="readURL(this);" required>
									<!-- 업로드되는 팀로고 미리보기 -->
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

							</div>

						</div>
					</div>
					<div class="row">

						<div class="form-floating">
							<textarea name="teamIntro" class="form-control" placeholder="Leave a comment here" id="floatingTextarea2" style="height: 200px"></textarea>
							<label for="floatingTextarea2">팀 소개</label>
						</div>
					</div>
					<div class="row mt-5 mb-3 text-center">

						<div class="d-flex justify-content-around" id="buttonDiv">
							<button style="width: 10rem;" class="btn btn-outline-primary" id="createTeam" type="submit" disabled>등 록</button>
							<button style="width: 10rem;" class="btn btn-danger" type="button">취 소</button>
						</div>


					</div>

				</div>

			</div>
		</form>
	</div>

</body>
</html>

