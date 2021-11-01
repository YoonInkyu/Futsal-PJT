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
	recruitDetailModal.addEventListener('hidden.bs.modal', function (event) {
		location.reload();
	})
});
</script>
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
											<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop" onclick="teamDetail('${teamList.teamCode}')">상세보기</button> <!-- Modal -->
											<script type="text/javascript">
											    function teamDetail(teamCode){
													$(".modal-content").load("/team/teamDetail?teamCode=" + teamCode);
												}
											</script>
											<div class="modal fade  " id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
												<div class="modal-dialog modal-lg">
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
			</div>
		</div>
	</div>



</body>
</html>