<%--
  Created by IntelliJ IDEA.
  User: hoangfvi
  Date: 03/12/2021
  Time: 16:17
  To change this template use File | Settings | File Templates.
--%>
<%--<%@ page language="java" contentType="text/html; charset=UTF-8"--%>
<%--         pageEncoding="UTF-8" %>--%>
<%--<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>--%>
<%--<html>--%>
<%--<head>--%>
<%--    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"--%>
<%--          integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">--%>
<%--    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>--%>
<%--    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>--%>
<%--    <title>$Title$</title>--%>
<%--    <link rel="stylesheet" href="css/style.css">--%>
<%--</head>--%>
<%--<body>--%>
<%--<c:if test="${sessionScope.currentUser== null}">--%>
<%--    Welcome guest--%>
<%--    <a href="/login">Login</a>--%>
<%--    <a href="/sign-in">Sign in</a>--%>
<%--</c:if>--%>
<%--<c:if test="${sessionScope.currentUser!= null}">--%>
<%--    welcome ${sessionScope.currentUser.name}--%>
<%--    <a href="/logout"--%>
<%--       onclick="return confirm('Are you sure to log out?')">Log out</a>--%>
<%--</c:if>--%>
<%--<br>--%>
<%--<a href="/carts" >My cart</a>--%>
<%--<br>--%>
<%--<a href="/products?action=list">product list</a>--%>
<%--</body>--%>
<%--</html>--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
                    <a href="index.jsp" class="nav-item nav-link active">Home</a>
                    <a href="/products?action=list" class="nav-item nav-link">Products</a>
                    <%--                    <a href="product-detail.html" class="nav-item nav-link">Product Detail</a>--%>
                    <a href="/carts" class="nav-item nav-link">Cart</a>
                    <c:if test="${sessionScope.currentUser != null}">
                        <a href="/orders" class="nav-item nav-link">Order</a>
                    </c:if>

                    <%--                    <a href="checkout.html" class="nav-item nav-link">Checkout</a>--%>
                    <%--                    <a href="/myAccount" class="nav-item nav-link">My Account</a>--%>
                    <c:if test="${sessionScope.currentUser.role == 1}">
                        <a href="/users" class="nav-item nav-link">Account Management(Admin)</a>
                    </c:if>
                    <c:if test="${(sessionScope.currentUser.role != 1)&&(sessionScope.currentUser.role != null) }">
                        <a href="/users?action=edit&id=${sessionScope.currentUser.id }" class="nav-item nav-link">Edit
                            MyAccount</a>
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
            <div class="col-md-3">
            </div>
            <div class="col-md-6">
                <div class="header-slider normal-slider">
                    <div class="header-slider-item">
                        <img src="img/slider-1.jpg" alt="Slider Image"/>
                        <div class="header-slider-caption">
                            <p>Some text goes here that describes the image</p>
                            <a class="btn" href=""><i class="fa fa-shopping-cart"></i>Shop Now</a>
                        </div>
                    </div>
                    <div class="header-slider-item">
                        <img src="img/slider-2.jpg" alt="Slider Image"/>
                        <div class="header-slider-caption">
                            <p>Some text goes here that describes the image</p>
                            <a class="btn" href=""><i class="fa fa-shopping-cart"></i>Shop Now</a>
                        </div>
                    </div>
                    <div class="header-slider-item">
                        <img src="img/slider-3.jpg" alt="Slider Image"/>
                        <div class="header-slider-caption">
                            <p>Some text goes here that describes the image</p>
                            <a class="btn" href=""><i class="fa fa-shopping-cart"></i>Shop Now</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-3">

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
                    <img src="img/category-3.jpg"/>
                    <a class="category-name" href="">
                        <p>Some text goes here that describes the image</p>
                    </a>
                </div>
            </div>
            <div class="col-md-3">
                <div class="category-item ch-250">
                    <img src="img/category-4.jpg"/>
                    <a class="category-name" href="">
                        <p>Some text goes here that describes the image</p>
                    </a>
                </div>
                <div class="category-item ch-150">
                    <img src="img/category-5.jpg"/>
                    <a class="category-name" href="">
                        <p>Some text goes here that describes the image</p>
                    </a>
                </div>
            </div>
            <div class="col-md-3">
                <div class="category-item ch-150">
                    <img src="img/category-6.jpg"/>
                    <a class="category-name" href="">
                        <p>Some text goes here that describes the image</p>
                    </a>
                </div>
                <div class="category-item ch-250">
                    <img src="img/category-7.jpg"/>
                    <a class="category-name" href="">
                        <p>Some text goes here that describes the image</p>
                    </a>
                </div>
            </div>
            <div class="col-md-3">
                <div class="category-item ch-400">
                    <img src="img/category-8.jpg"/>
                    <a class="category-name" href="">
                        <p>Some text goes here that describes the image</p>
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Category End-->

