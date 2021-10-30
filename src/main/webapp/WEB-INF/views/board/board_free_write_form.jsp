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
			<h5 class="mb-3" style="border-bottom: 2px solid blue;">자 유 게 시 판</h5>
		</div>

		<h3 class="m-5">자유게시판 작성</h3>

		<form action="/board/freeWriteForm" method="post" enctype="multipart/form-data">

			<div class="col-8 mx-auto mt-3">

				<!-- 글정보 -->
				<div class="row">

					<div class="col-12 mb-3">
						<label for="titleFree" class="form-label">제 목</label> <input type="text" class="form-control" name="titleFree" required>
					</div>

				</div>

				<div class="row mb-3">

					<div class="col mx-auto">
						<label for="writerFree" class="form-label">작 성 자</label> <input type="text" class="form-control" name="writerFree" value="${sessionScope.loginInfo.memberId }" readonly>
					</div>

					<div class="col mx-auto ">
						<label for="createDateFree" class="form-label">작 성 일</label> <input type="date" class="form-control" name="createDateFree" value="${nowDate }" readonly>
					</div>

					<div class="col mx-auto">
						<label for="boardPwFree" class="form-label">비 밀 번 호</label> <input type="password" class="form-control" name="boardPwFree">
					</div>

				</div>



				<!-- 파일 업로드 미 구현 -->

				<!-- 				<div class="row"> -->

				<!-- 					<div class="col-12 mb-5"> -->
				<!-- 						<label for="fileNameFree" class="form-label">파 일 등 록</label> <input type="file" class="form-control" name="fileNameFree"> -->
				<!-- 					</div> -->

				<!-- 				</div> -->




				<!-- 글 내용 -->
				<div class="row mb-5">

					<div class="form-floating">
						<textarea class="form-control" placeholder="Leave a comment here" id="floatingTextarea2" name="contentFree" style="height: 300px" required></textarea>
						<label for="floatingTextarea2">내 용</label>
					</div>

				</div>



				<!-- 버튼 -->
				<div class="row mb-5">

					<div class="col d-flex justify-content-evenly">
						<input style="width: 13rem;" class="btn btn-outline-primary" type="submit" value="등 록">
						<button style="width: 13rem;" type="button" class="btn btn-danger" onclick="location.href='/board/goFreeList';">취 소</button>
					</div>

				</div>

			</div>

		</form>

	</div>




</body>
</html>