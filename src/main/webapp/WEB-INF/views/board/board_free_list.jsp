<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
							<th scope="col" width="">제목</th>
							<th scope="col" width="15%">작성자</th>
							<th scope="col" width="20%">작성일자</th>
							<th scope="col" width="15%">조회</th>
						</tr>

					</thead>

					<tbody>

						<c:forEach items="${freeList }" var="freeInfo">
							<tr onclick="location.href='/board/goFreeDetail?boardNumFree=' + ${freeInfo.boardNumFree };">
								<td>${freeInfo.boardNumFree }</td>
								<td>${freeInfo.titleFree }</td>
								<td>${freeInfo.writerFree }</td>
								<td>${freeInfo.createDateFree }</td>
								<td>${freeInfo.readCntFree }</td>
							</tr>

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







</body>
</html>