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

		<h3 class="m-5">작성글 수정</h3>

		<form action="/board/updateBoardNotice" method="post" enctype="multipart/form-data">

			<div class="col-8 mx-auto mt-3">

				<!-- 글정보 -->
				<div class="row">

					<div class="col-12 mb-3">
						<label for="titleNotice" class="form-label">제 목</label> <input type="text" class="form-control" name="titleNotice" value="${noticeInfo.titleNotice }" required>
					</div>

				</div>

				<div class="row mb-3">

					<div class="col mx-auto">
						<label for="writerNotice" class="form-label">작 성 자</label> <input type="text" class="form-control" name="writerNotice" value="${noticeInfo.writerNotice }" readonly>
					</div>

					<div class="col mx-auto ">
						<label for="createDateNotice" class="form-label">작 성 일</label> <input type="date" class="form-control" name="createDateNotice" value="${nowDate }" readonly>
					</div>

					<div class="col mx-auto">
						<label for="boardNumNotice" class="form-label">글 번 호</label> <input type="text" class="form-control" name="boardNumNotice" value="${noticeInfo.boardNumNotice }" readonly>
					</div>

				</div>


				<!-- 파일 업로드 미 구현 -->

				<!-- 				<div class="row"> -->

				<!-- 					<div class="col-12 mb-5"> -->
				<!-- 						<label for="fileNameNotice" class="form-label">파 일 등 록</label> <input type="file" class="form-control" name="fileNameNotice" value="${noticeInfo.fileNameNotice }> -->
				<!-- 					</div> -->

				<!-- 				</div> -->



				<!-- 글 내용 -->
				<div class="row mb-5">

					<div class="form-floating">
						<textarea class="form-control" placeholder="Leave a comment here" id="floatingTextarea2" name="contentNotice" style="height: 300px" required>${noticeInfo.contentNotice }</textarea>
						<label for="floatingTextarea2">내 용</label>
					</div>

				</div>


				<!-- 버튼 -->
				<div class="row mb-5">

					<div class="col d-flex justify-content-evenly">
						<input style="width: 13rem;" class="btn btn-outline-primary" type="submit" value="수 정">
						<button style="width: 13rem;" type="button" class="btn btn-danger" onclick="location.href='/board/goNoticeList';">취 소</button>
					</div>

				</div>

			</div>

		</form>

	</div>












<!-- 	<form action="/board/updateBoardNotice" method="post"> -->


<!-- 		<h3>작성글 수정</h3> -->

<!-- 		<table border="1"> -->

<!-- 			<colgroup> -->
<!-- 				<col width="20%"> -->
<!-- 				<col width="80%"> -->
<!-- 			</colgroup> -->


<!-- 			<tr> -->
<!-- 				<td>글 번호</td> -->
<%-- 				<td><input type="text" style="width: 80%" name="boardNumNotice" value="${noticeInfo.boardNumNotice }" readonly></td> --%>
<!-- 			</tr> -->

<!-- 			<tr> -->
<!-- 				<td>제목</td> -->
<%-- 				<td><input type="text" style="width: 80%" name="titleNotice" value="${noticeInfo.titleNotice }"></td> --%>
<!-- 			</tr> -->

<!-- 			<tr> -->
<!-- 				<td>작성자</td> -->
<%-- 				<td><input type="text" style="width: 80%" name="writerNotice" value="${noticeInfo.writerNotice }" readonly></td> --%>
<!-- 			</tr> -->

<!-- 			<tr> -->
<!-- 				<td>작성일</td> -->
<%-- 				<td><input type="date" style="width: 80%" name="createDateNotice" value="${nowDate }" readonly></td> --%>
<!-- 			</tr> -->

<!-- 			<tr> -->
<!-- 				<td>내용</td> -->
<%-- 				<td><textarea rows="20" cols="86%" name="contentNotice">${noticeInfo.contentNotice }</textarea></td> --%>
<!-- 			</tr> -->

<!-- 			<tr> -->
<!-- 				<td>첨부파일</td> -->
<%-- 				<td><input type="file" style="width: 80%" name="fileNameNotice" value="${noticeInfo.fileNameNotice }"></td> --%>
<!-- 			</tr> -->

<!-- 		</table> -->

<!-- 		<br> <input type="submit" value="수정" class="btn btn-primary"> -->
<!-- 	</form> -->


<!-- 	<br> -->
<!-- 	<a class="btn btn-primary" onclick="location.href='/board/goNoticeList';">뒤로 가기</a> -->


</body>
</html>