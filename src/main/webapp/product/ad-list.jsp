<%--
  Created by IntelliJ IDEA.
  User: hoangfvi
  Date: 06/12/2021
  Time: 09:30
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
pp

<div align="center">
    <table border="1" cellpadding="5">
        <caption><h2>${listName}</h2></caption>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Category</th>
            <th>Description</th>
            <th>image</th>
            <th>rate</th>
            <th>sold</th>
        </tr>
        <c:forEach var="product" items="${productList}">
            <tr>
                <td>${product.id}</td>
                <td>${product.name}</td>
                <td>${product.categoryId}</td>
                <td>${product.description}</td>
                <td>${product.image}</td>
                <td>${product.sold}</td>
                <td>
                    <a href="/products?action=edit&id=${product.id}">Edit</a>
                    <a href="/products?action=delete&id=${product.id}">Delete</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>
