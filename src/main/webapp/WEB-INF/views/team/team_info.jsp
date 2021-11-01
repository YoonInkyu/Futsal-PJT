<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$(document).ready(function() {
	$(document).on('click', '#change', function() {
		var teamCode = $(this).next().val()
		
		$.ajax({
	        url: '/team/changeInfo', //요청경로
	        type: 'post',
	        data:{'teamCode':teamCode}, //필요한 데이터
	        success: function(result) {
	        	//ajax 실행 성공 시 실행되는 구간
	        	//셀렉트바로 수정해야 함.
	        	$('.aa').remove()
	        	var str='';
	        	str += '<td><input type="file" name="teamLogo" onchange="readURL(this);">'
	        	str += '<img src="/resources/img/common/'+result.teamLogoImgAttachedName+'" id="preview" class="img-thumbnail"></td>'
	        	$('.a').append(str);
	        		        	
	        	$('.bb').remove()
	        	var str='';
	        	str += '<td><input type="text" name="teamCode" value="' + result.teamCode + '"></td>';
	        	$('.b').append(str);
	        	$('.cc').remove()
	        	var str='';
	        	str += '<td><input type="text" name="teamLocation" value="' + result.teamLocation + '"></td>';
	        	$('.c').append(str);
	        	$('.dd').remove()
	        	var str='';
	        	str += '<td><input type="text" name="teamIntro" value="' + result.teamIntro + '"></td>';
	        	$('.d').append(str);
	        	$('.ee').remove()
	        	var str='';
	        	str += '<td><input type="text" name="teamName" value="' + result.teamName + '"></td>';
	        	$('.e').append(str);
	        	
	        	$('#change').attr('type', 'submit')
	        	$('#formId').attr('action', '/team/updateInfo')
	        	
	        },
	        error: function(){
	        	//ajax 실행 실패 시 실행되는 구간
	        	alert('실패');
	        }
	  });

	});
});
</script>
</head>
<body>
<div>
<form action="" method="post" id="formId" enctype="multipart/form-data">
<input type="hidden" name="teamLogoImgCode" value="${myTeam.teamLogoImgCode }">
	<table>
		<tr class="a">
			<td class="aa">
				<img alt="" src="/resources/img/team/${myTeam.teamLogoImgOrignName }">
			</td> 
		</tr>
		<tr class="b">
			<td class="bb">${myTeam.teamCode }</td>
		</tr >
		<tr class="c">
			<td class="cc">${myTeam.teamLocation }</td>
		</tr>
		<tr class="d">
			<td class="dd">${myTeam.teamIntro }</td>
		</tr>
		<tr class="e">
			<td class="ee">${myTeam.teamName }</td>
		</tr>
	</table>


<input type="button" value="수정" id="change">
<input type="hidden" value="${myTeam.teamCode }" class="gg">
<input type="button" value="삭제" onclick="location.href='goTeamDelete'">
</form>
</div>
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