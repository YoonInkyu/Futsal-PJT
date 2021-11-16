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
<title>매치 게시판 글 쓰기</title>
<script type="text/javascript" src="/resources/match/js/match_regForm.js"></script>
</head>
<body>
	<div class="container col-3 mx-auto">
		<div class="row shadow-lg p-3 mb-5 bg-body rounded">
			<div class="row mt-3">
				<h5 class="mb-3" style="border-bottom: 2px solid blue;">매 치</h5>
			</div>
			<h3 class="m-5">매치 등록</h3>
			<form action="/match/matchReg" method="post">
				<div class="col mb-3">
					<label for="selectLocation" class="form-label">지역</label> <select class="form-select" aria-label="Default select example" name="matchLocation">
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
					<label for="inputIntro" class="form-label">매치 소개</label>
					<textarea rows="10px" name="matchIntro" class="form-control" id="inputIntro" required></textarea>
				</div>
				<div class="col mb-3">
					<label for="selectDate" class="form-label">매치 날짜</label> <input type="date" name="matchDate" class="form-control" id="selectDate" value="${today }" min="${today }" required>
				</div>
				<div class="col mb-3">
					<label for="selectTime" class="form-label">매치 시작 시간</label> <input type="time" name="matchStartTime" class="form-control matchStartTime" id="selectTime" value="${time }" min="09:00" required>
				</div>
				<div class="col mb-3">
					<label for="selectTime" class="form-label">매치 끝나는 시간</label> <input type="time" name="matchEndTime" class="form-control matchEndTime" id="selectTime" value="${time }" required>
				</div>
				<div class="col mb-3">
					<div class="row">
						<label for="selectRadio" class="form-label">모집 여부</label>
					</div>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio" name="matchPossible" id="inlineRadio1" value="1" checked> <label class="form-check-label" for="inlineRadio1">모집중</label>
					</div>
				</div>
				<div class="d-flex justify-content-around mt-5 mb-3">
					<input style="width: 10rem;" class="btn btn-outline-primary" type="submit" id="matchReg" value="매치 등록">
					<button style="width: 10rem;" type="button" class="btn btn-outline-danger" onclick="location.href='/match/matchList';">취 소</button>
				</div>
			</form>
		</div>
	</div>
</body>
</html>