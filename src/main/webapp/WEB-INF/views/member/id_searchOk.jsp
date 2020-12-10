<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  

<c:choose>
	<c:when test="${list == null || empty list}">
		<script>
			history.back();
		</script>
	</c:when>

	<c:otherwise>
		<script>
			location.href = "${pageContext.request.contextPath }/security/login";
		</script>
	</c:otherwise>
</c:choose>
