<%--
<%--  Created by IntelliJ IDEA.--%>
<%--  User: hoangfvi--%>
<%--  Date: 03/12/2021--%>
<%--  Time: 16:17--%>
<%--  To change this template use File | Settings | File Templates.--%>
<%--&ndash;%&gt;--%>
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

c:if test="${productList.size() != 0}">
<c:forEach var="i" begin="0" end="${productList.size()-1}">
    <div class="col-lg-3">
        <div class="product-item">
            <div class="product-title">
                <a href="/products?action=view&id=${productList.get(i).getId()}">${productList.get(i).name}</a>
            </div>
            <div class="product-image">
                <a href="/products?action=view&id=${productList.get(i).getId()}">
                    <img src="${productList.get(i).image}" alt="Product Image">
                </a>
                <div class="product-action">
                    <a href="/carts?action=add-product&id=${productList.get(i).getId()}&quantity=1"><i
                            class="fa fa-cart-plus"></i></a>

                </div>
            </div>
            <div class="product-price">
                <h3 style="color: white">$ ${productDetailList.get(i).getPrice()}</h3>
                <br>
                <c:if test="${sessionScope.currentUser.role == 1}">
                    <center>
                        <a onclick="return confirm('Are you sure?')"
                           href="/products?action=delete&id=${productList.get(i).getId()}"
                           class="btn cart"> Delete </a>
                        <a href="/products?action=edit&id=${productList.get(i).getId()}"
                           class="btn cart"> Edit </a>
                    </center>

                </c:if>
                    <%--                                        <a class="btn" href=""><i class="fa fa-shopping-cart"></i>Buy Now</a>--%>
            </div>
        </div>
    </div>
</c:forEach>
</c:if>

</body>
</html>
<