<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="zxx">
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<head>
    <title>회원가입</title>
<style>
	
	body{
		color:pink;
	}
</style>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>

	var validateMemberId = false;

	$().ready(function() {
		
		$("#btnOverlapped").click(function(){
			
		    var memberId = $("#memberId").val();
		    if (memberId == ''){
		   		alert("ID를 입력하세요");
		   		return;
		    }
		   
		    $.ajax({
		       type : "post",
		       url : "${contextPath}/member/overlapped",
		       data : {"id" : memberId},
		       success : function(isOverLapped){
		          if (isOverLapped == "false"){
		          	alert("사용할 수 있는 ID입니다.");
		          	validateMemberId = true;
		          }
		          else {
		          	alert("사용할 수 없는 ID입니다.");
		          	validateMemberId = false;
		          }
		       }
		    });
		});	
		
	});
	
	$().ready(function() {
		
		$("#btnOverlappedNickname").click(function(){
			
		    var memberNickname = $("#memberNickname").val();
		    if (memberNickname == ''){
		   		alert("닉네임을 입력하세요");
		   		return;
		    }
		   
		    $.ajax({
		       type : "post",
		       url : "${contextPath}/member/overlappedNickname",
		       data : {"nickname" : memberNickname},
		       success : function(isOverLapped){
		          if (isOverLapped == "false"){
		          	alert("사용할 수 있는 닉네임입니다.");
		          	validateMemberId = true;
		          }
		          else {
		          	alert("사용할 수 없는 닉네임입니다.");
		          	validateMemberId = false;
		          }
		       }
		    });
		});	
		
	});
	
	function checkValidationField() {
		if (!validateMemberId) {
			alert("아이디를 확인해주세요.");
			return false;
		}
		
	}
	
	
</script>
<script>
	function execDaumPostcode() {
	    new daum.Postcode({
	        oncomplete: function(data) {
	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
	            // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
	            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	            var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
	            var extraRoadAddr = ''; // 도로명 조합형 주소 변수
	
	            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	            if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                extraRoadAddr += data.bname;
	            }
	            // 건물명이 있고, 공동주택일 경우 추가한다.
	            if (data.buildingName !== '' && data.apartment === 'Y'){
	               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	            }
	            // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	            if (extraRoadAddr !== ''){
	                extraRoadAddr = ' (' + extraRoadAddr + ')';
	            }
	            // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
	            if (fullRoadAddr !== ''){
	                fullRoadAddr += extraRoadAddr;
	            }
	
	            // 우편번호와 주소 정보를 해당 필드에 넣는다.
	            document.getElementById('zipcode').value = data.zonecode; //5자리 새우편번호 사용
	            document.getElementById('roadAddress').value = fullRoadAddr;
	            document.getElementById('jibunAddress').value = data.jibunAddress;
	
	        }
	    }).open();
	}
</script>
</head>

