<!-- 10/21 윤인규 작성
	추가 작업 필요함.
	매치 날짜? 매치가 잡혀있으면 소개에 적으면? 용병을 구하고 매치? 매치를 잡고 용병?
	팀코드, 매치코드 어떻게 컨트롤러에 보낼지?
 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(document).ready(function() {
		$(document).on('change', '.mercBoardEndTime', function() {
			var mercBoardStartTime = $('.mercBoardStartTime').val();
			var mercBoardEndTime = $('.mercBoardEndTime').val();

			if (mercBoardEndTime < mercBoardStartTime) {
				alert('매치 끝나는 시간이 매치 시작보다 빠릅니다.')
				$('.mercBoardEndTime').val('');
			} else {
			}
		});

		$(document).on('click', '#mercReg', function() {
			var inputIntro = $('#inputIntro').val()

			if (inputIntro == '') {
				alert('자기 소개를 먼저 입력 해주세요.')
			} else {
				alert('용병 등록이 완료되었습니다.')
			}
		});
	});
</script>
</head>
<body>

	<div class="container col-3 mx-auto">

		<div class="row shadow-lg p-3 mb-5 bg-body rounded">

			<div class="row mt-3">
				<h5 class="mb-3" style="border-bottom: 2px solid blue;">용 병</h5>
			</div>

			<h3 class="m-5">구인 / 구직</h3>


			<form action="/mercenary/recruitReg" method="post">
				<div class="col mx-auto mb-3">
					<label for="selectSort" class="form-label">게시글 구분</label> <select class="form-select" aria-label="Default select example" name="mercBoardSort">
						<option selected value="구인">구인</option>
						<option value="구직">구직</option>
					</select>
				</div>
				<div class="col mb-3">
					<label for="selectLocation" class="form-label">지역</label> <select class="form-select" aria-label="Default select example" name="mercBoardLocation">
						<option selected value="서울">서울</option>
						<option value="인천">인천</option>
						<option value="대전">대전</option>
						<option value="대구">대구</option>
						<option value="부산">부산</option>
						<option value="광주">광주</option>
						<option value="울산">울산</option>
					</select>
				</div>
				<div class="col mb-3">
					<label for="inputIntro" class="form-label">자기 소개</label>
					<textarea rows="10px" name="mercBoardIntro" class="form-control" id="inputIntro" required></textarea>
				</div>
				<div class="col mb-3">
					<label for="selectDate" class="form-label">매치 날짜</label> <input type="date" name="mercBoardDate" class="form-control" id="selectDate" value="${today }" min="${today }" required>
				</div>
				<div class="col mb-3">
					<label for="selectTime" class="form-label">매치 시작 시간</label> <input type="time" name="mercBoardStartTime" class="form-control mercBoardStartTime" id="selectTime" value="${time }" min="09:00" required>
				</div>
				<div class="col mb-3">
					<label for="selectTime" class="form-label">매치 끝나는 시간</label> <input type="time" name="mercBoardEndTime" class="form-control mercBoardEndTime" id="selectTime" value="${time }" required>
				</div>
				<div class="col mb-3">
					<div class="row">
						<label for="selectRadio" class="form-label">모집여부</label>
					</div>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio" name="mercBoardPossible" id="inlineRadio1" value="1" checked> <label class="form-check-label" for="inlineRadio1">모집중</label>
					</div>
				</div>
				<div class="d-flex justify-content-around mt-5 mb-3">
					<input style="width: 10rem;" class="btn btn-outline-primary" type="submit" id="mercReg" value="모집 등록">
					<button style="width: 10rem;" type="button" class="btn btn-outline-danger" onclick="location.href='/mercenary/recruit';">취 소</button>
				</div>
			</form>
		</div>
	</div>
</body>
</html>