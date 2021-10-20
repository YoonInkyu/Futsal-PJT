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
		<form action="/team/regTeam" method="post">
			<table>
				<tr>
					<td>
						<input name="teamRogo" type="file" accept="image/*" onchange="setThumbnail(event);">
						
						<script type="text/javascript">
						function setThumbnail(event) {
							var reader = new FileReader(); 
							
							reader.onload = function(event) { 
								var img = document.createElement("img"); 
								img.setAttribute("src", event.target.result);
								document.querySelector("div#image_container").appendChild(img); 
							}; 
							
							reader.readAsDataURL(event.target.files[0]); 
						
						}

						</script>
						
						
						<label for=""> 팀 로고 등록</label>
						<div class="text-center">
							<img src="..." class="rounded" alt="...">
						</div>
						팀 로고 등록<input type="file">
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
					<td>팀 소개 <textarea rows="30px" cols="30px" name="intro"></textarea> </td>
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