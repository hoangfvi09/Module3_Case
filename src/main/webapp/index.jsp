<%--
  Created by IntelliJ IDEA.
  User: hoangfvi
  Date: 03/12/2021
  Time: 16:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Naiker - Find your fast</title>
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
                    <a href="index.jsp" class="nav-item nav-link active">Home</a>
                    <a href="/products?action=list" class="nav-item nav-link">Products</a>
                    <%--                    <a href="product-detail.html" class="nav-item nav-link">Product Detail</a>--%>
                    <c:if test="${sessionScope.currentUser.role != 1}">
                        <a href="/carts" class="nav-item nav-link">Cart</a>
                    </c:if>
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
                                <a href="/register" class="dropdown-item">Register</a>
                                <a href="users?action=create" class="dropdown-item">Register</a>
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
                    <a href="index.jsp">
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

<!-- Main Slider Start -->
<div class="header">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-3"></div>

            <div class="col-md-6">
                <div class="header-slider slide normal-slider">
                    <center>
                        <div class="header-slider-item" style="height: 400px;  overflow: hidden">
                            <a href="/products"><img src="https://cdn.dribbble.com/users/3237629/screenshots/12922403/artboard_1_copy_3_4x.jpg"
                                                     alt="Slider Image" style="width: 100%"/></a>

                        </div>
                    </center>
                    <center>
                        <div class="header-slider-item" style=" height: 400px; overflow: hidden">
                            <a href="/products"><img src="https://bizweb.dktcdn.net/thumb/large/100/039/880/products/169534ci107x1-c4273247-9898-4f92-9484-d7675e059dda.jpg?v=1623313685000"
                                                     alt="Slider Image" style="width: 100%"/></a>

                        </div>
                    </center>
                    <center>
                        <div class="header-slider-item" style="height: 400px; overflow: hidden">
                            <a href="/products"> <img src="https://cdn.dribbble.com/users/3334486/screenshots/16038982/media/606955cbf8891157d3ca6d40263d3bea.jpg?compress=1&resize=400x300"
                                                      alt="Slider Image" style="width: 100%"/></a>

                        </div>
                    </center>
                </div>
                <div class="col-md-3"></div>
            </div>

        </div>
    </div>
</div>
</div>
<!-- Main Slider End -->

<!-- Brand Start -->

<!-- Brand End -->


<!-- Category Start-->
<div class="category">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-3">
                <div class="category-item ch-400">
                    <img src="https://i.pinimg.com/originals/8f/bf/75/8fbf75fcdc3a1660a341b6c8ae720cf9.jpg"/>
                    <a class="category-name" href="/products?action=list&category=1">
                        <p style="font-size: 40px">NIKE</p>
                    </a>
                </div>
            </div>
            <div class="col-md-3">
                <div class="category-item ch-400">
                    <img src="https://brand.assets.adidas.com/image/upload/f_auto,q_auto,fl_lossy/enUS/Images/ultraboost_Ingrid_Banner_D_tcm221-626518.jpg"/>
                    <a class="category-name" href="/products?action=list&category=2">
                        <p style="font-size: 40px">ADIDAS</p>
                    </a>
                </div>
            </div>
            <div class="col-md-3" >
                <div class="category-item ch-400">
                    <img src="https://5.imimg.com/data5/ANDROID/Default/2020/9/AX/DC/SX/113109586/product-jpeg-500x500.jpg"/>
                    <a class="category-name" href="/products?action=list&category=3">
                        <p style="font-size: 40px">PUMA</p>
                    </a>
                </div>
            </div>
            <div class="col-md-3">
                <div class="category-item ch-400">
                    <img src="https://www.converse.com/dw/image/v2/BCZC_PRD/on/demandware.static/-/Sites-cnv-master-catalog/default/dw7fce8cfc/images/j_08/572038C_J_08X1.jpg?sw=406"/>
                    <a class="category-name" href="/products?action=list&category=4">
                        <p style="font-size: 40px">CONVERSE</p>
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Category End-->

<!-- Call to Action Start -->

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
</div>
</body>
</html>

