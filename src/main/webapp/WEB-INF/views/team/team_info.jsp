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
					$('.aa').remove()
					var str = '';
					str += '<td><input type="file" name="teamLogo" onchange="readURL(this);">'
					str += '<img src="/resources/img/common/'+result.teamLogoImgAttachedName+'" id="preview" class="img-thumbnail"></td>'
					$('.a').append(str);

					$('.bb').remove()
					var str = '';
					str += '<td><input type="text" name="teamCode" value="' + result.teamCode + '"></td>';
					$('.b').append(str);
					$('.cc').remove()
					var str = '';
					str += '<td><input type="text" name="teamLocation" value="' + result.teamLocation + '"></td>';
					$('.c').append(str);
					$('.dd').remove()
					var str = '';
					str += '<td><input type="text" name="teamIntro" value="' + result.teamIntro + '"></td>';
					$('.d').append(str);
					$('.ee').remove()
					var str = '';
					str += '<td><input type="text" name="teamName" value="' + result.teamName + '"></td>';
					$('.e').append(str);

					$('#change').attr('type', 'submit')
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
				<div class="row">
					<div class="col-5">
						<h3 class="name font-weight-bold mb-3">팀 정보</h3>
						<div class="e mx-3 my-4">
							<h5 class="ee">팀 명 : ${myTeam.teamName }</h5>
						</div>
						<div class="mx-5 mb-4">
							<div class="mb-3 cc">지 역 : ${myTeam.teamLocation }</div>
							
							<div class="mb-3 cc">구 단 주 : 팀장 이름 가져 올수 있음 가져오기</div>

							<div class="form-floating mb-3 d">
								<textarea class="form-control dd" placeholder="Leave a comment here" id="floatingTextarea2" name="contentFree" style="width: 26rem; height: 16rem;">${myTeam.teamIntro }</textarea>
								<label for="floatingTextarea2">팀 소개</label>
							</div>

						</div>
						<div class="mb-4 d-flex justify-content-around">




							<c:if test="${loginInfo.teamAdmin eq '3' }">
								<input type="hidden" value="${myTeam.teamCode }" class="gg">
								<input class="btn btn-danger" style="width: 10rem;" type="button" value="팀 삭제" onclick="location.href='goTeamDelete'">
								<input class="btn btn-outline-primary" style="width: 10rem;" type="button" value="팀 수정" id="change">
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
</body>
</html>