<!-- 10/25 박성환 : 초기 생성 -->



<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
										<img style="margin-right: 1rem;" src="/resources/img/common/img2.png" width="6%">가입 요청 리스트
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
																	<td><img src="/resources/img/member/${applyMember.memberImgAttachedName }" width="30%"></td>
																</c:when>
																<c:otherwise>
																	<td><img src="/resources/img/member/nullImg.png" width="30%"></td>
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
										<td><img src="/resources/img/member/${member.memberImgAttachedName }" width="30%"></td>
									</c:if>
									<c:if test="${empty member.memberImgAttachedName }">
										<td><img src="/resources/img/member/nullImg.png" width="30%"></td>
									</c:if>
									<td>${member.memberName }</td>
									<td>${member.position }</td>
									<td>일반회원</td>
									<td>
										<!-- Button trigger modal -->
										<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop" onclick="teamMemberDetail('${member.memberCode}')">상세보기</button> <!-- Modal --> <script type="text/javascript">
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