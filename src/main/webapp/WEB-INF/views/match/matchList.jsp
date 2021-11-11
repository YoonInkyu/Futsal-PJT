<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(document).ready(function() {
		var matchDetailModal = document.getElementById('matchDetailModal');
		//모달 닫히면 페이지 리로드
		//가끔 모달 닫고 메뉴바가 눌러지지 않아서 강제로 리로드 시킴
		matchDetailModal.addEventListener('hidden.bs.modal', function(event) {
		location.reload();
		})
	});
	$(document).ready(function() {
		var recruitDetailModal = document.getElementById('teamDetailModal');
		//모달 닫히면 페이지 리로드
		//가끔 모달 닫고 메뉴바가 눌러지지 않아서 강제로 리로드 시킴
		recruitDetailModal.addEventListener('hidden.bs.modal', function(event) {
		location.reload();
		})
	});
</script>
</head>
<body>
	<div class="container col-6 mx-auto">
		<div class="row m-5 text-center justify-content-center">
			<h2>매 치 게 시 판</h2>
			<div class="col-3" style="border-bottom: 3px solid gray;"></div>
		</div>
		<div class="row">
			<div class="d-grid gap-2 d-md-flex justify-content-md-end mb-3">
				<button class="btn btn-outline-primary " type="button" onclick="location.href='/match/goMatchRegForm'">
					<svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" fill="currentColor" class="bi bi-journal-text" viewBox="0 0 16 16">
					  <path d="M5 10.5a.5.5 0 0 1 .5-.5h2a.5.5 0 0 1 0 1h-2a.5.5 0 0 1-.5-.5zm0-2a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5zm0-2a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5zm0-2a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5z" />
					  <path d="M3 0h10a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2v-1h1v1a1 1 0 0 0 1 1h10a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H3a1 1 0 0 0-1 1v1H1V2a2 2 0 0 1 2-2z" />
					  <path d="M1 5v-.5a.5.5 0 0 1 1 0V5h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1H1zm0 3v-.5a.5.5 0 0 1 1 0V8h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1H1zm0 3v-.5a.5.5 0 0 1 1 0v.5h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1H1z" />
					</svg>&nbsp;등 록 하 기
				</button>
			</div>

			<div class="col text-center">

				<table class="table table-striped table-hover">
					<thead>
						<tr>
							<th scope="col" width="10%">지역</th>
							<th scope="col" width="*%">매치일자</th>
							<th scope="col" width="15%">신청팀</th>
							<th scope="col" width="15%">작성팀</th>
							<th scope="col" width="15%">작성일자</th>
							<th scope="col" width="10%">신청</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${matchList }" var="match">
							<tr>
								<td data-bs-toggle="modal" data-bs-target="#matchDetailModal" onclick="recruitInfo('${match.matchCode}')">${match.matchLocation }</td>
								<td data-bs-toggle="modal" data-bs-target="#matchDetailModal" onclick="recruitInfo('${match.matchCode}')">${match.matchDate }&nbsp;/&nbsp;${match.matchStartTime }&nbsp;~&nbsp;${match.matchEndTime }</td>
								<td data-bs-toggle="modal" data-bs-target="#matchDetailModal" onclick="recruitInfo('${match.matchCode}')">${match.matchApplyNum }명</td>
								<td>
								<div class="btn-group dropend">
									<button type="button" class="btn link-primary dropdown-toggle" id="memberMenuButt" data-bs-toggle="dropdown" aria-expanded="false" value="${match.matchWriter }">${match.matchWriter }</button>
									<ul class="dropdown-menu">
										<li class="dropdown-item" data-bs-toggle="modal" data-bs-target="#teamDetailModal" onclick="teamDetail('${match.teamCode}')">소속 팀 보기</li>
									</ul>
								</div>
								</td>
								<td data-bs-toggle="modal" data-bs-target="#matchDetailModal" onclick="recruitInfo('${match.matchCode}')">${match.matchRegdate }</td>
								<c:choose>
									<c:when test="${match.matchPossible eq '1' }" >
										<td><button type="button" data-bs-toggle="modal" data-bs-target="#matchDetailModal" class="btn btn-success" onclick="recruitInfo('${match.matchCode}')">
												<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-lightbulb-fill" viewBox="0 0 16 16">
												  <path d="M2 6a6 6 0 1 1 10.174 4.31c-.203.196-.359.4-.453.619l-.762 1.769A.5.5 0 0 1 10.5 13h-5a.5.5 0 0 1-.46-.302l-.761-1.77a1.964 1.964 0 0 0-.453-.618A5.984 5.984 0 0 1 2 6zm3 8.5a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1l-.224.447a1 1 0 0 1-.894.553H6.618a1 1 0 0 1-.894-.553L5.5 15a.5.5 0 0 1-.5-.5z"/>
												</svg>&nbsp;신청
											</button></td>
									</c:when>
									<c:otherwise>
										<td><button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#matchDetailModal" onclick="recruitInfo('${match.matchCode}')">
												<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-lightbulb-off-fill" viewBox="0 0 16 16">
												  <path d="M2 6c0-.572.08-1.125.23-1.65l8.558 8.559A.5.5 0 0 1 10.5 13h-5a.5.5 0 0 1-.46-.302l-.761-1.77a1.964 1.964 0 0 0-.453-.618A5.984 5.984 0 0 1 2 6zm10.303 4.181L3.818 1.697a6 6 0 0 1 8.484 8.484zM5 14.5a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1l-.224.447a1 1 0 0 1-.894.553H6.618a1 1 0 0 1-.894-.553L5.5 15a.5.5 0 0 1-.5-.5zM2.354 1.646a.5.5 0 1 0-.708.708l12 12a.5.5 0 0 0 .708-.708l-12-12z"/>
												</svg>&nbsp;마감
											</button></td>
									</c:otherwise>
								</c:choose>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		<!-- 검색관련 내용 -->
		<div class="row mt-5">
			<div class="col-9 mx-auto m-0 p-0">
				<form action="/match/matchList" method="post">
					<div class="row mx-auto">
						<div class="col-2">
							<select class="form-select form-select" aria-label=".form-select-lg example" name="searchLocation">
								<c:if test="${matchVO.searchLocation == null }">
									<option value="">지역</option>
										<option value="서울">서울</option>
										<option value="인천">인천</option>
										<option value="대전">대전</option>
										<option value="대구">대구</option>
										<option value="부산">부산</option>
										<option value="광주">광주</option>
										<option value="울산">울산</option>
								</c:if>
								<c:if test="${matchVO.searchLocation != null }">
									<option value="">지역</option>
									<option value="서울" <c:if test="${matchVO.searchLocation == '서울'}">selected</c:if>>서울</option>
									<option value="대구" <c:if test="${matchVO.searchLocation == '인천'}">selected</c:if>>인천</option>
									<option value="대전" <c:if test="${matchVO.searchLocation == '대전'}">selected</c:if>>대전</option>
									<option value="서울" <c:if test="${matchVO.searchLocation == '대구'}">selected</c:if>>대구</option>
									<option value="대구" <c:if test="${matchVO.searchLocation == '부산'}">selected</c:if>>부산</option>
									<option value="대전" <c:if test="${matchVO.searchLocation == '광주'}">selected</c:if>>광주</option>
									<option value="대전" <c:if test="${matchVO.searchLocation == '울산'}">selected</c:if>>울산</option>
								</c:if>
							</select>
						</div>
						<div class="col-3">
							<select class="form-select form-select" aria-label=".form-select-lg example" name="searchKeyword">
								<c:if test="${matchVO.searchKeyword == null}">
									<option value="">신청여부</option>
									<option value="1">신청</option>
									<option value="2">마감</option>
								</c:if>
								<c:if test="${matchVO.searchKeyword != null}">
									<option value="">신청여부</option>
									<option value="1" <c:if test="${matchVO.searchKeyword == '1'}">selected</c:if>>신청</option>
									<option value="2" <c:if test="${matchVO.searchKeyword == '2'}">selected</c:if>>마감</option>
								</c:if>
							</select>
						</div>
						<div class="col">
							<input class="form-control" type="search" placeholder="작성팀 검색" aria-label="Search" name="searchValue" value="${matchVO.searchValue }">
						</div>
						<div class="col-2">
							<button class="btn btn-outline-primary " type="submit">
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
 								 <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z" />
								</svg>&nbsp;검 색
							</button>
						</div>
					</div>
				</form>
			</div>
		</div>
		<!-- 페이징 처리 -->
		<c:if test="${matchVO.totalCnt != 0}">
			<div class="row mt-5">
				<div class="col">
					<nav aria-label="Page navigation example">
						<ul class="pagination justify-content-center">
							<li class="page-item <c:if test="${!matchVO.prev }">disabled</c:if>"><a class="page-link" href="/match/matchList?nowPage=${matchVO.beginPage - 1 }"> <span aria-hidden="true">&laquo;</span>
							</a></li>
							<c:forEach begin="${matchVO.beginPage }" end="${matchVO.endPage }" var="pageNumber">
								<li class="page-item <c:if test="${matchVO.nowPage == pageNumber }">active</c:if>"><a class="page-link" href="/match/matchList?nowPage=${pageNumber }&searchLocation=${matchVO.searchLocation}&searchKeyword=${matchVO.searchKeyword}&searchValue=${matchVO.searchValue}">${pageNumber }</a></li>
							</c:forEach>
							<li class="page-item <c:if test="${!matchVO.next }">disabled</c:if>"><a class="page-link" href="/match/matchList?nowPage=${matchVO.endPage + 1 }"> <span aria-hidden="true">&raquo;</span>
							</a></li>
						</ul>
					</nav>
				</div>
			</div>
		</c:if>
	</div>
	<!-- js파일 새로 만들어서 넣어야 함. -->
	<script type="text/javascript">
		function recruitInfo(matchCode) {
			$(".modal-content").load("/match/matchDetail?matchCode=" + matchCode);
		}
		function teamDetail(teamCode) {
			$(".modal-content").load("/team/teamDetail?teamCode=" + teamCode);
			}
	</script>
	<!-- tr 클릭시 상세보기 모달창이고, match_detail.jsp을 불러와서 div class=content안에 내용 넣음 -->
	<div class="modal fade" tabindex="-1" id="matchDetailModal">
		<div class="modal-dialog modal-lg">
			<div class="modal-content matchDetail"></div>
		</div>
	</div>
	<div class="modal fade  " id="teamDetailModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content"></div>
		</div>
	</div>
</body>
</html>