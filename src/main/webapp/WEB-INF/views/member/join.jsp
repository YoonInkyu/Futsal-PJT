<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="/member/join" method="post">
<!-- 이미지 파일 넣는곳 -->


<!-- 아이디 중복체크,영문&숫자 15개 이하??  -->
id<input type="text" name="memberId" required> <br>
<!-- 정규식? -->
비밀번호<input type="text" name="memberPw" required> <br>
<!-- j쿼리로 비밀번호 동일체크 -->
비밀번호확인<input type="text" id="memberPwCrheck" required> <br>
<!-- 한글 정규식? -->
이름<input type="text" name="memberName" required> <br>
<!-- 숫자 6개 -->
생년월일<input type="text" name="memberBirth" required> <br>
성별<input type="radio" checked name="memberGender" value="남자">남 
	<input type="radio" name="memberGender" value="여자">여 <br>
<!-- 숫자만 가능 -->
연락처<input type="text" name="tells"><input type="text" name="tells"><input type="text" name="tells">  <br>
<!-- 중복체크가능 -->
포지션<input type="checkbox" value="공격" name="position">공격
	  <input type="checkbox" value="수비" name="position">수비
	  <input type="checkbox" value="키퍼" name="position">키퍼 <br>
<input type="submit" value="회원가입">
</form>
</body>
</html>