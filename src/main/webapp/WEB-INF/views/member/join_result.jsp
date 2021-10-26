<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:choose>
	<c:when test="${result eq '1' }">
		<script type="text/javascript">
			alert('회원가입을 환영합니다.');
			location.href = '/member/goLogin';
		</script>
	</c:when>
	<c:otherwise>
		<script type="text/javascript">
			alert('가입실패.....');
			location.href = '/member/goJoin';
		</script>
	</c:otherwise>
</c:choose>


</head>
<body>

</body>
</html>
