<%--
  Created by IntelliJ IDEA.
  User: hoangfvi
  Date: 06/12/2021
  Time: 10:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action ="login" method="post">
    <input type="email" name="email">
    <input type="password" name="password">
    <button> Login</button>
</form>

<c:if test="${verifyResult!= null}" >
    ${verifyResult}
</c:if>


</body>
</html>
