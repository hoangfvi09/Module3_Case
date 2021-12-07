<%--
  Created by IntelliJ IDEA.
  User: hoangfvi
  Date: 06/12/2021
  Time: 09:29
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
        <caption><h2>My cart</h2></caption>
        <tr>
            <th>No.</th>
            <th>Product</th>
            <th>Quantity</th>
            <th>Price</th>
            <%--            <th>Description</th>--%>
            <%--            <th>image</th>--%>
            <%--            <th>rate</th>--%>
            <%--            <th>sold</th>--%>
        </tr>
        <c:forEach var="i" begin="0" end="${myCart.size()-1}">
            <tr>
                <td></td>
                <td>${productList.get(i).name}</td>
                <td>${myCart.get(i).quantity}</td>
                <td>x ${priceList.get(i)}</td>
                <td>
                    <a href="/carts?action=increase&id=${productList.get(i).id}">+1</a>
                    <a href="/carts?action=decrease&id=${productList.get(i).id}">-1</a>
                    <a onclick="return confirm('Are you sure?')" href="/carts?action=delete&id=${productList.get(i).id}">Delete</a>
                </td>
            </tr>
        </c:forEach>
        <a href="/carts?action=empty-cart">Delete All</a>
    </table>
    </div>
</body>
</html>
