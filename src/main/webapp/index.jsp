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

<body style="background: #f0f8ff" >
<!-- Top bar Start -->
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
                    <a href="/home" class="nav-item nav-link active">Home</a>
                    <a href="/products?action=list" class="nav-item nav-link">Products</a>
                    <a href="product-detail.html" class="nav-item nav-link">Product Detail</a>
                    <a href="cart.html" class="nav-item nav-link">Cart</a>
                    <a href="checkout.html" class="nav-item nav-link">Checkout</a>
                    <a href="/myAccount" class="nav-item nav-link">My Account</a>
                    <c:if test="${sessionScope.currentUser.role == 1}">
                        <a href="/users" class="nav-item nav-link">Account Management(Admin)</a>
                    </c:if>
                    <c:if test="${(sessionScope.currentUser.role != 1)&&(sessionScope.currentUser.role != null) }">
                        <a href="/users?action=edit&id=${sessionScope.currentUser.id }" class="nav-item nav-link">Edit
                            MyAccount</a>
                    </c:if>
                    <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">More Pages</a>
                        <div class="dropdown-menu">
                            <a href="wishlist.html" class="dropdown-item">Wishlist</a>
                            <a href="login.html" class="dropdown-item">Login & Register</a>
                            <a href="contact.html" class="dropdown-item">Contact Us</a>
                        </div>
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
                    <input type="text" placeholder="Search">
                    <button><i class="fa fa-search"></i></button>
                </div>
            </div>
            <div class="col-md-3">
                <div class="user">
                    <a href="wishlist.html" class="btn wishlist">
                        <i class="fa fa-heart"></i>
                        <span>(0)</span>
                    </a>
                    <a href="cart.html" class="btn cart">
                        <i class="fa fa-shopping-cart"></i>
                        <span>(0)</span>
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
                <nav class="navbar bg-light">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link" href="index.jsp"><i class="fa fa-home"></i>Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#"><i class="fa fa-shopping-bag"></i>Best Selling</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#"><i class="fa fa-plus-square"></i>New Arrivals</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#"><i class="fa fa-female"></i>Fashion & Beauty</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#"><i class="fa fa-child"></i>Kids & Babies Clothes</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#"><i class="fa fa-tshirt"></i>Men & Women Clothes</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#"><i class="fa fa-mobile-alt"></i>Gadgets & Accessories</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#"><i class="fa fa-microchip"></i>Electronics & Accessories</a>
                        </li>
                    </ul>
                </nav>
            </div>
            <div class="col-md-6">
                <div style="height: 450px" class="header-slider normal-slider">
                    <div class="header-slider-item">
                        <img width="100%"height="400px" src="https://f48-zpg.zdn.vn/8858870016585865246/720c19ef326bf935a07a.jpg" alt="Slider Image"/>
                        <div class="header-slider-caption">
                            <p>Some text goes here that describes the image</p>
                            <a class="btn" href=""><i class="fa fa-shopping-cart"></i>Shop Now</a>
                        </div>
                    </div>
                    <div class="header-slider-item">
                        <img  width="100%" height="400px" src="https://f55-zpg.zdn.vn/7850414313046660269/b6c2f53bdebf15e14cae.jpg" alt="Slider Image"/>
                        <div class="header-slider-caption">
                            <p>Some text goes here that describes the image</p>
                            <a class="btn" href=""><i class="fa fa-shopping-cart"></i>Shop Now</a>
                        </div>
                    </div>
                    <div class="header-slider-item">
                        <img  width="100%" height="400px" src="https://f36-zpg.zdn.vn/8336791738500185749/3283850aae8e65d03c9f.jpg" alt="Slider Image"/>
                        <div class="header-slider-caption">
                            <p>Some text goes here that describes the image</p>
                            <a class="btn" href=""><i class="fa fa-shopping-cart"></i>Shop Now</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="header-img">
                    <div class="img-item">
                        <img src="https://photo-cms-kienthuc.zadn.vn/zoom/800/uploaded/nguyenanhson/2020_12_24/1/dang-anh-khoe-giay-gai-xinh-lo-voc-dang-cuc-xin-hinh-2.jpeg"/>
                        <a class="img-text" href="">
                            <p>Some text goes here that describes the image</p>
                        </a>
                    </div>
                    <div class="img-item">
                        <img src="https://gamek.mediacdn.vn/133514250583805952/2020/2/1/photo-1-1580529782917695541729.jpg"/>
                        <a class="img-text" href="">
                            <p>Some text goes here that describes the image</p>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Main Slider End -->

<!-- Brand Start -->
<div class="brand">
    <div class="container-fluid">
        <div class="brand-slider">
            <div class="brand-item"><img src="img/brand-1.png" alt=""></div>
            <div class="brand-item"><img src="img/brand-2.png" alt=""></div>
            <div class="brand-item"><img src="img/brand-3.png" alt=""></div>
            <div class="brand-item"><img src="img/brand-4.png" alt=""></div>
            <div class="brand-item"><img src="img/brand-5.png" alt=""></div>
            <div class="brand-item"><img src="img/brand-6.png" alt=""></div>
        </div>
    </div>
</div>
<!-- Brand End -->

