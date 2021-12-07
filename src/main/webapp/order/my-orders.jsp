<%--
  Created by IntelliJ IDEA.
  User: hoangfvi
  Date: 06/12/2021
  Time: 09:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div align="center">
    <table border="1" cellpadding="5">
        <caption><h2>My cart</h2></caption>
        <tr>
            <th>Order Id</th>
            <th>Product Id</th>
            <th>Quantity </th>
            <%--            <th>Description</th>--%>
            <%--            <th>image</th>--%>
            <%--            <th>rate</th>--%>
            <%--            <th>sold</th>--%>
        </tr>
        <c:forEach var="product" items="${myOrders}">
            <tr>
                <td></td>
                <td>${product.productId}</td>
                <td>${product.quantity}</td>
                    <%--                <td>${product.description}</td>--%>
                    <%--                <td>${product.image}</td>--%>
                    <%--                <td>${product.sold}</td>--%>
                <td>
                    <a href="/carts?action=increase&id=${product.productId}">+1</a>
                    <a href="/carts?action=decrease&id=${product.productId}">-1</a>
                    <a href="/carts?action=delete&id=${product.productId}">Delete</a>
                </td>
            </tr>
        </c:forEach>
        <a href="/carts?action=empty-cart">Delete All</a>
    </table>
</div>
</body>
</html>
