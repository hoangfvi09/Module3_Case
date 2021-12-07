<%--
  Created by IntelliJ IDEA.
  User: hoangfvi
  Date: 03/12/2021
  Time: 16:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>$Title$</title>
</head>
<body>
<c:if test="${sessionScope.currentUser== null}">
    welcome guest
</c:if>
<c:if test="${sessionScope.currentUser!= null}">
    welcome ${sessionScope.currentUser.name}
    <a href="/logout"
       onclick="return confirm('Are you sure to log out?')">Log out</a>
</c:if>

<a href="/carts" >My cart</a>



<br>
<a href="/products?action=list">product list</a>
<a href="/users">show form</a>
<a href="/login">show login</a>

</body>
</html>