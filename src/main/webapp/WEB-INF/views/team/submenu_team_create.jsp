<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">

</style>

</head>
<body>




	<div class="row my-3 mb-5 ">

		<div class="col text-center">
			<img class="shadow-lg p-3 mb-5 bg-body rounded" src="/resources/img/common/team_create1.PNG" width="20%;">
		</div>

	</div>


	<div class="row  justify-content-center">

		<div class="col-8 p-3 shadow-lg p-3 mb-5 bg-body rounded">

			<div class="row my-4 ">

				<div class="col-4">
					<img src="/resources/img/common/facebook.png" class="img-thumbnail" height="300px;">
				</div>



				<div class="col-8">



					<div class="row">

						<label for="inputId" class="form-label">팀 명</label>
						<div class="col mb-3 d-grid gap-2 d-md-flex">
							<input type="text" class="form-control" id="inputId" placeholder="1~16 글자수 생성 가능"> <input class="btn btn-primary" type="submit" value="중복 체크">
						</div>

					</div>



					<div class="row">

						<label for="inputTell" class="form-label">지 역</label>
						<div class="col mb-3 d-grid gap-2 d-md-flex">
							<select class="form-select" aria-label="Default select example" id="inputTell">
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
							<label class="input-group-text bg-primary text-white" for="inputGroupFile01">팀 대표 이미지 등록</label> <input type="file" class="form-control" id="inputGroupFile01">
						</div>

					</div>


				</div>




			</div>




			<div class="row">

				<div class="form-floating">
					<textarea class="form-control" placeholder="Leave a comment here" id="floatingTextarea2" style="height: 200px"></textarea>
					<label for="floatingTextarea2">팀 소개</label>
				</div>

			</div>



			<div class="row mt-5 mb-3 text-center">

				<div class="d-grid gap-2 d-md-block">
					<button class="btn btn-primary col-2 mx-auto" type="button">팀 등록</button>
					<button class="btn btn-primary col-2 mx-auto" type="button">취 소</button>
				</div>

			</div>




		</div>

	</div>






</body>
</html>