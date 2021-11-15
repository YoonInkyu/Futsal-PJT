<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 상세보기</title>
</head>
<body>



	<div class="container col-5 mx-auto">

		<div class="row">
			<h5 class="mb-3" style="border-bottom: 2px solid blue;">공 지 사 항</h5>
		</div>



		<!-- 글 정보 -->
		<div class="row">

			<h3 class="m-5">${noticeInfo.titleNotice }</h3>

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
								<td>${noticeInfo.boardNumNotice }</td>
								<td>${noticeInfo.writerNotice }</td>
								<td>${noticeInfo.createDateNotice }</td>
								<td>${noticeInfo.readCntNotice }</td>
							</tr>
							<tr>
								<td colspan="4">첨부파일 : <c:forEach items="${imgListNotice }" var="imgNotice">

										<c:if test="${not empty imgNotice.noticeImgOrignName }">
											<a class="mx-1 btn btn-outline-success  btn-sm" href="<c:url value="..\\resources\\img\\board\\${imgNotice.noticeImgAttachedName }" ></c:url>" download="${imgNotice.noticeImgOrignName }">
											<svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" fill="currentColor" class="bi bi-download" viewBox="0 0 16 16">
											  <path d="M.5 9.9a.5.5 0 0 1 .5.5v2.5a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1v-2.5a.5.5 0 0 1 1 0v2.5a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2v-2.5a.5.5 0 0 1 .5-.5z"/>
											  <path d="M7.646 11.854a.5.5 0 0 0 .708 0l3-3a.5.5 0 0 0-.708-.708L8.5 10.293V1.5a.5.5 0 0 0-1 0v8.793L5.354 8.146a.5.5 0 1 0-.708.708l3 3z"/>
											</svg>&nbsp;${imgNotice.noticeImgOrignName }</a>
										</c:if>

									</c:forEach>

								</td>
							</tr>

						</tbody>

					</table>

				</div>

			</div>

		</div>



		<!-- 글 내용 -->
		<div class="row mb-3" style="border-bottom: 1px solid gray; height: 30rem; word-break: break-all;">${noticeInfo.contentNotice }</div>



		<!-- 버튼 -->
		<div class="row m-5">

			<div class="col d-flex justify-content-between">

				<!-- 관리자 기능이(IS_ADMIN)이 'Y'인 아이디만 "글 수정/삭제"가 보이게 함 -->
				<c:if test="${sessionScope.loginInfo.isAdmin eq 'Y' }">

					<input class="btn btn-outline-danger" value="삭 제" onclick="deleteBoardNotice(${noticeInfo.boardNumNotice });">
					<input class="btn btn-outline-warning" value="수 정" onclick="location.href='/board/goUpdateBoardNotice?boardNumNotice=' + ${noticeInfo.boardNumNotice };">

				</c:if>

				<input class="btn btn-primary" value="뒤로가기" onclick="location.href='/board/goNoticeList';">

			</div>

		</div>



		<!-- 댓글 입력란 -->
		<div class="row my-5" style="border-top: 1px solid gray;">


			<div class="col-8 mx-auto my-5 shadow-sm p-3 mb-5 bg-body rounded">

				<div class="mb-3">총 ${replyNoticeList.size() }건의 댓글이 있습니다.</div>

				<c:choose>

					<c:when test="${not empty sessionScope.loginInfo }">

						<form action="/reply/noticeInsertReply" method="post">

							<input type="hidden" name="boardNumNotice" value="${noticeInfo.boardNumNotice }">

							<div class="input-group">

								<span class="input-group-text" id="basic-addon1">댓글 입력</span> <input type="text" class="form-control" name="contentNotice" placeholder="입력..." aria-label="Username" aria-describedby="basic-addon1" onkeyup="contentNoticeReply_checkByte(this);" required>

								<button type="submit" class="btn btn-success">등록&nbsp;
								<svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" fill="currentColor" class="bi bi-chat-dots-fill" viewBox="0 0 22 22">
								  <path d="M16 8c0 3.866-3.582 7-8 7a9.06 9.06 0 0 1-2.347-.306c-.584.296-1.925.864-4.181 1.234-.2.032-.352-.176-.273-.362.354-.836.674-1.95.77-2.966C.744 11.37 0 9.76 0 8c0-3.866 3.582-7 8-7s8 3.134 8 7zM5 8a1 1 0 1 0-2 0 1 1 0 0 0 2 0zm4 0a1 1 0 1 0-2 0 1 1 0 0 0 2 0zm3 1a1 1 0 1 0 0-2 1 1 0 0 0 0 2z"/>
								</svg>
								</button>

							</div>

						</form>

						<div class="mt-3">
							글자수 제한 (<span id="nowByte2">0</span>/500bytes)
						</div>

					</c:when>

					<c:otherwise>

						<div class="input-group ">
							<span class="input-group-text" id="basic-addon1">댓글 입력</span> <input type="text" class="form-control" placeholder="로그인을 하셔야 댓글 입력이 가능 합니다." aria-label="Username" aria-describedby="basic-addon1" readonly>

							<button type="submit" class="btn btn-success">등록&nbsp;
								<svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" fill="currentColor" class="bi bi-chat-dots-fill" viewBox="0 0 22 22">
								  <path d="M16 8c0 3.866-3.582 7-8 7a9.06 9.06 0 0 1-2.347-.306c-.584.296-1.925.864-4.181 1.234-.2.032-.352-.176-.273-.362.354-.836.674-1.95.77-2.966C.744 11.37 0 9.76 0 8c0-3.866 3.582-7 8-7s8 3.134 8 7zM5 8a1 1 0 1 0-2 0 1 1 0 0 0 2 0zm4 0a1 1 0 1 0-2 0 1 1 0 0 0 2 0zm3 1a1 1 0 1 0 0-2 1 1 0 0 0 0 2z"/>
								</svg>
								</button>

						</div>

					</c:otherwise>

				</c:choose>

			</div>

		</div>



		<c:forEach items="${replyNoticeList }" var="replyNotice">

			<!-- 댓글 목록 -->
			<div class="row mb-5 align-items-center">

				<!-- 로그인 이미지(이미지 불러 오고 링크 걸어서 정보로 갈수 있게 할 예정) -->
				<c:if test="${not empty replyNotice.writerImg}">
				<div class="col-3 text-end">
					<img style="height: 60px; object-fit: cover;" src="/resources/img/member/${replyNotice.writerImg }" id="preview" class="img-thumbnail" >
				</div>
				</c:if>
				<c:if test="${empty replyNotice.writerImg}">
				<div class="col-3 text-end">
					<img style="height: 60px; object-fit: cover;" src="/resources/img/member/nullImg.png" id="preview" class="img-thumbnail">
				</div>
				</c:if>
				



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
								<td>${replyNotice.writerNotice }</td>
								<td>${replyNotice.createDateNotice }</td>
							</tr>

							<tr>
								<td colspan="2" style="word-break: break-all;">내용 : ${replyNotice.contentNotice }</td>
							</tr>

						</tbody>

					</table>

				</div>



				<!-- 댓글 버튼	 -->
				<div class="col-3 ">

					<!-- 관리자 또는 로그인 대상자가 댓글 작성자 아이디가 동일 하면 삭제가 활성화 됨 -->
					<c:if test="${sessionScope.loginInfo.isAdmin eq 'Y' or sessionScope.loginInfo.memberId eq replyNotice.writerNotice }">

						<input type="button" class="btn btn-outline-danger btn-lg d-flex  " value="삭제" onclick="location.href='/reply/deleteReplyNotice?replyNumNotice=${replyNotice.replyNumNotice}&boardNumNotice=${noticeInfo.boardNumNotice}';">

					</c:if>

				</div>

			</div>

		</c:forEach>

	</div>



	<!-- ============================== 스크립트 부분 ============================== -->

	<script type="text/javascript">

	// 	공지사항 삭제 알람
	function deleteBoardNotice(boardNumNotice) {

		var result = confirm('삭제하시겠습니까?');

		if (result) {

			location.href = '/board/deleteBoardNotice?boardNumNotice=' + boardNumNotice;
		}
	}
	
	
	// 공지사항 댓글 글자수 제한
	function contentNoticeReply_checkByte(obj) {
		const maxByte = 500; //최대 바이트
		const text_val = obj.value; //입력한 문자
		const text_len = text_val.length; //입력한 문자수

		let totalByte = 0;
		for (let i = 0; i < text_len; i++) {
			const each_char = text_val.charAt(i);
			const uni_char = escape(each_char) //유니코드 형식으로 변환
			if (uni_char.length > 4) {
				// 한글 : 2Byte
				totalByte += 2;
			} else {
				// 영문,숫자,특수문자 : 1Byte
				totalByte += 1;
			}
		}

		if (totalByte > maxByte) {
			alert('최대 500Byte까지만 입력가능합니다.');
			document.getElementById("nowByte2").innerText = totalByte;
			document.getElementById("nowByte2").style.color = "red";
		} else {
			document.getElementById("nowByte2").innerText = totalByte;
			document.getElementById("nowByte2").style.color = "green";
		}
	}

	</script>



</body>
</html>