<!-- 박성환 10/27 : 초기 디자인 적용 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/resources/member/js/update_member_info2.js?ver=1"></script>
</head>
<body>



	<div class="container col-8 mx-auto">


		<form action="/member/updateMemberInfo" method="post" enctype="multipart/form-data">
			<div class="row">
				<div class="col-4 mx-auto justify-content-center">
					<div class="row shadow-lg p-3 mb-5 bg-body rounded">
						<div class="col mx-auto">
							<div class="text-center my-5">
								<i class="bi bi-camera-fill"></i>
								<c:choose>
									<c:when test="${empty member.memberImgAttachedName}">
										<img style="height: 200px; object-fit: cover;" src="/resources/img/member/nullImg.png" id="preview" class="img-thumbnail" width="50%;" height="50%;">
									</c:when>
									<c:otherwise>
										<img style="height: 200px; object-fit: cover;" src="/resources/img/member/${member.memberImgAttachedName }" id="preview" class="img-thumbnail" width="50%;" height="50%;">
									</c:otherwise>
								</c:choose>
							</div>
							<div class="input-group mb-5">
								<label class="input-group-text bg-primary text-white" for="inputGroupFile01">선수 사진 등록</label> <input type="file" class="form-control" id="inputGroupFile01" name="memberImg" value="memberImg" onchange="readURL(this);">
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
							<%-- <div class="d-grid mb-5">
							<input class="btn btn-primary" type="button" data-bs-toggle="modal" data-bs-target="#baseImgModal" value="기본사진으로 변경" onclick="baseImg(memberCode=${member.memberCode});">
						</div> --%>
							<div class="col-12 mb-5">
								<label for="inputId" class="form-label">아이디</label> <input type="text" class="form-control" id="memberId" name="memberId" readonly value="${member.memberId }">
							</div>
							<div class="d-grid mb-5">
								<input class="btn btn-outline-primary" type="button" data-bs-toggle="modal" data-bs-target="#changePwModal" value="비밀번호변경">
							</div>
							<div class="col-12 mb-5">
								<label for="inputName" class="form-label">이름</label> <input type="text" class="form-control" id="memberName" name="memberName" required value="${member.memberName }">
								<div class="mt-2" id="nameJDiv" style="color: red; font-size: 12px; margin-top: 2px;"></div>
							</div>
							<div class="col-12 mb-5">
								<label for="inputBirth" class="form-label">생년월일</label> <input type="text" class="form-control" id="memberBirth" name="memberBirth" readonly value="${member.memberBirth }">
							</div>
							<div class="col-12 mb-5">
								<div class="form-check form-check-inline">
									<input class="form-check-input gender" type="radio" id="inlineRadio1" name="memberGender" value="남자" disabled <c:if test="${member.memberGender eq '남자'}">checked</c:if>> <label class="form-check-label" for="inlineRadio1">남</label>
								</div>
								<div class="form-check form-check-inline">
									<input class="form-check-input gender" type="radio" id="inlineRadio2" name="memberGender" value="남자" disabled <c:if test="${member.memberGender eq '여자'}">checked</c:if>> <label class="form-check-label" for="inlineRadio2">여</label>
								</div>
							</div>
							<div class="col-12 mb-5">

								<div class="row">

									<label for="inputTell" class="form-label">연락처</label>

									<div class="col">
										<input type="text" class="form-control tells" id="tell1" name="tells" value="${member.updateTells[0] }" required>
									</div>

									<div class="col">
										<input type="text" class="form-control tells" id="tell2" name="tells" value="${member.updateTells[1] }" required>
									</div>

									<div class="col">
										<input type="text" class="form-control tells" id="tell3" name="tells" value="${member.updateTells[2] }" required>
									</div>

								</div>
								<div class="mt-2" id="tellJDiv" style="color: red; font-size: 12px; margin-top: 2px;"></div>

							</div>
							<div class="col-12 mb-5">
								<div class="col">
									<label for="inputTell" class="form-label">포지션</label>
								</div>
								<div class="form-check form-check-inline">
									<input class="form-check-input" type="radio" id="inlineCheckbox1" value="공격" name="position" <c:if test="${member.position eq '공격'}">checked</c:if>> <label class="form-check-label align-middle pt-1" for="inlineCheckbox1">공격</label>
								</div>
								<div class="form-check form-check-inline">
									<input class="form-check-input" type="radio" id="inlineCheckbox2" value="수비" name="position" <c:if test="${member.position eq '수비'}">checked</c:if>> <label class="form-check-label align-middle pt-1" for="inlineCheckbox2">수비</label>
								</div>
								<div class="form-check form-check-inline">
									<input class="form-check-input" type="radio" id="inlineCheckbox3" value="키퍼" name="position" <c:if test="${member.position eq '키퍼'}">checked</c:if>> <label class="form-check-label align-middle pt-1" for="inlineCheckbox3">키퍼</label>
								</div>
							</div>
							<div class="d-grid gap-2">
								<input type="hidden" value="${member.memberCode }" name="memberCode"> <input class="btn btn-outline-primary" type="submit" value="수정 하기" id="updateButt">
							</div>
							<div class="d-grid gap-2  my-4">
								<button type="button" class="btn btn-danger" onclick="location.href='/member/myPage';">취 소</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</form>
		<!-- Modal -->
		<div class="modal fade" id="changePwModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">비밀번호 변경</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<form action="/member/changePw" method="post" id="changePwForm">
							<div class="form-floating mb-3">
								<input type="password" class="form-control" id="oldMemberPw" placeholder="Password" name="oldMemberPw" required> <label for="floatingInput">현재 비밀번호</label>
							</div>
							<div class="form-floating mb-3">
								<input type="password" class="form-control" id="memberPw" placeholder="Password" name="MemberPw" required> <label for="floatingPassword">새 비밀번호</label>
								<div class="mt-2" id="pwJDiv" style="color: red; font-size: 12px; margin-top: 2px;"></div>
							</div>
							<div class="form-floating mb-5">
								<input type="password" class="form-control" id="memberPwCheck" placeholder="Password" required> <label for="floatingPassword">새 비밀번호 확인</label>
								<div class="mt-2" id="pwCheckDiv" style="color: red; font-size: 12px; margin-top: 2px;"></div>
							</div>
							<div class="col-12 d-grid my-3">
								<input type="button" class="btn btn-outline-primary disabled" value="변 경 하 기" id="changePwButt">
							</div>
							<input type="hidden" value="${member.memberCode }" name="memberCode" id="memberCode">
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>