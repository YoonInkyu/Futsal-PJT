<!--  10 월 21일 송영준 -->

<!-- 박성환 10/25 : 테이블 수정, 데이터 포문 주석처리 -->


<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>






	<div class="row my-3 mb-5 ">

		<div class="col text-center">
			<img class="shadow-lg p-3 mb-5 bg-body rounded" src="/resources/img/common/team_list1.PNG" width="20%;">
		</div>

	</div>





	<div class="row  justify-content-center">

		<div class="col-8 p-3 shadow-lg p-3 mb-5 bg-body rounded">

			<div class="accordion" id="accordionPanelsStayOpenExample">





				<div class="accordion-item">
					<h2 class="accordion-header" id="panelsStayOpen-headingOne">
						<button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseOne" aria-expanded="true" aria-controls="panelsStayOpen-collapseOne">랭킹 1위 ~ 10위</button>
					</h2>



					<div id="panelsStayOpen-collapseOne" class="accordion-collapse collapse show" aria-labelledby="panelsStayOpen-headingOne">

						<div class="accordion-body">

							<table class="table table-striped table-hover text-center">

								<thead>

									<tr>
										<th scope="col" width="20%">팀 마크</th>

										<th scope="col" width="20%">랭 킹</th>

										<th scope="col" width="20%">팀 이름</th>

										<th scope="col" width="20%">인 원</th>

										<th scope="col" width="20%">상세 정보</th>
									</tr>

								</thead>

								<tbody>
									<c:forEach items="${teamList }" var="teamList">
									<tr>
										<td><img src="/resources/img/team/${teamList.teamLogoImgOrignName }" width="30%"></td>
										<td>${teamList.rankTotalScore }</td>
										<td>${teamList.teamName }</td>
										<td>${teamList.memberCount }</td>
										<td>
											<!-- Button trigger modal -->
											<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop">상세보기</button> <!-- Modal -->
											<div class="modal fade  " id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
												<div class="modal-dialog">
													<div class="modal-content">
														<div class="modal-header">
															<h5 class="modal-title" id="staticBackdropLabel"></h5>
															<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
														</div>
														
															<div class="modal-body">
																<p>
																	<img src="/resources/img/team/${teamList.teamLogoImgOrignName }" width="30%">
																</p>
																<p>회원수 : ${teamList.memberCount }</p>
																<p>이미지 : ${teamList.memberImgAttachedName }</p>
																<p>이름 : ${teamList.memberName }</p>
																<p>성별 : ${teamList.memberGender }</p>
																<p>연락처 : ${teamList.memberTell }</p>
																<p>등급 : ${teamList.teamAdmin }</p>
																<p>포지션 : ${teamList.position }</p>
													
															</div>
														
														<div class="modal-footer justify-content-between">
															<button type="button" class="btn btn-outline-success">가입 신청</button>
															<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
														</div>
													</div>
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
		</div>
	</div>



</body>
</html>