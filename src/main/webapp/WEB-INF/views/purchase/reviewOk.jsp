<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="username" value='<%=session.getAttribute("username") %>' />

<c:if test="${result == 0 }">
	<script>
		alert("리뷰를 다시 작성해주세요.");
		history.back();
	</script>
</c:if>

<c:if test="${result != 0 }">
	<script>
		location.href="./rdetail?pid="+${pid }
	</script>
</c:if>