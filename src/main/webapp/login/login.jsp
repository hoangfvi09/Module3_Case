<%--
  Created by IntelliJ IDEA.
  User: vieth
  Date: 12/6/2021
  Time: 10:54 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Naiker - eCommerce HTML Template</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="eCommerce HTML Template Free Download" name="keywords">
    <meta content="eCommerce HTML Template Free Download" name="description">

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

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
<!-- Top bar Start -->
<div class="top-bar">
    <div class="container-fluid">
        <div class="row">
            <div class="col-sm-6">
                <i class="fa fa-envelope"></i>
                support@email.com
            </div>
            <div class="col-sm-6">
                <i class="fa fa-phone-alt"></i>
                +012-345-6789
            </div>
        </div>
    </div>
</div>
<!-- Top bar End -->

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
                    <div class="nav-item dropdown">

                    </div>
                </div>
                <div class="navbar-nav ml-auto">
                    <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">User Account</a>
                        <div class="dropdown-menu">
                            <a href="/login" class="dropdown-item">Login</a>
                            <a href="/register" class="dropdown-item">Register</a>

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
                        <span>(0)</span>
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
            <li class="breadcrumb-item active">Login</li>
        </ul>
    </div>
</div>
<!-- Breadcrumb End -->

<!-- Login Start -->
<div class="login">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-3"></div>
                <div class="col-lg-6">
                    <form method="post">
                    <div class="login-form">
                        <div class="row">
                            <div class="col-md-12">
                                <p class="text-danger">${verifyResult}</p>
                            </div>
                            <div class="col-md-12">
                                <label>E-mail / Username</label>
                                <input class="form-control" type="text" name="email" placeholder="E-mail / Username">
                            </div>
                            <div class="col-md-12">
                                <label>Password</label>
                                <input class="form-control" type="password" name="password" placeholder="Password">
                            </div>
                            <div class="col-md-12">

                            </div>
                            <div class="col-md-12">
                                <button class="btn">Login</button>
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
