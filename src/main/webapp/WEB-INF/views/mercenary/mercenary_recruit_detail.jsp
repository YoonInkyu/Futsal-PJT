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
	$(document).on('click', '#change', function() {
		var mercBoardCode = $(this).next().val()
		
		$.ajax({
	        url: '/mercenary/recruitDetailAjax', //요청경로
	        type: 'post',
	        data:{'mercBoardCode':mercBoardCode}, //필요한 데이터
	        success: function(result) {
	        	//ajax 실행 성공 시 실행되는 구간
	        	$('.location').remove()
	        	var str='';
	        	str += '<td>';
	        	str += '<select class="form-select" name="mercBoardLocation">'
	        	str += '<option selected value="' + result.mercBoardLocation + '">' + result.mercBoardLocation + '</option>';
	        	//선택된 애는 option에 안나오게 어떻게 하는고임..??
	        	str += '<option value="서울">서울</option>';
	        	str += '<option value="경기">경기</option>';
	        	str += '<option value="대전">대전</option>';
	        	str += '<option value="대구">대구</option>';
	        	str += '</select>';
	        	str += '</td>';
	        	$('.locationTr').append(str);
	        	
	        	$('.matchDate').remove()
	        	var str1='';
	        	str1 += '<td><input type="date" name="mercBoardDate" class="form-control" value="' + result.mercBoardDate + '">';
	        	str1 += '<input type="time" name="mercBoardStartTime" class="form-control" value="' + result.mercBoardStartTime + '">';
	        	str1 += '<input type="time" name="mercBoardEndTime" class="form-control" value="' + result.mercBoardEndTime + '"></td>';
	        	$('.matchDateTr').append(str1);
	        	
	        	$('.intro').remove()
	        	var str2='';
	        	str2 += '<td><textarea rows="10px" name="mercBoardIntro" class="form-control" >' + result.mercBoardIntro + '</textarea></td>';
	        	$('.introTr').append(str2);
	        	
	        	$('.change').val('수정')
	        	$('.formChange').attr('action', '/mercenary/detailUpdate?mercBoardCode=' + result.mercBoardCode)
	        	$('.change').attr('type', 'submit')
	        },
	        error: function(){
	        	//ajax 실행 실패 시 실행되는 구간
	        	alert('실패');
	        }
	  });
	});
});
</script>
</head>
<body>
<!-- 용병 구인 상세보기 모달 내용 -->
	<div class="modal-header">
		<h3 class="modal-title">상세보기</h3>
		<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	</div>
	<form action="#" method="post" id="formAt" class="formChange">
		<div class="modal-body">
			<table class="table">
				<tbody>
					<tr class="sortTr">
						<th scope="row">구분</th>
						<td class="al_left sort">${mercVO.mercBoardSort }</td>
					</tr>
					<tr class="writerTr">
						<th scope="row">작성자</th>
						<td class="al_left writer">${mercVO.mercBoardWriter }</td>
					</tr>
					<tr class="locationTr">
						<th scope="row">지역</th>
						<td class="al_left location" colspan="3">${mercVO.mercBoardLocation }</td>
					</tr>
					<tr class="matchDateTr">
						<th scope="row">매치일자</th>
						<td class="al_left matchDate" colspan="3">${mercVO.mercBoardDate } ${mercVO.mercBoardStartTime } ~ ${mercVO.mercBoardEndTime } </td>
					</tr>
					<tr class="applyNumTr">
						<th scope="row">신청한 사람</th>
						<td class="al_left applyNum">${mercVO.mercBoardApplyNumber }명</td>
					</tr>
					<tr class="possibleTr">
						<th scope="row">신청가능여부</th>
						<td class="">
							<c:choose>
								<c:when test="${mercVO.mercBoardPossible eq '1' }">
									가능							
								</c:when>
								<c:otherwise>
									마감
								</c:otherwise>
							</c:choose>
						</td>
					</tr>
					<tr class="introTr">
						<td class="al_left intro" colspan="4"><div class="match_meno">${mercVO.mercBoardIntro }</div></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="modal-footer">
			 <c:choose>
				<c:when test="${sessionScope.loginInfo.memberName eq mercVO.mercBoardWriter }">
					<input type="button" class="btn btn-primary change" value="수정하기" id="change">
					<input type="hidden" value="${mercVO.mercBoardCode}">
				</c:when>
				<c:otherwise>
					<c:if test="${mercVO.mercBoardPossible eq '1' }">
						<input type="button" class="btn btn-primary" value="신청하기" onclick="location.href='/mercenary/updateRecruitCnt?mercBoardCode=${mercVO.mercBoardCode}&memberCode=${sessionScope.loginInfo.memberCode}&teamCode=${sessionScope.loginInfo.teamCode }'">
					</c:if>
				</c:otherwise>
			</c:choose>
		</div>
	</form>
	<h3 class="modal-title2">지원 용병 리스트</h3>
	<table class="table">
		<thead>
			<tr>
				<th scope="col">멤버 이름</th>
				<th scope="col">포지션</th>
				<th scope="col">수락/거절</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${mercList }" var="merc">
				<tr>
					<td>${merc.memberName }</td>
					<td>${merc.position }</td>
					<td>
						<c:choose>
							<c:when test="${sessionScope.loginInfo.memberName eq mercVO.mercBoardWriter && mercVO.mercBoardPossible eq '1'}">
								<button type="button" class="btn btn-info" onclick="location.href='/mercenary/updateResponse?mercBoardCode=${mercVO.mercBoardCode}&mercListCode=${merc.mercListCode}'">수락</button>
							</c:when>
							<c:otherwise>
								${merc.mercListResponse }
							</c:otherwise>
						</c:choose>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>