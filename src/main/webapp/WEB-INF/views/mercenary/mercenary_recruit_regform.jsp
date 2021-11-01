<!-- 10/21 윤인규 작성
	추가 작업 필요함.
	매치 날짜? 매치가 잡혀있으면 소개에 적으면? 용병을 구하고 매치? 매치를 잡고 용병?
	팀코드, 매치코드 어떻게 컨트롤러에 보낼지?
 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		
		if(mercBoardEndTime < mercBoardStartTime) {
			alert('매치 끝나는 시간이 매치 시작보다 빠릅니다.')
			$('.mercBoardEndTime').val('');
		}
		else {
		}
		
	});
});
</script>
</head>
<body>
<form action="/mercenary/recruitReg" method="post">
	<div class="row">
		<div class="col-12 mb-5">
			<label for="selectSort" class="form-label">게시글 구분</label>
			<select class="form-select" aria-label="Default select example" name="mercBoardSort">
				<option selected value="구인">구인</option>
				<option value="구직">구직</option>
			</select>
		</div>
		<div class="col-12 mb-5">
			<label for="selectLocation" class="form-label">지역</label>
			<select class="form-select" aria-label="Default select example" name="mercBoardLocation">
				<option selected value="서울">서울</option>
				<option value="경기">경기</option>
				<option value="대전">대전</option>
				<option value="대구">대구</option>
			</select>
		</div>
		<div class="col-12 mb-5">
			<label for="inputIntro" class="form-label">팀 소개</label>
			<textarea rows="10px" name="mercBoardIntro" class="form-control" id="inputIntro" required></textarea>
		</div>
		<div class="col-12 mb-5">
			<label for="selectDate" class="form-label">매치 날짜?</label>
			<input type="date" name="mercBoardDate" class="form-control" id="selectDate" value="${today }" min="${today }" required>
		</div>
		<div class="col-12 mb-5">
			<label for="selectTime" class="form-label">매치 시작 시간?</label>
			<input type="time" name="mercBoardStartTime" class="form-control mercBoardStartTime" id="selectTime" value="${time }" min="09:00" required>
		</div>
		<div class="col-12 mb-5">
			<label for="selectTime" class="form-label">매치 끝나는 시간?</label>
			<input type="time" name="mercBoardEndTime" class="form-control mercBoardEndTime" id="selectTime" value="${time }"required>
		</div>
		<div class="col-12 mb-5">
			<div class="row">
				<label for="selectRadio" class="form-label">모집여부</label>
			</div>
			<div class="form-check form-check-inline">
				<input class="form-check-input" type="radio" name="mercBoardPossible" id="inlineRadio1" value="1" checked>
				<label class="form-check-label" for="inlineRadio1">모집중</label>
			</div>
			<div class="form-check form-check-inline">
				<input class="form-check-input" type="radio" name="mercBoardPossible" id="inlineRadio2" value="2">
				<label class="form-check-label" for="inlineRadio2">모집완료</label>
			</div>
		</div>
	</div>
	<div class="d-grid gap-2">
		<input class="btn btn-primary" type="submit" value="모집 등록">
	</div>
</form>
</body>
</html>