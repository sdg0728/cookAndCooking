<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:choose>
	<c:when test="${result == 0 }">
		<script>
			alert("신청을 다시 해주세요.");
			history.back();
		</script>
	</c:when>
	<c:otherwise>
		<script>
			alert("신청 완료!");
			location.href="./rlist";
		</script>
	</c:otherwise>
</c:choose>