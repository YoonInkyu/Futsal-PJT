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
</head>
<body>
<form action="/mercenary/recruitReg" method="post">
	<div class="row">
		<div class="col-12 mb-5">
			<label for="inputTitle" class="form-label">제목</label>
			<input type="text" name="mercenaryBoardTitle" class="form-control" id="inputTitle">
		</div>
		<div class="col-12 mb-5">
			<label for="inputIntro" class="form-label">팀 소개</label>
			<textarea rows="10px" name="mercenaryBoardIntro" class="form-control" id="inputIntro"></textarea>
		</div>
		<div class="col-12 mb-5">
			<label for="selectMerceNum" class="form-label">용병 구인 수</label>
			<input type="number" name="mercenaryBoardNumbermember" class="form-control" id="selectMerceNum" min="1" max="5">
		</div>
		<div class="col-12 mb-5">
			<label for="selectDate" class="form-label">매치 날짜?</label>
			<input type="date" name="" class="form-control" id="selectDate">
		</div>
		<div class="col-12 mb-5">
			<div class="row">
				<label for="selectRadio" class="form-label">모집여부</label>
			</div>
			<div class="form-check form-check-inline">
				<input class="form-check-input" type="radio" name="mercenaryBoardPosible" id="inlineRadio1" value="1">
				<label class="form-check-label" for="inlineRadio1">모집중</label>
			</div>
			<div class="form-check form-check-inline">
				<input class="form-check-input" type="radio" name="mercenaryBoardPosible" id="inlineRadio2" value="2">
				<label class="form-check-label" for="inlineRadio2">모집완료</label>
			</div>
		</div>
	</div>
	<div class="d-grid gap-2">
		<input class="btn btn-primary" type="submit" value="모집글 등록">
	</div>
</form>
</body>
</html>