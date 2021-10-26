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
	//처음 모달은 제거 되는데... 모달창 닫고 다시열면 보임 ㅠㅠㅠㅠ
	//상세보기 모달 사이드바 제거
	$('.mercDetail').children().last().children().last().remove()
	//상세보기 모달 푸터 제거
	$('.mercDetail').children().last().children().last().children().last().remove()
});
</script>
</head>
<body>
<!-- 용병 구인 상세보기 모달 내용 -->
	<div class="modal-header">
		<h3 class="modal-title">용병 구인 상세보기</h3>
		<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	</div>
	<form action="" method="post">
		<div class="modal-body">
			<table class="table">
				<tbody>
					<tr>
						<th scope="row">작성자</th>
						<td class="al_left">${mercVO.mercenaryBoardWriter }</td>
					</tr>
					<tr>
						<th scope="row">지역</th>
						<td class="al_left" colspan="3">${mercVO.mercenaryBoardLocation }</td>
					</tr>
					<tr>
						<th scope="row">매치일자</th>
						<td class="al_left" colspan="3">${mercVO.mercenaryBoardDate } ${mercVO.mercenaryBoardStartTime } ~ ${mercVO.mercenaryBoardEndTime } </td>
					</tr>
					<tr>
						<th scope="row">신청한 사람</th>
						<td class="al_left">${mercVO.mercenaryBoardNumberMember }명</td>
					</tr>
					<tr>
						<th scope="row">신청가능여부</th>
						<c:choose>
							<c:when test="${mercVO.mercenaryBoardPosible eq '1' }">
								<td>가능</td>
							</c:when>
							<c:otherwise>
								<td>마감</td>
							</c:otherwise>
						</c:choose>
					</tr>
					<tr>
						<td class="al_left" colspan="4"><div class="match_meno">${mercVO.mercenaryBoardIntro }</div></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="modal-footer">
			<!-- 버튼 아직 미구현 -->
			<c:choose>
				<c:when test="${loginInfo.memberID eq mercVO.mercenaryBoardWriter }">
					글쓴이면 수정하기만 보이고 > submit이 아니라 js로 해야 할듯?
					<input type="submit" class="btn btn-primary" value="수정하기">
				</c:when>
				<c:otherwise>
					글쓴이가 아니라면 신청하기만 보이기 마찬가지로 js로 해야 할듯?
					<input type="submit" class="btn btn-primary" value="신청하기">
				</c:otherwise>
			</c:choose> 
		</div>
	</form>
</body>
</html>