<%--
  Created by IntelliJ IDEA.
  User: hoangfvi
  Date: 06/12/2021
  Time: 08:18
  To change this template use File | Settings | File Templates.
--%>
<%--<%@ page language="java" contentType="text/html; charset=UTF-8"--%>
<%--         pageEncoding="UTF-8" %>--%>
<%--<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>--%>
<%--<html>--%>
<%--<head>--%>
<%--    <title>Title</title>--%>
<%--</head>--%>
<%--<body>--%>
<%--<a href="/products?action=create">Create product</a><br><br>--%>
<%--<div align="center">--%>
<%--    <table border="1" cellpadding="5">--%>
<%--        <caption><h2>${listName}</h2></caption>--%>
<%--        <tr>--%>
<%--            <th>ID</th>--%>
<%--            <th>Name</th>--%>
<%--            <th>Category</th>--%>
<%--            <th>Description</th>--%>
<%--            <th>image</th>--%>
<%--            <th>rate</th>--%>
<%--            <th>sold</th>--%>
<%--            <th>price</th>--%>
<%--            <th>category</th>--%>
<%--        </tr>--%>
<%--        <c:forEach var="i" begin="0" end="${productList.size()-1}">--%>
<%--            <tr>--%>
<%--                <td>${productList.get(i).getId()}</td>--%>
<%--                <td>${productList.get(i).getName()}</td>--%>
<%--                <td>${productList.get(i).getDescription()}</td>--%>
<%--                <td>${productList.get(i).getImage()}</td>--%>
<%--                <td></td>--%>
<%--                <td>${productList.get(i).getSold()}</td>--%>
<%--                <td>${productDetailList.get(i).getPrice()}</td>--%>
<%--                <td>${categoryList.get(i).getName()}</td>--%>
<%--                <td> <a onclick="return confirm('Are you sure?')"--%>
<%--                        href="/products?action=delete&id=${productList.get(i).getId()}">delete</a>--%>
<%--                </td>--%>
<%--                <td>--%>
<%--                    <a href="/products?action=edit&id=${productList.get(i).getId()}">Edit</a>,--%>
<%--                </td>--%>
<%--                <td><a href="/carts?action=add-product&id=${productList.get(i).getId()}&quantity=1">Add to cart</a></td>--%>
<%--            </tr>--%>
<%--        </c:forEach>--%>
<%--    </table>--%>
<%--</div>--%>
<%--</body>--%>
<%--</html>--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <link href="../slick/slick.css" rel="stylesheet">
    <link href="../slick/slick-theme.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="../../css/style.css" rel="stylesheet">
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
                    <a href="/products" class="nav-item nav-link active">Products</a>
                    <a href="carts" class="nav-item nav-link">Cart</a>
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
                    <a href="index.jsp">
                        <img src="../../img/logo.png" alt="Logo">
                    </a>
                </div>
            </div>
            <div class="col-md-6">

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
            <li class="breadcrumb-item"><a href="/">Home</a></li>
            <li class="breadcrumb-item"><a href="/products">Products</a></li>
        </ul>
    </div>
</div>
<!-- Breadcrumb End -->

