<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
tr {
	cursor: pointer;
}
</style>

</head>
<body>


	<div class="container">


		<div class="row m-5 text-center justify-content-center">
			<h2>자 유 게 시 판</h2>
			<div class="col-3" style="border-bottom: 3px solid gray;"></div>

		</div>


		<div class="row">

			<!-- 로그인이 되어 있어야 글쓰기 가능 -->
			<c:if test="${not empty sessionScope.loginInfo }">

				<div class="d-grid gap-2 d-md-flex justify-content-md-end mb-3">
					<a class="btn btn-outline-primary col-2" type="button" href="/board/goFreeWriteForm">글쓰기</a>
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

						<c:forEach items="${freeList }" var="freeInfo">

							<c:choose>

								<c:when test="${empty freeInfo.boardPwFree }">
									<tr onclick="location.href='/board/goFreeDetail?boardNumFree=' + ${freeInfo.boardNumFree };">

										<td>${freeInfo.boardNumFree }</td>
										<td>${freeInfo.titleFree }</td>
										<td>${freeInfo.writerFree }</td>
										<td>${freeInfo.createDateFree }</td>
										<td>${freeInfo.readCntFree }</td>

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

		<a href="location"></a>



		<div class="row mt-5">

			<div class="col-6 mx-auto m-0 p-0">

				<div class="row mx-auto">

					<div class="col-3">
						<select class="form-select form-select" aria-label=".form-select-lg example">
							<option value="제목" selected>제목</option>
							<option value="내용">내용</option>
							<option value="작성자">작성자</option>
						</select>
					</div>

					<div class="col">
						<input class="form-control" type="search" placeholder="Search" aria-label="Search">
					</div>

					<div class="col-1">
						<button class="btn btn-primary " type="submit">Search</button>
					</div>

				</div>

			</div>

		</div>




		<div class="row mt-5">

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

		</div>


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


					<div class="form-floating mb-3">
						<input type="password" class="form-control rounded-4" id="inputPwFree" placeholder="Password"> <label for="inputPwFree">입력...</label>
					</div>

					<button class="w-100 mb-2 btn btn-lg rounded-4 btn-primary" id="checkPw" onclick="checkPwFree();">확 인</button>
					<input type="hidden" id="originPw"> <input type="hidden" id="num">

				</div>

			</div>

		</div>

	</div>






	<!-- ============================== 스크립트 부분 ============================== -->

	<script type="text/javascript">
		
		(function($) {
			
			setInfo = function(pw, num){
				$('#originPw').val(pw);	
				$('#num').val(num);
			}
			
			checkPwFree = function(){
				
					inputPwFree
					var inputPw = $('#inputPwFree').val();	
					var realPw = $('#originPw').val();	
					
					
					if (inputPw != realPw) {
						
						alert('비밀번호를 확인하세요.')
						
						$('#inputPwFree').val('');	
						
						$('#inputPwFree').focus();	
						
						return;
					}
					
					location.href = '/board/goFreeDetail?boardNumFree=' + $('#num').val();

				}
				

		})(jQuery);
		
	</script>





</body>
</html>


























