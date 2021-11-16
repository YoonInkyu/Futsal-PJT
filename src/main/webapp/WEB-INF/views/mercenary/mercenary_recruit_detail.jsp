<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>용병 게시판 상세보기</title>
<script type="text/javascript" src="/resources/mercenary/js/mercenary_recruit_detail.js"></script>
</head>
<body>
	<!-- 용병 구인 상세보기 모달 내용 -->
	<div class="container">
		<div class="modal-header">
			<h3 class="modal-title">상세보기</h3>
			<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		</div>
		<form action="#" method="post" id="formAt" class="formChange">
			<div class="modal-body">
				<div class="row my-3">
					<div class="col">
						<label for="mercBoardSort" class="form-label">구분</label> 
						<input type="text" class="form-control" id="mercBoardSort" value="${mercVO.mercBoardSort }" readonly>
					</div>
					<div class="col">
						<label for="memberId" class="form-label">작성자</label> 
						<input type="text" class="form-control" id="memberId" value="${mercVO.memberId }" readonly>
					</div>
					<div class="col selectLocationDiv">
						<label for="selectLocation" class="form-label">지역</label> 
						<input type="text" class="form-control selectLocation" id="selectLocation" value="${mercVO.mercBoardLocation }" readonly>
					</div>
				</div>
				<div class="row my-3">
					<div class="col inputDateDiv">
						<label for="mercBoardDate" class="form-label">매치일자</label> 
						<input type="text" class="form-control mercBoardDate" id="mercBoardDate" value="${mercVO.mercBoardDate } / ${mercVO.mercBoardStartTime } ~ ${mercVO.mercBoardEndTime }" readonly>
					</div>
					<div class="col-3">
						<label for="mercBoardApplyNumber" class="form-label">신청한 사람</label> 
						<input type="text" class="form-control" id="mercBoardApplyNumber" value="${mercVO.mercBoardApplyNumber }명" readonly>
					</div>
					<div class="col-3">
						<c:choose>
							<c:when test="${mercVO.mercBoardPossible eq '1' }">
								<label for="possible" class="form-label">신청가능 여부</label>
								<input type="text" class="form-control" id="possible" value="가능" readonly>
							</c:when>
							<c:otherwise>
								<label for="impossible" class="form-label">신청가능 여부</label>
								<input type="text" class="form-control" id="impossible" value="마감" readonly>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
				<div class="row mt-4">
					<div class="col inputIntroDiv">
						<label for="mercBoardIntro">내 용</label>
						<textarea class="form-control mercBoardIntro" id="mercBoardIntro" style="height: 10rem;" readonly>${mercVO.mercBoardIntro }</textarea>
					</div>
				</div>
			</div>
			<!-- 11/8 성환이형 디자인 수정(아래가 기본소스) -->
			<!-- 				<table class="table"> -->
			<!-- 					<tbody> -->

			<!-- 						<tr class="sortTr"> -->
			<!-- 							<th scope="row">구분</th> -->
			<%-- 							<td class="al_left sort">${mercVO.mercBoardSort }</td> --%>
			<!-- 						</tr> -->
			<!-- 						<tr class="writerTr"> -->
			<!-- 							<th scope="row">작성자</th> -->
			<%-- 							<td class="al_left writer">${mercVO.memberId }</td> --%>
			<!-- 						</tr> -->
			<!-- 						<tr class="locationTr"> -->
			<!-- 							<th scope="row">지역</th> -->
			<%-- 							<td class="al_left location" colspan="3">${mercVO.mercBoardLocation }</td> --%>
			<!-- 						</tr> -->
			<!-- 						<tr class="matchDateTr"> -->
			<!-- 							<th scope="row">매치일자</th> -->
			<%-- 							<td class="al_left matchDate" colspan="3">${mercVO.mercBoardDate }/${mercVO.mercBoardStartTime }~${mercVO.mercBoardEndTime }</td> --%>
			<!-- 						</tr> -->
			<!-- 						<tr class="applyNumTr"> -->
			<!-- 							<th scope="row">신청한사람</th> -->
			<%-- 							<td class="al_left applyNum">${mercVO.mercBoardApplyNumber }명</td> --%>
			<!-- 						</tr> -->
			<!-- 						<tr class="possibleTr"> -->
			<!-- 							<th scope="row">신청가능여부</th> -->
			<%-- 							<td class=""><c:choose> --%>
			<%-- 									<c:when test="${mercVO.mercBoardPossible eq '1' }"> --%>
			<!-- 									가능							 -->
			<%-- 								</c:when> --%>
			<%-- 									<c:otherwise> --%>
			<!-- 									마감 -->
			<%-- 								</c:otherwise> --%>
			<%-- 								</c:choose></td> --%>
			<!-- 						</tr> -->
			<!-- 						<tr class="introTr"> -->
			<%-- 							<td class="al_left intro" colspan="4"><div class="match_meno">${mercVO.mercBoardIntro }</div></td> --%>
			<!-- 						</tr> -->
			<!-- 					</tbody> -->
			<!-- 				</table> -->
			<!-- 삭제 / 수정 / 신청 버튼 -->
			<div class="modal-footer d-flex justify-content-around mb-5">
				<c:choose>
					<c:when test="${sessionScope.loginInfo.memberCode eq mercVO.memberCode }">
						<c:if test="${mercVO.mercBoardPossible eq '1' }">
						<!-- 신청 마감이면 수정,삭제 불가능 -->
							<input style="width: 10rem;" type="button" class="btn btn-outline-danger delete" value="삭제하기" onclick="location.href='/mercenary/deleteMerc?mercBoardCode=${mercVO.mercBoardCode}'">
							<input style="width: 10rem;" type="button" class="btn btn-primary change" value="수정하기" id="change">
							<input type="hidden" value="${mercVO.mercBoardCode}">
						</c:if>
					</c:when>
					<c:otherwise>
						<c:if test="${mercVO.mercBoardPossible eq '1' }">
							<input style="width: 10rem;" type="button" class="btn btn-outline-primary" value="신청하기" onclick="location.href='/mercenary/updateRecruitCnt?mercBoardCode=${mercVO.mercBoardCode}&memberCode=${sessionScope.loginInfo.memberCode}&memberTell=${mercVO.memberTell }&teamCode=${sessionScope.loginInfo.teamCode }'">
						</c:if>
					</c:otherwise>
				</c:choose>
			</div>
		</form>
		<div class="row m-5" style="border-bottom: 2px solid blue;"></div>
		<!-- 지원자 리스트 -->
		<div class="col m-3">
			<h3 class="modal-title2">지원 용병 리스트</h3>
		</div>

		<table class="table table-striped table-hover text-center">
			<thead>
				<tr>
					<th scope="col">지원자</th>
					<th scope="col">포지션</th>
					<th scope="col">수락 / 거절</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${mercList }" var="merc">
					<tr>
						<td>${merc.memberId }</td>
						<td>${merc.position }</td>
						<td><c:choose>
								<c:when test="${sessionScope.loginInfo.memberCode eq mercVO.memberCode && mercVO.mercBoardPossible eq '1'}">
									<button type="button" class="btn btn-info" onclick="location.href='/mercenary/updateResponse?mercBoardCode=${mercVO.mercBoardCode}&mercListCode=${merc.mercListCode}'">수락</button>
								</c:when>
								<c:otherwise>
									${merc.mercListResponse }
								</c:otherwise>
							</c:choose></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>