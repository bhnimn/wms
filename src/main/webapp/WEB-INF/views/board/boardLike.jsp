<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="zxx">
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<head>
    <title>genre</title>
    
    <script>
    
    function change_genre(genre) {
    	location.href = "${contextPath}/board/genre" + genre;
    }
    
    </script>
</head>

<body>
    <!-- Page Preloder -->


    <!-- Header Section Begin -->

    <!-- Header End -->

    <!-- Breadcrumb Begin -->
    
    <!-- Breadcrumb End -->

    <!-- Product Section Begin -->
    <section class="product-page spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-8">
                    <div class="product__page__content">
                        <div class="product__page__title">
                            <div class="row">
                                <div class="col-lg-8 col-md-8 col-sm-6">
                                    <div class="section-title">
                                        <h4>내가 좋아요 한 작품</h4>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-6">
                                    <div class="product__page__filter">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                         <c:forEach var="item" items="${myLike }">
                            <div class="col-lg-4 col-md-6 col-sm-6">
                                <div class="product__item">
                                    <div class="product__item__pic set-bg" data-setbg="${contextPath}/thumbnails?boardFileName=${item.boardFileName}">
                                        <div class="comment"><i class="fa fa-heartbeat"></i>${item.boardLikes }</div>
                                        <div class="view"><i class="fa fa-eye"></i>${item.boardViews }</div>
                                    </div>
                                    <div class="product__item__text">
                                        <ul>
                                            <li>${item.boardGenre }</li>
                                        </ul>
                                        <h5><a href="${contextPath}/board/boardDetail?boardId=${item.boardId}">${item.boardTitle }</a></h5>
                                    </div>
                                </div>
                            </div>
                         </c:forEach>
                        </div>
                    </div>
                </div>
</div>
</section>
<!-- Product Section End -->

<!-- Footer Section Begin -->

  <!-- Footer Section End -->

  <!-- Search model Begin -->

<!-- Search model end -->


</body>

</html>