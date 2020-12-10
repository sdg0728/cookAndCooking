<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="username" value='<%=session.getAttribute("username") %>' />
<c:choose>
   <c:when test="${result == 0 }">
      <script>
         alert("업로드실패 !!!");
         history.back();
      </script>
   </c:when>

   <c:otherwise>

      <script>
         alert("업로드 성공 !");
        
         location.href = "${pageContext.request.contextPath }/admin/recipe/detail?rid=${rid}";
      </script>
   </c:otherwise>
</c:choose>