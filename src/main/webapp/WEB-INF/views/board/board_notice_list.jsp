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



	<div class="container col-6 mx-auto">



		<div class="row m-5 text-center justify-content-center">
			<h2>공 지 사 항</h2>
			<div class="col-3" style="border-bottom: 3px solid gray;"></div>
		</div>



		<div class="row">

			<!-- 관리자 기능이(IS_ADMIN)이 'Y'인 아이디만 "글쓰기"가 보이게 함 -->
			<c:if test="${sessionScope.loginInfo.isAdmin eq 'Y' }">

				<div class="d-grid gap-2 d-md-flex justify-content-md-end mb-3">
					<a class="btn btn-outline-primary" type="button" href="/board/goNoticeWriteForm">
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

						<c:choose>

							<c:when test="${noticeList.size() eq 0 }">
								<tr>
									<td colspan="5" style="text-align: center;">등록된 글이 없습니다.</td>
								</tr>
							</c:when>

							<c:otherwise>
								<c:forEach items="${noticeList }" var="noticeInfo">
									<tr onclick="location.href='/board/goNoticeDetail?boardNumNotice=' + ${noticeInfo.boardNumNotice };">
										<td>${noticeInfo.boardNumNotice }</td>
										<td>${noticeInfo.titleNotice }</td>
										<td>${noticeInfo.writerNotice }</td>
										<td>${noticeInfo.createDateNotice }</td>
										<td>${noticeInfo.readCntNotice }</td>
									</tr>
								</c:forEach>
							</c:otherwise>

						</c:choose>

					</tbody>

				</table>

			</div>

		</div>



		<!-- 검색 기능 -->
		<form action="/board/goNoticeList" method="post">

			<div class="row mt-5">

				<div class="col-6 mx-auto m-0 p-0">

					<div class="row mx-auto">

						<div class="col-3">
							<select name="searchKeyword" class="form-select form-select" aria-label=".form-select-lg example">
								<option value="TITLE_NOTICE" selected>제목</option>
								<option value="CONTENT_NOTICE">내용</option>
								<option value="WRITER_NOTICE">작성자</option>
							</select>
						</div>

						<div class="col">
							<input name="searchValue" class="form-control" type="search" placeholder="Search" aria-label="Search" value="${boardNoticeVO.searchValue}">
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



</body>
</html>