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
<%--<html>--%>
<%--<head>--%>
<%--    <title>Title</title>--%>
<%--</head>--%>
<%--<body>--%>
<%--<div align="center">--%>
<%--    <table border="1" cellpadding="5">--%>
<%--        <caption><h2>My orders</h2></caption>--%>
<%--        <tr>--%>
<%--            <th>Order Id</th>--%>
<%--            <th>Time </th>--%>
<%--            <th>Status </th>--%>

<%--        </tr>--%>
<%--        <c:forEach var="order" items="${myOrders}">--%>
<%--            <tr>--%>
<%--                <td>${order.id}</td>--%>
<%--                <td>${order.time}</td>--%>
<%--                <td>${order.status}</td>--%>

<%--<a href="/orders?action=cancel&id=${order.id}" onclick="return confirm('Are you sure to cancel this order?')">Cancel</a>--%>
<%--                </td>--%>
<%--            </tr>--%>
<%--        </c:forEach>--%>
<%--    </table>--%>
<%--</div>--%>
<%--</body>--%>
<%--</html>--%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>E Store - eCommerce HTML Template</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="eCommerce HTML Template Free Download" name="keywords">
    <meta content="eCommerce HTML Template Free Download" name="description">

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400|Source+Code+Pro:700,900&display=swap"
          rel="stylesheet">

    <!-- CSS Libraries -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="lib/slick/slick.css" rel="stylesheet">
    <link href="lib/slick/slick-theme.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="css/style.css" rel="stylesheet">
</head>

<body>

<!-- Nav Bar Start -->
<div class="nav">
    <div class="container-fluid">
        <nav class="navbar navbar-expand-md bg-dark navbar-dark">
            <a href="#" class="navbar-brand">MENU</a>
            <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
                <div class="navbar-nav mr-auto">
                    <a href="/" class="nav-item nav-link">Home</a>
                    <a href="/products" class="nav-item nav-link">Products</a>
                    <a href="/carts" class="nav-item nav-link ">Cart</a>
                    <a href="/carts" class="nav-item nav-link active">Orders</a>
                </div>
                <div class="navbar-nav ml-auto">
                    <div class="nav-item dropdown">
                        <c:if test="${sessionScope.currentUser != null}">
                            <img src="${sessionScope.currentUser.image}" alt="avatar" height="50" width="50">
                        </c:if>
                    </div>
                    <div class="nav-item dropdown">
                        <c:if test="${sessionScope.currentUser != null}">
                            <a href="#" class="nav-link dropdown-toggle"
                               data-toggle="dropdown">Hello ${sessionScope.currentUser.name}</a>
                        </c:if>
                        <c:if test="${sessionScope.currentUser == null}">
                            <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">User Account</a>
                        </c:if>
                        <div class="dropdown-menu">
                            <c:if test="${sessionScope.currentUser != null}">
                                <a href="/logout" class="dropdown-item">Logout</a>
                            </c:if>
                            <c:if test="${sessionScope.currentUser == null}">
                                <a href="/login" class="dropdown-item">Login</a>
                                <a href="/users?action=create" class="dropdown-item">Register</a>
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>
        </nav>
    </div>
</div>
<!-- Nav Bar End -->

<!-- Bottom Bar Start -->
<div class="bottom-bar">
    <div class="container-fluid">
        <div class="row align-items-center">
            <div class="col-md-3">
                <div class="logo">
                    <a href="/">
                        <img src="img/logo.png" alt="Logo">
                    </a>
                </div>
            </div>
            <div class="col-md-6">
                <div class="search">
                    <form action="/products">
                        <input type="text" name="info" placeholder="Search">
                        <input type="hidden" name="action" value="find">
                        <button><i class="fa fa-search"></i></button>
                    </form>
                </div>
            </div>
            <div class="col-md-3">
                <div class="user">

                    <a href="/carts" class="btn cart">
                        <i class="fa fa-shopping-cart"></i>
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Bottom Bar End -->

<!-- Breadcrumb Start -->
<div class="breadcrumb-wrap">
    <div class="container-fluid">
        <ul class="breadcrumb">
            <li class="breadcrumb-item"><a href="/">Home</a></li>
            <li class="breadcrumb-item"><a href="/products">Products</a></li>
            <li class="breadcrumb-item active">Orders</li>
        </ul>
    </div>
</div>
<!-- Breadcrumb End -->

<!-- Cart Start -->
<div class="cart-page">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-8">
                <div class="cart-page-inner">
                    <div class="table-responsive">
                        <table class="table table-bordered">
                            <c:if test="${myOrders == null}">
                                There aren't any orders!
                            </c:if>
                            <c:if test="${myOrders != null}">
                                <thead class="thead-dark">
                                <tbody>
                                <tr>
                                    <th>Order Id</th>
                                    <c:if test="${sessionScope.currentUser.role == 1}">
                                        <th>User Id</th>
                                    </c:if>

                                    <th>Time</th>
                                    <th>Address</th>
                                    <th>PhoneNo</th>
                                    <th>Status</th>
                                </tr>
                                </thead>
                                <tbody class="align-middle">

                                <c:forEach var="i" begin="0" end="${myOrders.size()-1}">
                                    <tr>
                                        <td>
                                                ${myOrders.get(i).id}
                                        </td>
                                        <c:if test="${sessionScope.currentUser.role == 1}">
                                            <td>${myOrders.get(i).userId}</td>
                                        </c:if>
                                        <td>${myOrders.get(i).time}</td>
                                        <td>${myOrders.get(i).address}</td>
                                        <td>${myOrders.get(i).phoneNo}</td>
                                        <td><c:if test="${myOrders.get(i).status == 0}">
                                            Canceled
                                        </c:if>
                                            <c:if test="${myOrders.get(i).status == 1}">
                                                Ordered
                                            </c:if>
                                            <c:if test="${myOrders.get(i).status == 2}">
                                                Shipped
                                            </c:if>
                                            <c:if test="${myOrders.get(i).status == 3}">
                                                Delivered
                                            </c:if>

                                        </td>
                                        <td>
                                            <c:if test="${(myOrders.get(i).status != 0)&&(myOrders.get(i).status != 3)}">
                                                <a onclick="return confirm('Are you sure to cancel this order?')"
                                                   href="/orders?action=cancel&id=${myOrders.get(i).id}">
                                                    Cancel<i
                                                        class="fa fa-trash"></i></a>
                                            </c:if>
                                        </td>
                                    </tr>
                                </c:forEach>

                                </tbody>
                            </c:if>

                        </table>
                    </div>
                </div>
            </div>
            <div class="col-lg-4">
                <div class="cart-page-inner">
                    <div class="row">
                        <div class="col-md-12">

                        </div>
                        <div class="col-md-12">

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Cart End -->


<!-- Back to Top -->
<a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>

<!-- JavaScript Libraries -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
<script src="lib/easing/easing.min.js"></script>
<script src="lib/slick/slick.min.js"></script>

<!-- Template Javascript -->
<script src="js/main.js"></script>
</body>
</html>


