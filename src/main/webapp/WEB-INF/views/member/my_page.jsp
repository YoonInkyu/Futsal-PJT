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
	<div class="container col-6 mx-auto">
		<div class="row shadow-lg p-3 mb-5 bg-body rounded">
			<div class="col m-5">
				<h2 style="border-bottom: 3px solid gray;">
					선수 소개 <span style="display: inline-block; float: right;"><button type="button" class="btn link-danger" data-bs-toggle="modal" data-bs-target="#deleteMemberModal">회원탈퇴</button></span>
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
				<h2 style="border-bottom: 3px solid gray;">게시글 보기</h2>
			</div>



			<div class="accordion mt-5" id="accordionPanelsStayOpenExample">
				<div class="accordion-item">
					<h2 class="accordion-header" id="panelsStayOpen-headingOne">
						<button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseOne" aria-expanded="true" aria-controls="panelsStayOpen-collapseOne">
							<img style="margin-right: 1rem;" src="/resources/img/common/out.png" width="10%"><h4>
							보낸 매칭
							</h4>
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
														<td><button type="button" class="btn btn-info">신청</button></td>
													</c:when>
													<c:otherwise>
														<td><button type="button" class="btn btn-danger">마감</button></td>
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
														<td><button type="button" class="btn btn-info">신청</button></td>
													</c:when>
													<c:otherwise>
														<td><button type="button" class="btn btn-danger">마감</button></td>
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
							<img style="margin-right: 1rem;" src="/resources/img/common/in.png" width="10%">
							<h4>받은 매칭</h4>
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
														<td><button type="button" class="btn btn-info">신청</button></td>
													</c:when>
													<c:otherwise>
														<td><button type="button" class="btn btn-danger">마감</button></td>
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
														<td><button type="button" class="btn btn-info">신청</button></td>
													</c:when>
													<c:otherwise>
														<td><button type="button" class="btn btn-danger">마감</button></td>
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