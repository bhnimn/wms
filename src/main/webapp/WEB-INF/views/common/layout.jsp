<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html lang="zxx">

<head>
    <script src="${contextPath }/resources/js/jquery-3.3.1.min.js"></script>
    <meta charset="UTF-8">
    <meta name="description" content="Anime Template">
    <meta name="keywords" content="Anime, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Mulish:wght@300;400;500;600;700;800;900&display=swap"
    rel="stylesheet">

    <link rel="stylesheet" href="${contextPath }/resources/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="${contextPath }/resources/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="${contextPath }/resources/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="${contextPath }/resources/css/plyr.css" type="text/css">
    <link rel="stylesheet" href="${contextPath }/resources/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="${contextPath }/resources/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="${contextPath }/resources/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="${contextPath }/resources/css/style.css" type="text/css">
</head>

<body>
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>

    <!-- Header Section Begin -->
    <tiles:insertAttribute name="header"/>
    <!-- Header End -->

   <tiles:insertAttribute name="body"/>

  <!-- Footer Section Begin -->
	<tiles:insertAttribute name="footer"/>
  <!-- Footer Section End -->

  <!-- Search model Begin -->
  <div class="search-model">
    <div class="h-100 d-flex align-items-center justify-content-center">
        <div class="search-close-switch"><i class="icon_close"></i></div>
        <form class="search-model-form">
            <input type="text" id="search-input" placeholder="Search here.....">
        </form>
    </div>
</div>
<!-- Search model end -->

<!-- Js Plugins -->

<script src="${contextPath }/resources/js/bootstrap.min.js"></script>
<script src="${contextPath }/resources/js/player.js"></script>
<script src="${contextPath }/resources/js/jquery.nice-select.min.js"></script>
<script src="${contextPath }/resources/js/mixitup.min.js"></script>
<script src="${contextPath }/resources/js/jquery.slicknav.js"></script>
<script src="${contextPath }/resources/js/owl.carousel.min.js"></script>
<script src="${contextPath }/resources/js/main.js"></script>


</body>

</html>   