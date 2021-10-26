<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/resources/member/js/join.js?ver=2"></script>
</head>
<body>
<form action="/member/updateMemberInfo" method="post" enctype="multipart/form-data">
	<!-- 이미지 파일 넣는곳 -->
	<input type="file" name="memberImg" onchange="readURL(this);" >
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
	</script> <br>
<!-- 아이디 중복체크,영문&숫자 15개 이하??  -->
<div id="checkIdDiv">
id<input type="text" id="memberId" name="memberId" value="${member.memberId }" readonly>
</div>

<!-- 한글 정규식? -->
이름<input type="text" name="memberName" value="${member.memberName }"> <br>
<!-- 숫자 6개 -->
생년월일<input type="text" name="memberBirth" value="${member.memberBirth }" readonly> <br>
성별<input type="radio" checked name="memberGender" value="남자" disabled<c:if test="${member.memberGender eq '남자'}">checked</c:if>>남 
	<input type="radio" name="memberGender" value="여자" disabled<c:if test="${member.memberGender eq '여자'}">checked</c:if>>여 <br>
<!-- 숫자만 가능 -->
연락처<input type="text" name="memberTell" value="${member.memberTell }"><br>
<!-- 중복체크가능 -->
포지션<input type="radio" value="공격" name="position" <c:if test="${member.position eq '공격'}">checked</c:if>>공격
	  <input type="radio" value="수비" name="position" <c:if test="${member.position eq '수비'}">checked</c:if>>수비
	  <input type="radio" value="키퍼" name="position" <c:if test="${member.position eq '키퍼'}">checked</c:if>>키퍼 <br>
<input type="hidden" value="${member.memberCode }">	  
<input type="submit" value="수정하기">
</form>
</body>
</html>