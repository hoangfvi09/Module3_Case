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
<%--        <caption><h2>My cart</h2></caption>--%>
<%--        <tr>--%>
<%--            <th>No.</th>--%>
<%--            <th>Product</th>--%>
<%--            <th>Quantity</th>--%>
<%--            <th>Price</th>--%>
<%--            &lt;%&ndash;            <th>Description</th>&ndash;%&gt;--%>
<%--            &lt;%&ndash;            <th>image</th>&ndash;%&gt;--%>
<%--            &lt;%&ndash;            <th>rate</th>&ndash;%&gt;--%>
<%--            &lt;%&ndash;            <th>sold</th>&ndash;%&gt;--%>
<%--        </tr>--%>
<%--        <c:forEach var="i" begin="0" end="${myCart.size()-1}">--%>
<%--            <tr>--%>
<%--                <td></td>--%>
<%--                <td>${productList.get(i).name}</td>--%>
<%--                <td>${myCart.get(i).quantity}</td>--%>
<%--                <td>x ${priceList.get(i)}</td>--%>
<%--                <td>--%>
<%--                    <a href="/carts?action=increase&id=${productList.get(i).id}">+1</a>--%>
<%--                    <a href="/carts?action=decrease&id=${productList.get(i).id}">-1</a>--%>
<%--                    <a onclick="return confirm('Are you sure?')" href="/carts?action=delete&id=${productList.get(i).id}">Delete</a>--%>
<%--                </td>--%>
<%--            </tr>--%>
<%--        </c:forEach>--%>
<%--        <a href="/carts?action=empty-cart">Delete All</a>--%>
<%--    </table>--%>
<%--    </div>--%>
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
                    <a href="/carts" class="nav-item nav-link active">Cart</a>
                    <c:if test="${sessionScope.currentUser != null}">
                        <a href="/orders" class="nav-item nav-link">Order</a>
                    </c:if>
                    <c:if test="${sessionScope.currentUser.role == 1}">
                        <a href="/products?action=create" class="nav-item nav-link">Add products</a>
                    </c:if>
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
            <li class="breadcrumb-item active">Cart</li>
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
                            <thead class="thead-dark">
                            <c:if test="${myCart == null}">
                                Your cart is empty!
                            </c:if>
                            <c:if test="${myCart != null}">
                            <tr>
                                <th>Product</th>
                                <th>Price</th>
                                <th>Quantity</th>
                                <th>Total</th>
                                <th>Remove</th>
                            </tr>
                            </thead>
                            <tbody class="align-middle">

                            <c:forEach var="i" begin="0" end="${myCart.size()-1}">
                                <tr>
                                    <td>
                                        <div class="img">
                                            <a href="#"><img src="${productList.get(i).image}" alt="Image"></a>
                                            <p>${productList.get(i).name}</p>
                                        </div>
                                    </td>
                                    <td>$${priceList.get(i)}</td>
                                    <td>
                                        <div class="qty">

                                            <a href="/carts?action=decrease&id=${productList.get(i).id}">
                                                <button class="btn-minus"><i
                                                        class="fa fa-minus" onclick></i></button>
                                            </a>
                                            <input type="text" value="${myCart.get(i).quantity}">

                                            <a href="/carts?action=increase&id=${productList.get(i).id}">
                                                <button class="btn-plus"><i
                                                        class="fa fa-plus"></i></button>
                                            </a>
                                        </div>
                                    </td>
                                    <td>${priceList.get(i)*myCart.get(i).quantity}</td>
                                    <td><a onclick="return confirm('Are you sure?')"
                                           href="/carts?action=delete&id=${productList.get(i).id}"><i
                                            class="fa fa-trash"></i></a></td>
                                </tr>
                            </c:forEach>
                            </c:if>
                            </tbody>
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
                            <div class="cart-summary">
                                <div class="cart-content">
                                    <c:if test="${myCart != null}">
                                        <h1>Cart Summary</h1>
                                        <p>Sub Total<span>${total}</span></p>
                                        <p>Shipping Cost<span>$100</span></p>
                                        <h2>Grand Total<span>${total+100}</span></h2>
                                    </c:if>
                                    <c:if test="${myCart == null}">
                                        <h1>Cart Summary</h1>
                                        <p>Sub Total<span>0</span></p>
                                        <p>Shipping Cost<span>0</span></p>
                                        <h2>Grand Total<span>0</span></h2>
                                    </c:if>
                                </div>
                                <div class="cart-btn">
                                    <c:if test="${myCart != null}">
                                        <a onclick="return confirm('Are you sure?')" type="btn" href="/carts?action=empty-cart">
                                            <button>Empty Cart</button>
                                        </a>
                                    </c:if>
                                    <button>Checkout</button>
                                </div>
                            </div>
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

