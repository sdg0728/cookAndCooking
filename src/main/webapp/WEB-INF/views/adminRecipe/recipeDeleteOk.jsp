<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
      
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="username" value='<%=session.getAttribute("username") %>' />

<c:choose>
   <c:when test="${delete == 0 }">
      <script>
         alert("삭제 실패");
         history.back();
      </script>
   </c:when>

   <c:otherwise>

      <script>
         alert("삭제되었습니다");
        
         location.href = "${pageContext.request.contextPath }/admin/recipe/list";
      </script>
   </c:otherwise>
</c:choose>