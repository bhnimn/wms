<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="zxx">
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Anime Template">
    <meta name="keywords" content="Anime, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>작품상세</title>

<script>
	function boardLike(boardId){
		
		var isLogOn = document.getElementById("isLogOn").value;
		var memberInfo = document.getElementById("memberInfo").value;

		if (isLogOn == "" || isLogOn == "false") {
			alert("로그인 후 이용 가능합니다.");
			location.href = "${contextPath}/member/login";
			return;
		}
		
		location.href = "${contextPath}/board/heart?boardId=" + boardId + "&memberId=" + memberInfo;
	}
	
	function boardWatch(){
		
		var isLogOn = document.getElementById("isLogOn").value;
		var memberInfo = document.getElementById("memberInfo").value;

		if (isLogOn == "" || isLogOn == "false") {
			alert("로그인 후 시청이 가능합니다.");
			location.href = "${contextPath}/member/login";
			return;
		}
	}
	
	function writeReview(){
		
		var isLogOn = document.getElementById("isLogOn").value;
		var memberInfo = document.getElementById("memberInfo").value;
		if (isLogOn == "" || isLogOn == "false") {
			alert("로그인 후 리뷰 작성이 가능합니다.");
			location.href = "${contextPath}/member/login";
			return;
		}
	}
	
</script>
	
	
	
    <!-- Google Font -->

    <!-- Css Styles -->
</head>

<body>
    <!-- Page Preloder -->

    <!-- Header Section Begin -->
    <!-- Header End -->

    <!-- Breadcrumb Begin -->
    <div class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__links">
                        <a href="${contextPath }"><i class="fa fa-home"></i> Home</a>
                        <a href="${contextPath }/board/genreall">Categories</a>
                        <span>${board.boardGenre }</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb End -->

    <!-- Anime Section Begin -->
    <section class="anime-details spad">
        <div class="container">
            <div class="anime__details__content">
                <div class="row">
                    <div class="col-lg-3">
                        <div class="anime__details__pic set-bg" data-setbg="${contextPath}/thumbnails?boardFileName=${board.boardFileName}">
                            <div class="comment"><i class="fa fa-heartbeat"></i> ${board.boardLikes }</div>
                            <div class="view"><i class="fa fa-eye"></i> ${board.boardViews}</div>
                        </div>
                    </div>
                    <div class="col-lg-9">
                        <div class="anime__details__text">
                            <div class="anime__details__title">
                                <h3>${board.boardTitle}</h3>
                            </div>
                            <p>${board.boardIntro }</p>
                            <div class="anime__details__widget">
                                <div class="row">
                                    <div class="col-lg-6 col-md-6">
                                        <ul>
                                            <li><span>감독:</span>${board.boardDirector }</li>
                                            <li><span>출연진:</span>${board.boardCasting }</li>
                                            <li><span>장르:</span>${board.boardGenre }</li>
                                        </ul>
                                    </div>
                                    <div class="col-lg-6 col-md-6">
                                        <ul>
                                            <li><span>개봉일:</span><fmt:formatDate value='${board.boardDate}' pattern='yyyy-MM-dd'/></li>
                                            <li><span>국적:</span>${board.boardCountry }</li>
                                            <li><span>작품 회차:</span>${board.boardEpisode }</li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="anime__details__btn">
                                <a href="javascript:boardLike('${board.boardId }')" class="follow-btn"><i class="fa fa-heart-o"></i> 좋아요</a>
                                <a href="javascript:boardWatch()" class="watch-btn"><span>지금 시청</span> <i
                                    class="fa fa-angle-right"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-8 col-md-8">
                        <div class="anime__details__review">
                            <div class="section-title">
                                <h5>리뷰</h5>
                            </div>
                            <c:forEach var="item" items="${review }">
                            <div class="anime__review__item">
                                <div class="anime__review__item__pic">
                                    <img src="${contextPath }/resources/img/profileImg.png" alt="">
                                </div>
                                <div class="anime__review__item__text">
                                    <h6>${item.memberNickname } - <span>${item.commentDate }</span></h6>
                                    <p>${item.reviewComment }</p>
                                    <br>
                                </div>
                                <input type="hidden" name="commentNo" id="commentNo" value="${item.commentNo}"/>
                            </div>
                            </c:forEach>
                        </div>
                        <div class="anime__details__form">
                            <div class="section-title">
                                <h5>댓글 작성</h5>
                            </div>
                            <form action="${contextPath }/board/writeComment" method="post" enctype="multipart/form-data">
                                <textarea placeholder="여기에 댓글을 작성하세요." id="reviewComment" name="reviewComment" onclick="writeReview()"></textarea>
                                <button type="submit"><i class="fa fa-location-arrow"></i> 댓글 달기</button>
							    <input type="hidden" name="memberInfo" id="memberInfo" value="${memberInfo}"/>
							    <input type="hidden" name="boardId" id="boardId" value="${board.boardId }"/>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Anime Section End -->

        <!-- Footer Section Begin -->
          <!-- Footer Section End -->

          <!-- Search model Begin -->
        <!-- Search model end -->

        <!-- Js Plugins -->

    </body>

    <input type="hidden" name="memberInfo" id="memberInfo" value="${memberInfo}"/>
    <input type="hidden" name="isLogOn" id="isLogOn" value="${isLogOn}"/>
    </html>