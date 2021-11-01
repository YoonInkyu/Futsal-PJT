<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
		<script type="text/javascript">
			var result = confirm('삭제하시겠습니까?');
			
			if(result == true){
				location.href = '/team/deleteTeam';
			}
			
		
			else{
				location.href = '/team/teamInfo';
			}
	
			
		</script>
</head>
<body>

</body>
</html>
