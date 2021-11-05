<!-- 박성환 10/27 : 초기 포멧 생성 -->

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script type="text/javascript">
	    function recruitInfo1(mercBoardCode){
			$(".modal-content").load("/mercenary/recruitDetail?mercBoardCode=" + mercBoardCode);
		}
	    function recruitInfo2(matchCode){
			$(".modal-content").load("/match/matchDetail?matchCode=" + matchCode);
		}
	    $(document).ready(function() {
	    	var recruitDetailModal = document.getElementById('recruitDetailModal');
	    	var matchDetailModal = document.getElementById('matchDetailModal');
	    	//모달 닫히면 페이지 리로드
	    	//가끔 모달 닫고 메뉴바가 눌러지지 않아서 강제로 리로드 시킴
	    	recruitDetailModal.addEventListener('hidden.bs.modal', function (event) {
	    		location.reload();
	    	})
			//모달 닫히면 페이지 리로드
			//가끔 모달 닫고 메뉴바가 눌러지지 않아서 강제로 리로드 시킴
			matchDetailModal.addEventListener('hidden.bs.modal', function (event) {
				location.reload();
			})
	    });
	</script>
</head>
<body>
	<div class="m-5">
		<h1 style="border-bottom: 3px solid gray;">선수 소개 <span style="display: inline-block; float: right;"><button type="button" class="btn btn-link link-dark" data-bs-toggle="modal" data-bs-target="#deleteMemberModal">회원탈퇴</button></span></h1>
	</div>
	<section class="about-me-section p-3 p-lg-5 theme-bg-light">
		<div class="container">
			<div class="profile-teaser row">
				<div class="col-1"></div>
				<div class="col-6">
					<h1 class="name font-weight-bold mb-3">${member.memberName }</h1>
					<div class="mx-3 mb-5">
						<h4>주 포지션 : ${member.position }</h4>
					</div>
					<div class="mx-5 mb-4">
						<div class="mb-3">아이디 : ${member.memberId }</div>
						<div class="mb-3">생 일 : ${member.memberBirth }</div>
						<div class="mb-3">성별 : ${member.memberGender }</div>
						<div class="mb-3">연락처 : ${member.memberTell }</div>
					</div>
					<div class="mb-4 d-grid col-6">
						<button class="btn btn-primary " onclick="location.href='/member/goUpdateMember'">개인 정보 수정</button>
					</div>
				</div>
				<div class="col-md-5 col-lg-5 align-self-center" style="width: 300px;">
				<c:choose>
				<c:when test="${empty member.memberImgAttachedName}">
					<img class="profile-image img-fluid mb-3 mb-lg-0 me-md-0" src="/resources/img/member/nullImg.png" alt="">
				</c:when>
				<c:otherwise>
					<img class="profile-image img-fluid mb-3 mb-lg-0 me-md-0" src="/resources/img/member/${member.memberImgAttachedName }" alt="">
				</c:otherwise>
				</c:choose>
				</div>
			</div>
		</div>
	</section>
	<div class="m-5">
		<h1 style="border-bottom: 3px solid gray;">나의 최신 게시글</h1>
	</div>
	<section class="about-me-section p-3 p-lg-5 theme-bg-light">
		<div class="m-5">
		<h3>용병</h3>
		</div>
		<div class="container">
			<div class="profile-teaser row">
				<table class="table table-striped table-hover">
					<thead>
						<tr>
							<th scope="col">구분</th>
							<th scope="col">지역</th>
							<th scope="col">매치일자</th>
							<th scope="col">신청 인원</th>
							<th scope="col">작성자</th>
							<th scope="col">작성일자</th>
							<th scope="col">신청</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${MymercBoardList }" var="mercBoard" begin="0" end="4">
						<tr data-bs-toggle="modal" data-bs-target="#recruitDetailModal" onclick="recruitInfo1('${mercBoard.mercBoardCode}')">
							<td>${mercBoard.mercBoardSort }</td>
							<td>${mercBoard.mercBoardLocation }</td>
							<td>${mercBoard.mercBoardDate } ${mercBoard.mercBoardStartTime } ~ ${mercBoard.mercBoardEndTime }</td>
							<td>${mercBoard.mercBoardApplyNumber }명</td>
							<td>${mercBoard.memberId }</td>
							<td>${mercBoard.mercBoardRegdate }</td>
							<c:choose>
								<c:when test="${mercBoard.mercBoardPossible eq '1' }">
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
	</section>
	<section class="about-me-section p-3 p-lg-5 theme-bg-light">
		<div class="m-5">
		<h3>매치</h3>
		</div>
		<div class="container">
			<div class="profile-teaser row">
				<table class="table table-striped table-hover">
					<thead>
						<tr>
							<th scope="col">지역</th>
							<th scope="col">매치일자</th>
							<th scope="col">신청팀</th>
							<th scope="col">작성팀</th>
							<th scope="col">작성일자</th>
							<th scope="col">신청</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${matchList }" var="match" begin="0" end="4">
						<tr data-bs-toggle="modal" data-bs-target="#matchDetailModal" onclick="recruitInfo2('${match.matchCode}')">
							<td>${match.matchLocation }</td>
							<td>${match.matchDate } ${match.matchStartTime } ~ ${match.matchEndTime }</td>
							<td>${match.matchApplyNum }명</td>
							<td>${match.matchWriter }</td>
							<td>${match.matchRegdate }</td>
							<c:choose>
								<c:when test="${match.matchPossible eq '1' }">
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
	</section>
	
		<!-- tr 클릭시 상세보기 모달창이고, mercenary_recruit_detail.jsp을 불러와서 div class=content안에 내용 넣음 --> 
	<div class="modal fade" tabindex="-1" id="recruitDetailModal">
		<div class="modal-dialog modal-lg">
			<div class="modal-content mercDetail">
			</div>
		</div>
	</div>
	<div class="modal fade" tabindex="-1" id="matchDetailModal">
		<div class="modal-dialog modal-lg">
			<div class="modal-content matchDetail">
			</div>
		</div>
	</div>
	<!-- Modal -->
<div class="modal fade" id="deleteMemberModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">회 원 탈 퇴</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        정말 탈퇴하시겠습니까?
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" onclick="location.href='/member/deleteMember'">Y E S</button>
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
</body>
</html>