<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판 목록</title>
<script type="text/javascript" src="/resources/board/js/board_free_list.js?ver=2"></script>
<style type="text/css">
.c_td {
	cursor: pointer;
}
</style>

</head>
<body>



	<div class="container col-6 mx-auto">



		<div class="row m-5 text-center justify-content-center">
			<h2>자 유 게 시 판</h2>
			<div class="col-3" style="border-bottom: 3px solid gray;"></div>
		</div>



		<div class="row">

			<!-- 로그인이 되어 있어야 글쓰기 가능 -->
			<c:if test="${not empty sessionScope.loginInfo }">

				<div class="d-grid gap-2 d-md-flex justify-content-md-end mb-3">
					<a class="btn btn-outline-primary" type="button" href="/board/goFreeWriteForm">
					<svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" fill="currentColor" class="bi bi-journal-text" viewBox="0 0 16 16">
					  <path d="M5 10.5a.5.5 0 0 1 .5-.5h2a.5.5 0 0 1 0 1h-2a.5.5 0 0 1-.5-.5zm0-2a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5zm0-2a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5zm0-2a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5z" />
					  <path d="M3 0h10a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2v-1h1v1a1 1 0 0 0 1 1h10a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H3a1 1 0 0 0-1 1v1H1V2a2 2 0 0 1 2-2z" />
					  <path d="M1 5v-.5a.5.5 0 0 1 1 0V5h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1H1zm0 3v-.5a.5.5 0 0 1 1 0V8h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1H1zm0 3v-.5a.5.5 0 0 1 1 0v.5h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1H1z" />
					</svg>&nbsp;글 쓰 기</a>
				</div>

			</c:if>



			<div class="col text-center">

				<table class="table table-striped table-hover">

					<thead>

						<tr>
							<th scope="col" width="10%">번호</th>
							<th scope="col" width="*%">제목</th>
							<th scope="col" width="15%">작성자</th>
							<th scope="col" width="20%">작성일자</th>
							<th scope="col" width="15%">조회</th>
						</tr>

					</thead>

					<tbody>

						<c:if test="${freeList.size() eq 0 }">
							<tr>
								<td colspan="5" style="text-align: center;">등록된 글이 없습니다.</td>
							</tr>
						</c:if>

						<c:forEach items="${freeList }" var="freeInfo">

							<c:choose>

								<c:when test="${empty freeInfo.boardPwFree }">

									<tr>

										<td class="c_td" onclick="location.href='/board/goFreeDetail?boardNumFree=' + ${freeInfo.boardNumFree };">${freeInfo.boardNumFree }</td>
										<td class="c_td" onclick="location.href='/board/goFreeDetail?boardNumFree=' + ${freeInfo.boardNumFree };">${freeInfo.titleFree }</td>

										<c:choose>

											<c:when test="${freeInfo.writerFree eq loginInfo.memberId}">
												<td>${freeInfo.writerFree }</td>
											</c:when>

											<c:otherwise>
												<td>
													<div class="btn-group dropend">
														<button type="button" class="btn link-primary dropdown-toggle" id="memberMenuButt" data-bs-toggle="dropdown" aria-expanded="false" value="${freeInfo.writerFree }">${freeInfo.writerFree }</button>
														<ul class="dropdown-menu">
															<li class="dropdown-item" data-bs-toggle="modal" data-bs-target="#addMemberBlackModal" style="cursor: pointer;">블랙리스트 추가</li>
															<li class="dropdown-item"  onclick="teamDetail('${freeInfo.teamCode}')">소속 팀 보기</li>
														</ul>
													</div>
												</td>
											</c:otherwise>

										</c:choose>

										<td class="c_td" onclick="location.href='/board/goFreeDetail?boardNumFree=' + ${freeInfo.boardNumFree };">${freeInfo.createDateFree }</td>
										<td class="c_td" onclick="location.href='/board/goFreeDetail?boardNumFree=' + ${freeInfo.boardNumFree };">${freeInfo.readCntFree }</td>

									</tr>

								</c:when>



								<c:otherwise>

									<tr data-bs-toggle="modal" data-bs-target="#staticBackdrop" onclick="setInfo('${freeInfo.boardPwFree}', ${freeInfo.boardNumFree });">
										<td>${freeInfo.boardNumFree }</td>

										<td><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-file-earmark-lock2" viewBox="0 0 16 16">
											  <path d="M10 7v1.076c.54.166 1 .597 1 1.224v2.4c0 .816-.781 1.3-1.5 1.3h-3c-.719 0-1.5-.484-1.5-1.3V9.3c0-.627.46-1.058 1-1.224V7a2 2 0 1 1 4 0zM7 7v1h2V7a1 1 0 0 0-2 0z" />
											  <path d="M14 14V4.5L9.5 0H4a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2zM9.5 3A1.5 1.5 0 0 0 11 4.5h2V14a1 1 0 0 1-1 1H4a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h5.5v2z" />
											</svg> ${freeInfo.titleFree }</td>

										<td>${freeInfo.writerFree }</td>
										<td>${freeInfo.createDateFree }</td>
										<td>${freeInfo.readCntFree }</td>

									</tr>

								</c:otherwise>

							</c:choose>

						</c:forEach>

					</tbody>

				</table>

			</div>

		</div>



		<!-- 검색 기능 -->
		<form action="/board/goFreeList" method="post">

			<div class="row mt-5">

				<div class="col-8 mx-auto m-0 p-0">

					<div class="row mx-auto">

						<div class="col-2">
							<select name="searchKeyword" class="form-select form-select" aria-label=".form-select-lg example">
								<option value="TITLE_Free" selected>제목</option>
								<option value="CONTENT_Free">내용</option>
								<option value="WRITER_Free">작성자</option>
							</select>
						</div>

						<div class="col">
							<input name="searchValue" class="form-control" type="search" placeholder="Search" aria-label="Search" value="${boardFreeVO.searchValue}">
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



		<!-- 페이징 기능 -->
		<c:if test="${boardFreeVO.totalCnt != 0 }">

			<div class="row mt-5">

				<div class="col">

					<nav aria-label="Page navigation example">

						<ul class="pagination justify-content-center m-0 p-0">

							<li class="page-item <c:if test="${!boardFreeVO.prev }">disabled</c:if>"><a class="page-link" aria-label="Previous" href="/board/goFreeList?nowPage=${boardFreeVO.beginPage - 1 }"> <span aria-hidden="true">&laquo;</span>
							</a></li>

							<c:forEach begin="${boardFreeVO.beginPage }" end="${boardFreeVO.endPage }" var="pageNumber">
								<li class="page-item <c:if test="${boardFreeVO.nowPage eq pageNumber }">active</c:if>"><a class="page-link" href="/board/goFreeList?nowPage=${pageNumber }&searchKeyword=${boardFreeVO.searchKeyword}&searchValue=${boardFreeVO.searchValue}">${pageNumber }</a></li>
							</c:forEach>

							<li class="page-item <c:if test="${!boardFreeVO.next }">disabled</c:if>"><a class="page-link" href="/board/goFreeList?nowPage=${boardFreeVO.endPage + 1 }"> <span aria-hidden="true">&raquo;</span></a></li>

						</ul>

					</nav>

				</div>

			</div>

		</c:if>



	</div>



	<!--  Modal -->
	<div class="modal fade " id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">

		<div class="modal-dialog" role="document">

			<div class="modal-content rounded-5 shadow">

				<div class="modal-header p-5 pb-4 border-bottom-0">

					<h4 class="fw-bold mb-0" id="staticBackdropLabel">비밀 번호를 입력하세요.</h4>

					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>

				</div>

				<div class="modal-body p-5 pt-0">

					<input type="hidden" id="datePw"> <input type="hidden" id="dataNum">

					<div class="form-floating mb-3">
						<input type="password" class="form-control rounded-4" id="inputPwFree" placeholder="Password"> <label for="inputPwFree">입력...</label>
					</div>

					<button class="w-100 mb-2 btn btn-lg rounded-4 btn-primary" id="checkPw" onclick="checkPwFree();">확 인</button>

				</div>

			</div>

		</div>

	</div>



	<div class="modal fade" id="addMemberBlackModal" tabindex="-1">

		<div class="modal-dialog">

			<div class="modal-content addMemberBlackDiv">

				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">블랙리스트 추가</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>

				<div class="modal-body">

					<div class="form-floating">
						<textarea class="form-control" placeholder="Leave a comment here" id="blackComment" style="height: 10rem; resize: none;" required></textarea>
						<label for="floatingTextarea2">사 유</label>
					</div>

					<div class="my-3" style="font-size: 13px; color: red;">블랙리스트 추가시 해당회원의 용병구인 게시글 및 신청 현황이 숨김 처리됩니다.</div>

					<div class="modal-footer d-flex justify-content-between">
						<button style="width: 10rem;" type="button" class=" btn btn-outline-danger" onclick="addMemberBlack()">추 가</button>
						<button style="width: 10rem;" type="button" class="btn btn-primary" data-bs-dismiss="modal">취 소</button>
					</div>

				</div>

			</div>

		</div>

	</div>

	<div class="modal fade  " id="teamDetailModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content"></div>
		</div>
	</div>

	<!-- ============================== 스크립트 부분 ============================== -->
	<script type="text/javascript">
	$(document).ready(function() {
		var recruitDetailModal = document.getElementById('teamDetailModal');
		//모달 닫히면 페이지 리로드
		//가끔 모달 닫고 메뉴바가 눌러지지 않아서 강제로 리로드 시킴
		recruitDetailModal.addEventListener('hidden.bs.modal', function(event) {
			location.reload();
		})
	});
		function teamDetail(teamCode) {
			
			if(teamCode == ''){
				alert('소속팀이 없습니다.')
			}
			else{
				$(".modal-content").load("/team/teamDetail?teamCode=" + teamCode);
				$('#teamDetailModal').modal('show');
			}
		}
		
		(function($) {
			
			setInfo = function(pw, num){
				$('#datePw').val(pw);	
				$('#dataNum').val(num);
			}
			
			checkPwFree = function(){
				
					var inputPw = $('#inputPwFree').val();	
					var datePw = $('#datePw').val();	
					
					if (inputPw != datePw) {
						
						alert('비밀번호를 확인하세요.')
						
						$('#inputPwFree').val('');	
						
						$('#inputPwFree').focus();	
						
						return;
					}
					
					location.href = '/board/goFreeDetail?boardNumFree=' + $('#dataNum').val();

				}

		})(jQuery);
		
		
	</script>



</body>
</html>


























