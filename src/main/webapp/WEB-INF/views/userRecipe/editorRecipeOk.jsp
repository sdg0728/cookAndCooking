<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<c:set var="email" value='<%=session.getAttribute("username")%>' />	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
 <input type="hidden" name="my" id="my" value="${email }"/> 
<c:choose>
   <c:when test="${result == 0 }">
      <script>
         alert("수정실패 !!!");
         history.back();
      </script>
   </c:when>

   <c:otherwise>
      <script>
      function getContextPath() {
		    var hostIndex = location.href.indexOf( location.host ) + location.host.length;
		    return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
		}
         alert("수정 성공 !");
         location.href = "./myRecipe?email=" + $("input:hidden[name=my]").val();
      </script>
   </c:otherwise>
</c:choose>