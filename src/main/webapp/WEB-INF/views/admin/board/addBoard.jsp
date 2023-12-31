<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="zxx">
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Anime Template">
    <meta name="keywords" content="Anime, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>작품등록</title>

    <script>

	function formValidationCheck(){
		
		var boardTitle = document.f.boardTitle;
		if (boardTitle.value == ""){
			alert("작품 제목은 반드시 입력해야 합니다.");
			boardTitle.focus();
			return false;
		}
		
		var boardDate = document.f.boardDate;
		if (boardDate.value == ""){
			alert("개봉일은 반드시 입력해야 합니다.");
			boardDate.focus();
			return false;
		}
		
		var boardGenre = document.f.boardGenre;
		if (boardGenre.value == ""){
			alert("장르는 반드시 입력해야 합니다.");
			boardGenre.focus();
			return false;
		}
		
		var boardIntro = document.f.boardIntro;
		if (boardIntro.value == ""){
			alert("작품 소개는 반드시 입력해야 합니다.");
			boardIntro.focus();
			return false;
		}
		
		var boardCasting = document.f.boardCasting;
		if (boardCasting.value == ""){
			alert("출연진은 반드시 입력해야 합니다.");
			boardCasting.focus();
			return false;
		}
		
		var boardDirector = document.f.boardDirector;
		if (boardDirector.value == ""){
			alert("감독은 반드시 입력해야 합니다.");
			boardDirector.focus();
			return false;
		}
		
		var boardEpisode = document.f.boardEpisode;
		if (boardEpisode.value == ""){
			alert("작품 회 수는 반드시 입력해야 합니다.");
			boardEpisode.focus();
			return false;
		}
		
		var boardCountry = document.f.boardCountry;
		if (boardCountry.value == ""){
			alert("국적은 반드시 입력해야 합니다.");
			boardCountry.focus();
			return false;
		}
		
		var boardFileName = document.f.boardFileName;
		if (document.f.boardFileName.value == ""){
			alert("작품 이미지는 반드시 첨부해야 합니다.");
			boardFileName.focus();
			return false;
		}
		
			
	}
</script>
<style>
	td:first-child {
		text-align: center;
		font-weight: bold;
	}
	
	table, th, td {
		color:pink;
	}
</style>
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
                        <h2>작품 등록</h2>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Normal Breadcrumb End -->

    <!-- Blog Section Begin -->
    
    	<form action="${contextPath}/admin/board/addBoard" name="f" method="post" enctype="multipart/form-data" onsubmit="return formValidationCheck()">
		<div class="tab_container">
		<div class="tab_container" id="container">
			<div class="tab_container">
				<div class="tab_content" id="tab1">
					<table class="table table-bordered table-hover">			
						<tr>
							<td width=200>작품 장르</td>
							<td width=500>
								<select name="boardGenre" class="form-control" style="padding-bottom:0; padding-top:0; height:35px">
									<option value="action" selected>액션
									<option value="drama">드라마
									<option value="series">시리즈
									<option value="sf">공상 과학
								</select>
							</td>
						</tr>
						<tr>
							<td>작품 제목</td>
							<td><input name="boardTitle" type="text" class="form-control"/></td>
						</tr>
						<tr>
							<td >감독</td>
							<td><input name="boardDirector" type="text" class="form-control"/></td>
						</tr>
						<tr>
							<td>출연진</td>
							<td><input name="boardCasting" type="text" class="form-control"/></td>
						</tr>
						<tr>
							<td>작품 회 수</td>
							<td><input name="boardEpisode" type="text" class="form-control"/></td>
						</tr>
						<tr>
							<td>개봉일</td>
							<td><input  name="boardDate" type="date" class="form-control"/></td>
						</tr>
						<tr>
							<td>작품 이미지</td>
							<td><input name="boardFileName" type="file" /></td>
						</tr>
						<tr>
							<td>국적</td>
							<td><input name="boardCountry" type="text" class="form-control"/></td>
						</tr>
						<tr>
							<td>작품 소개</td>
							<td><textarea rows="10" cols="10" class="form-control" id="boardIntro" name="boardIntro"></textarea></td>
						</tr>
					</table>	
				</div>
			</div>
			<p align="right">
				<input type="submit" value="등록하기" class="site-btn">
			</p>
			</div>
		</div>
	</form>	
    <!-- Blog Section End -->

    <!-- Footer Section Begin -->
    
      <!-- Footer Section End -->

      <!-- Search model Begin -->
  
    <!-- Search model end -->

    <!-- Js Plugins -->
   
</body>

</html>