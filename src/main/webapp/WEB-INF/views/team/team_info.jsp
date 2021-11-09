<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/resources/team/js/team_info.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$(document).on('click', '#change', function() {
			var teamCode = $(this).next().val()

			$.ajax({
				url : '/team/changeInfo', //요청경로
				type : 'post',
				data : {
					'teamCode' : teamCode
				}, //필요한 데이터
				success : function(result) {
					//ajax 실행 성공 시 실행되는 구간
					//셀렉트바로 수정해야 함.
					//$('.aa').remove()
					var str = '';
					str += '<input type="file" name="teamLogo" onclick="clickImg()" onchange="readURL(this);">'
					str += '<img src="/resources/img/common/'+result.teamLogoImgAttachedName+'" id="preview" class="img-thumbnail">'
					$('.a').prepend(str);

					$('.cc').remove()
					var str = '';
					str += '<div class="mb-3 cc">지 역 :'
					str += '<select class="form-select" name="teamLocation">'
					if (result.teamLocation == '서울') {
						str += '<option value="서울" selected>서울</option>';
						str += '<option value="경기">경기</option>';
						str += '<option value="대전">대전</option>';
						str += '<option value="대구">대구</option>';
					} else if (result.teamLocation == '경기') {
						str += '<option value="서울">서울</option>';
						str += '<option value="경기" selected>경기</option>';
						str += '<option value="대전">대전</option>';
						str += '<option value="대구">대구</option>';
					} else if (result.teamLocation == '대전') {
						str += '<option value="서울">서울</option>';
						str += '<option value="경기">경기</option>';
						str += '<option value="대전" selected>대전</option>';
						str += '<option value="대구">대구</option>';
					} else if (result.teamLocation == '대구') {
						str += '<option value="서울">서울</option>';
						str += '<option value="경기">경기</option>';
						str += '<option value="대전">대전</option>';
						str += '<option value="대구" selected>대구</option>';
					}
					str += '</select>';
					str += '</div>';
					$('.c').prepend(str);
					
					
					$('.dd').remove()
					var str = '';
					str += '<textarea class="form-control dd" id="floatingTextarea2" name="teamIntro" style="width: 26rem; height: 16rem;">'+ result.teamIntro +'</textarea>';
					$('.d').prepend(str);

					$('.ee').remove()
					var str = '';
					str += '<h5 class="ee">팀명 : <input type="text" name="teamName" value="' + result.teamName + '"></h5>';
					
					$('.e').append(str);

					$('#change').attr('type', 'submit')
					$('#change').attr('value', '확인')
					$('#formId').attr('action', '/team/updateInfo')

				},
				error : function() {
					//ajax 실행 실패 시 실행되는 구간
					alert('실패');
				}
			});

		});
	});
</script>
</head>
<body>



	<form action="" method="post" id="formId" enctype="multipart/form-data">

		<input type="hidden" name="teamLogoImgCode" value="${myTeam.teamLogoImgCode }">

		<section class="about-me-section py-5  theme-bg-light">
			<div class="container">
			
			
			  <div class="row my-5">
		      
		         <div class="col-1 text-end">
		            <img alt="" src="/resources/img/common/bg1.png" width="100%;" class="pr-5">
		         </div>
         
		         <div class="col-6 text-starts align-self-center">
		            <h2 style="border-bottom: 3px solid gray;">팀 정보</h2>
		         </div>
         
     		 	</div>
			
			
				<div class="row">
					<div class="col-5">
						<div class="e mx-3 my-4">
							<h5 class="ee">팀 명 : ${myTeam.teamName }</h5>
						</div>
						<div class="c mx-5 mb-4">
							<div class="mb-3 cc">지 역 : ${myTeam.teamLocation }</div>
							
							<div class="mb-3 ">구 단 주 : ${myTeam.masterName }</div>

							<div class="form-floating mb-3 d">
								<textarea class="form-control dd" placeholder="Leave a comment here" id="floatingTextarea2" name="contentFree" style="width: 26rem; height: 16rem;">${myTeam.teamIntro }</textarea>
								<label for="floatingTextarea2">팀 소개</label>
							</div>

						</div>
						<div class="mb-4 d-flex justify-content-around">




							<c:if test="${loginInfo.teamAdmin eq '3' }">
								<input class="btn btn-danger" style="width: 10rem;" type="button" value="팀 삭제" onclick="location.href='goTeamDelete'">
								<input class="btn btn-outline-primary" style="width: 10rem;" type="button" value="팀 수정" id="change">
								<input type="hidden" value="${myTeam.teamCode }" class="gg">
							</c:if>
							<c:if test="${loginInfo.teamAdmin eq '2' }">
								<input class="btn btn-danger" style="width: 10rem;" type="button" value="팀 탈퇴" id="myTeamDelete">
							</c:if>




						</div>
					</div>
					<div class="a col-md-5 col-lg-5 align-self-center" style="width: 16rem;">
						<img class="aa profile-image img-fluid mb-3 mb-lg-0 me-md-0" src="/resources/img/team/${myTeam.teamLogoImgAttachedName }" alt="">
					</div>
				</div>
			</div>
		</section>

	</form>








	<!-- 	<table> -->
	<!-- 		<tr class="a"> -->
	<%-- 				<td class="aa"><img alt="" src="/resources/img/team/${myTeam.teamLogoImgAttachedName }"></td> --%>
	<!-- 		</tr> -->
	<!-- 		<tr class="b"> -->
	<%-- 			<td class="bb">${myTeam.teamCode }</td> --%>
	<!-- 		</tr> -->
	<!-- 		<tr class="c"> -->
	<%-- 			<td class="cc">${myTeam.teamLocation }</td> --%>
	<!-- 		</tr> -->
	<!-- 		<tr class="d"> -->
	<%-- 			<td class="dd">${myTeam.teamIntro }</td> --%>
	<!-- 		</tr> -->
	<!-- 			<tr class="e"> -->
	<%-- 				<td class="ee">${myTeam.teamName }</td> --%>
	<!-- 			</tr> -->
	<!-- 	</table> -->







	<script type="text/javascript">
		function readURL(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();
				reader.onload = function(e) {
					document.getElementById('preview').src = e.target.result;
				};
				reader.readAsDataURL(input.files[0]);
			} else {
				document.getElementById('preview').src = "";
			}
		}
	</script>
	<script type="text/javascript">
		function clickImg() {
			$('.aa').remove()
		}
	</script>
</body>
</html>