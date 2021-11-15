<!-- 10/25 박성환 : 초기 생성 -->



<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title>나의 팀, 관리</title>
</head>
<body>








	<div class="container">
		<div class="row my-5">

			<div class="col-1 text-end">
				<img alt="" src="/resources/img/common/bg2.png" width="100%;" class="pr-5">
			</div>

			<div class="col-6 text-starts align-self-center">
				<h2 style="border-bottom: 3px solid gray;">팀 관 리</h2>
			</div>

		</div>

		<div class="col-7">
			<div class="row  justify-content-center">
				<div class="p-3 shadow-lg p-3 mb-5 bg-body rounded">
					<div class="accordion" id="accordionPanelsStayOpenExample">


						<c:if test="${teamAdmin eq '3' }">
							<div class="accordion-item">
								<h2 class="accordion-header" id="panelsStayOpen-headingOne">
									<button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseOne" aria-expanded="true" aria-controls="panelsStayOpen-collapseOne">
										<svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" fill="currentColor" class="bi bi-hourglass-split" viewBox="0 0 16 16">
										  <path d="M2.5 15a.5.5 0 1 1 0-1h1v-1a4.5 4.5 0 0 1 2.557-4.06c.29-.139.443-.377.443-.59v-.7c0-.213-.154-.451-.443-.59A4.5 4.5 0 0 1 3.5 3V2h-1a.5.5 0 0 1 0-1h11a.5.5 0 0 1 0 1h-1v1a4.5 4.5 0 0 1-2.557 4.06c-.29.139-.443.377-.443.59v.7c0 .213.154.451.443.59A4.5 4.5 0 0 1 12.5 13v1h1a.5.5 0 0 1 0 1h-11zm2-13v1c0 .537.12 1.045.337 1.5h6.326c.216-.455.337-.963.337-1.5V2h-7zm3 6.35c0 .701-.478 1.236-1.011 1.492A3.5 3.5 0 0 0 4.5 13s.866-1.299 3-1.48V8.35zm1 0v3.17c2.134.181 3 1.48 3 1.48a3.5 3.5 0 0 0-1.989-3.158C8.978 9.586 8.5 9.052 8.5 8.351z"/>
										</svg><h4 style="margin-left: 3rem;">가입 요청 리스트</h4>
									</button>
								</h2>
								<div id="panelsStayOpen-collapseOne" class="accordion-collapse collapse show" aria-labelledby="panelsStayOpen-headingOne">
									<div class="accordion-body">
										<div class="row">
											<table class="table table-striped table-hover text-center">
												<thead>
													<tr>
														<th scope="col" width="20%">사진</th>
														<th scope="col" width="20%">이름</th>
														<th scope="col" width="20%">포지션</th>
														<th scope="col" width="20%">성 별</th>
														<th scope="col" width="20%">가입 요청</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach items="${applyMember }" var="applyMember">
														<tr>
															<c:choose>
																<c:when test="${not empty applyMember.memberImgAttachedName }">
																	<td><i class="bi bi-camera-fill"></i><img class="img-thumbnail" src="/resources/img/member/${applyMember.memberImgAttachedName }" style="height: 38px; object-fit: cover;"></td>
																</c:when>
																<c:otherwise>
																	<td><i class="bi bi-camera-fill"></i><img class="img-thumbnail" src="/resources/img/member/nullImg.png" style="height: 38px; object-fit: cover;"></td>
																</c:otherwise>
															</c:choose>
															<td>${applyMember.memberName }</td>
															<td>${applyMember.position }</td>
															<td>${applyMember.memberGender }</td>
															<td>
																<button type="button" class="btn btn-primary" onclick="location.href='teamApplyApproval?memberCode=${applyMember.memberCode}'">승인</button>
																<button type="button" class="btn btn-danger" onclick="location.href='teamApplyReject?memberCode=${applyMember.memberCode}'">거절</button>
															</td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
										</div>
									</div>
								</div>
							</div>
						</c:if>


					</div>
				</div>
			</div>
		</div>
	</div>





	<div class="container">

		<div class="col-7">

			<div class="row mt-5 mb-3 p-5">
				<h4 class="mb-3" style="border-bottom: 2px solid blue;">팀원 리스트</h4>
			</div>

			<div class="row  justify-content-center">


				<div class="col text-center shadow-lg p-3 mb-5 bg-body rounded">

					<table class="table table-striped table-hover">

						<thead>

							<tr>
								<th scope="col" width="20%">팀원 사진</th>
								<th scope="col" width="20%">이름</th>
								<th scope="col" width="20%">포지션</th>
								<th scope="col" width="20%">등급</th>
								<th scope="col" width="20%">상세 정보</th>
							</tr>


						</thead>


						<tbody>
							<c:forEach items="${memberList }" var="member">
								<tr>
									<c:if test="${not empty member.memberImgAttachedName }">
										<td><i class="bi bi-camera-fill"></i><img class="img-thumbnail" src="/resources/img/member/${member.memberImgAttachedName }" style="height: 38px; object-fit: cover;"></td>
									</c:if>
									<c:if test="${empty member.memberImgAttachedName }">
										<td><i class="bi bi-camera-fill"></i><img class="img-thumbnail" src="/resources/img/member/nullImg.png" style="height: 38px; object-fit: cover;"></td>
									</c:if>
									<td>${member.memberName }</td>
									<td>${member.position }</td>
									<td>
										<c:choose>
											<c:when test="${member.teamAdmin eq '3'}">팀장</c:when>
											<c:otherwise> 팀원</c:otherwise>
										</c:choose>
									</td>
								
									
									<td>
										<!-- Button trigger modal -->
										<button type="button" class="btn btn-outline-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop" onclick="teamMemberDetail('${member.memberCode}')">상세보기</button> <!-- Modal --> <script type="text/javascript">
											function teamMemberDetail(memberCode) {
												$(".modal-content").load("/team/teamMemberDetail?memberCode=" + memberCode);
											}
										</script>
										<div class="modal fade  " id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
											<div class="modal-dialog">

												<div class="modal-content"></div>
											</div>
										</div>
									</td>
								</tr>
							</c:forEach>
						</tbody>

					</table>

				</div>

			</div>
		</div>
	</div>









	<!-- 							<div class="accordion-item"> -->
	<!-- 								<h2 class="accordion-header" id="panelsStayOpen-headingTwo"> -->
	<!-- 									<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseTwo" aria-expanded="false" aria-controls="panelsStayOpen-collapseTwo"> -->
	<!-- 										<img src="/resources/img/common/1.png" width="10%"> 팀원 리스트 -->
	<!-- 									</button> -->
	<!-- 								</h2> -->

	<!-- 								<div id="panelsStayOpen-collapseTwo" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingTwo"> -->
	<!-- 									<div class="accordion-body"> -->
	<!-- 										<div class="row"> -->

	<!-- 											<table class="table table-striped table-hover text-center"> -->
	<!-- 												<thead> -->
	<!-- 													<tr> -->
	<!-- 														<th scope="col" width="25%">팀원 사진</th> -->
	<!-- 														<th scope="col" width="25%">이름</th> -->
	<!-- 														<th scope="col" width="25%">포지션</th> -->
	<!-- 														<th scope="col" width="25%">상세 정보</th> -->
	<!-- 													</tr> -->
	<!-- 												</thead> -->

	<!-- 												<tbody> -->
	<%-- 													<c:forEach items="${memberList }" var="member"> --%>
	<!-- 														<tr> -->
	<%-- 															<c:if test="${not empty member.memberImgAttachedName }"> --%>
	<%-- 																<td><img src="/resources/img/member/${member.memberImgAttachedName }" width="30%"></td> --%>
	<%-- 															</c:if> --%>
	<%-- 															<c:if test="${empty member.memberImgAttachedName }"> --%>
	<!-- 																<td><img src="/resources/img/member/nullImg.png" width="30%"></td> -->
	<%-- 															</c:if> --%>
	<%-- 															<td>${member.memberName }</td> --%>
	<%-- 															<td>${member.position }</td> --%>
	<%-- 															<td>${member.memberCode }</td> --%>
	<!-- 															<td> -->
	<!-- 																Button trigger modal -->
	<%-- 																<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop" onclick="teamMemberDetail('${member.memberCode}')">상세보기</button> <!-- Modal --> <script type="text/javascript"> --%>
	<!-- // 																	function teamMemberDetail(memberCode) { -->
	<!-- // 																		$(".modal-content").load("/team/teamMemberDetail?memberCode=" + memberCode); -->
	<!-- // 																	} -->
	<!-- 																</script> -->
	<!-- 																<div class="modal fade  " id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true"> -->
	<!-- 																	<div class="modal-dialog"> -->

	<!-- 																		<div class="modal-content"></div> -->
	<!-- 																	</div> -->
	<!-- 																</div> -->
	<!-- 															</td> -->
	<!-- 														</tr> -->
	<%-- 													</c:forEach> --%>
	<!-- 												</tbody> -->
	<!-- 											</table> -->

	<!-- 										</div> -->
	<!-- 									</div> -->
	<!-- 								</div> -->
	<!-- 							</div> -->




</body>
</html>