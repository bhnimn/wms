<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="zxx">
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<head>
    <script src="${contextPath }/resources/js/jquery-3.3.1.min.js"></script>

    <title>로그인</title>
<c:if test='${invalidMember eq true}'>
	<script>
		$().ready(function(){
			alert("아이디와 비밀번호를 확인하세요.");
		});
	</script>
</c:if>
</head>

<body>
    <!-- Page Preloder -->

    <!-- Header Section Begin -->
    
    <!-- Header End -->

    <!-- Normal Breadcrumb Begin -->
    <section class="normal-breadcrumb set-bg" data-setbg="${contextPath }/resources/img/welcome_login.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="normal__breadcrumb__text">
                        <h2>로그인</h2>
                        <p>환영합니다.</p>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Normal Breadcrumb End -->

    <!-- Login Section Begin -->
    <section class="login spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-6">
                    <div class="login__form">
                        <h3>Login</h3>
                        <form action="${contextPath }/member/login" method="post">
                            <div class="input__item">
                                <input type="text" placeholder="아이디" id="memberId" name="memberId">
                                <span class="icon_profile"></span>
                            </div>
                            <div class="input__item">
                                <input type="password" placeholder="비밀번호" id="memberPw" name="memberPw">
                                <span class="icon_lock"></span>
                            </div>
                            <button type="submit" class="site-btn" >로그인</button>
                        </form>
                        <a href="#" class="forget_pass">비밀번호 찾기</a>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="login__register">
                        <h3>회원이 아니신가요?</h3>
                        <a href="${contextPath}/member/join" class="primary-btn">회원가입</a>
                    </div>
                </div>
            </div>
            <div class="login__social">
                <div class="row d-flex justify-content-center">
                    <div class="col-lg-6">
                        <div class="login__social__links">
                            <span>or</span>
                            <ul>
                                <li><a href="#" class="facebook"><i class="fa fa-facebook"></i> 페이스북 계정으로 로그인</a></li>
                                <li><a href="#" class="google"><i class="fa fa-google"></i> 구글 계정으로 로그인</a></li>
                                <li><a href="#" class="twitter"><i class="fa fa-twitter"></i> 트위터 계정으로 로그인</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Login Section End -->

    <!-- Footer Section Begin -->
    
      <!-- Footer Section End -->

      <!-- Search model Begin -->
     
    <!-- Search model end -->

    <!-- Js Plugins -->
</body>

</html>