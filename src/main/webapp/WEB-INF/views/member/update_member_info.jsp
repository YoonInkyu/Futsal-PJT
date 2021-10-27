<!-- 박성환 10/27 : 초기 디자인 적용 -->



<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/resources/member/js/join.js?ver=2"></script>
</head>
<body>





	<div class="row">

		<div class="col-4 mx-auto justify-content-center">

			<div class="row">

				<div class="col mx-auto">

					<form action="/member/join" method="post" enctype="multipart/form-data">


						<div class="text-center mb-5">
							<img src="/resources/img/common/addImg.PNG" id="" class="img-thumbnail" width="200px;">
						</div>


						<div class="input-group mb-5">
							<label class="input-group-text bg-primary text-white" for="inputGroupFile01">선수 사진 등록</label> <input type="file" class="form-control" id="inputGroupFile01" name="memberImg" value="memberImg">
						</div>



						<div class="row">

							<label for="inputId" class="form-label">아이디</label>

							<div class="col d-grid gap-2 d-md-flex" id="checkIdDiv">
								<input type="text" class="form-control" id="memberId" name="memberId" required placeholder="1~16 글자수 생성 가능"> <input class="btn btn-primary" type="button" value="중복 체크" id="checkButt" onclick="checkId();">
							</div>
							<div class="mt-2 mb-5" id="idButtCheck" style="color: red; font-size: 12px; margin-top: 2px;">중복체크바랍니다.</div>
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
									<input type="text" class="form-control tells" id="tell1" name="tells">
								</div>

								<div class="col">
									<input type="text" class="form-control tells" id="tell2" name="tells">
								</div>

								<div class="col">
									<input type="text" class="form-control tells" id="tell3" name="tells">
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
							<input class="btn btn-primary disabled" type="submit" value="수정 하기" id="joinButt">
						</div>



					</form>



					<div style="height: 10rem;"></div>


				</div>

			</div>


		</div>

	</div>




	<!-- 승수씨 데이터 -->



	<form action="/member/updateMemberInfo" method="post" enctype="multipart/form-data">
		<!-- 이미지 파일 넣는곳 -->
		<input type="file" name="memberImg" onchange="readURL(this);"> <img id="preview" />
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
		<br>
		<!-- 아이디 중복체크,영문&숫자 15개 이하??  -->
		<div id="checkIdDiv">
			id<input type="text" id="memberId" name="memberId" value="${member.memberId }" readonly>
		</div>

		<!-- 한글 정규식? -->
		이름<input type="text" name="memberName" value="${member.memberName }"> <br>
		<!-- 숫자 6개 -->
		생년월일<input type="text" name="memberBirth" value="${member.memberBirth }" readonly> <br> 성별<input type="radio" checked name="memberGender" value="남자" disabled <c:if test="${member.memberGender eq '남자'}">checked</c:if>>남 <input type="radio" name="memberGender" value="여자" disabled
			<c:if test="${member.memberGender eq '여자'}">checked</c:if>>여 <br>
		<!-- 숫자만 가능 -->
		연락처<input type="text" name="memberTell" value="${member.memberTell }"><br>
		<!-- 중복체크가능 -->
		포지션<input type="radio" value="공격" name="position" <c:if test="${member.position eq '공격'}">checked</c:if>>공격 <input type="radio" value="수비" name="position" <c:if test="${member.position eq '수비'}">checked</c:if>>수비 <input type="radio" value="키퍼" name="position" <c:if test="${member.position eq '키퍼'}">checked</c:if>>키퍼
		<br> <input type="hidden" value="${member.memberCode }" name="memberCode"> <input type="submit" value="수정하기">
	</form>
</body>
</html>