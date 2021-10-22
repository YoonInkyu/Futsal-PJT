<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="/member/correctionMember" method="post">
<!-- 이미지 파일 넣는곳 -->
	<input type="file" name="memberImgName" onchange="readURL(this);" >
	<img id="preview" />
<!-- 업로드되는 회원이미지 미리보기 -->
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
<!-- 아이디 중복체크,영문&숫자 15개 이하??  -->
id<input type="text" name="memberId" value="${member.memberId }" readonly> <br>

<!-- 한글 정규식? -->
이름<input type="text" name="memberName" value="${member.memberName }" readonly> <br>
<!-- 숫자 6개 -->
생년월일<input type="text" name="memberBirth" value="${member.memberBirth }" readonly> <br>
성별<input type="radio" checked name="memberGender" value="남자">남 
	<input type="radio" name="memberGender" value="여자">여 <br>
<!-- 숫자만 가능 -->
연락처<input type="text" name="tells" value="${member.memberTell }" readonly><br>
<!-- 중복체크가능 -->
포지션<input type="checkbox" value="공격" name="position" <c:if test="${member.position eq '공격'}">checked</c:if>>공격
	  <input type="checkbox" value="수비" name="position" <c:if test="${member.position eq '수비'}">checked</c:if>>수비
	  <input type="checkbox" value="키퍼" name="position" <c:if test="${member.position eq '키퍼'}">checked</c:if>>키퍼 <br>
<input type="submit" value="수정하기">
</form>
</body>
</html>