<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    

<c:set var="username" value='<%=session.getAttribute("username") %>' />
    
<c:choose>
	<c:when test="${result == 0 }">
		<script>
			alert("회원탈퇴 실패! 비밀번호를 다시 확인해주세요.");
			history.back();
		</script>
	</c:when>
	<c:otherwise>
		<c:choose>
	        <c:when test="${username eq 'admin@naver.com'}">
	        	<script>
	            alert("탈퇴 성공 !");
	            location.href = "${pageContext.request.contextPath }/admin/admin_member_list";
	            </script>
	        </c:when>         
        	<c:otherwise>
        		<script>
        		alert("탈퇴 성공 !");
          		 location.href = "${pageContext.request.contextPath }/";
          		 </script>
         	</c:otherwise>
    	</c:choose>
		<%
			session.removeAttribute("username");
		%>
	</c:otherwise>
</c:choose>