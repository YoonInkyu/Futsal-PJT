<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>



	<div class="container col-4 mx-auto">

		<div class="row shadow-lg p-3 mb-5 bg-body rounded">

			<div class="row mt-5">
				<h5 class="mb-3" style="border-bottom: 2px solid blue;">자 유 게 시 판</h5>
			</div>

			<h3 class="m-5">작성글 수정</h3>

			<form action="/board/updateBoardFree" method="post" enctype="multipart/form-data">

				<div class="col mx-auto mt-3">

					<!-- 글정보 -->
					<div class="row">

						<div class="col-12 mb-3">
							<label for="titleFree" class="form-label">제 목</label> <input type="text" class="form-control" name="titleFree" value="${freeInfo.titleFree }" required>
						</div>

					</div>

					<div class="row mb-3">

						<div class="col mx-auto">
							<label for="writerFree" class="form-label">작 성 자</label> <input type="text" class="form-control" name="writerFree" value="${freeInfo.writerFree }" readonly>
						</div>

						<div class="col mx-auto ">
							<label for="createDateFree" class="form-label">작 성 일</label> <input type="date" class="form-control" name="createDateFree" value="${nowDate }" readonly>
						</div>

						<div class="col mx-auto">
							<label for="boardNumFree" class="form-label">글 번 호</label> <input type="text" class="form-control" name="boardNumFree" value="${freeInfo.boardNumFree }" readonly>
						</div>

					</div>



					<!-- 글 내용 -->
					<div class="row mb-5">

						<div class="form-floating">
							<textarea class="form-control" placeholder="Leave a comment here" id="floatingTextarea2" name="contentFree" style="height: 30rem;" onkeyup="contentFree_checkByte(this);" required>${freeInfo.contentFree }</textarea>
							<label for="floatingTextarea2">내 용</label>
						</div>
						<div class="mt-3">
							글자수 제한 (<span id="nowByte1">0</span>/1000bytes)
						</div>

					</div>


					<!-- 버튼 -->
					<div class="row mb-5">

						<div class="col d-flex justify-content-evenly">
							<input style="width: 13rem;" class="btn btn-outline-primary" type="submit" value="수 정">
							<button style="width: 13rem;" type="button" class="btn btn-outline-danger" onclick="location.href='/board/goFreeList';">취 소</button>
						</div>

					</div>

				</div>

			</form>

		</div>

	</div>


	<!-- ============================== 스크립트 부분 ============================== -->

	<script type="text/javascript">
		function contentFree_checkByte(obj) {
			const maxByte = 1000; //최대 바이트
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
				alert('최대 1000Byte까지만 입력가능합니다.');
				document.getElementById("nowByte1").innerText = totalByte;
				document.getElementById("nowByte1").style.color = "red";
			} else {
				document.getElementById("nowByte1").innerText = totalByte;
				document.getElementById("nowByte1").style.color = "green";
			}
		}
	</script>




</body>
</html>