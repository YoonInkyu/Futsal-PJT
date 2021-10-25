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
										<th scope="col">팀 마크</th>
										<th scope="col">랭 킹</th>
										<th scope="col">팀 이름</th>
										<th scope="col">인 원</th>
										<th scope="col">상세 정보</th>
									</tr>

								</thead>

								<tbody>




									<tr>

										<td><img src="/resources/img/common/1.png" width="10%"></td>
										<td>1 위</td>
										<td>울산 FC</td>
										<td>20 명</td>

										<td>
											<!-- Button trigger modal -->
											<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop">Detail</button> <!-- Modal -->
											<div class="modal fade  " id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
												<div class="modal-dialog">
													<div class="modal-content">
														<div class="modal-header">
															<h5 class="modal-title" id="staticBackdropLabel">울산 FC 상세 정보</h5>
															<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
														</div>
														<div class="modal-body">

															<p>
																<img src="/resources/img/common/1.png" width="30%">
															</p>
															<p>이름 : 원빈</p>

															<p>나이 : 1977 / 11 / 10 (43세)</p>

															<p>지역 : 울산</p>
															<p>성별 : 남자</p>
															<p>포지션 : 공격</p>
															<p>연락처 : 010-1111-3333</p>
															<p>자기 소개 : 안녕하세요 원빈 입니다. 전 티.오.피 만 먹습니다. 여러분들도 그렇게 하길 바래요 얼마면 되</p>

														</div>
														<div class="modal-footer">
															<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
															<button type="button" class="btn btn-outline-success">경기 요청</button>
														</div>
													</div>
												</div>
											</div>

										</td>

									</tr>





									<tr>

										<td><img src="/resources/img/common/2.png" width="10%"></td>
										<td>2 위</td>
										<td>포항 FC</td>
										<td>10 명</td>

										<td>
											<!-- Button trigger modal -->
											<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop2">Detail</button> <!-- Modal -->
											<div class="modal fade  " id="staticBackdrop2" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
												<div class="modal-dialog">
													<div class="modal-content">
														<div class="modal-header">
															<h5 class="modal-title" id="staticBackdropLabel">울산 FC 상세 정보</h5>
															<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
														</div>
														<div class="modal-body">

															<p>
																<img src="/resources/img/common/2.png" width="30%">
															</p>
															<p>이름 : 원빈</p>

															<p>나이 : 1977 / 11 / 10 (43세)</p>

															<p>지역 : 울산</p>
															<p>성별 : 남자</p>
															<p>포지션 : 공격</p>
															<p>연락처 : 010-1111-3333</p>
															<p>자기 소개 : 안녕하세요 원빈 입니다. 전 티.오.피 만 먹습니다. 여러분들도 그렇게 하길 바래요 얼마면 되</p>

														</div>
														<div class="modal-footer">
															<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
															<button type="button" class="btn btn-outline-success">경기 요청</button>
														</div>
													</div>
												</div>
											</div>

										</td>

									</tr>




								</tbody>

							</table>


						</div>

					</div>
				</div>





				<div class="accordion-item">
					<h2 class="accordion-header" id="panelsStayOpen-headingTwo">
						<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseTwo" aria-expanded="false" aria-controls="panelsStayOpen-collapseTwo">랭킹 11위 ~ 20위</button>
					</h2>
					<div id="panelsStayOpen-collapseTwo" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingTwo">
						<div class="accordion-body">

							<table class="table table-striped table-hover text-center">

								<thead>

									<tr>
										<th scope="col">팀 마크</th>
										<th scope="col">랭 킹</th>
										<th scope="col">팀 이름</th>
										<th scope="col">인 원</th>
										<th scope="col">상세 정보</th>
									</tr>

								</thead>

								<tbody>

									<tr>

										<td><img src="/resources/img/common/1.png" width="10%"></td>
										<td>11 위</td>
										<td>울산 FC</td>
										<td>20 명</td>

										<td>
											<!-- Button trigger modal -->
											<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop">Detail</button> <!-- Modal -->
											<div class="modal fade  " id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
												<div class="modal-dialog">
													<div class="modal-content">
														<div class="modal-header">
															<h5 class="modal-title" id="staticBackdropLabel">울산 FC 상세 정보</h5>
															<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
														</div>
														<div class="modal-body">

															<p>
																<img src="/resources/img/common/1.png" width="30%">
															</p>
															<p>이름 : 원빈</p>

															<p>나이 : 1977 / 11 / 10 (43세)</p>

															<p>지역 : 울산</p>
															<p>성별 : 남자</p>
															<p>포지션 : 공격</p>
															<p>연락처 : 010-1111-3333</p>
															<p>자기 소개 : 안녕하세요 원빈 입니다. 전 티.오.피 만 먹습니다. 여러분들도 그렇게 하길 바래요 얼마면 되</p>

														</div>
														<div class="modal-footer">
															<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
															<button type="button" class="btn btn-outline-success">경기 요청</button>
														</div>
													</div>
												</div>
											</div>

										</td>

									</tr>




									<tr>

										<td><img src="/resources/img/common/2.png" width="10%"></td>
										<td>12 위</td>
										<td>포항 FC</td>
										<td>10 명</td>

										<td>
											<!-- Button trigger modal -->
											<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop">Detail</button> <!-- Modal -->
											<div class="modal fade  " id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
												<div class="modal-dialog">
													<div class="modal-content">
														<div class="modal-header">
															<h5 class="modal-title" id="staticBackdropLabel">울산 FC 상세 정보</h5>
															<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
														</div>
														<div class="modal-body">

															<p>
																<img src="/resources/img/common/2.png" width="30%">
															</p>
															<p>이름 : 원빈</p>

															<p>나이 : 1977 / 11 / 10 (43세)</p>

															<p>지역 : 울산</p>
															<p>성별 : 남자</p>
															<p>포지션 : 공격</p>
															<p>연락처 : 010-1111-3333</p>
															<p>자기 소개 : 안녕하세요 원빈 입니다. 전 티.오.피 만 먹습니다. 여러분들도 그렇게 하길 바래요 얼마면 되</p>

														</div>
														<div class="modal-footer">
															<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
															<button type="button" class="btn btn-outline-success">경기 요청</button>
														</div>
													</div>
												</div>
											</div>

										</td>

									</tr>









								</tbody>

							</table>

						</div>

					</div>

				</div>













				<%-- 							<c:forEach items="${teamList }" var="teamList"> --%>
				<!-- 							<div class="row"> -->

				<!-- 								<div class="col"> -->
				<!-- 									<img alt="" src="">이미지 -->
				<!-- 								</div> -->
				<%-- 								<div class="col">${teamList.teamName}</div> --%>
				<%-- 								<div class="col">${teamList.teamLocation}</div> --%>
				<!-- 								<div class="col">팀 소개</div> -->
				<!-- 								<div class="col">랭 킹</div> -->

				<!-- 							</div> -->
				<%-- 							</c:forEach> --%>










			</div>

		</div>

	</div>



</body>
</html>