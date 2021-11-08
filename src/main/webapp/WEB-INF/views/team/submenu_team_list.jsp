<!--  10 월 21일 송영준 -->

<!-- 박성환 10/25 : 테이블 수정, 데이터 포문 주석처리 -->


<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(document).ready(function() {
		var recruitDetailModal = document.getElementById('staticBackdrop');
		//모달 닫히면 페이지 리로드
		//가끔 모달 닫고 메뉴바가 눌러지지 않아서 강제로 리로드 시킴
		recruitDetailModal.addEventListener('hidden.bs.modal', function(event) {
			location.reload();
		})
	});
</script>
</head>
<body>





	<div class="container col-5 mx-auto">



		<div class="row m-5 text-center justify-content-center">
			<h2>팀 목 록</h2>
			<div class="col-3" style="border-bottom: 3px solid gray;"></div>
		</div>



		<!-- 검색 기능 -->
		<form action="/board/goNoticeList" method="post">

			<div class="row my-5">

				<div class="col-8 mx-auto m-0 p-0">

					<div class="row mx-auto">

						<div class="col-3">
							<select name="searchKeyword" class="form-select form-select" aria-label=".form-select-lg example">
								<option value="팀이름" selected>팀 이름</option>
								<option value="팀원">팀 원</option>
							</select>
						</div>

						<div class="col">
							<input name="searchValue" class="form-control" type="search" placeholder="Search" aria-label="Search" value="${boardNoticeVO.searchValue}">
						</div>

						<div class="col-1">
							<button class="btn btn-primary " type="submit">Search</button>
						</div>

					</div>

				</div>

			</div>

		</form>



		<div class="row mt-5">

			<div class="col text-center">

				<table class="table table-striped table-hover">

					<thead>

						<tr>
							<th scope="col" width="20%">팀 마크</th>
							<th scope="col" width="*%">팀 이름</th>
							<th scope="col" width="20%">인 원</th>
							<th scope="col" width="15%">상세 정보</th>
						</tr>

					</thead>

					<tbody>

						<c:forEach items="${teamList }" var="teamList">


							<tr>

								<td><img src="/resources/img/team/${teamList.teamLogoImgOrignName }" width="30%"></td>
								<td>${teamList.teamName }</td>
								<td>${teamList.memberCount }</td>
								<td>
									<!-- Button trigger modal -->
									<button type="button" class="btn btn-outline-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop" onclick="teamDetail('${teamList.teamCode}')">상세보기</button> <!-- Modal --> <script type="text/javascript">
										function teamDetail(teamCode) {
											$(".modal-content").load("/team/teamDetail?teamCode=" + teamCode);
										}
									</script>
									<div class="modal fade  " id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
										<div class="modal-dialog modal-lg">
											<div class="modal-content"></div>
										</div>
									</div>
							</tr>

						</c:forEach>

					</tbody>

				</table>

			</div>

		</div>



		<!-- 페이징 기능 -->
		<c:if test="${boardNoticeVO.totalCnt != 0 }">

			<div class="row mt-5">

				<div class="col">

					<nav aria-label="Page navigation example">

						<ul class="pagination justify-content-center m-0 p-0">
							<li class="page-item <c:if test="${!boardNoticeVO.prev }">disabled</c:if>"><a class="page-link" aria-label="Previous" href="/board/goNoticeList?nowPage=${boardNoticeVO.beginPage - 1 }"> <span aria-hidden="true">&laquo;</span>
							</a></li>

							<c:forEach begin="${boardNoticeVO.beginPage }" end="${boardNoticeVO.endPage }" var="pageNumber">
								<li class="page-item <c:if test="${boardNoticeVO.nowPage eq pageNumber }">active</c:if>"><a class="page-link" href="/board/goNoticeList?nowPage=${pageNumber }&searchKeyword=${boardNoticeVO.searchKeyword}&searchValue=${boardNoticeVO.searchValue}">${pageNumber }</a></li>
							</c:forEach>

							<li class="page-item <c:if test="${!boardNoticeVO.next }">disabled</c:if>"><a class="page-link" href="/board/goNoticeList?nowPage=${boardNoticeVO.endPage + 1 }"> <span aria-hidden="true">&raquo;</span></a></li>

						</ul>

					</nav>

				</div>

			</div>

		</c:if>



	</div>









	<!-- 	<div class="row  justify-content-center"> -->

	<!-- 		<div class="col-8 p-3 shadow-lg p-3 mb-5 bg-body rounded"> -->

	<!-- 			<div class="accordion" id="accordionPanelsStayOpenExample"> -->


	<!-- 				<div class="accordion-item"> -->
	<!-- 					<h2 class="accordion-header" id="panelsStayOpen-headingOne"> -->
	<!-- 						<button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseOne" aria-expanded="true" aria-controls="panelsStayOpen-collapseOne">랭킹 1위 ~ 10위</button> -->
	<!-- 					</h2> -->



	<!-- 					<div id="panelsStayOpen-collapseOne" class="accordion-collapse collapse show" aria-labelledby="panelsStayOpen-headingOne"> -->

	<!-- 						<div class="accordion-body"> -->

	<!-- 							<table class="table table-striped table-hover text-center"> -->

	<!-- 								<thead> -->

	<!-- 									<tr> -->
	<!-- 										<th scope="col" width="20%">팀 마크</th> -->

	<!-- 										<th scope="col" width="20%">팀 이름</th> -->

	<!-- 										<th scope="col" width="20%">인 원</th> -->

	<!-- 										<th scope="col" width="20%">상세 정보</th> -->
	<!-- 									</tr> -->

	<!-- 								</thead> -->

	<!-- 								<tbody> -->
	<%-- 									<c:forEach items="${teamList }" var="teamList"> --%>
	<!-- 										<tr> -->
	<%-- 											<td><img src="/resources/img/team/${teamList.teamLogoImgOrignName }" width="30%"></td> --%>
	<%-- 											<td>${teamList.teamName }</td> --%>
	<%-- 											<td>${teamList.memberCount }</td> --%>
	<!-- 											<td> -->
	<!-- 												Button trigger modal -->
	<%-- 												<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop" onclick="teamDetail('${teamList.teamCode}')">상세보기</button> <!-- Modal --> <script type="text/javascript"> --%>
	<!-- // 													function teamDetail(teamCode) { -->
	<!-- // 														$(".modal-content").load("/team/teamDetail?teamCode=" + teamCode); -->
	<!-- // 													} -->
	<!-- 												</script> -->
	<!-- 												<div class="modal fade  " id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true"> -->
	<!-- 													<div class="modal-dialog modal-lg"> -->
	<!-- 														<div class="modal-content"></div> -->
	<!-- 													</div> -->
	<!-- 												</div> -->

	<!-- 											</td> -->
	<!-- 										</tr> -->
	<%-- 									</c:forEach> --%>

	<!-- 								</tbody> -->
	<!-- 							</table> -->
	<!-- 						</div> -->
	<!-- 					</div> -->
	<!-- 				</div> -->
	<!-- 			</div> -->
	<!-- 		</div> -->
	<!-- 	</div> -->



</body>
</html>