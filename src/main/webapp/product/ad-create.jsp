<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<html>--%>
<%--<head>--%>
<%--    <title>Title</title>--%>
<%--</head>--%>
<%--<body>--%>
<%--<form method="post">--%>
<%--    <input type="text" name="name" placeholder="name">--%>
<%--    <input type="number" name="categoryId" placeholder="categoryId">--%>
<%--    <input type="text" name="description" placeholder="description">--%>
<%--    <input type="text" name="image" placeholder="image">--%>
<%--    <input type="number" name="sold" placeholder="sold">--%>
<%--    <input type="number" name="inStock" placeholder="inStock">--%>
<%--    <input type="number" name="price" placeholder="price">--%>
<%--    <input type="number" name="status" placeholder="status">--%>
<%--    <button>Create</button>--%>
<%--</form>--%>
<%--</body>--%>
<%--</html>--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Naiker - Find your fast</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="eCommerce HTML Template Free Download" name="keywords">
    <meta content="eCommerce HTML Template Free Download" name="description">

    <!-- Favicon -->
    <link href="img/logo.png" rel="icon">

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400|Source+Code+Pro:700,900&display=swap" rel="stylesheet">

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
                    <a href="/home" class="nav-item nav-link">Home</a>
                    <a href="/products" class="nav-item nav-link">Products</a>
                    <c:if test="${sessionScope.currentUser.role != 1}">
                        <a href="/carts" class="nav-item nav-link">Cart</a>
                    </c:if>
                    <c:if test="${sessionScope.currentUser != null}">
                        <a href="/orders" class="nav-item nav-link">Order</a>
                    </c:if>
                    <c:if test="${sessionScope.currentUser.role == 1}">
                        <a href="/products?action=create" class="nav-item nav-link">Add products</a>
                    </c:if>
                    <div class="nav-item dropdown">

                    </div>
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
                                <a href="/register" class="dropdown-item">Register</a>
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
                    <a href="/home">
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
                    <a href="carts" class="btn cart">
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
            <li class="breadcrumb-item"><a href="/home">Home</a></li>
            <li class="breadcrumb-item"><a href="/products">Products</a></li>
            <li class="breadcrumb-item active">Create</li>
        </ul>
    </div>
</div>
<!-- Breadcrumb End -->

<!-- Login Start -->
<div class="login">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12">
                <form method="post">
                    <div class="login-form">
                        <div class="row">
                            <div class="col-md-12">
                                <label>Name: </label>
                                <input class="form-control" type="text" name="name" placeholder="product name">
                            </div>
                            <div class="col-md-12">
                                <label>Category Id: </label>
                                <input class="form-control" type="number" name="categoryId" placeholder="category id">
                            </div>
                            <div class="col-md-12">
                                <label>Image Address:  </label>
                                <input class="form-control" type="text" name="image" placeholder="image address">
                            </div>
                            <div class="col-md-12">
                                <label>Description: </label>
                                <input class="form-control" type="text" name="description" placeholder="product's description">
                            </div>
                            <div class="col-md-12">
                                <label>Sold quantity: </label>
                                <input class="form-control" type="number" name="sold" value="0">
                            </div>
                            <div class="col-md-12">
                                <label>In Stock Quantity: </label>
                                <input class="form-control" type="number" name="inStock" placeholder="in stock quantity">
                            </div>
                            <div class="col-md-12">
                                <label>Price: </label>
                                <input class="form-control" type="number" name="price" placeholder="price">
                            </div>
                            <div class="col-md-12">
                                <label>Status: </label>
                                <input class="form-control" type="number" name="status" value="1">
                            </div>
                            <div class="col-md-12">

                                <button type="submit" class="btn">Add</button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>

        </div>
    </div>
</div>
<!-- Login End -->


<!-- Footer Start -->
<div class="footer">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-3 col-md-6">
                <div class="footer-widget">
                    <h2>Get in Touch</h2>
                    <div class="contact-info">
                        <p><i class="fa fa-envelope"></i>uyblack1234567890@gmail.com</p>
                        <p><i class="fa fa-envelope"></i>hoangvixinh@gmail.com</p>
                        <p><i class="fa fa-envelope"></i>ducviet12vl@gmail.com</p>
                    </div>
                </div>
            </div>

            <div class="col-lg-3 col-md-6">
            </div>

            <div class="col-lg-3 col-md-6">
                <div class="footer-widget">
                    <h2>Shop members</h2>
                    <ul>
                        <li>Le Dinh Uy</li>
                        <li>Trinh Lan Huong</li>
                        <li>Hoang Duc Viet</li>
                    </ul>
                </div>
            </div>

            <div class="col-lg-3 col-md-6">

            </div>
        </div>
    </div>
</div>
<!-- Footer End -->
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

