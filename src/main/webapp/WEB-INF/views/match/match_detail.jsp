<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$(document).ready(function() {
	//수정 ajax
	$(document).on('click', '#change', function() {
		var matchCode = $(this).next().val()
		
		$.ajax({
	        url: '/match/matchDetailAjax', //요청경로
	        type: 'post',
	        data:{'matchCode':matchCode}, //필요한 데이터
	        success: function(result) {
	        	//ajax 실행 성공 시 실행되는 구간
	        	$('.location').remove()
	        	var str='';
	        	str += '<td>';
	        	str += '<select class="form-select" name="matchLocation">'
	        		if(result.matchLocation == '서울'){
		        		str += '<option value="서울" selected>서울</option>';
		        		str += '<option value="경기">경기</option>';
		        		str += '<option value="대전">대전</option>';
		        		str += '<option value="대구">대구</option>';
		        	}
		        	else if(result.matchLocation == '경기'){
		        		str += '<option value="서울">서울</option>';
		        		str += '<option value="경기" selected>경기</option>';
		        		str += '<option value="대전">대전</option>';
		        		str += '<option value="대구">대구</option>';
		        	}
		        	else if(result.matchLocation == '대전'){
		        		str += '<option value="서울">서울</option>';
		        		str += '<option value="경기">경기</option>';
		        		str += '<option value="대전" selected>대전</option>';
		        		str += '<option value="대구">대구</option>';
		        	}
		        	else if(result.matchLocation == '대구'){
		        		str += '<option value="서울">서울</option>';
		        		str += '<option value="경기">경기</option>';
		        		str += '<option value="대전">대전</option>';
		        		str += '<option value="대구" selected>대구</option>';
		        	}
	        	str += '</select>';
	        	str += '</td>';
	        	$('.locationTr').append(str);
	        	
	        	$('.matchDate').remove()
	        	var str1='';
	        	str1 += '<td><input type="date" name="matchDate" class="form-control" value="' + result.matchDate + '">';
	        	str1 += '<input type="time" name="matchStartTime" class="form-control" value="' + result.matchStartTime + '">';
	        	str1 += '<input type="time" name="matchEndTime" class="form-control" value="' + result.matchEndTime + '"></td>';
	        	$('.matchDateTr').append(str1);
	        	
	        	$('.intro').remove()
	        	var str2='';
	        	str2 += '<td><textarea rows="10px" name="matchIntro" class="form-control" >' + result.matchIntro + '</textarea></td>';
	        	$('.introTr').append(str2);
	        	
	        	$('.change').val('수정')
	        	$('.formAt').attr('action', '/match/matchDetailUpdate?matchCode=' + result.matchCode)
	        	$('.change').attr('type', 'submit')
	        },
	        error: function(){
	        	//ajax 실행 실패 시 실행되는 구간
	        	alert('실패');
	        }
	  });
	});
	
	//결과 등록 ajax
	$(document).on('click', '#matchResult', function() {
		var matchCode = $(this).prev().val()
		
		$.ajax({
	        url: '/match/matchDetailAjax', //요청경로
	        type: 'post',
	        data:{'matchCode':matchCode}, //필요한 데이터
	        success: function(result) {
	        	//ajax 실행 성공 시 실행되는 구간
	        	var str = '';
	        	str += '<span class="input-group-text">결과 입력(홈 : 어웨이)</span>';
	        	str += '<input type="number" name="matchResultHometeamScore" aria-label="First name" class="form-control" min="0" value="0">';
	        	str += '<input type="number" name="matchResultAwayteamScore" aria-label="Last name" class="form-control" min="0" value="0">';
	        	$('.inputScore').append(str);
	        	
	        	$('.formAt').attr('action', '/match/insertResult?matchCode=' + result.matchCode + '&teamCode=' + result.teamCode + '&teamCodeAway=' + result.teamCodeAway)
	        	$('.matchResult').val('결과 등록')
	        	$('.matchResult').attr('type', 'submit')
	        	
	        },
	        error: function(){
	        	//ajax 실행 실패 시 실행되는 구간
	        	alert('실패');
	        }
	  });
	});
	
	$(document).on('click', '#matchResponse', function() {
		var matchCode = $(this).next().val()
		var matchManageCode = $(this).next().next().val()
		var matchDateAll = $(this).next().next().next().val()
		var teamCodeAway = $(this).next().next().next().next().val()
		var applyMemberTell = $(this).next().next().next().next().next().val()
		var applyTeamName = $(this).next().next().next().next().next().next().val()
		var writerMemberTell = $(this).next().next().next().next().next().next().next().val()
		var writerTeamName = $(this).next().next().next().next().next().next().next().next().val()
		var str = '?matchCode=' + matchCode + '&matchManageCode=' + matchManageCode + '&matchDateAll=' + matchDateAll + '&teamCodeAway=' + teamCodeAway + '&applyMemberTell=' + applyMemberTell + '&applyTeamName=' + applyTeamName + '&writerMemberTell=' + writerMemberTell + '&writerTeamName=' + writerTeamName
		//alert(str)
		
		location.href='/match/updateResponse' + str;
	});
	
});
</script>
<style type="text/css">
input[type=number] {
	text-align: center;
}
</style>
</head>
<body>
<!-- 용병 구인 상세보기 모달 내용 -->
	<div class="modal-header">
		<h3 class="modal-title">상세보기</h3>
		<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	</div>
	<form action="#" method="post" id="formAt" class="formAt">
		<div class="modal-body">
			<table class="table">
				<tbody>
					<tr class="writerTr">
						<th scope="row">작성팀</th>
						<td class="al_left writer">${matchVO.matchWriter }</td>
					</tr>
					<tr class="locationTr">
						<th scope="row">지역</th>
						<td class="al_left location" colspan="3">${matchVO.matchLocation }</td>
					</tr>
					<tr class="matchDateTr">
						<th scope="row">매치일자</th>
						<td class="al_left matchDate" colspan="3">${matchVO.matchDate } ${matchVO.matchStartTime } ~ ${matchVO.matchEndTime } </td>
					</tr>
					<tr class="applyNumTr">
						<th scope="row">신청한 팀</th>
						<td class="al_left applyNum">${matchVO.matchApplyNum }팀</td>
					</tr>
					<tr class="possibleTr">
						<th scope="row">신청가능여부</th>
						<td class="">
							<c:choose>
								<c:when test="${matchVO.matchPossible eq '1' }">
									가능							
								</c:when>
								<c:otherwise>
									마감
								</c:otherwise>
							</c:choose>
						</td>
					</tr>
					<tr class="introTr">
						<td class="al_left intro" colspan="4"><div class="match_meno">${matchVO.matchIntro }</div></td>
					</tr>
					<tr>
					</tr>
				</tbody>
			</table>
				<div class="input-group inputScore">
				<c:if test="${not empty matchResult }">
					<table class="table">
						<colgroup>
							<col width="*">
							<col width="40%">
							<col width="34%">
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
		</div>
		<div class="modal-footer">
			 <c:choose>
				<c:when test="${sessionScope.loginInfo.teamName eq matchVO.matchWriter }">
					<input type="button" class="btn btn-primary change" value="수정하기" id="change">
					<input type="hidden" value="${matchVO.matchCode}">
					<c:if test="${matchVO.matchPossible eq '1' && empty matchResult}"> <!-- 신청 마감이고, 결과가 등록되어 있으면 삭제 불가능 --> 
						<input type="button" class="btn btn-danger delete" value="삭제하기" onclick="location.href='/match/deleteMatch?matchCode=${matchVO.matchCode}'">
					</c:if>
					<c:if test="${matchVO.matchPossible eq '2' && empty matchResult}">
						<input type="button" class="btn btn-info matchResult" value="매치 결과 등록" id="matchResult">
					</c:if>
				</c:when>
				<c:otherwise>
					<c:if test="${matchVO.matchPossible eq '1' }">
						<input type="button" class="btn btn-primary" value="신청하기" onclick="location.href='/match/updateApplyMatch?matchCode=${matchVO.matchCode}&memberTell=${matchVO.memberTell }&teamCodeAway=${sessionScope.loginInfo.teamCode }'">
					</c:if>
				</c:otherwise>
			</c:choose>
		</div>
	</form>
	<h3 class="modal-title2">지원 팀 리스트</h3>
	<table class="table">
		<thead>
			<tr>
				<th scope="col">팀 이름</th>
				<!-- 가능하면 랭킹순위? -->
				<!-- <th scope="col">랭킹순위</th> -->
				<th scope="col">수락/거절</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${teamList }" var="team">
				<tr>
					<td>${team.teamName }</td>
					<td>
						<c:choose>
							<c:when test="${sessionScope.loginInfo.teamName eq matchVO.matchWriter && matchVO.matchPossible eq '1'}">
								<button type="button" class="btn btn-info" id="matchResponse">수락</button>
								<input type="hidden" value="${matchVO.matchCode }"> <!-- 매치코드 -->
								<input type="hidden" value="${team.matchManageCode }"> <!-- 매치 매니지 코드 -->
								<input type="hidden" value="${team.matchDate }"> <!-- 매치 시간 -->
								<input type="hidden" value="${team.teamCodeAway }"> <!-- 신청자 팀코드 -->
								<input type="hidden" value="${team.memberTell }"> <!-- 신청자 핸드폰번호 -->
								<input type="hidden" value="${team.teamName }"> <!-- 신청자 아이디 -->
								<input type="hidden" value="${matchVO.memberTell }"> <!-- 작성자 핸드폰 번호 -->
								<input type="hidden" value="${matchVO.matchWriter }"> <!-- 작성자 아이디 -->
<%-- 								<button type="button" class="btn btn-info" onclick="location.href='/match/updateResponse?matchCode=${matchVO.matchCode }&matchManageCode=${team.matchManageCode}&teamCodeAway=${team.teamCodeAway}'">수락</button> --%>
							</c:when>
							<c:otherwise>
								${team.matchManageResponse }
							</c:otherwise>
						</c:choose>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>