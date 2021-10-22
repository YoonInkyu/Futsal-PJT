<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 사진 -->
${member.memberId }<br>
${member.memberName }<br>
${member.memberBirth }<br>
${member.memberGender }<br>
${member.memberTell }<br>
${member.position }<br>
${member.teamName }<br>
<input type="button" value="회원정보 수정하기" onclick="location.href='/member/goUpdateMember';">
<input type="button" value="블랙리스트 관리" onclick="location.href='/member/goMemberBlacklist';">
</body>
</html>