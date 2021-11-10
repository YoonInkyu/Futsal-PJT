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





	<div class="container col-6 mx-auto">



		<div class="row m-5 text-center justify-content-center">
			<h2>팀 목 록</h2>
			<div class="col-3" style="border-bottom: 3px solid gray;"></div>
		</div>



		<!-- 검색 기능 -->
		<form action="/team/selectTeamList" method="post">

			<div class="row my-5">

				<div class="col-8 mx-auto m-0 p-0">

					<div class="row mx-auto">

						<div class="col-2">
							<select name="searchKeyword" class="form-select form-select" aria-label=".form-select-lg example">
							<c:if test="${teamVO.searchKeyword == null}">
								<option value="T.TEAM_NAME" selected>팀 이름</option>
								<option value="M.MEMBER_NAME">팀 원</option>
							</c:if>
							<c:if test="${teamVO.searchKeyword != null}">
								<option value="T.TEAM_NAME" <c:if test="${teamVO.searchKeyword eq 'T.TEAM_NAME' }">selected</c:if>>팀 이름</option>
								<option value="M.MEMBER_NAME" <c:if test="${teamVO.searchKeyword eq 'M.MEMBER_NAME' }">selected</c:if>>팀 원</option>
							</c:if> 
							</select>
						</div>

						<div class="col">
							<input name="searchValue" class="form-control" type="search" placeholder="Search" aria-label="Search" value="${teamVO.searchValue}">
						</div>

						<div class="col-2">
							<button class="btn btn-outline-primary " type="submit">
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
							 <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z" />
							</svg>&nbsp;검 색</button>
						</div>

					</div>

				</div>

			</div>

		</form>



		<div class="row mt-5">

			<div class="col text-center shadow-lg p-3 mb-5 bg-body rounded">

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

								<td><i class="bi bi-camera-fill"></i><img class="img-thumbnail" src="/resources/img/team/${teamList.teamLogoImgAttachedName }" style="height: 38px; object-fit: cover;"></td>
								<td>${teamList.teamName }</td>
								<td>${teamList.memberCount }</td>
								<td>
									<!-- Button trigger modal -->
									<button type="button" class="btn btn-outline-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop" onclick="teamDetail('${teamList.teamCode}')">상세보기</button>
									 <!-- Modal --> 
									<script type="text/javascript">
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
		<c:if test="${teamVO.totalCnt != 0 }">

			<div class="row mt-5">

				<div class="col">

					<nav aria-label="Page navigation example">

						<ul class="pagination justify-content-center m-0 p-0">
							<li class="page-item <c:if test="${!teamVO.prev }">disabled</c:if>"><a class="page-link" aria-label="Previous" href="/team/selectTeamList?nowPage=${teamVO.beginPage - 1 }"> <span aria-hidden="true">&laquo;</span>
							</a></li>

							<c:forEach begin="${teamVO.beginPage }" end="${teamVO.endPage -1 }" var="pageNumber">
								<li class="page-item <c:if test="${teamVO.nowPage eq pageNumber }">active</c:if>"><a class="page-link" href="/team/selectTeamList?nowPage=${pageNumber }&searchKeyword=${teamVO.searchKeyword}&searchValue=${teamVO.searchValue}">${pageNumber }</a></li>
							</c:forEach>

							<li class="page-item <c:if test="${!teamVO.next }">disabled</c:if>"><a class="page-link" href="/team/selectTeamList?nowPage=${teamVO.endPage -1 }"> <span aria-hidden="true">&raquo;</span></a></li>

						</ul>

					</nav>

				</div>

			</div>

		</c:if>



	</div>

</body>
</html>