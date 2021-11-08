<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/resources/mercenary/js/mercenary_recruit.js?ver=2"></script>
<script type="text/javascript">
	$(document).ready(function() {
		var recruitDetailModal = document.getElementById('recruitDetailModal');
		//모달 닫히면 페이지 리로드
		//가끔 모달 닫고 메뉴바가 눌러지지 않아서 강제로 리로드 시킴
		recruitDetailModal.addEventListener('hidden.bs.modal', function(event) {
			location.reload();
		})
	});
</script>
</head>
<body>
	<div class="container col-5 mx-auto">
		<div class="row m-5 text-center justify-content-center">
			<h2>용 병 게 시 판</h2>
			<div class="col-3" style="border-bottom: 3px solid gray;"></div>
		</div>
		<div class="row">
			<div class="d-grid gap-2 d-md-flex justify-content-md-end mb-3">
				<button class="btn btn-outline-primary col-2" type="button" onclick="location.href='/mercenary/recruitRegForm'">등록하기</button>
			</div>
			<div class="col text-center">
				<table class="table table-striped table-hover">
					<thead>
						<tr>
							<th scope="col" width="10%">구분</th>
							<th scope="col" width="10%">지역</th>
							<th scope="col" width="*%">매치일자</th>
							<th scope="col" width="10%">신청인원</th>
							<th scope="col" width="15%">작성자</th>
							<th scope="col" width="15%">작성일자</th>
							<th scope="col" width="10%">신청</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${mercBoardList }" var="mercBoard">
							<tr>
								<td data-bs-toggle="modal" data-bs-target="#recruitDetailModal" onclick="recruitInfo('${mercBoard.mercBoardCode}')">${mercBoard.mercBoardSort }</td>
								<td data-bs-toggle="modal" data-bs-target="#recruitDetailModal" onclick="recruitInfo('${mercBoard.mercBoardCode}')">${mercBoard.mercBoardLocation }</td>
								<td data-bs-toggle="modal" data-bs-target="#recruitDetailModal" onclick="recruitInfo('${mercBoard.mercBoardCode}')">${mercBoard.mercBoardDate } / ${mercBoard.mercBoardStartTime } ~ ${mercBoard.mercBoardEndTime }</td>
								<td data-bs-toggle="modal" data-bs-target="#recruitDetailModal" onclick="recruitInfo('${mercBoard.mercBoardCode}')">${mercBoard.mercBoardApplyNumber }명</td>
								<c:if test="${mercBoard.memberId  eq loginInfo.memberId}">
									<td>${mercBoard.memberId}</td>
								</c:if>
								<c:if test="${mercBoard.memberId  ne loginInfo.memberId}">
									<td>
										<div class="btn-group dropend">
											<button type="button" class="btn link-primary dropdown-toggle" id="memberMenuButt" data-bs-toggle="dropdown" aria-expanded="false" value="${mercBoard.memberId }">${mercBoard.memberId }</button>
											<ul class="dropdown-menu">
												<li class="dropdown-item" data-bs-toggle="modal" data-bs-target="#addMemberBlackModal" style="cursor: pointer;">블랙리스트 추가</li>
												<li class="dropdown-item">소속 팀 보기</li>
											</ul>
										</div>
									</td>
								</c:if>
								<td data-bs-toggle="modal" data-bs-target="#recruitDetailModal" onclick="recruitInfo('${mercBoard.mercBoardCode}')">${mercBoard.mercBoardRegdate }</td>
								<c:choose>
									<c:when test="${mercBoard.mercBoardPossible eq '1' }">
										<td data-bs-toggle="modal" data-bs-target="#recruitDetailModal" onclick="recruitInfo('${mercBoard.mercBoardCode}')"><button type="button" class="btn btn-info">신청</button></td>
									</c:when>
									<c:otherwise>
										<td data-bs-toggle="modal" data-bs-target="#recruitDetailModal" onclick="recruitInfo('${mercBoard.mercBoardCode}')"><button type="button" class="btn btn-danger">마감</button></td>
									</c:otherwise>
								</c:choose>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<!-- 검색관련 내용 -->
			<div class="row mt-5">
				<div class="col-8 mx-auto m-0 p-0">
					<form action="/mercenary/recruit" method="post">
						<div class="row mx-auto">
							<div class="col-2">
								<select class="form-select form-select" aria-label=".form-select-lg example" name="searchSort">
									<c:if test="${mercenaryVO.searchSort == null }">
										<option value="">구분</option>
										<option value="구인">구인</option>
										<option value="구직">구직</option>
									</c:if>
									<c:if test="${mercenaryVO.searchSort != null }">
										<option value="">구분</option>
										<option value="구인" <c:if test="${mercenaryVO.searchSort == '구인'}">selected</c:if>>구인</option>
										<option value="구직" <c:if test="${mercenaryVO.searchSort == '구직'}">selected</c:if>>구직</option>
									</c:if>
								</select>
							</div>
							<div class="col-2">
								<select class="form-select form-select" aria-label=".form-select-lg example" name="searchLocation">
									<c:if test="${mercenaryVO.searchLocation == null }">
										<option value="">지역</option>
										<option value="서울">서울</option>
										<option value="대구">대구</option>
										<option value="대전">대전</option>
									</c:if>
									<c:if test="${mercenaryVO.searchLocation != null }">
										<option value="">지역</option>
										<option value="서울" <c:if test="${mercenaryVO.searchLocation == '서울'}">selected</c:if>>서울</option>
										<option value="대구" <c:if test="${mercenaryVO.searchLocation == '대구'}">selected</c:if>>대구</option>
										<option value="대전" <c:if test="${mercenaryVO.searchLocation == '대전'}">selected</c:if>>대전</option>
									</c:if>
								</select>
							</div>
							<div class="col-3">
								<select class="form-select form-select" aria-label=".form-select-lg example" name="searchKeyword">
									<c:if test="${mercenaryVO.searchKeyword == null}">
										<option value="">신청여부</option>
										<option value="1">신청</option>
										<option value="2">마감</option>
									</c:if>
									<c:if test="${mercenaryVO.searchKeyword != null}">
										<option value="">신청여부</option>
										<option value="1" <c:if test="${mercenaryVO.searchKeyword == '1'}">selected</c:if>>신청</option>
										<option value="2" <c:if test="${mercenaryVO.searchKeyword == '2'}">selected</c:if>>마감</option>
									</c:if>
								</select>
							</div>
							<div class="col">
								<input class="form-control" type="search" placeholder="작성자 검색" aria-label="Search" name="searchValue" value="${mercenaryVO.searchValue }">
							</div>
							<div class="col-1">
								<button class="btn btn-primary " type="submit">Search</button>
							</div>
						</div>
					</form>
				</div>
			</div>
			<!-- 페이징 처리 -->
			<c:if test="${mercenaryVO.totalCnt != 0}">
				<div class="row mt-5">
					<div class="col">
						<nav aria-label="Page navigation example">
							<ul class="pagination justify-content-center">
								<li class="page-item <c:if test="${!matchVO.prev }">disabled</c:if>">
									<a class="page-link" href="/mercenary/recruit?nowPage=${mercenaryVO.beginPage - 1 }">
										<span aria-hidden="true">&laquo;</span>
									</a>
								</li>
								<c:forEach begin="${mercenaryVO.beginPage }" end="${mercenaryVO.endPage }" var="pageNumber">
									<li class="page-item <c:if test="${mercenaryVO.nowPage == pageNumber }">active</c:if>">
										<a class="page-link" href="/mercenary/recruit?nowPage=${pageNumber }&searchLocation=${mercenaryVO.searchLocation}&searchKeyword=${mercenaryVO.searchKeyword}&searchValue=${mercenaryVO.searchValue}">${pageNumber }</a>
									</li>
								</c:forEach>
								<li class="page-item <c:if test="${!mercenaryVO.next }">disabled</c:if>">
									<a class="page-link" href="/mercenary/recruit?nowPage=${mercenaryVO.endPage + 1 }">
										<span aria-hidden="true">&raquo;</span>
									</a>
								</li>
							</ul>
						</nav>
					</div>
				</div>
			</c:if>
		</div>
	</div>
	<!-- js파일 새로 만들어서 넣어야 함. -->
	<script type="text/javascript">
	    function recruitInfo(mercBoardCode){
			$(".modal-content").load("/mercenary/recruitDetail?mercBoardCode=" + mercBoardCode);
		}
	</script>
	<!-- 
		tr 클릭시 상세보기 모달창이고, mercenary_recruit_detail.jsp을 불러와서 div class=content안에 내용 넣음 
	 -->


	<div class="modal fade" tabindex="-1" id="recruitDetailModal">
		<div class="modal-dialog modal-lg">
			<div class="modal-content mercDetail"></div>
		</div>
	</div>
	<div class="modal fade" id="addMemberBlackModal" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content addMemberBlackDiv">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">블랙리스트 추가</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="form-floating">
						<textarea class="form-control" placeholder="Leave a comment here" id="blackComment" style="height: 10rem; resize: none;"></textarea>
						<label for="floatingTextarea2" >사 유</label>

						<div class="my-3" style="font-size: 13px; color: red;">블랙리스트 추가시 해당회원의 용병구인 게시글 및 신청 현황이 숨김 처리됩니다.</div>
					</div>
					<div class="modal-footer d-flex justify-content-between">
						<button style="width: 10rem;" type="button" class=" btn btn-outline-danger" onclick="addMemberBlack()">추 가</button>
						<button style="width: 10rem;" type="button" class="btn btn-primary" data-bs-dismiss="modal">취 소</button>
					</div>
				</div>
			</div>
		</div>
	</div>










</body>
</html>