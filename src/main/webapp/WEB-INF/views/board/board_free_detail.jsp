<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/resources/board/js/board_free_detail.js?ver=3"></script>
</head>
<body>



	<div class="container col-5 mx-auto">

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
													<li class="dropdown-item"onclick="teamDetail('${freeInfo.teamCode}')">소속 팀 보기</li>
												</ul>
											</div>
										</td>
									</c:otherwise>

								</c:choose>

								<td>${freeInfo.createDateFree }</td>
								<td>${freeInfo.readCntFree }</td>
							</tr>
							<tr>

								<td colspan="4">첨부파일 : <c:forEach items="${imgListFree }" var="imgFree">

										<c:if test="${not empty imgFree.freeImgOrignName }">
											<a class="mx-1 btn btn-outline-success  btn-sm" href="<c:url value="..\\resources\\img\\board\\${imgFree.freeImgAttachedName }" ></c:url>" download="${imgFree.freeImgOrignName }">
												<svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" fill="currentColor" class="bi bi-download" viewBox="0 0 16 16">
												  <path d="M.5 9.9a.5.5 0 0 1 .5.5v2.5a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1v-2.5a.5.5 0 0 1 1 0v2.5a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2v-2.5a.5.5 0 0 1 .5-.5z"/>
												  <path d="M7.646 11.854a.5.5 0 0 0 .708 0l3-3a.5.5 0 0 0-.708-.708L8.5 10.293V1.5a.5.5 0 0 0-1 0v8.793L5.354 8.146a.5.5 0 1 0-.708.708l3 3z"/>
												</svg>&nbsp;${imgFree.freeImgOrignName }</a>
										</c:if>

									</c:forEach>
							</tr>

						</tbody>

					</table>

				</div>

			</div>

		</div>



		<!-- 글 내용 -->
		<div class="row mb-3" style="border-bottom: 1px solid gray; height: 30rem; word-break: break-all;">${freeInfo.contentFree }</div>



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

			<div class="col-8 mx-auto my-5 shadow-sm p-3 mb-5 bg-body rounded">

				<div class="mb-3">총 ${replyFreeList.size() }건의 댓글이 있습니다.</div>

				<c:choose>

					<c:when test="${not empty sessionScope.loginInfo }">

						<form action="/reply/freeInsertReply" method="post">

							<input type="hidden" name="boardNumFree" value="${freeInfo.boardNumFree }">

							<div class="input-group">

								<span class="input-group-text" id="basic-addon1">댓글 입력</span> <input type="text" class="form-control" name="contentFree" placeholder="입력..." aria-label="Username" aria-describedby="basic-addon1" onkeyup="contentFreeReply_checkByte(this);" required>

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



		<c:forEach items="${replyFreeList }" var="replyFree">

			<!-- 댓글 목록 -->
			<div class="row mb-5 align-items-center">

				<!-- 로그인 이미지(이미지 불러 오고 링크 걸어서 정보로 갈수 있게 할 예정) -->
				<c:if test="${not empty replyFree.writerImg}">
				<div class="col-3 text-end">
					<img style="height: 60px; object-fit: cover;" src="/resources/img/member/${replyFree.writerImg }" id="preview" class="img-thumbnail" >
				</div>
				</c:if>
				<c:if test="${empty replyFree.writerImg}">
				<div class="col-3 text-end">
					<img style="height: 60px; object-fit: cover;" src="/resources/img/member/nullImg.png" id="preview" class="img-thumbnail" >
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
								<c:if test="${replyFree.writerFree eq loginInfo.memberId}">
									<td>${replyFree.writerFree }</td>
								</c:if>
								<c:if test="${replyFree.writerFree ne loginInfo.memberId}">
									<td>
										<div class="btn-group dropend">
											<button type="button" class="btn link-primary dropdown-toggle" id="memberMenuButt" data-bs-toggle="dropdown" aria-expanded="false" value="${replyFree.writerFree }">${replyFree.writerFree }</button>
											<ul class="dropdown-menu">
												<li class="dropdown-item" data-bs-toggle="modal" data-bs-target="#addMemberBlackModal" style="cursor: pointer;">블랙리스트 추가</li>
												<li class="dropdown-item"onclick="teamDetail('${replyFree.teamCode}')">소속 팀 보기</li>
											</ul>
										</div>
									</td>
								</c:if>
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
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	</div>



	<!-- ============================== 스크립트 부분 ============================== -->

	<script type="text/javascript">

	// 	공지사항 삭제 알람
	function deleteBoardFree(boardNumFree) {

		var result = confirm('삭제하시겠습니까?');

		if (result) {

			location.href = '/board/deleteBoardFree?boardNumFree=' + boardNumFree;
		}
	}
	
	
	// 공지사항 댓글 글자수 제한
	function contentFreeReply_checkByte(obj) {
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

	</script>



</body>
</html>