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

		<div class="row">
			<h5 class="mb-3" style="border-bottom: 2px solid blue;">자 유 게 시 판</h5>
		</div>



		<!-- 글 정보 -->
		<div class="row">

			<h3 class="m-5">${freeInfo.titleFree }</h3>

			<div class="col ma-auto">

				<div class="row">

					<table class="table  ">

						<thead>

							<tr>
								<th scope="col" width="10%">번 호</th>
								<th scope="col" width="20%">작 성 자</th>
								<th scope="col" width="20%">작 성 일 자</th>
								<th scope="col" width="*%">글 조 회 수</th>
							</tr>

						</thead>

						<tbody>

							<tr>
								<td>${freeInfo.boardNumFree }</td>
								<td>${freeInfo.writerFree }</td>
								<td>${freeInfo.createDateFree }</td>
								<td>${freeInfo.readCntFree }</td>
							</tr>
							<tr>
								<td colspan="4">첨부파일 : ${freeInfo.fileNameFree }</td>
							</tr>

						</tbody>

					</table>

				</div>

			</div>

		</div>



		<!-- 글 내용 -->
		<div class="row mb-3" style="border-bottom: 1px solid gray; height: 30rem;">${freeInfo.contentFree }</div>



		<!-- 버튼 -->
		<div class="row m-5">

			<div class="col d-flex justify-content-between">

				<!-- 관리자 기능이(IS_ADMIN)이 'Y'인 아이디만 "글 수정/삭제"가 보이게 함 -->
				<c:if test="${sessionScope.loginInfo.memberId eq freeInfo.writerFree }">

					<input class="btn btn-outline-danger" value="삭 제" onclick="deleteBoardFree(${freeInfo.boardNumFree });">
					<input class="btn btn-outline-warning" value="수 정" onclick="location.href='/board/goUpdateBoardFree?boardNumFree=' + ${freeInfo.boardNumFree };">

				</c:if>

				<input class="btn btn-primary" value="뒤로가기" onclick="location.href='/board/goFreeList';">

			</div>

		</div>



		<!-- 댓글 입력란 -->
		<div class="row my-5" style="border-top: 1px solid gray;">


			<div class="col-8 mx-auto my-5">

				<div class="mb-3">총 ${replyFreeList.size() }건의 댓글이 있습니다.</div>

				<c:choose>

					<c:when test="${not empty sessionScope.loginInfo }">

						<form action="/reply/freeInsertReply" method="post">

							<input type="hidden" name="boardNumFree" value="${freeInfo.boardNumFree }">

							<div class="input-group">

								<span class="input-group-text" id="basic-addon1">댓글 입력</span> 
								<input type="text" class="form-control" name="contentFree" placeholder="입력..." aria-label="Username" aria-describedby="basic-addon1" required>

								<button type="submit" class="btn btn-success">
									<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-reply-fill" viewBox="0 0 16 16">
									  <path d="M5.921 11.9 1.353 8.62a.719.719 0 0 1 0-1.238L5.921 4.1A.716.716 0 0 1 7 4.719V6c1.5 0 6 0 7 8-2.5-4.5-7-4-7-4v1.281c0 .56-.606.898-1.079.62z" />
									</svg>
									등록
								</button>

							</div>

						</form>

					</c:when>

					<c:otherwise>

						<div class="input-group ">
							<span class="input-group-text" id="basic-addon1">댓글 입력</span> 
							<input type="text" class="form-control" placeholder="로그인을 하셔야 댓글 입력이 가능 합니다." aria-label="Username" aria-describedby="basic-addon1" readonly>

							<button type="submit" class="btn btn-success">
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-reply-fill" viewBox="0 0 16 16">
								  <path d="M5.921 11.9 1.353 8.62a.719.719 0 0 1 0-1.238L5.921 4.1A.716.716 0 0 1 7 4.719V6c1.5 0 6 0 7 8-2.5-4.5-7-4-7-4v1.281c0 .56-.606.898-1.079.62z" />
								</svg>
								등록
							</button>

						</div>

					</c:otherwise>

				</c:choose>

			</div>

		</div>

	</div>



	<c:forEach items="${replyFreeList }" var="replyFree">

		<!-- 댓글 목록 -->
		<div class="row mb-5 align-items-center">

			<!-- 로그인 이미지(이미지 불러 오고 링크 걸어서 정보로 갈수 있게 할 예정) -->
			<div class="col-3 text-end">
				<i class="bi bi-camera-fill"></i> <img src="/resources/img/member/nullImg.png" id="preview" class="img-thumbnail" width="30%;" height="30%;">
			</div>



			<!-- 댓글 정보	 -->
			<div class="col">

				<table class="table">

					<thead>

						<tr>
							<th scope="col" width="*%">작 성 자</th>
							<th scope="col" width="*%">작 성 일 자</th>
						</tr>

					</thead>

					<tbody>

						<tr>
							<td>${replyFree.writerFree }</td>
							<td>${replyFree.createDateFree }</td>
						</tr>

						<tr>
							<td colspan="2" style="word-break: break-all;">내용 : ${replyFree.contentFree }</td>
						</tr>

					</tbody>

				</table>

			</div>



			<!-- 댓글 버튼	 -->
			<div class="col-3 ">

				<!-- 관리자 또는 로그인 대상자가 댓글 작성자 아이디가 동일 하면 삭제가 활성화 됨 -->
				<c:if test="${sessionScope.loginInfo.isAdmin eq 'Y' or sessionScope.loginInfo.memberId eq replyFree.writerFree }">

					<input type="button" class="btn btn-outline-danger btn-lg d-flex  " value="삭제" onclick="location.href='/reply/deleteReplyFree?replyNumFree=${replyFree.replyNumFree}&boardNumFree=${freeInfo.boardNumFree}';">

				</c:if>

			</div>

		</div>

	</c:forEach>











	<!-- ============================== 스크립트 부분 ============================== -->

	<script type="text/javascript">

function deleteBoardFree(boardNumFree) {
	
	var result = confirm('삭제하시겠습니까?');
	
	if (result) {
		
		location.href= '/board/deleteBoardFree?boardNumFree=' + boardNumFree;
	}
}
</script>


</body>
</html>