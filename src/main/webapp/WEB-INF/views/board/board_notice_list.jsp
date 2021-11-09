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
					<a class="btn btn-outline-primary col-2" type="button" href="/board/goNoticeWriteForm">글쓰기</a>
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

						<!-- 공지사항은 관리자만 입력함으로 비밀번호 없음 -->
						<c:forEach items="${noticeList }" var="noticeInfo">

							<!-- 왜 안되는거 확인 필요 -->
							<c:if test="${empty noticeInfo.boardNumNotice }">
								<tr>
									<td colspan="5" style="text-align: center;">등록된 글이 없습니다.</td>
								</tr>
							</c:if>

							<tr onclick="location.href='/board/goNoticeDetail?boardNumNotice=' + ${noticeInfo.boardNumNotice };">
								<td>${noticeInfo.boardNumNotice }</td>
								<td>${noticeInfo.titleNotice }</td>
								<td>${noticeInfo.writerNotice }</td>
								<td>${noticeInfo.createDateNotice }</td>
								<td>${noticeInfo.readCntNotice }</td>
							</tr>

						</c:forEach>

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

						<div class="col-1">
							<button class="btn btn-primary " type="submit">Search</button>
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