<!-- Product List Start -->
<div class="product-view">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-8">
                <div class="row">
                    <div class="col-md-12">
                        <div class="product-view-top">
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="product-search">
                                        <form action="/products">
                                            <input type="text" name="info" placeholder="Search">
                                            <input type="hidden" name="action" value="find">
                                            <button><i class="fa fa-search"></i></button>
                                        </form>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="product-short">
                                        <div class="dropdown">
                                            <div class="dropdown-toggle" data-toggle="dropdown">Product sort by</div>
                                            <div class="dropdown-menu dropdown-menu-right">
                                                <a href="/products?action=list-price-asc" class="dropdown-item">Ascending
                                                    Price</a>
                                                <a href="/products?action=list-price-desc" class="dropdown-item">Descending
                                                    Price</a>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                                <div class="col-md-4">

                                </div>
                            </div>
                        </div>
                    </div>
                    <c:if test="${productList.size() != 0}">
                        <c:forEach var="i" begin="0" end="${productList.size()-1}">
                            <div class="col-md-4">
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
                                                   class="btn"> Delete </a>
                                                <a href="/products?action=edit&id=${productList.get(i).getId()}"
                                                   class="btn"> Edit </a>
                                            </center>

                                        </c:if>
                                            <%--                                        <a class="btn" href=""><i class="fa fa-shopping-cart"></i>Buy Now</a>--%>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </c:if>
                    <c:if test="${productList.size() == 0}">
                        No result found!
                    </c:if>
                </div>

                <%--                <!-- Pagination Start -->--%>
                <%--                <div class="col-md-12">--%>
                <%--                    <nav aria-label="Page navigation example">--%>
                <%--                        <ul class="pagination justify-content-center">--%>
                <%--                            <li class="page-item disabled">--%>
                <%--                                <a class="page-link" href="#" tabindex="-1">Previous</a>--%>
                <%--                            </li>--%>
                <%--                            <li class="page-item active"><a class="page-link" href="#">1</a></li>--%>
                <%--                            <li class="page-item"><a class="page-link" href="#">2</a></li>--%>
                <%--                            <li class="page-item"><a class="page-link" href="#">3</a></li>--%>
                <%--                            <li class="page-item">--%>
                <%--                                <a class="page-link" href="#">Next</a>--%>
                <%--                            </li>--%>
                <%--                        </ul>--%>
                <%--                    </nav>--%>
                <%--                </div>--%>
                <!-- Pagination Start -->
            </div>

            <!-- Side Bar Start -->
            <div class="col-lg-4 sidebar">
                <div class="sidebar-widget brands">
                    <h2 class="title">Category</h2>
                    <ul>
                        <li><a href="/products?action=list">ALL</a></li>
                        <li><a href="/products?action=list&category=1">NIKE</a></li>
                        <li><a href="/products?action=list&category=2">ADIDDAS</a></li>
                        <li><a href="/products?action=list&category=3">PUMA</a></li>
                        <li><a href="/products?action=list&category=4">CONVERSE</a></li>
                        <c:if test="${sessionScope.currentUser.role == 1}">
                            <li><a href="/products?action=deleted-list">DELETED PRODUCTS</a></li>
                        </c:if>
                    </ul>
                </div>
            </div>
            <!-- Side Bar End -->
        </div>
    </div>
</div>
<!-- Product List End -->

<%--<!-- Brand Start -->--%>
<%--<div class="brand">--%>
<%--    <div class="container-fluid">--%>
<%--        <div class="brand-slider">--%>
<%--            <div class="brand-item"><img src="../../img/brand-1.png" alt=""></div>--%>
<%--            <div class="brand-item"><img src="../../img/brand-2.png" alt=""></div>--%>
<%--            <div class="brand-item"><img src="../../img/brand-3.png" alt=""></div>--%>
<%--            <div class="brand-item"><img src="../../img/brand-4.png" alt=""></div>--%>
<%--            <div class="brand-item"><img src="../../img/brand-5.png" alt=""></div>--%>
<%--            <div class="brand-item"><img src="../../img/brand-6.png" alt=""></div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>
<%--<!-- Brand End -->--%>

<!-- Footer Start -->
<div class="footer">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-3 col-md-6">
                <div class="footer-widget">
                    <h2>Get in Touch</h2>
                    <div class="contact-info">
                        <p><i class="fa fa-map-marker"></i>My Dinh 2 - Ha Noi</p>
                        <p><i class="fa fa-envelope"></i>uyblack1234567890@gmail.com</p>
                        <p><i class="fa fa-phone"></i>0325836893</p>
                    </div>
                </div>
            </div>

            <div class="col-lg-3 col-md-6">
                <div class="footer-widget">
                    <h2>Follow Us</h2>
                    <div class="contact-info">
                        <div class="social">
                            <a href="https://www.facebook.com/UyLe2003/"><i class="fab fa-twitter"></i></a>
                            <a href=""><i class="fab fa-facebook-f"></i></a>
                            <a href=""><i class="fab fa-linkedin-in"></i></a>
                            <a href=""><i class="fab fa-instagram"></i></a>
                            <a href="https://www.youtube.com/c/nike"><i class="fab fa-youtube"></i></a>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-lg-3 col-md-6">
                <div class="footer-widget">
                    <h2>Shop members</h2>
                    <ul>
                        <li><a href="#">Uy</a></li>
                        <li><a href="#">Huong</a></li>
                        <li><a href="#">Viet</a></li>
                    </ul>
                </div>
            </div>

            <div class="col-lg-3 col-md-6">

            </div>
        </div>

        <!-- Footer End -->

        <!-- Footer Bottom Start -->

    </div>
    <!-- Footer Bottom End -->

    <!-- Back to Top -->
    <a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>

    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
    <script src="../easing/easing.min.js"></script>
    <script src="../slick/slick.min.js"></script>

    <!-- Template Javascript -->
    <script src="../../js/main.js"></script>
</div>
</body>
</html>
