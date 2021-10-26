<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
				<c:when test="${sessionScope.loginInfo.memberName eq mercVO.mercenaryBoardWriter }">
					<input type="submit" class="btn btn-primary" value="수정하기">
				</c:when>
				<c:otherwise>
					<input type="button" class="btn btn-primary" value="신청하기" onclick="location.href='/mercenary/updateRecruitCnt?mercenaryBoardCode=${mercVO.mercenaryBoardCode}&memberCode=${sessionScope.loginInfo.memberCode}'">
				</c:otherwise>
			</c:choose> 
		</div>
	</form>
</body>
</html>