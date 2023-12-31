<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="zxx">
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<head>
    <title>frommywindowtoyours</title>
</head>

<body>

    <!-- Header Section Begin -->
  
    <!-- Header End -->

    <!-- Hero Section Begin -->
    <section class="hero">
        <div class="container">
	    	<div class="hero__slider owl-carousel">
	    	    <c:forEach var="item" items="${like }" begin="0" end="2">
                <div class="hero__items set-bg" data-setbg="${contextPath}/thumbnails?boardFileName=${item.boardFileName}">
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="hero__text">
                             <div class="label">${item.boardGenre }</div>
                                <h2>${item.boardTitle }</h2>
                                <p>${item.boardIntro }</p>
                                <a href="${contextPath}/board/boardDetail?boardId=${item.boardId}"><span>시청 하기</span> <i class="fa fa-angle-right"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
                </c:forEach>
            </div>
        </div>
    </section>
    <!-- Hero Section End -->

    <!-- Product Section Begin -->
    <section class="product spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-8">
                    <div class="trending__product">
                        <div class="row">
                            <div class="col-lg-8 col-md-8 col-sm-8">
                                <div class="section-title">
                                    <h4>최근 등록 작품</h4>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-4">
                            </div>
                        </div>
                        <div class="row">
                        	<div class="product__item__text">
                            	<h5><a href="#"></a></h5>
                            </div>
                            <c:forEach var="item" items="${recent }" begin="0" end="8">
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
                    <div class="popular__product">
                        <div class="row">
                            <div class="col-lg-8 col-md-8 col-sm-8">
                                <div class="section-title">
                                    <h4>조회수 많은 작품</h4>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-4">
                                <div class="btn__all">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <c:forEach var="item" items="${view }" begin="0" end="8">
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
                    <div class="recent__product">
                        <div class="row">
                            <div class="col-lg-8 col-md-8 col-sm-8">
                                <div class="section-title">
                                    <h4>좋아요 많은 작품</h4>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-4">
                                <div class="btn__all">
                                </div>
                            </div>
                            <c:forEach var="item" items="${like }" begin="0" end="8">
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
          </div>
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

<!-- Js Plugins -->



</body>

</html>