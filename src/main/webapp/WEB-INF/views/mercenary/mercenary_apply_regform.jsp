<!-- 10/21 윤인규 작성
	추가 작업 필요함. 멤버코드 어떻게 컨트롤러에 보낼지?
	가능한 시간대 칼럼(데이터) 추가? 소개에 적으면?
 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="/mercenary/applyReg" method="post">
	<div class="row">
		<div class="col-12 mb-5">
			<label for="inputTitle" class="form-label">지역</label>
			<select class="form-select" aria-label="Default select example" name="mercenaryApplyLocation">
				<option selected>서울</option>
				<option value="경기">경기</option>
				<option value="대전">대전</option>
				<option value="대구">대구</option>
			</select>
		</div>
		<div class="col-12 mb-5">
			<label for="inputTitle" class="form-label">제목</label>
			<input type="text" name="mercenaryApplyTitle" class="form-control" id="inputTitle">
		</div>
		<div class="col-12 mb-5">
			<label for="inputIntro" class="form-label">자기 소개</label>
			<textarea rows="10px" name="mercenaryApplyIntro" class="form-control" id="inputIntro"></textarea>
		</div>
		<div class="col-12 mb-5">
			<label for="selectDate" class="form-label">용병 가능한 날짜?</label>
			<input type="date" name="mercenaryApplyDate" class="form-control" id="selectDate">
		</div>
		<div class="col-12 mb-5">
			<label for="selectTime" class="form-label">용병 가능한 시작시간?</label>
			<input type="time" name="mercenaryApplyStartTime" class="form-control" id="selectTime" min="09:00:00" max="24:00:00">
		</div>
		<div class="col-12 mb-5">
			<label for="selectTime" class="form-label">용병 가능한 끝나는 시간?</label>
			<input type="time" name="mercenaryApplyEndTime" class="form-control" id="selectTime" min="09:00:00" max="24:00:00">
		</div>
		<div class="col-12 mb-5">
			<div class="row">
				<label for="selectRadio" class="form-label">마감여부</label>
			</div>
			<div class="form-check form-check-inline">
				<input class="form-check-input" type="radio" name="mercenaryApplyPosible" id="inlineRadio1" value="1" checked>
				<label class="form-check-label" for="inlineRadio1">신청가능</label>
			</div>
			<div class="form-check form-check-inline">
				<input class="form-check-input" type="radio" name="mercenaryApplyPosible" id="inlineRadio2" value="2">
				<label class="form-check-label" for="inlineRadio2">신청완료</label>
			</div>
		</div>
	</div>
	<div class="d-grid gap-2">
		<input class="btn btn-primary" type="submit" value="지원글 등록">
	</div>
</form>
</body>
</html>