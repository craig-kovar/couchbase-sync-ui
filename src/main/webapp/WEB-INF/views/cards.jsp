<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml" xmlns:th="http://www.thymeleaf.org">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Customer 360</title>
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <!-- Bootstrap core CSS -->
    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <!-- Material Design Bootstrap -->
    <link href="${contextPath}/resources/css/mdb.min.css" rel="stylesheet">
    <!-- Your custom styles (optional) -->
    <link href="${contextPath}/resources/css/style.min.css" rel="stylesheet">
</head>

<body class="grey lighten-3">

<!--Main Navigation-->
<header>

    <!-- Navbar -->
    <nav class="navbar fixed-top navbar-expand-lg navbar-light white scrolling-navbar">
        <div class="container-fluid">

            <!-- Brand -->
            <a class="navbar-brand waves-effect" href="https://www.couchbase.com/" target="_blank">
                <strong class="blue-text">Customer 360</strong>
            </a>

            <!-- Collapse -->
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                    aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <!-- Links -->
            <li class="collapse navbar-collapse" id="navbarSupportedContent">

                <!-- Left -->
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link border border-light rounded waves-effect" href="#">Home
                            <span class="sr-only">(current)</span>
                        </a>
                    </li>
                </ul>

                <!-- Right -->
                <ul class="navbar-nav nav-flex-icons">
                    <li class="nav-item active">
                        <a class="navbar-brand waves-effect">
                            <strong class="blue-text">Welcome ${pageContext.request.userPrincipal.name}</strong>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="https://www.facebook.com/Couchbase/" class="nav-link waves-effect" target="_blank">
                            <i class="fa fa-facebook"></i>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="https://twitter.com/couchbase" class="nav-link waves-effect" target="_blank">
                            <i class="fa fa-twitter"></i>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="https://www.couchbase.com/contact" class="nav-link border border-light rounded waves-effect"
                           target="_blank">
                            <i class=""></i>CONTACT US
                        </a>
                    </li>
                    <li class="nav-item">
                        <c:if test="${pageContext.request.userPrincipal.name != null}">
                            <form id="logoutForm" method="POST" action="${contextPath}/logout">
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                            </form>
                            <a onclick="document.forms['logoutForm'].submit()" class="nav-link border border-light rounded waves-effect"
                               target="_blank">
                                <i class=""></i>LOGOUT
                            </a>
                        </c:if>
                    </li>
                </ul>

            </div>

        </div>
    </nav>
    <!-- Navbar -->

    <!-- Sidebar -->
    <div class="sidebar-fixed position-fixed">

        <a class="logo-wrapper waves-effect">
            <img src="${contextPath}/resources/img/cb-logo-red.png" class="img-fluid" alt="">
        </a>

        <div class="list-group list-group-flush">
            <a href="#" class="list-group-item active waves-effect">
                <i class="fa fa-pie-chart mr-3"></i>Dashboard
            </a>
            <a href="#" class="list-group-item list-group-item-action waves-effect">
                <i class="fa fa-user mr-3"></i>Profile</a>
        </div>

    </div>
    <!-- Sidebar -->

</header>
<!--Main Navigation-->

<!--Main layout-->
<main class="pt-5 mx-lg-5">
    <div class="container-fluid mt-5">

        <!--Section: Jumbotron-->
        <section class="card wow fadeIn" id="intro">

            <!-- Content -->
            <div class="card-body text-white text-center py-5 px-5 my-5">

                <h1 class="mb-4">
                    <strong>Welcome to Couchbase Portal</strong>
                </h1>
                <p>
                    <strong>THE NOSQL WITH NO EQUAL</strong>
                </p>
                <p class="mb-4">
                    <strong>Unmatched developer agility & performance at scale,
                            from any cloud to the edge</strong>
                </p>
                <a target="_blank" href="https://www.couchbase.com/" class="btn btn-outline-white btn-lg">GET STARTED
                    <i class=""></i>
                </a>

            </div>
            <!-- Content -->
        </section>
        <!--Section: Jumbotron-->

        <hr class="my-5">

        <!--Section: Cards-->
        <section class="text-center">

            <!--Grid row-->
            <%--<div class="row mb-4 wow fadeIn" th:each="product : ${products}">--%>

            <div class="row mb-4 wow fadeIn">

            <c:forEach items="${products}" var="product">

                <!--Grid column-->
                <div class="col-md-6 mb-4">

                    <!--Card-->
                    <div class="card">

                        <!--Card image-->
                        <div class="view overlay">
                            <img src="${contextPath}/resources/img/${product.image}" class="card-img-top" alt="">
                            <a href="${product.url}" target="_blank">
                                <div class="mask rgba-white-slight"></div>
                            </a>
                        </div>

                        <!--Card content-->
                        <div class="card-body">
                            <!--Title-->
                            <h4 class="card-title">${product.name}</h4>
                            <!--Text-->
                            <p class="card-text">${product.description} </p>
                            <a href="${product.url}" target="_blank" class="btn btn-primary btn-md">LEARN MORE
                                <i class=""></i>
                            </a>
                        </div>

                    </div>
                    <!--/.Card-->

                </div>
                <!--Grid column-->

            </c:forEach>

            </div>
            <!--Grid row-->

        </section>
        <!--Section: Cards-->

    </div>
</main>
<!--Main layout-->

<!--Footer-->
<footer class="page-footer text-center font-small primary-color-dark darken-2 mt-4 wow fadeIn">

    <!--Call to action-->
    <div class="pt-4">
        <a class="btn btn-outline-white" href="https://www.couchbase.com/downloads" target="_blank" role="button">Download Couchbase
            <i class="fa fa-download ml-2"></i>
        </a>
    </div>
    <!--/.Call to action-->

    <hr class="my-4">

    <!-- Social icons -->
    <div class="pb-4">
        <a href="https://www.facebook.com/Couchbase/" target="_blank">
            <i class="fa fa-facebook mr-3"></i>
        </a>

        <a href="https://twitter.com/couchbase" target="_blank">
            <i class="fa fa-twitter mr-3"></i>
        </a>

        <a href="https://plus.google.com/+CouchbaseServer" target="_blank">
            <i class="fa fa-google-plus mr-3"></i>
        </a>
    </div>
    <!-- Social icons -->

    <!--Copyright-->
    <div class="footer-copyright py-3">
        2018
        <a href="https://www.couchbase.com/" target="_blank"> COUCHBASE </a>
    </div>
    <!--/.Copyright-->

</footer>
<!--/.Footer-->

<!-- SCRIPTS -->
<!-- JQuery -->
<script type="text/javascript" src="${contextPath}/resources/js/jquery-3.3.1.min.js"></script>
<!-- Bootstrap tooltips -->
<script type="text/javascript" src="${contextPath}/resources/js/popper.min.js"></script>
<!-- Bootstrap core JavaScript -->
<script type="text/javascript" src="${contextPath}/resources/js/bootstrap.min.js"></script>
<!-- MDB core JavaScript -->
<script type="text/javascript" src="${contextPath}/resources/js/mdb.min.js"></script>
<!-- Initializations -->
<script type="text/javascript">
    // Animations initialization
    new WOW().init();
</script>

</body>

</html>
