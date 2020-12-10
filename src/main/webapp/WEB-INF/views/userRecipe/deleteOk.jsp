<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<c:set var="result" value='<%=request.getAttribute("delete") %>' />

<c:choose>
	<c:when test = "${result == 0 }">
		<script>
			alert("다시 시도해주세요.");
			history.back();
		</script>
	</c:when>
	
	<c:otherwise>
		<script>
			alert("삭제가 완료되었습니다.");
		    location.href = "${pageContext.request.contextPath }/userRecipe/myRecipe?email=${email}";
		</script>
	</c:otherwise>
</c:choose>