<!-- Call to Action Start -->

<!-- Featured Product Start -->
<div class="featured-product product">
    <div class="container-fluid">
        <div class="section-header">
            <h1>Featured Product</h1>
        </div>
        <div class="row align-items-center product-slider product-slider-4">
            <div class="col-lg-3">
                <div class="product-item">
                    <div class="product-title">
                        <a href="#">Product Name</a>
                        <div class="ratting">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                        </div>
                    </div>
                    <div class="product-image">
                        <a href="product-detail.html">
                            <img src="img/product-1.jpg" alt="Product Image">
                        </a>
                        <div class="product-action">
                            <a href="#"><i class="fa fa-cart-plus"></i></a>
                            <a href="#"><i class="fa fa-heart"></i></a>
                            <a href="#"><i class="fa fa-search"></i></a>
                        </div>
                    </div>
                    <div class="product-price">
                        <h3><span>$</span>99</h3>
                        <a class="btn" href=""><i class="fa fa-shopping-cart"></i>Buy Now</a>
                    </div>
                </div>
            </div>
            <div class="col-lg-3">
                <div class="product-item">
                    <div class="product-title">
                        <a href="#">Product Name</a>
                        <div class="ratting">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                        </div>
                    </div>
                    <div class="product-image">
                        <a href="product-detail.html">
                            <img src="img/product-2.jpg" alt="Product Image">
                        </a>
                        <div class="product-action">
                            <a href="#"><i class="fa fa-cart-plus"></i></a>
                            <a href="#"><i class="fa fa-heart"></i></a>
                            <a href="#"><i class="fa fa-search"></i></a>
                        </div>
                    </div>
                    <div class="product-price">
                        <h3><span>$</span>99</h3>
                        <a class="btn" href=""><i class="fa fa-shopping-cart"></i>Buy Now</a>
                    </div>
                </div>
            </div>
            <div class="col-lg-3">
                <div class="product-item">
                    <div class="product-title">
                        <a href="#">Product Name</a>
                        <div class="ratting">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                        </div>
                    </div>
                    <div class="product-image">
                        <a href="product-detail.html">
                            <img src="img/product-3.jpg" alt="Product Image">
                        </a>
                        <div class="product-action">
                            <a href="#"><i class="fa fa-cart-plus"></i></a>
                            <a href="#"><i class="fa fa-heart"></i></a>
                            <a href="#"><i class="fa fa-search"></i></a>
                        </div>
                    </div>
                    <div class="product-price">
                        <h3><span>$</span>99</h3>
                        <a class="btn" href=""><i class="fa fa-shopping-cart"></i>Buy Now</a>
                    </div>
                </div>
            </div>
            <div class="col-lg-3">
                <div class="product-item">
                    <div class="product-title">
                        <a href="#">Product Name</a>
                        <div class="ratting">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                        </div>
                    </div>
                    <div class="product-image">
                        <a href="product-detail.html">
                            <img src="img/product-4.jpg" alt="Product Image">
                        </a>
                        <div class="product-action">
                            <a href="#"><i class="fa fa-cart-plus"></i></a>
                            <a href="#"><i class="fa fa-heart"></i></a>
                            <a href="#"><i class="fa fa-search"></i></a>
                        </div>
                    </div>
                    <div class="product-price">
                        <h3><span>$</span>99</h3>
                        <a class="btn" href=""><i class="fa fa-shopping-cart"></i>Buy Now</a>
                    </div>
                </div>
            </div>
            <div class="col-lg-3">
                <div class="product-item">
                    <div class="product-title">
                        <a href="#">Product Name</a>
                        <div class="ratting">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                        </div>
                    </div>
                    <div class="product-image">
                        <a href="product-detail.html">
                            <img src="img/product-5.jpg" alt="Product Image">
                        </a>
                        <div class="product-action">
                            <a href="#"><i class="fa fa-cart-plus"></i></a>
                            <a href="#"><i class="fa fa-heart"></i></a>
                            <a href="#"><i class="fa fa-search"></i></a>
                        </div>
                    </div>
                    <div class="product-price">
                        <h3><span>$</span>99</h3>
                        <a class="btn" href=""><i class="fa fa-shopping-cart"></i>Buy Now</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Featured Product End -->