<!-- Feature Start-->
<div class="feature">
    <div class="container-fluid">
        <div class="row align-items-center">
            <div class="col-lg-3 col-md-6 feature-col">
                <div class="feature-content">
                    <i class="fab fa-cc-mastercard"></i>
                    <h2>Secure Payment</h2>
                    <p>
                        Lorem ipsum dolor sit amet consectetur elit
                    </p>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 feature-col">
                <div class="feature-content">
                    <i class="fa fa-truck"></i>
                    <h2>Worldwide Delivery</h2>
                    <p>
                        Lorem ipsum dolor sit amet consectetur elit
                    </p>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 feature-col">
                <div class="feature-content">
                    <i class="fa fa-sync-alt"></i>
                    <h2>90 Days Return</h2>
                    <p>
                        Lorem ipsum dolor sit amet consectetur elit
                    </p>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 feature-col">
                <div class="feature-content">
                    <i class="fa fa-comments"></i>
                    <h2>24/7 Support</h2>
                    <p>
                        Lorem ipsum dolor sit amet consectetur elit
                    </p>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Feature End-->

<!-- Category Start-->
<div class="category">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-3">
                <div class="category-item ch-400">
                    <img src="https://2sao.vietnamnetjsc.vn/images/2021/06/09/11/54/b4.jpg"/>
                    <a class="category-name" href="">
                        <p>Some text goes here that describes the image</p>
                    </a>
                </div>
            </div>
            <div class="col-md-3">
                <div class="category-item ch-250">
                    <img src="https://i.pinimg.com/originals/1c/ed/06/1ced067bbc7d63808f2018c34f4ad10b.jpg"/>
                    <a class="category-name" href="">
                        <p>Some text goes here that describes the image</p>
                    </a>
                </div>
                <div class="category-item ch-150">
                    <img src="https://minsu.com.vn/wp-content/uploads/2021/05/tiep-noi-hot-girl-bap-can-bo-xoai-non-trang-pham-phat-ngon-soc-ve-viec-hoc-hinh-2-e1620804638897.jpg"/>
                    <a class="category-name" href="">
                        <p>Some text goes here that describes the image</p>
                    </a>
                </div>
            </div>
            <div class="col-md-3">
                <div class="category-item ch-150">
                    <img src="https://vcdn1-ione.vnecdn.net/2020/09/04/118322725-386151272388892-9294-6169-4105-1599153481.jpg?w=0&h=0&q=100&dpr=1&fit=crop&s=Tc-zJ65dczSQ3rUwRoNpdQ"/>
                    <a class="category-name" href="">
                        <p>Some text goes here that describes the image</p>
                    </a>
                </div>
                <div class="category-item ch-250">
                    <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSNZ6w5d_yrhIto83Q_-Wuc1ELXQMebgcTSQQ&usqp=CAU" alt="">
                    <a class="category-name" href="">
                        <p>Some text goes here that describes the image</p>
                    </a>
                </div>
            </div>
            <div class="col-md-3">
                <div class="category-item ch-400">
                    <img src="https://vcdn1-ione.vnecdn.net/2020/09/04/giay-the-thao-dep-re-4-1246-1599153481.jpg?w=0&h=0&q=100&dpr=1&fit=crop&s=qV3WyaMZGIn7NqDYr-Lc_w"/>
                    <a class="category-name" href="">
                        <p>Some text goes here that describes the image</p>
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="newsletter">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-6">
                <h1>Subscribe Our Newsletter</h1>
            </div>
            <div class="col-md-6">
                <div class="form">
                    <input type="email" value="Your email here">
                    <button>Submit</button>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Newsletter End -->

<!-- Recent Product Start -->
<div class="recent-product product">
    <div class="container-fluid">
        <div class="section-header">
            <h1>Recent Product</h1>
        </div>
        <div class="row align-items-center product-slider product-slider-4">
            <div class="col-lg-3">
                <div class="product-item">
                    <div class="product-title">
                        <a href="#">Nike</a>
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
                            <img src="https://bizweb.dktcdn.net/thumb/large/100/413/756/products/e3229940-b0f5-4e69-8491-203ca12a5953.jpg?v=1638527796000" alt="Product Image">
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
                        <a href="#">Puma Nova Pop</a>
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
                            <img src="https://cdn.shopify.com/s/files/1/0456/5070/6581/products/371723_02-1_360x.jpg?v=1603255337" alt="Product Image">
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
                        <a href="#">Puma Muse X-2 Shimmer</a>
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
                            <img src="https://cdn.shopify.com/s/files/1/0456/5070/6581/products/372101_02-1_360x.jpg?v=1603255338" alt="Product Image">
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
                        <a href="#"> Puma Rs-X³ Millenium White-Gray Violet</a>
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
                            <img src="https://cdn.shopify.com/s/files/1/0456/5070/6581/products/373236_02-1_360x.jpg?v=1604303353" alt="Product Image">
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
                        <a href="#"> Puma Ascend</a>
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
                            <img src="https://cdn.shopify.com/s/files/1/0456/5070/6581/products/371313_03-1_ccb6fbbb-bb98-471a-b41f-15240b80df2f_360x.jpg?v=1615270486" alt="Product Image">
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
<!-- Recent Product End -->

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

        <a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>

        <!-- JavaScript Libraries -->
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
        <script src="lib/easing/easing.min.js"></script>
        <script src="lib/slick/slick.min.js"></script>

        <!-- Template Javascript -->
        <script src="js/main.js"></script>
    </div>
</div>
</body>
</html>
