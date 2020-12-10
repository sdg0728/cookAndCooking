<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  

<c:set var="username" value='<%=session.getAttribute("username") %>' />

<c:choose>
	<c:when test="${result == 0 }">
		<script>
			alert("가입실패 !!!");
			history.back();
		</script>
	</c:when>

	<c:otherwise>
		<c:choose>
	        <c:when test="${username eq 'admin@naver.com'}">
	        	<script>
	            alert("가입 성공 !");
	            location.href = "${pageContext.request.contextPath }/admin/admin_member_list";
	            </script>
	        </c:when>         
        	<c:otherwise>
        		<script>
        		alert("가입 성공 !");
          		 location.href = "${pageContext.request.contextPath }/";
          		 </script>
         	</c:otherwise>
    	</c:choose>
	
		
			
			
		
	</c:otherwise>
</c:choose>
