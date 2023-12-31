<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script>

	function go_to_boardLike(){
		
		var isLogOn = document.getElementById("isLogOn").value;
		var memberInfo = document.getElementById("memberInfo").value;

		if (isLogOn == "" || isLogOn == "false") {
			alert("로그인 후 이용 가능합니다.");
			location.href = "${contextPath}/member/login";
			return;
		}
		
		location.href = "${contextPath}/board/boardLike?memberId=" + memberInfo;

	}
</script>
</head>
<body>
	  <header class="header">
        <div class="container">
            <div class="row">
                <div class="col-lg-2">
                    <div class="header__logo">
                        <a href="${contextPath }">
                            <img src="${contextPath }/resources/img/fmwty_logo.png" alt="">
                        </a>
                    </div>
                </div>
                <div class="col-lg-8">
                    <div class="header__nav">
                        <nav class="header__menu mobile-menu">
                            <ul>
                                <li class="active"><a href="${contextPath }">홈으로</a></li>
                                <li><a href="${contextPath }/board/genreall">장르</a></li>
                                <li><a href="javascript:go_to_boardLike()">내가 좋아요 한 작품</a></li>
                            </ul>
                        </nav>
                    </div>
                </div>
                <div class="col-lg-2">
                    <div class="header__right">
                        <a href="#" class="search-switch"><span class="icon_search"></span></a>
					    <c:choose>
						    <c:when test="${isLogOn == true and memberInfo == 'admin' }">  
							   <li><a href="${contextPath}/admin/board/adminBoardMain">작품삭제/등록</a></li>
							   <li><a href="${contextPath}/admin/member/memberList">회원정보</a></li>
							   <li><a href="${contextPath}/member/logout">로그아웃</a></li>
							</c:when>
						     <c:when test="${isLogOn == true and not empty memberInfo }">
							   <li><a href="${contextPath}/member/logout">로그아웃</a></li>
							 </c:when>
							 <c:otherwise>
							   <li><a href="${contextPath}/member/login">로그인</a></li>
							   <li><a href="${contextPath}/member/join">회원가입</a></li> 
							 </c:otherwise>
						</c:choose>
                    </div>
                </div>
            </div>
            <div id="mobile-menu-wrap"></div>
        </div>
    </header>
    <input type="hidden" name="memberInfo" id="memberInfo" value="${memberInfo}"/>
    <input type="hidden" name="isLogOn" id="isLogOn" value="${isLogOn}"/>
</body>
</html>