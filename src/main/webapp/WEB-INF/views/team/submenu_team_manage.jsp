<!-- 10/25 박성환 : 초기 생성 -->



<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<div class="container">
		<div class="row">
			<div class="mx-auto">
				<div class="row  justify-content-center">
					<div class="p-3 shadow-lg p-3 mb-5 bg-body rounded">
						<div class="accordion" id="accordionPanelsStayOpenExample">
						
							<div class="accordion-item">
								<h2 class="accordion-header" id="panelsStayOpen-headingOne">
									<button class="accordion-button" type="button"
										data-bs-toggle="collapse"
										data-bs-target="#panelsStayOpen-collapseOne"
										aria-expanded="true"
										aria-controls="panelsStayOpen-collapseOne">
										<img src="/resources/img/common/1.png" width="10%"> 팀 구성원
									</button>
									
								</h2>
								<div id="panelsStayOpen-collapseOne"
									class="accordion-collapse collapse show"
									aria-labelledby="panelsStayOpen-headingOne">
									<div class="accordion-body">
										<div class="row">
										
											<table class="table table-striped table-hover text-center">
												<thead>
													<tr>
														<th scope="col" width="25%">팀원 사진</th>
														<th scope="col" width="25%">이름</th>
														<th scope="col" width="25%">포지션</th>
														<th scope="col" width="25%">상세 정보</th>
													</tr>
												</thead>

												<tbody>
													<c:forEach items="${memberList }" var="member" >
														<tr>
															<td>
																<img src="/resources/img/member/${member.memberImgAttachedName }"
																width="30%">
															</td>
															<td>${member.memberName }</td>
															<td>${member.position }</td>
															<td>${member.memberCode }</td>
															<td>
															<!-- Button trigger modal -->
															<button type="button" class="btn btn-primary"
																data-bs-toggle="modal" data-bs-target="#staticBackdrop" onclick="teamMemberDetail('${member.memberCode}')" >상세보기</button>
															<!-- Modal -->
															<script type="text/javascript">
														    function teamMemberDetail(memberCode){
																$(".modal-content").load("/team/teamMemberDetail?memberCode=" + memberCode);
															}
															</script>
																		
															<div class="modal fade  " id="staticBackdrop"
																data-bs-backdrop="static" data-bs-keyboard="false"tabindex="-1" aria-labelledby="staticBackdropLabel"aria-hidden="true">
																<div class="modal-dialog">
																
																	<div class="modal-content">
																				
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
								
								<div class="accordion-item">
									<h2 class="accordion-header" id="panelsStayOpen-headingTwo">
										<button class="accordion-button collapsed" type="button"
											data-bs-toggle="collapse"
											data-bs-target="#panelsStayOpen-collapseTwo"
											aria-expanded="false"
											aria-controls="panelsStayOpen-collapseTwo">
											<img src="/resources/img/common/2.png" width="10%"> 가입
											요청 대기 리스트
										</button>
									</h2>

									<div id="panelsStayOpen-collapseTwo"
										class="accordion-collapse collapse"
										aria-labelledby="panelsStayOpen-headingTwo">
										<div class="accordion-body">
											<div class="row">
												<table class="table table-striped table-hover text-center">
													<thead>
														<tr>
															<th scope="col" width="20%">가입 요청</th>
															<th scope="col" width="20%">사진</th>
															<th scope="col" width="20%">이름</th>
															<th scope="col" width="20%">포지션</th>
															<th scope="col" width="20%">상세 정보</th>
														</tr>
													</thead>
													
													<tbody>
														<c:forEach items="${applyMember }" var="applyMember">
															<tr>
																<td><button type="button" class="btn btn-primary">승인</button>
																	<button type="button" class="btn btn-danger">취소</button></td>
																<td><img src="/resources/img/common/3.jpg"
																	width="30%"></td>
																<td>${applyMember.memberName }</td>
																<td>${applyMember.memberCode }</td>
																<td>${applyMember.position }</td>
																<td>${applyMember.memberGender }</td>
																<td>${applyMember.memberTell }</td>
																<td>
																	<!-- Button trigger modal -->
																	<button type="button" class="btn btn-primary"
																		data-bs-toggle="modal"
																		data-bs-target="#staticBackdrop2">Detail</button> <!-- Modal -->
																	<div class="modal fade  " id="staticBackdrop2"
																		data-bs-backdrop="static" data-bs-keyboard="false"
																		tabindex="-1" aria-labelledby="staticBackdropLabel"
																		aria-hidden="true">
																		<div class="modal-dialog">
																			<div class="modal-content">
																				<div class="modal-header">
																					<h5 class="modal-title" id="staticBackdropLabel">원빈
																						상세 정보</h5>
																					<button type="button" class="btn-close"
																						data-bs-dismiss="modal" aria-label="Close"></button>
																				</div>
																				<div class="modal-body">
																					<p>
																						<img src="/resources/img/common/3.jpg" width="30%">
																					</p>
																					<p>자기 소개 : 안녕하세요 원빈 입니다. 전 티.오.피 만 먹습니다. 여러분들도
																						그렇게 하길 바래요 얼마면 되</p>
																				</div>
																				<div class="modal-footer">
																					<button type="button" class="btn btn-secondary"
																						data-bs-dismiss="modal">Close</button>
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
					</div>
				</div>
			</div>
		</div>
	</div>


</body>
</html>