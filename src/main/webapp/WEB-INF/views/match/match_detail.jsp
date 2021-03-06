<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매치 게시판 상세보기</title>
<script type="text/javascript" src="/resources/match/js/match_detail.js"></script>
<style type="text/css">
input[type=number] {
	text-align: center;
}
</style>
</head>
<body>
	<!-- 매치 상세보기 모달 내용 -->
	<div class="container">
		<div class="modal-header">
			<h3 class="modal-title">상세보기</h3>
			<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		</div>
		<form action="#" method="post" id="formAt" class="formChange">
			<div class="modal-body">
				<div class="row my-3">
					<div class="col">
						<label for="matchApplyNum" class="form-label">신청한 팀</label> <input type="text" class="form-control" id="matchApplyNum" value="${matchVO.matchApplyNum }팀" readonly>
					</div>
					<div class="col">
						<label for="matchWriter" class="form-label">작성팀</label> <input type="text" class="form-control" id="matchWriter" value="${matchVO.matchWriter }" readonly>
					</div>
					<div class="col selectLocationDiv">
						<label for="aaa" class="form-label">지역</label> <input type="text" class="form-control selectLocation" id="selectLocation" value="${matchVO.matchLocation }" readonly>
					</div>
				</div>
				<div class="row my-3">
					<div class="col inputDateDiv">
						<label for="aaa" class="form-label">매치일자</label> <input type="text" class="form-control matchDate" id="matchDate" value="${matchVO.matchDate } / ${matchVO.matchStartTime } ~ ${matchVO.matchEndTime }" readonly>
					</div>
					<div class="col-3">
						<c:choose>
							<c:when test="${matchVO.matchPossible eq '1' }">
								<label for="aaa" class="form-label">신청가능 여부</label>
								<input type="text" class="form-control" id="aaa" value="가능" readonly>
							</c:when>
							<c:otherwise>
								<label for="aaa" class="form-label">신청가능 여부</label>
								<input type="text" class="form-control" id="aaa" value="마감" readonly>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
				
				
				<div class="row mt-4">
					<div class="mb-2">
						<label for="matchRank">작성팀 매치전적</label>
					</div>
					<div class="col-2">
						<input type="text" class="form-control" id="matchWin" value="${matchVO.rankWin }승" readonly>
					</div>
					<div class="col-2">
						<input type="text" class="form-control" id="matchDraw" value="${matchVO.rankDraw }무" readonly>
					</div>
					<div class="col-2">
						<input type="text" class="form-control" id="matchLose" value="${matchVO.rankLose }패" readonly>
					</div>
					<div class="col">
						<c:set var="matchRate" value="${(matchVO.rankWin / (matchVO.rankWin + matchVO.rankDraw + matchVO.rankLose)) * 100  }"/>
						<c:if test="${matchRate eq 'NaN'}">
							<input type="text" class="form-control matchRate" id="matchRate" value="승률 : 0.00%" readonly>
						</c:if>
						<c:if test="${matchRate ne 'NaN'}">
							<input type="text" class="form-control matchRate" id="matchRate" value="승률 : <fmt:formatNumber value="${matchRate}" pattern="0.00" /> %" readonly>
						</c:if>
					</div>
					<div class="col">
					</div>
				</div>
				
				
				
				<div class="row mt-4">
					<div class="col inputIntroDiv">
						<label for="matchIntro">내 용</label>
						<textarea class="form-control matchIntro" id="matchIntro" style="height: 10rem;" readonly>${matchVO.matchIntro }</textarea>
					</div>
				</div>
			</div>
			<!-- 11/8 성환이형 디자인 수정(아래가 기본소스) -->
			<!-- 			<div class="modal-header"> -->
			<!-- 				<h3 class="modal-title">상세보기</h3> -->
			<!-- 				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button> -->
			<!-- 			</div> -->
			<!-- 			<form action="#" method="post" id="formAt" class="formAt"> -->
			<!-- 				<div class="modal-body"> -->
			<!-- 					<table class="table"> -->
			<!-- 						<tbody> -->
			<!-- 							<tr class="writerTr"> -->
			<!-- 								<th scope="row">작성팀</th> -->
			<%-- 								<td class="al_left writer">${matchVO.matchWriter }</td> --%>
			<!-- 							</tr> -->
			<!-- 							<tr class="locationTr"> -->
			<!-- 								<th scope="row">지역</th> -->
			<%-- 								<td class="al_left location" colspan="3">${matchVO.matchLocation }</td> --%>
			<!-- 							</tr> -->
			<!-- 							<tr class="matchDateTr"> -->
			<!-- 								<th scope="row">매치일자</th> -->
			<%-- 								<td class="al_left matchDate" colspan="3">${matchVO.matchDate } / ${matchVO.matchStartTime } ~ ${matchVO.matchEndTime }</td> --%>
			<!-- 							</tr> -->
			<!-- 							<tr class="applyNumTr"> -->
			<!-- 								<th scope="row">신청한 팀</th> -->
			<%-- 								<td class="al_left applyNum">${matchVO.matchApplyNum }팀</td> --%>
			<!-- 							</tr> -->
			<!-- 							<tr class="possibleTr"> -->
			<!-- 								<th scope="row">신청가능여부</th> -->
			<%-- 								<td class=""><c:choose> --%>
			<%-- 										<c:when test="${matchVO.matchPossible eq '1' }"> --%>
			<!-- 									가능							 -->
			<%-- 								</c:when> --%>
			<%-- 										<c:otherwise> --%>
			<!-- 									마감 -->
			<%-- 								</c:otherwise> --%>
			<%-- 									</c:choose></td> --%>
			<!-- 							</tr> -->
			<!-- 							<tr class="introTr"> -->
			<%-- 								<td class="al_left intro" colspan="4"><div class="match_meno">${matchVO.matchIntro }</div></td> --%>
			<!-- 							</tr> -->
			<!-- 							<tr> -->
			<!-- 							</tr> -->
			<!-- 						</tbody> -->
			<!-- 					</table> -->
			<div class="input-group inputScore">
				<c:if test="${not empty matchResult }">
					<table class="table">
						<colgroup>
							<col width="*">
							<col width="44%">
							<col width="30%">
						</colgroup>
						<tr>
							<th></th>
							<th>HOME SCORE</th>
							<th>AWAY SCORE</th>
						</tr>
					</table>
					<span class="input-group-text">매치 결과</span>
					<input type="number" name="matchResultHometeamScore" aria-label="First name" class="form-control" min="0" value="${matchResult.matchResultHometeamScore }" readonly>
					<input type="number" name="matchResultAwayteamScore" aria-label="Last name" class="form-control" min="0" value="${matchResult.matchResultAwayteamScore }" readonly>
				</c:if>
			</div>
			<div class="modal-footer d-flex justify-content-around mb-5">
				<c:choose>
					<c:when test="${sessionScope.loginInfo.teamName eq matchVO.matchWriter }">
						<input type="hidden" value="${matchVO.matchCode}">
						<c:if test="${matchVO.matchPossible eq '1' && empty matchResult}">
							<!-- 신청 마감이거나, 결과가 등록되어 있으면 수정,삭제 불가능 -->
							<input style="width: 10rem;" type="button" class="btn btn-outline-danger delete" value="삭제하기" onclick="location.href='/match/deleteMatch?matchCode=${matchVO.matchCode}'">
							<input style="width: 10rem;" type="button" class="btn btn-outline-primary change" value="수정하기" id="change">
						</c:if>
						<c:if test="${matchVO.matchPossible eq '2' && empty matchResult}">
							<input style="width: 10rem;" type="button" class="btn btn-info matchResult" value="매치 결과 등록" id="matchResult">
						</c:if>
					</c:when>
					<c:otherwise>
						<c:if test="${matchVO.matchPossible eq '1' }">
							<input style="width: 10rem;" type="button" class="btn btn-primary" value="신청하기" onclick="location.href='/match/updateApplyMatch?matchCode=${matchVO.matchCode}&memberTell=${matchVO.memberTell }&teamCodeAway=${sessionScope.loginInfo.teamCode }'">
						</c:if>
					</c:otherwise>
				</c:choose>
			</div>
		</form>
		<div class="row m-5" style="border-bottom: 2px solid blue;"></div>
		<div class="col m-3">
			<h3 class="modal-title2">지원 팀 리스트</h3>
		</div>
		<table class="table table-striped table-hover text-center">
			<thead>
				<tr>
					<th scope="col">팀 이름</th>
					<th scope="col">팀 전적</th>
					<th scope="col">수락/거절</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${teamList }" var="team">
					<tr>
						<td>${team.teamName }</td>
						<td>${team.rankWin }승/ ${team.rankDraw }무 / ${team.rankLose }패</td>
						<td><c:choose>
								<c:when test="${sessionScope.loginInfo.teamName eq matchVO.matchWriter && matchVO.matchPossible eq '1'}">
									<button type="button" class="btn btn-info" id="matchResponse">수락</button>
									<input type="hidden" value="${matchVO.matchCode }">
									<!-- 매치코드 -->
									<input type="hidden" value="${team.matchManageCode }">
									<!-- 매치 매니지 코드 -->
									<input type="hidden" value="${team.matchDate }">
									<!-- 매치 시간 -->
									<input type="hidden" value="${team.teamCodeAway }">
									<!-- 신청자 팀코드 -->
									<input type="hidden" value="${team.memberTell }">
									<!-- 신청자 핸드폰번호 -->
									<input type="hidden" value="${team.teamName }">
									<!-- 신청자 팀이름 -->
									<input type="hidden" value="${matchVO.memberTell }">
									<!-- 작성자 핸드폰 번호 -->
									<input type="hidden" value="${matchVO.matchWriter }">
									<!-- 작성자 팀이름 -->
									<!-- 문자 알림을 위해 수락 기능 js로 수정함. -->
									<%-- <button type="button" class="btn btn-info" onclick="location.href='/match/updateResponse?matchCode=${matchVO.matchCode }&matchManageCode=${team.matchManageCode}&teamCodeAway=${team.teamCodeAway}'">수락</button> --%>
								</c:when>
								<c:otherwise>
								${team.matchManageResponse }
							</c:otherwise>
							</c:choose></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>