<body>

    <!-- Header Section Begin -->
    <!-- Header End -->

    <!-- Normal Breadcrumb Begin -->
    <section class="normal-breadcrumb set-bg" data-setbg="${contextPath }/resources/img/welcome_login.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="normal__breadcrumb__text">
                        <h2>회원가입</h2>
                        <p>다양한 작품을 무제한으로 시청하세요.</p>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Normal Breadcrumb End -->

    <!-- Signup Section Begin -->
    <section class="signup spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-6">
                    <div class="login__form">
                        <h3>회원 정보</h3>
                        <form action="${contextPath }/member/join" method="post" onsubmit="return checkValidationField()">
                       		<h5>아이디</h5>
                            <div class="input__item">
                                <input type="text" placeholder="아이디" name="memberId" id="memberId">
                                <span class="icon_profile"></span>
                            </div>
                            <input type="button" id="btnOverlapped" value="중복확인" />
                            <br>
                            <h5>비밀번호</h5>
                            <div class="input__item">
                                <input type="password" placeholder="비밀번호" name="memberPw">
                                <span class="icon_lock"></span>
                            </div>
                            <h5>이름</h5>
                            <div class="input__item">
                                <input type="text" placeholder="이름" name="memberName">
                                <span class="icon_profile"></span>
                            </div>
                            <h5>닉네임</h5>
                            <div class="input__item">
                                <input type="text" placeholder="닉네임" id="memberNickname" name="memberNickname">
                                <span class="icon_profile"></span>
                            </div>
                            <input type="button" id="btnOverlappedNickname" value="중복확인" />
                            <br>
	                        <h5>이메일</h5>
	                        <div class="input__item">
                                <input type="email" placeholder="이메일" name="email">
                                <span class="icon_mail"></span>
                            </div>
                            <input id="emailstsYn" type="checkbox" name="emailstsYn" value="Y" checked/>
	                		스프링에서 발송하는 E-mail을 수신합니다.
                            <br>
	                        <div>
	                        <h5>성별</h5>
                            <input type="radio" name="memberGender" value="man" checked /> 남성
							<input type="radio" name="memberGender" value="women" />여성
	                        </div>
                            <div>
                            <h5>생년월일</h5>
                            <select name="memberBirthY" style="background-color:#FF0000">
								<c:forEach var="year" begin="1" end="70">
									<option value="${1952 + year}" selected>${1952 + year}</option>
								</c:forEach>
							</select> 년 &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
							<input type="radio" name="memberBirthGn" value="2" checked /> 양력
							<input type="radio" name="memberBirthGn" value="1" />음력
							<hr>
							<select name="memberBirthM" style="background-color:#FF0000">
							  	<c:forEach var="month" begin="1" end="12">
								   <option value="${month}">${month }</option>
							  	</c:forEach>
							</select> 월
							<hr>
							<select name="memberBirthD" style="background-color:#FF0000">
								<c:forEach var="day" begin="1" end="31">
									<option value="${day}" selected>${day}</option>
								</c:forEach>
							</select>  일
                            </div>
							<hr>
                            <div>
                            <h5>핸드폰번호</h5>
                            <select name="hp1" style="color:#343a40">
								<option>없음</option>
								<option selected value="010">010</option>
								<option value="011">011</option>
								<option value="019">019</option>
							</select> - 
							<input size="10px" type="text" name="hp2"> - 
							<input size="10px" type="text" name="hp3">
							<hr>
							<input id="smsstsYn" type="checkbox" name="smsstsYn"  value="Y" checked/>
			                스프링에서 발송하는 SMS 소식을 수신합니다.
                            </div>
                            <hr>
                            <div>
                            <h5>주소</h5>
                                <input type="text" placeholder="우편번호 입력" id="zipcode" name="zipcode" >
				                <input type="button" onclick="javascript:execDaumPostcode()" value="검색">
				                <br> <br>
				                도로명 주소 : <input type="text" name="roadAddress" id="roadAddress"> <br>
								지번 주소   :  <input type="text"  name="jibunAddress" id="jibunAddress"> <br>
								나머지 주소: <input type="text" name="namujiAddress" id="namujiAddress"/>
                            </div>
                            <br>
                            <button type="submit" class="site-btn">가입하기</button>
                        </form>
                        <h5>이미 계정이 존재합니까? <a href="${contextPath }/member/login">로그인하러가기</a></h5>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="login__social__links">
                        <h3>계정 연동</h3>
                        <ul>	
                            <li><a href="#" class="facebook"><i class="fa fa-facebook"></i> 페이스북 계정으로 가입</a>
                            </li>
                            <li><a href="#" class="google"><i class="fa fa-google"></i> 구글 계정으로 가입</a></li>
                            <li><a href="#" class="twitter"><i class="fa fa-twitter"></i> 트위터 계정으로 가입</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Signup Section End -->

    <!-- Footer Section Begin -->
      <!-- Footer Section End -->

      <!-- Search model Begin -->
    <!-- Search model end -->

</body>

</html>