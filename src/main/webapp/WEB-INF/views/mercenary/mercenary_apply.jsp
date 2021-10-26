<!-- 윤인규 10/23 게시글 리스트 조회 작업중 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="row my-5">
		<div class="col-2 mx-auto" style="font-size: 40px; text-align: center; border-bottom: 3px solid black;">용병 구직</div>
	</div>
	<div class="row">
		<div class="row mt-5">
			<div class="col-8 mx-auto">
				<div class="d-grid gap-2 d-md-flex justify-content-md-end mb-5">
					<button class="btn btn-primary col-3" type="button" style="font-size: 30px;" onclick="location.href='/mercenary/applyRegForm'">용병 등록</button>
				</div>
				<table class="table table-striped table-hover">
					<thead>
						<tr>
							<th scope="col">지점구분</th>
							<th scope="col">매치일자</th>
							<th scope="col">신청팀</th>
							<th scope="col">작성자</th>
							<th scope="col">작성일자</th>
							<th scope="col">신청</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${mercApplyList }" var="mercApply">
						<tr data-bs-toggle="modal" data-bs-target="#applyDetailModal" onclick="applyInfo('${mercApply.mercenaryApplyCode}')">
							<td>${mercApply.mercenaryApplyLocation }</td>
							<td>${mercApply.mercenaryApplyDate } ${mercApply.mercenaryApplyStartTime } ~ ${mercApply.mercenaryApplyEndTime }</td>
							<td>${mercApply.mercenaryApplyNumberTeam }팀</td>
							<td>${mercApply.mercenaryApplyWriter }</td>
							<td>${mercApply.mercenaryApplyRegdate }</td>
							<c:choose>
								<c:when test="${mercApply.mercenaryApplyPosible eq '1' }">
									<td><button type="button" class="btn btn-info">신청</button></td>
								</c:when>
								<c:otherwise>
									<td><button type="button" class="btn btn-danger">마감</button></td>
								</c:otherwise>
							</c:choose>
						</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		<div class="row mt-5">
			<div class="col-6 mx-auto m-0 p-0">
				<div class="row mx-auto">
					<div class="col-2">
						<select class="form-select form-select" aria-label=".form-select-lg example" name="searchKeyword">
							<option selected>지점</option>
							<option value="서울">서울</option>
							<option value="대구">대구</option>
							<option value="대전">대전</option>
						</select>
					</div>
					<div class="col">
						<input class="form-control" type="search" placeholder="Search" aria-label="Search" name="searchValue">
					</div>
					<div class="col-1">
						<button class="btn btn-primary " type="submit">Search</button>
					</div>
				</div>
			</div>
		</div>
		<div class="row mt-5">
			<div class="col">
				<nav aria-label="Page navigation example">
					<ul class="pagination justify-content-center m-0 p-0">
						<li class="page-item"><a class="page-link" href="#" aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
						</a></li>
						<li class="page-item active"><a class="page-link" href="#">1</a></li>
						<li class="page-item"><a class="page-link" href="#">2</a></li>
						<li class="page-item"><a class="page-link" href="#">3</a></li>
						<li class="page-item"><a class="page-link" href="#">4</a></li>
						<li class="page-item"><a class="page-link" href="#">5</a></li>
						<li class="page-item"><a class="page-link" href="#">6</a></li>
						<li class="page-item"><a class="page-link" href="#">7</a></li>
						<li class="page-item"><a class="page-link" href="#">8</a></li>
						<li class="page-item"><a class="page-link" href="#">9</a></li>
						<li class="page-item"><a class="page-link" href="#">10</a></li>
						<li class="page-item"><a class="page-link" href="#" aria-label="Next"> <span aria-hidden="true">&raquo;</span>
						</a></li>
					</ul>
				</nav>
			</div>
		</div>
	</div>
	<script type="text/javascript">
	    function applyInfo(mercenaryApplyCode){
			$(".modal-content").load("/mercenary/applyDetail?mercenaryApplyCode=" + mercenaryApplyCode);
		}
	</script>
	<!-- tr 클릭시 상세보기 모달창이고, mercenary_apply_detail.jsp을 불러와서 div class=content안에 내용 넣음 
		모달창에 사이드메뉴, 푸터 안나오게 하는 방법 찾아야 함.
		detail.jsp에서 사이드,푸터 js로 없애니까 모달 사이드,푸터 말고 밖 사이드,푸터도 없어짐..
	 -->
	<div class="modal fade" tabindex="-1" id="applyDetailModal">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
			</div>
		</div>
	</div>
</body>
</html>