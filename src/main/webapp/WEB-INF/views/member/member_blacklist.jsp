<!-- 박성환 10/27 : 포멧 초기 설정 -->


<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>





	<div class="container col-5 mx-auto">
	
		<div class="row my-3 align-items-center">
			<div class="col-4 text-end">
				<img alt="" src="/resources/img/common/bg5.png" width="50%;" class="pr-5">
			</div>
			<div class="col-5">
				<h2 style="border-bottom: 3px solid gray;">BLACK LIST</h2>
			</div>
		</div>
		<div class="row ">
			<div class="row mt-5">
				<div class="col-8 mx-auto">
					<table class="table table-striped table-hover text-center">
						<thead>
							<tr>
								<th scope="col" width="*%">사 진</th>
								<th scope="col" width="20%">이 름</th>
								<th scope="col" width="20%">등록 날짜</th>
								<th scope="col" width="20%">상세 보기</th>
							</tr>
						</thead>
						<tbody>

							<c:forEach items="${black }" var="blackInfo" varStatus="status">
								<c:if test="${blackInfo.blackName != null }">
									<tr>
										<c:if test="${not empty blackInfo.blackImg }">
											<td><img src="/resources/img/member/${blackInfo.blackImg }" width="30%"></td>
										</c:if>
										<c:if test="${empty blackInfo.blackImg }">	
											<td><img src="/resources/img/member/nullImg.png" width="30%"></td>
										</c:if>
										<td>${blackInfo.blackName }</td>
										<td>${blackInfo.blackDate }</td>
										<td>
											<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop${status.index }">Detail</button> <!-- Modal -->
											<div class="modal fade  " id="staticBackdrop${status.index }" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
												<div class="modal-dialog">
													<div class="modal-content">
														<div class="modal-header">
															<h3 class="modal-title" id="staticBackdropLabel">블랙 상세 정보</h3>
															<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
														</div>
														
														<div class="modal-body">

															<div class="row align-items-center">

																<div class="col">
																	<div>이름 : ${blackInfo.blackName }</div>
																	<div class="my-5">포지션 : ${blackInfo.blackPosition }</div>
																	<div>블랙등록일 : ${blackInfo.blackDate }</div>
																</div>


																<div class="col text-center">
																	<div>
																		<img alt="" src="/resources/img/member/nullImg.png" width="80%">
																	</div>
																</div>

															</div>
															
															<c:if test="${not empty blackInfo.blackTeam }">

																<div class="my-5" style="border-bottom: 1px solid gray;"></div>

																<div class="row align-items-center">

																	<div class="col">
																		<div>팀 명 : ${blackInfo.blackTeam }</div>
																		<div class="my-5">팀 활동지역 : ${blackInfo.blackTeamLocation }</div>
																		<div>팀 랭킹 :</div>
																	</div>


																	<div class="col text-center">
																		<div>
																			<img alt="" src="/resources/img/common/1.png" width="80%">
																		</div>
																	</div>

																</div>
																
															</c:if>

															<div class="row mt-3">

																<div class="form-floating">
																	<textarea name="teamIntro" class="form-control" placeholder="Leave a comment here" id="floatingTextarea2" style="height: 200px" readonly></textarea>
																	<label for="floatingTextarea2">${blackInfo.blackComment }</label>
																</div>

															</div>

														</div>
														
														
														
														<div class="modal-footer d-flex justify-content-between">
															<button style="width: 10rem;" type="button" class="btn btn-outline-danger" onclick="location.href='/member/deleteMemberBlack?blackmemberCode=${blackInfo.blackmemberCode}';">블럭 삭제</button>
															<button style="width: 10rem;" type="button" class="btn btn-primary" data-bs-dismiss="modal">취 소</button>
														</div>
														
														
														
													</div>
												</div>
											</div>
										</td>
									</tr>
								</c:if>
								<c:if test="${blackInfo.blackName == null }">
									<tr>
										<td colspan="4" style="text-align: center;">등록된 블랙리스트가 없습니다.</td>
									</tr>
								</c:if>
							</c:forEach>

						</tbody>
					</table>
				</div>
			</div>
			<!-- 			<div class="row mt-5">
				<div class="col">
					<nav aria-label="Page navigation example">
						<ul class="pagination justify-content-center m-0 p-0">
							<li class="page-item"><a class="page-link" href="#" aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
							</a></li>
							<li class="page-item active"><a class="page-link" href="#">1</a></li>
							<li class="page-item"><a class="page-link" href="#">2</a></li>
							<li class="page-item"><a class="page-link" href="#">3</a></li>
							<li class="page-item"><a class="page-link" href="#" aria-label="Next"> <span aria-hidden="true">&raquo;</span>
							</a></li>
						</ul>
					</nav>
				</div>
			</div> -->
		</div>
	</div>
</body>
</html>