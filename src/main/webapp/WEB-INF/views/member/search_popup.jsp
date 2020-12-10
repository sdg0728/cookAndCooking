<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  

<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Document</title>
</head>
<body>

<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />

<c:choose>
	<c:when test="${list == null || empty list}">
		
			<h1>존재하는 이메일이 없습니다.</h1>
		
	</c:when>

	<c:otherwise>
		
			<h1>${list[0].email }</h1>
		
	</c:otherwise>
</c:choose>

</body>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/member/JS/search_popup.js?ver=<%= System.currentTimeMillis()%>" type="text/javascript"></script>
</html>