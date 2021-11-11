<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/resources/team/js/team_detail.js?ver=20"></script>
</head>
<body>



	<div class="container">


		<div class="modal-header">
         <h5 class="modal-title" id="staticBackdropLabel">팀 상세 정보</h5>
         <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>


		<div class="modal-body my-3">

			<div class="col text-center shadow-lg p-3  bg-body rounded">

				<div class="row">
					<div class="col text-start">

						<div class="mb-3">팀 이름 : ${teamDetail.teamName }</div>
						<div class="mb-3">지 역 : ${teamDetail.teamLocation}</div>
						<div class="mb-3">회원 수 : ${teamDetail.memberCount}</div>
						<div class="mb-3">팀 장 : ${teamDetail.masterName }</div>
						<div class="mb-3">승/무/패 : ${teamDetail.rankWin }/${teamDetail.rankDraw }/${teamDetail.rankLose }</div>
						<div class="form-floating">
							<textarea name="teamIntro" class="form-control" placeholder="Leave a comment here" id="floatingTextarea2" style="height: 19rem;" readonly>${teamDetail.teamIntro }</textarea>
							<label for="floatingTextarea2">팀 소개</label>
						</div>

					</div>



					<div class="col">
						<i class="bi bi-camera-fill"></i><img class="img-thumbnail" style="height: 500px; object-fit: cover;" src="/resources/img/team/${teamDetail.teamLogoImgAttachedName }">
					</div>


				</div>







				<!-- 				<table class="table table-striped table-hover"> -->

				<!-- 					<thead> -->

				<!-- 						<tr> -->
				<!-- 							<th scope="col" width="15%">팀로고</th> -->
				<!-- 							<th scope="col" width="15%">팀 이 름</th> -->
				<!-- 							<th scope="col" width="15%">지 역</th> -->
				<!-- 							<th scope="col" width="*%">팀 소개</th> -->
				<!-- 							<th scope="col" width="15%">회원 수</th> -->
				<!-- 							<th scope="col" width="15%">팀장</th> -->
				<!-- 						</tr> -->

				<!-- 					</thead> -->

				<!-- 					<tbody> -->


				<!-- 						<tr> -->
				<%-- <c:if test="${not empty teamDetail.memberImgAttachedName  }">
                        <td><img style="height: 38px; object-fit: cover;" src="/resources/img/member/${teamDetail.memberImgAttachedName }"></td>
                        </c:if>
                        <c:if test="${empty teamDetail.memberImgAttachedName  }">
                        <td><img style="height: 38px; object-fit: cover;" src="/resources/img/member/nullImg.png"></td>
                        </c:if> --%>

				<%-- 							<td><i class="bi bi-camera-fill"></i><img class="img-thumbnail" style="height: 38px; object-fit: cover;" src="/resources/img/team/${teamDetail.teamLogoImgAttachedName }"></td> --%>
				<%-- 							<td>${teamDetail.teamName }</td> --%>
				<%-- 							<td>${teamDetail.teamLocation}</td> --%>
				<%-- 							<td>${teamDetail.teamIntro }</td> --%>
				<%-- 							<td>${teamDetail.memberCount}</td> --%>
				<%-- 							<td>${teamDetail.masterName }</td> --%>

				<!-- 						</tr> -->

				<%-- <c:forEach items="${teamDetail }" var="teamDetail">
                  </c:forEach> --%>

				<!-- 					</tbody> -->

				<!-- 				</table> -->

			</div>

		</div>

		<div class="modal-footer d-flex justify-content-around">
			<button style="width: 10rem;" type="button" class="btn btn-outline-primary" id="addTeambutt">가입 신청</button>
			<button style="width: 10rem;" type="button" class="btn btn-outline-danger" data-bs-dismiss="modal">취 소</button>
		</div>


	</div>
	<input type="hidden" id="teamCodeInput" value="${teamCode}">
	<input type="hidden" id="memberCodeInput" value="${memberCode}">
	<input type="hidden" id="myTeamCodeInput" value="${sessionScope.loginInfo.teamCode}">
</body>
</html>




