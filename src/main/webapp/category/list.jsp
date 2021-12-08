<%--
  Created by IntelliJ IDEA.
  User: hoangfvi
  Date: 07/12/2021
  Time: 13:31
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
<div align="center">
    <table border="1" cellpadding="5">
        <caption><h2>Category list</h2></caption>
        <tr>
            <th>ID</th>
            <th>Name</th>
        </tr>
        <c:forEach var="category" items="${categoryList}">
            <tr>
                <td>${category.id}</td>
                <td><a href="products?action=find&info=${category.name}">${category.name}</a></td>

                    <%--                <td> <a onclick="return confirm('Are you sure?')"--%>
                    <%--                        href="/products?action=delete&id=${productList.get(i).getId()}">delete</a>--%>
                    <%--                </td>--%>
                    <%--                <td>--%>
                    <%--                    <a href="/products?action=edit&id=${productList.get(i).getId()}">Edit</a>,--%>
                    <%--                </td>--%>
            </tr>
        </c:forEach>
    </table>

</div>
</body>
</html>