<!-- Review Start -->
<div class="review">
    <div class="container-fluid">
        <div class="row align-items-center review-slider normal-slider">
            <div class="col-md-6">
                <div class="review-slider-item">
                    <div class="review-img">
                        <img src="img/review-1.jpg" alt="Image">
                    </div>
                    <div class="review-text">
                        <h2>Customer Name</h2>
                        <h3>Profession</h3>
                        <div class="ratting">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                        </div>
                        <p>
                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur vitae nunc eget leo
                            finibus luctus et vitae lorem
                        </p>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="review-slider-item">
                    <div class="review-img">
                        <img src="img/review-2.jpg" alt="Image">
                    </div>
                    <div class="review-text">
                        <h2>Customer Name</h2>
                        <h3>Profession</h3>
                        <div class="ratting">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                        </div>
                        <p>
                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur vitae nunc eget leo
                            finibus luctus et vitae lorem
                        </p>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="review-slider-item">
                    <div class="review-img">
                        <img src="img/review-3.jpg" alt="Image">
                    </div>
                    <div class="review-text">
                        <h2>Customer Name</h2>
                        <h3>Profession</h3>
                        <div class="ratting">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                        </div>
                        <p>
                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur vitae nunc eget leo
                            finibus luctus et vitae lorem
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Review End -->

<!-- Footer Start -->
<div class="footer">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-3 col-md-6">
                <div class="footer-widget">
                    <h2>Get in Touch</h2>
                    <div class="contact-info">
                        <p><i class="fa fa-map-marker"></i>123 E Store, Los Angeles, USA</p>
                        <p><i class="fa fa-envelope"></i>email@example.com</p>
                        <p><i class="fa fa-phone"></i>+123-456-7890</p>
                    </div>
                </div>
            </div>

            <div class="col-lg-3 col-md-6">
                <div class="footer-widget">
                    <h2>Follow Us</h2>
                    <div class="contact-info">
                        <div class="social">
                            <a href=""><i class="fab fa-twitter"></i></a>
                            <a href=""><i class="fab fa-facebook-f"></i></a>
                            <a href=""><i class="fab fa-linkedin-in"></i></a>
                            <a href=""><i class="fab fa-instagram"></i></a>
                            <a href=""><i class="fab fa-youtube"></i></a>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-lg-3 col-md-6">
                <div class="footer-widget">
                    <h2>Company Info</h2>
                    <ul>
                        <li><a href="#">About Us</a></li>
                        <li><a href="#">Privacy Policy</a></li>
                        <li><a href="#">Terms & Condition</a></li>
                    </ul>
                </div>
            </div>

            <div class="col-lg-3 col-md-6">
                <div class="footer-widget">
                    <h2>Purchase Info</h2>
                    <ul>
                        <li><a href="#">Pyament Policy</a></li>
                        <li><a href="#">Shipping Policy</a></li>
                        <li><a href="#">Return Policy</a></li>
                    </ul>
                </div>
            </div>
        </div>

        <div class="row payment align-items-center">
            <div class="col-md-6">
                <div class="payment-method">
                    <h2>We Accept:</h2>
                    <img src="img/payment-method.png" alt="Payment Method"/>
                </div>
            </div>
            <div class="col-md-6">
                <div class="payment-security">
                    <h2>Secured By:</h2>
                    <img src="img/godaddy.svg" alt="Payment Security"/>
                    <img src="img/norton.svg" alt="Payment Security"/>
                    <img src="img/ssl.svg" alt="Payment Security"/>
                </div>
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