<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	recruitDetailModal.addEventListener('hidden.bs.modal', function (event) {
		location.reload();
	})
});
</script>
</head>
<body>
	<div class="row my-5">
		<div class="col-3 mx-auto" style="font-size: 40px; text-align: center; border-bottom: 3px solid black;">용병 게시판</div>
	</div>
	<div class="row">
		<div class="row mt-5">
			<div class="col-8 mx-auto">
				<div class="d-grid gap-2 d-md-flex justify-content-md-end mb-5">
					<button class="btn btn-primary col-3" type="button" style="font-size: 30px;" onclick="location.href='/mercenary/recruitRegForm'">등록하기</button>
				</div>
				<table class="table table-striped table-hover">
					<thead>
						<tr>
							<th scope="col">구분</th>
							<th scope="col">지역</th>
							<th scope="col">매치일자</th>
							<th scope="col">신청 인원</th>
							<th scope="col">작성자</th>
							<th scope="col">작성일자</th>
							<th scope="col">
							</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${mercBoardList }" var="mercBoard">
						<tr>
							<td data-bs-toggle="modal" data-bs-target="#recruitDetailModal" onclick="recruitInfo('${mercBoard.mercBoardCode}')">${mercBoard.mercBoardSort }</td>
							<td data-bs-toggle="modal" data-bs-target="#recruitDetailModal" onclick="recruitInfo('${mercBoard.mercBoardCode}')">${mercBoard.mercBoardLocation }</td>
							<td data-bs-toggle="modal" data-bs-target="#recruitDetailModal" onclick="recruitInfo('${mercBoard.mercBoardCode}')">${mercBoard.mercBoardDate } ${mercBoard.mercBoardStartTime } ~ ${mercBoard.mercBoardEndTime }</td>
							<td data-bs-toggle="modal" data-bs-target="#recruitDetailModal" onclick="recruitInfo('${mercBoard.mercBoardCode}')">${mercBoard.mercBoardApplyNumber }명</td>
							<c:if test="${mercBoard.memberId  eq loginInfo.memberId}">
								<td>${mercBoard.memberId}</td>
							</c:if>
							<c:if test="${mercBoard.memberId  ne loginInfo.memberId}">
							<td>
							<div class="btn-group dropend">
								<button type="button" class="btn btn-outline-dark dropdown-toggle" id="memberMenuButt" data-bs-toggle="dropdown" aria-expanded="false" value="${mercBoard.memberId }">${mercBoard.memberId }</button>
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
		</div>
		<!-- 검색관련 내용 -->
		<div class="row mt-5">
			<div class="col-6 mx-auto m-0 p-0">
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
							<input class="form-control" type="search" placeholder="작성팀 검색" aria-label="Search" name="searchValue" value="${mercenaryVO.searchValue }">
						</div>
						<div class="col-1">
							<button class="btn btn-primary " type="submit">Search</button>
						</div>
					</div>
				</form>
			</div>
		</div>
		<!-- 페이징 처리 -->
		<div class="row mt-5">
			<div class="col">
				<nav aria-label="Page navigation example">
					<ul class="pagination justify-content-center">
						<c:if test="${mercenaryVO.prev eq true}">
							<li class="page-item">
								<a class="page-link" href="/mercenary/recruit?nowPage=${mercenaryVO.beginPage - 1 }">Prev</a>
							</li>
						</c:if>
						<c:forEach begin="${mercenaryVO.beginPage }" end="${mercenaryVO.endPage }" var="pageNumber">
							<li class="page-item <c:if test="${mercenaryVO.nowPage == pageNumber }">active</c:if>">
								<!-- 여기 href 수정 -->
								<a class="page-link" href="/mercenary/recruit?nowPage=${pageNumber }&searchLocation=${mercenaryVO.searchLocation}&searchKeyword=${mercenaryVO.searchKeyword}&searchValue=${mercenaryVO.searchValue}">${pageNumber }</a>
							</li>
						</c:forEach>
						<c:if test="${mercenaryVO.next eq true}">
							<li class="page-item">
								<a class="page-link" href="/mercenary/recruit?nowPage=${mercenaryVO.endPage + 1 }">Next</a>
							</li>
						</c:if>
					</ul>
				</nav>
			</div>
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
			<div class="modal-content mercDetail">
			</div>
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
  						<textarea class="form-control" placeholder="Leave a comment here" id="blackComment" style="height: 100px"></textarea>
  						<label for="floatingTextarea2" style="color: gray;">사 유 입력란<br><br>블랙리스트 추가시 해당회원의 용병구인 게시글 및 신청<br> 현황이 숨김처리됩니다.</label>
					</div>
					<div class="modal-footer">
						<!-- <p>블랙리스트 추가시 해당회원의 용병구인 게시글 및 신청 현황이 숨김처리됩니다.</p> -->
						<button type="button" class="btn btn-primary" onclick="addMemberBlack()">추 가 하 기</button>
						<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫 기</button>
					</div>
				</div>
				<!-- <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div> -->
			</div>
		</div>
	</div>
</body>
</html>