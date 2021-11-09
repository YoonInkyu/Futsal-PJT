<!-- 박성환 10/27 : 초기 포멧 생성 -->

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function recruitInfo1(mercBoardCode) {
		$(".modal-content").load("/mercenary/recruitDetail?mercBoardCode=" + mercBoardCode);
	}
	function recruitInfo2(matchCode) {
		$(".modal-content").load("/match/matchDetail?matchCode=" + matchCode);
	}
	$(document).ready(function() {
		var recruitDetailModal = document.getElementById('recruitDetailModal');
		var matchDetailModal = document.getElementById('matchDetailModal');
		//모달 닫히면 페이지 리로드
		//가끔 모달 닫고 메뉴바가 눌러지지 않아서 강제로 리로드 시킴
		recruitDetailModal.addEventListener('hidden.bs.modal', function(event) {
			location.reload();
		})
		//모달 닫히면 페이지 리로드
		//가끔 모달 닫고 메뉴바가 눌러지지 않아서 강제로 리로드 시킴
		matchDetailModal.addEventListener('hidden.bs.modal', function(event) {
			location.reload();
		})
	});
</script>
</head>
<body>
	<div class="container col-7 mx-auto">
		<div class="row shadow-lg p-3 mb-5 bg-body rounded">
			<div class="col m-5">
				<h2 style="border-bottom: 3px solid gray;">
					선수 소개 <span style="display: inline-block; float: right;"><button type="button" class="btn link-danger" data-bs-toggle="modal" data-bs-target="#deleteMemberModal">
					<svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" fill="currentColor" class="bi bi-x-circle-fill" viewBox="0 0 16 16">
					  <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM5.354 4.646a.5.5 0 1 0-.708.708L7.293 8l-2.647 2.646a.5.5 0 0 0 .708.708L8 8.707l2.646 2.647a.5.5 0 0 0 .708-.708L8.707 8l2.647-2.646a.5.5 0 0 0-.708-.708L8 7.293 5.354 4.646z"/>
					</svg>&nbsp;회원탈퇴</button></span>
				</h2>
			</div>




			<section class="about-me-section p-3 p-lg-5 theme-bg-light">
				<div class="container">
					<div class="profile-teaser row">
						<div class="col-1"></div>
						<div class="col-6">
							<h3 class="name font-weight-bold mb-3">${member.memberName }</h3>
							<div class="mx-3 mb-5">
								<h5>주 포지션 : ${member.position }</h5>
							</div>
							<div class="mx-5 mb-4">
								<div class="mb-3">아이디 : ${member.memberId }</div>
								<div class="mb-3">생 일 : ${member.memberBirth }</div>
								<div class="mb-3">성별 : ${member.memberGender }</div>
								<div class="mb-3">연락처 : ${member.memberTell }</div>
							</div>
							<div class="mb-4 d-grid col-8">
								<button class="btn btn-outline-primary " onclick="location.href='/member/goUpdateMember'">개인 정보 수정</button>
							</div>
						</div>
						<div class="col-md-5 col-lg-5 align-self-center" style="width: 300px;">
							<c:choose>
								<c:when test="${empty member.memberImgAttachedName}">
									<img class="profile-image img-fluid mb-3 mb-lg-0 me-md-0" src="/resources/img/member/nullImg.png" alt="">
								</c:when>
								<c:otherwise>
									<img class="profile-image img-fluid mb-3 mb-lg-0 me-md-0" src="/resources/img/member/${member.memberImgAttachedName }" alt="">
								</c:otherwise>
							</c:choose>
						</div>
					</div>
				</div>
			</section>









			<div class="col mx-5 mt-5">
				<h2 style="border-bottom: 3px solid gray;">나의 게시글 보기</h2>
			</div>



			<div class="accordion mt-5" id="accordionPanelsStayOpenExample">
				<div class="accordion-item">
					<h2 class="accordion-header" id="panelsStayOpen-headingOne">
						<button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseOne" aria-expanded="true" aria-controls="panelsStayOpen-collapseOne">
							<svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" fill="currentColor" class="bi bi-cloud-download-fill" viewBox="0 0 16 16">
							  <path fill-rule="evenodd" d="M8 0a5.53 5.53 0 0 0-3.594 1.342c-.766.66-1.321 1.52-1.464 2.383C1.266 4.095 0 5.555 0 7.318 0 9.366 1.708 11 3.781 11H7.5V5.5a.5.5 0 0 1 1 0V11h4.188C14.502 11 16 9.57 16 7.773c0-1.636-1.242-2.969-2.834-3.194C12.923 1.999 10.69 0 8 0zm-.354 15.854a.5.5 0 0 0 .708 0l3-3a.5.5 0 0 0-.708-.708L8.5 14.293V11h-1v3.293l-2.146-2.147a.5.5 0 0 0-.708.708l3 3z" />
							</svg>
							<h4 style="margin-left: 3rem;">보낸 매칭</h4>
						</button>
					</h2>
					<div id="panelsStayOpen-collapseOne" class="accordion-collapse collapse show" aria-labelledby="panelsStayOpen-headingOne">
						<div class="accordion-body">







							<div class="m-5">
								<h3 style="border-bottom: 2px solid blue;">용 병 구인 / 구직</h3>
							</div>
							<div class="profile-teaser text-center">
								<table class="table table-striped table-hover">
									<thead>
										<tr>
											<th scope="col" width="10%">구분</th>
											<th scope="col" width="10%">지역</th>
											<th scope="col" width="*%">매치일자</th>
											<th scope="col" width="10%">신청인원</th>
											<th scope="col" width="15%">작성자</th>
											<th scope="col" width="15%">작성일자</th>
											<th scope="col" width="10%">신청</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${MymercBoardList }" var="mercBoard" begin="0" end="4">
											<tr data-bs-toggle="modal" data-bs-target="#recruitDetailModal" onclick="recruitInfo1('${mercBoard.mercBoardCode}')">
												<td>${mercBoard.mercBoardSort }</td>
												<td>${mercBoard.mercBoardLocation }</td>
												<td>${mercBoard.mercBoardDate }&nbsp;/&nbsp;${mercBoard.mercBoardStartTime }&nbsp;~&nbsp;${mercBoard.mercBoardEndTime }</td>
												<td>${mercBoard.mercBoardApplyNumber }명</td>
												<td>${mercBoard.memberId }</td>
												<td>${mercBoard.mercBoardRegdate }</td>
												<c:choose>
													<c:when test="${mercBoard.mercBoardPossible eq '1' }">
														<td><button type="button" class="btn btn-success">
															<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-check-fill" viewBox="0 0 16 16">
															  <path fill-rule="evenodd" d="M15.854 5.146a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708 0l-1.5-1.5a.5.5 0 0 1 .708-.708L12.5 7.793l2.646-2.647a.5.5 0 0 1 .708 0z"/>
															  <path d="M1 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H1zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
															</svg>&nbsp;신청
															</button></td>
													</c:when>
													<c:otherwise>
														<td><button type="button" class="btn btn-danger">
															<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-x-fill" viewBox="0 0 16 16">
															  <path fill-rule="evenodd" d="M1 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H1zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm6.146-2.854a.5.5 0 0 1 .708 0L14 6.293l1.146-1.147a.5.5 0 0 1 .708.708L14.707 7l1.147 1.146a.5.5 0 0 1-.708.708L14 7.707l-1.146 1.147a.5.5 0 0 1-.708-.708L13.293 7l-1.147-1.146a.5.5 0 0 1 0-.708z" />
															</svg>&nbsp;마감
													</c:otherwise>
												</c:choose>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>








							<div class="m-5">
								<h3 style="border-bottom: 2px solid blue;">매 치 신 청</h3>
							</div>
							<div class="profile-teaser text-center">
								<table class="table table-striped table-hover">
									<thead>
										<tr>
											<th scope="col" width="10%">지역</th>
											<th scope="col" width="*%">매치일자</th>
											<th scope="col" width="15%">신청팀</th>
											<th scope="col" width="15%">작성팀</th>
											<th scope="col" width="15%">작성일자</th>
											<th scope="col" width="10%">신청</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${matchList }" var="match" begin="0" end="4">
											<tr data-bs-toggle="modal" data-bs-target="#matchDetailModal" onclick="recruitInfo2('${match.matchCode}')">
												<td>${match.matchLocation }</td>
												<td>${match.matchDate }&nbsp;/&nbsp;${match.matchStartTime }&nbsp;~&nbsp;${match.matchEndTime }</td>
												<td>${match.matchApplyNum }명</td>
												<td>${match.matchWriter }</td>
												<td>${match.matchRegdate }</td>
												<c:choose>
													<c:when test="${match.matchPossible eq '1' }">
													<td><button type="button" class="btn btn-success">
															<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-lightbulb-fill" viewBox="0 0 16 16">
															  <path d="M2 6a6 6 0 1 1 10.174 4.31c-.203.196-.359.4-.453.619l-.762 1.769A.5.5 0 0 1 10.5 13h-5a.5.5 0 0 1-.46-.302l-.761-1.77a1.964 1.964 0 0 0-.453-.618A5.984 5.984 0 0 1 2 6zm3 8.5a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1l-.224.447a1 1 0 0 1-.894.553H6.618a1 1 0 0 1-.894-.553L5.5 15a.5.5 0 0 1-.5-.5z"/>
															</svg>&nbsp;신청
														</button></td>
														</c:when>
													<c:otherwise>
														<td><button type="button" class="btn btn-danger">
															<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-lightbulb-off-fill" viewBox="0 0 16 16">
															  <path d="M2 6c0-.572.08-1.125.23-1.65l8.558 8.559A.5.5 0 0 1 10.5 13h-5a.5.5 0 0 1-.46-.302l-.761-1.77a1.964 1.964 0 0 0-.453-.618A5.984 5.984 0 0 1 2 6zm10.303 4.181L3.818 1.697a6 6 0 0 1 8.484 8.484zM5 14.5a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1l-.224.447a1 1 0 0 1-.894.553H6.618a1 1 0 0 1-.894-.553L5.5 15a.5.5 0 0 1-.5-.5zM2.354 1.646a.5.5 0 1 0-.708.708l12 12a.5.5 0 0 0 .708-.708l-12-12z"/>
															</svg>&nbsp;마감
														</button></td>
													</c:otherwise>
												</c:choose>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>









						</div>
					</div>
				</div>



				<div class="accordion-item">
					<h2 class="accordion-header" id="panelsStayOpen-headingTwo">
						<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseTwo" aria-expanded="false" aria-controls="panelsStayOpen-collapseTwo">
							<svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" fill="currentColor" class="bi bi-cloud-upload-fill" viewBox="0 0 16 16">
							  <path fill-rule="evenodd" d="M8 0a5.53 5.53 0 0 0-3.594 1.342c-.766.66-1.321 1.52-1.464 2.383C1.266 4.095 0 5.555 0 7.318 0 9.366 1.708 11 3.781 11H7.5V5.707L5.354 7.854a.5.5 0 1 1-.708-.708l3-3a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1-.708.708L8.5 5.707V11h4.188C14.502 11 16 9.57 16 7.773c0-1.636-1.242-2.969-2.834-3.194C12.923 1.999 10.69 0 8 0zm-.5 14.5V11h1v3.5a.5.5 0 0 1-1 0z" />
							</svg>
							<h4 style="margin-left: 3rem;">받은 매칭</h4>
						</button>
					</h2>
					<div id="panelsStayOpen-collapseTwo" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingTwo">
						<div class="accordion-body">



							<div class="m-5">
								<h3 style="border-bottom: 2px solid blue;">용 병 구인 / 구직</h3>
							</div>
							<div class="profile-teaser text-center">
								<table class="table table-striped table-hover">
									<thead>
										<tr>
											<th scope="col" width="10%">구분</th>
											<th scope="col" width="10%">지역</th>
											<th scope="col" width="*%">매치일자</th>
											<th scope="col" width="10%">신청인원</th>
											<th scope="col" width="15%">작성자</th>
											<th scope="col" width="15%">작성일자</th>
											<th scope="col" width="10%">신청</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${MyRequestmercBoardList }" var="requestMercBoard" begin="0" end="4">
											<tr data-bs-toggle="modal" data-bs-target="#recruitDetailModal" onclick="recruitInfo1('${requestMercBoard.mercBoardCode}')">
												<td>${requestMercBoard.mercBoardSort }</td>
												<td>${requestMercBoard.mercBoardLocation }</td>
												<td>${requestMercBoard.mercBoardDate }&nbsp;/&nbsp;${requestMercBoard.mercBoardStartTime }&nbsp;~&nbsp;${requestMercBoard.mercBoardEndTime }</td>
												<td>${requestMercBoard.mercBoardApplyNumber }명</td>
												<td>${requestMercBoard.memberId }</td>
												<td>${requestMercBoard.mercBoardRegdate }</td>
												<c:choose>
													<c:when test="${requestMercBoard.mercBoardPossible eq '1' }">
														<td><button type="button" class="btn btn-success">
															<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-check-fill" viewBox="0 0 16 16">
															  <path fill-rule="evenodd" d="M15.854 5.146a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708 0l-1.5-1.5a.5.5 0 0 1 .708-.708L12.5 7.793l2.646-2.647a.5.5 0 0 1 .708 0z"/>
															  <path d="M1 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H1zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
															</svg>&nbsp;신청
															</button></td>
													</c:when>
													<c:otherwise>
														<td><button type="button" class="btn btn-danger">
															<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-x-fill" viewBox="0 0 16 16">
															  <path fill-rule="evenodd" d="M1 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H1zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm6.146-2.854a.5.5 0 0 1 .708 0L14 6.293l1.146-1.147a.5.5 0 0 1 .708.708L14.707 7l1.147 1.146a.5.5 0 0 1-.708.708L14 7.707l-1.146 1.147a.5.5 0 0 1-.708-.708L13.293 7l-1.147-1.146a.5.5 0 0 1 0-.708z" />
															</svg>&nbsp;마감
													</c:otherwise>
												</c:choose>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
							<div class="m-5">
								<h3 style="border-bottom: 2px solid blue;">매 치 신 청</h3>
							</div>
							<div class="profile-teaser text-center">
								<table class="table table-striped table-hover">
									<thead>
										<tr>
											<th scope="col" width="10%">지역</th>
											<th scope="col" width="*%">매치일자</th>
											<th scope="col" width="15%">신청팀</th>
											<th scope="col" width="15%">작성팀</th>
											<th scope="col" width="15%">작성일자</th>
											<th scope="col" width="10%">신청</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${requestMatchList }" var="requestMatch" begin="0" end="4">
											<tr data-bs-toggle="modal" data-bs-target="#matchDetailModal" onclick="recruitInfo2('${requestMatch.matchCode}')">
												<td>${requestMatch.matchLocation }</td>
												<td>${requestMatch.matchDate }&nbsp;/&nbsp;${requestMatch.matchStartTime }&nbsp;~&nbsp;${requestMatch.matchEndTime }</td>
												<td>${requestMatch.matchApplyNum }명</td>
												<td>${requestMatch.matchWriter }</td>
												<td>${requestMatch.matchRegdate }</td>
												<c:choose>
													<c:when test="${requestMatch.matchPossible eq '1' }">
														<td><button type="button" class="btn btn-success">
															<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-lightbulb-fill" viewBox="0 0 16 16">
															  <path d="M2 6a6 6 0 1 1 10.174 4.31c-.203.196-.359.4-.453.619l-.762 1.769A.5.5 0 0 1 10.5 13h-5a.5.5 0 0 1-.46-.302l-.761-1.77a1.964 1.964 0 0 0-.453-.618A5.984 5.984 0 0 1 2 6zm3 8.5a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1l-.224.447a1 1 0 0 1-.894.553H6.618a1 1 0 0 1-.894-.553L5.5 15a.5.5 0 0 1-.5-.5z"/>
															</svg>&nbsp;신청
														</button></td>
													</c:when>
													<c:otherwise>
														<td><button type="button" class="btn btn-danger">
															<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-lightbulb-off-fill" viewBox="0 0 16 16">
															  <path d="M2 6c0-.572.08-1.125.23-1.65l8.558 8.559A.5.5 0 0 1 10.5 13h-5a.5.5 0 0 1-.46-.302l-.761-1.77a1.964 1.964 0 0 0-.453-.618A5.984 5.984 0 0 1 2 6zm10.303 4.181L3.818 1.697a6 6 0 0 1 8.484 8.484zM5 14.5a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1l-.224.447a1 1 0 0 1-.894.553H6.618a1 1 0 0 1-.894-.553L5.5 15a.5.5 0 0 1-.5-.5zM2.354 1.646a.5.5 0 1 0-.708.708l12 12a.5.5 0 0 0 .708-.708l-12-12z"/>
															</svg>&nbsp;마감
														</button></td>
													</c:otherwise>
												</c:choose>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>







						</div>
					</div>
				</div>


			</div>


		</div>
	</div>





	<!-- tr 클릭시 상세보기 모달창이고, mercenary_recruit_detail.jsp을 불러와서 div class=content안에 내용 넣음 -->
	<div class="modal fade" tabindex="-1" id="recruitDetailModal">
		<div class="modal-dialog modal-lg">
			<div class="modal-content mercDetail"></div>
		</div>
	</div>
	<div class="modal fade" tabindex="-1" id="matchDetailModal">
		<div class="modal-dialog modal-lg">
			<div class="modal-content matchDetail"></div>
		</div>
	</div>
	<!-- Modal -->
	<div class="modal fade" id="deleteMemberModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">회 원 탈 퇴</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">정말 탈퇴하시겠습니까?</div>
				<div class="modal-footer d-flex justify-content-around">
					<button style="width: 10rem;" type="button" class="btn btn-outline-danger" onclick="location.href='/member/deleteMember'">탈 퇴</button>
					<button style="width: 10rem;" type="button" class="btn btn-primary" data-bs-dismiss="modal">취 소</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>