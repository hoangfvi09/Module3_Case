<%--
  Created by IntelliJ IDEA.
  User: hoangfvi
  Date: 06/12/2021
  Time: 08:18
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
<a href="/products?action=create">Create product</a><br><br>
<div align="center">
    <table border="1" cellpadding="5">
        <caption><h2>${listName}</h2></caption>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Description</th>
            <th>image</th>
            <th>rate</th>
            <th>sold</th>
            <th>price</th>
            <th>category</th>
        </tr>
        <c:forEach var="i" begin="0" end="${productList.size()-1}">
            <tr>
                <td>${productList.get(i).getId()}</td>
                <td>${productList.get(i).getName()}</td>
                <td>${productList.get(i).getDescription()}</td>
                <td>${productList.get(i).getImage()}</td>
                <td></td>
                <td>${productList.get(i).getSold()}</td>
                <td>${productDetailList.get(i).getPrice()}</td>
                <td>${categoryList.get(i).getName()}</td>
                <td> <a onclick="return confirm('Are you sure?')"
                        href="/products?action=delete&id=${productList.get(i).getId()}">delete</a>
                </td>
                <td>
                    <a href="/products?action=edit&id=${productList.get(i).getId()}">Edit</a>,
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>
