<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    <title>작품관리</title>


<style>
	td:first-child {
		text-align: center;
		font-weight: bold;
	}
	
	table, th, td {
		color:pink;
	}
</style>

<script>
	
	function deleteBoard(boardId) {
		
		 if (!confirm("정말 삭제하시겠습니까?")) {
			 return;	
		    } else {
				location.href = "${contextPath}/admin/board/deleteBoard?boardId=" + boardId;
		    }
	}
</script>
</head>

<body>
    <!-- Page Preloder -->
   
    <!-- Header Section Begin -->
   
    <!-- Header End -->

    <!-- Normal Breadcrumb Begin -->
    <section class="normal-breadcrumb set-bg" data-setbg="img/normal-breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="normal__breadcrumb__text">
                        <h2>작품 삭제/등록</h2>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Normal Breadcrumb End -->

    <!-- Blog Section Begin -->

		<table class="table table-bordered table-hover">
		<tbody align="center">
			<tr>
				<td>작품번호</td>
				<td>작품이름</td>
				<td>감독</td>
				<td>출연진</td>
				<td>개봉일</td>
				<td>장르</td>
				<td>국적</td>
			</tr>
  				<c:choose>
    				<c:when test="${empty newBoardList }">			
					<tr>
				       <td colspan="8" class="fixed"><strong>조회된 상품이 없습니다.</strong></td>
				    </tr>
			 	</c:when>
			 	<c:otherwise>
     				<c:forEach var="board" items="${newBoardList}">
						<tr>       
							<td><strong>${board.boardId}</strong></td>
							<td><p><a href="${contextPath}/board/boardDetail?boardId=${board.boardId}"><strong>${board.boardTitle} </strong></a></p>
							<p><input class="site-btn" type="button" onclick="javascript:deleteBoard(${board.boardId})" value="작품 삭제"></p>
							</td>
							<td><strong>${board.boardDirector}</strong></td>
							<td><strong>${board.boardCasting}</strong></td>
							<td><strong><fmt:formatDate value="${board.boardDate}" pattern="yyyy-MM-dd"/></strong></td>
							<td><strong>${board.boardGenre}</strong></td>
							<td><strong>${board.boardCountry}</strong></td>
						</tr>
					</c:forEach>
				</c:otherwise>
  			</c:choose>	        
		</tbody>
	</table>	
	
	<div align="right">
		<input class="site-btn" type="button" onclick="location.href='${contextPath}/admin/board/addBoard'" value="작품 등록">
	</div>
    <!-- Blog Section End -->
    <!-- Footer Section Begin -->
    
      <!-- Footer Section End -->

      <!-- Search model Begin -->
  
    <!-- Search model end -->

    <!-- Js Plugins -->
   
</body>

</html>