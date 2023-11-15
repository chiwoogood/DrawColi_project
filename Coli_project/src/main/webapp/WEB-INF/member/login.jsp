<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="cpath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">
<head>
  <title>DrawColi</title>
  <meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="format-detection" content="telephone=no">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="author" content="TemplatesJungle">
	<meta name="keywords" content="Free HTML Template">
	<meta name="description" content="Free HTML Template">
	
	<link rel="stylesheet" type="text/css" href="${cpath}/icomoon/icomoon.css">
	<link rel="stylesheet" type="text/css" href="${cpath}/css/vendor.css">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
		integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
	<link rel="stylesheet" type="text/css" href="${cpath}/css/style.css">

	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link
		href="https://fonts.googleapis.com/css2?family=Montserrat:wght@900&family=Roboto:ital,wght@0,400;0,700;1,400;1,700&display=swap"
		rel="stylesheet">
</head>
<body>
		<%@ include file="/WEB-INF/header.jsp"%>
		<section id="login-intro" class="login-section">
		<div class="log-in">
			<div class="login-top">
				<img src="${cpath}/images/main-banner1.png" alt="banner" class="login-img">
				<div class="login-content">
					<h2 class="login-title">Member</h2>
				</div><!--banner-content-->
			</div><!--slider-item-->
		
		<div class="login-container">
		  <!-- Heading -->
		  <h1 class="login-h1">SIGN IN</h1>
		  
		  <!-- Links -->
		  <ul class="login-links">
		    <li>
		      <a href="#" id="signin">SIGN IN</a>
		    </li>
		    <li>
		      <a href="#" id="signup">SIGN UP</a>
		    </li>
		    <li>
		      <a href="#" id="reset">RESET</a>
		    </li>
		  </ul>
		  
		  <!-- Form -->
		  <form action="${cpath}/member/join" method="post" class="login-form">
		    <!-- id input -->
		    <div class="input__block signin-input__block">
		       <input type="text" name="username" placeholder="id" class="input" id="id"   />
		    </div>
		    <!-- password input -->
		    <div class="input__block signin-input__block">
		       <input type="password" name="password" placeholder="Password" class="input" id="password"    />
		    </div>
		    <!-- repeat password input -->
		    <div class="input__block signup-input__block">
		       <input type="password" name="passwordConfirmation" placeholder="Repeat password" class="input" id="password"    />
		    </div>
		    <!-- name input -->
		    <div class="input__block signup-input__block">
		       <input type="text" name="name" placeholder="name" class="input" id="name"   />
		    </div>
		    <!-- nickname input -->
		    <div class="input__block signup-input__block">
		       <input type="text" name="nickname" placeholder="nickname" class="input" id="nickname"   />
		    </div>
		    <!-- birth input -->
		    <div class="input__block signup-input__block">
		       <input type="date" name="birth" placeholder="birth" class="input" id="birth"   />
		    </div>
		    <!-- email input -->
		    <div class="input__block signup-input__block">
		       <input type="email" name="email" placeholder="Email" class="input" id="email"   />
		    </div>
		    <!-- phone input -->
		    <div class="input__block signup-input__block">
		       <input type="tel" name="phone" placeholder="phone" class="input" id="phone"   />
		    </div>
		    <!-- sign in button -->
		    <button class="signin__btn">
		      Sign in
		    </button>
		  </form>
		  
		  <!-- separator -->
		  <div class="login-separator">
		    <p>OR</p>
		  </div>
		  
		  <!-- google button -->
		  <button class="google__btn">
		    <i class="fa fa-google"></i>
		    Sign in with Kakao
		  </button>
		  
		  <!-- google button -->
		  <button class="github__btn">
		    <i class="fa fa-github"></i>
		    Sign in with Naver
		  </button>
		</div>


		<script src="${cpath}/js/jquery-1.11.0.min.js"></script>
		<script src="${cpath}/js/ui-easing.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
			crossorigin="anonymous"></script>
		<script src="${cpath}/js/plugins.js"></script>
		<script src="${cpath}/js/script.js"></script>
		
		<script type="text/javascript">
		$(document).ready(function(){
			  let signup = $(".login-links").find("li").find("#signup");
			  let signin = $(".login-links").find("li").find("#signin");
			  let reset  = $(".login-links").find("li").find("#reset");
			  let first_input = $(".login-form").find(".signin-input__block");
			  let hidden_input = $(".login-form").find(".signup-input__block");
			  let signin_btn  = $(".login-form").find(".signin__btn");

			  // 초기 화면 설정: id와 password만 보이게
			  first_input.css("display", "block");
			  hidden_input.css("display", "none");

			  //----------- sign up ---------------------
			  signup.on("click",function(e){
			    e.preventDefault();
			    $(this).parent().parent().siblings(".login-h1").text("SIGN UP");
			    $(this).parent().css("opacity","1");
			    $(this).parent().siblings().css("opacity",".6");
			    first_input.removeClass("signin-input__block").addClass("signup-input__block");
			    hidden_input.css({
			      "opacity" : "1",
			      "display" : "block"
			    });
			    $(".login-form").find(".signup-input__block").css("display", "block");
			    signin_btn.text("Sign up");
			  });

			  //----------- sign in ---------------------
			  signin.on("click",function(e){
			    e.preventDefault();
			    $(this).parent().parent().siblings(".login-h1").text("SIGN IN");
			    $(this).parent().css("opacity","1");
			    $(this).parent().siblings().css("opacity",".6");
			    first_input.css("display", "block");
			    hidden_input.css("display", "none");
			    signin_btn.text("Sign in");
			  });

			  //----------- reset ---------------------
			  reset.on("click",function(e){
			    e.preventDefault();
			    $(this).parent().parent().siblings(".login-form")
			    .find(".input__block").find(".input").val("");
			  });
			});
		</script>
</body>

</html>