<!--  10월 20 일 송영준    -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 
	추가 작업 리스트
	1. 팀생성 유무 확인(용병만 생성가능하게)
	2. 팀명 중복확인
	3. 주소 셀렉트 확인
	4. 

 -->
<div>
	<div>
		<form action="/team/regTeam" method="post" enctype="multipart/form-data">
			<table>
				<tr>
					<td>
						팀 로고 등록
						<input type="file" name="teamLogo" onchange="readURL(this);" >
						<img id="preview" />
						<!-- 업로드되는 팀로고 미리보기 -->
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
					</td>
				</tr>
				<tr>
					<td>팀명 <input type="text" name="teamName"></td>
					<td><input type="button" value="중복확인"> </td>
				</tr>
				<tr>
					<td>지역
						<select name="teamLocation" >
							<option value="경상도">갱상도</option>
							<option value="우리집">벽산</option>
							<option value="너거집">퀴벌이집</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>팀 소개 <textarea rows="30px" cols="30px" name="teamIntro"></textarea> </td>
				</tr>
				<tr>
					<td><input type="submit" value="팀생성"> </td>
					<td><input type="button" value="취소"> </td>
				</tr>
			</table>
		</form>
	</div>
</div>
</body>
</html>