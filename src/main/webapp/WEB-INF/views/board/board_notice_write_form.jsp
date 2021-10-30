<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>



	<div class="container">

		<div class="row">
			<h5 class="mb-3" style="border-bottom: 2px solid blue;">공 지 사 항</h5>
		</div>

		<h3 class="m-5">공지사항 작성</h3>

		<form action="/board/noticeWriteForm" method="post" enctype="multipart/form-data">

			<div class="col-8 mx-auto mt-3">

				<!-- 글정보 -->
				<div class="row">

					<div class="col-12 mb-3">
						<label for="titleNotice" class="form-label">제 목</label> <input type="text" class="form-control" name="titleNotice" required>
					</div>

				</div>

				<div class="row mb-3">

					<div class="col mx-auto">
						<label for="writerNotice" class="form-label">작 성 자</label> <input type="text" class="form-control" name="writerNotice" value="${sessionScope.loginInfo.memberId }" readonly>
					</div>

					<div class="col mx-auto ">
						<label for="createDateNotice" class="form-label">작 성 일</label> <input type="date" class="form-control" name="createDateNotice" value="${nowDate }" readonly>
					</div>

					<div class="col mx-auto">
						<label for="boardPwNotice" class="form-label">비 밀 번 호</label> <input type="password" class="form-control" name="boardPwNotice">
					</div>

				</div>



				<!-- 파일 업로드 미 구현 -->

				<!-- 				<div class="row"> -->

				<!-- 					<div class="col-12 mb-5"> -->
				<!-- 						<label for="fileNameNotice" class="form-label">파 일 등 록</label> <input type="file" class="form-control" name="fileNameNotice"> -->
				<!-- 					</div> -->

				<!-- 				</div> -->




				<!-- 글 내용 -->
				<div class="row mb-5">

					<div class="form-floating">
						<textarea class="form-control" placeholder="Leave a comment here" id="floatingTextarea2" name="contentNotice" style="height: 300px" required></textarea>
						<label for="floatingTextarea2">내 용</label>
					</div>

				</div>



				<!-- 버튼 -->
				<div class="row mb-5">

					<div class="col d-flex justify-content-evenly">
						<input style="width: 13rem;" class="btn btn-outline-primary" type="submit" value="등 록">
						<button style="width: 13rem;" type="button" class="btn btn-danger" onclick="location.href='/board/goNoticeList';">취 소</button>
					</div>

				</div>

			</div>

		</form>

	</div>




</body>
</html>