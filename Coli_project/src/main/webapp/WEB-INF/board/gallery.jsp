<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="cpath" value="${pageContext.request.contextPath}" />
<c:set var="user" value="${SPRING_SECURITY_CONTEXT.authentication.principal}" />
<c:set var="auth" value="${SPRING_SECURITY_CONTEXT.authentication.authorities}" />
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
   <link rel="stylesheet" type="text/css" href="${cpath}/css/pricing-plan.css">
   <link rel="stylesheet" type="text/css" href="${cpath}/css/form.css">
   
   <link rel="preconnect" href="https://fonts.googleapis.com">
   <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>  
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
               <h2 class="login-title">Gallery</h2>
            </div><!--banner-content-->
         </div><!--slider-item-->
      </div>
      </section>
      
      <div id="wrap" class="layout">
         <div id="container" style="margin-top: 0px;">
            <div id="contents">
               <div class="xans-element- xans-product xans-product-headcategory title ">
                  <p class="banner"></p> 
                  <h2>
                     <span>user gallery</span>
                  </h2>
               </div>
               <div class="xans-element- xans-product xans-product-normalpackage ">
                  <div class="xans-element- xans-product xans-product-normalmenu ">
                     <div class="function">
                        <p class="prdCount">
                        TOTAL : 
                        <strong>44</strong>
                        개
                        </p>                        
                     </div>
                  </div>
                  <div class="xans-element- xans-product xans-product-listnormal ec-base-product">
                     <ul class="prdList grid3">
                        <!-- 반복 -->
                        <c:forEach items="${allArticles}" var="article">
                            <li id="anchorBoxId_367" class="xans-record-">
                                <div class="thumbnail">
                                    <div class="prdImg">
                                        <a href="#}">
                                            <img src="" alt="">
                                        </a>
                                    </div>
                                    <div class="description" style="cursor:text;">
                                        <strong class="name">
                                            <a href="${cpath}/board/detail/${article.atc_id}">
                                                <span style="font-size:12px;color:#000000;">${article.atc_title}</span>
                                            </a>
                                        </strong>
                                        <ul class="xans-element- xans-product xans-product-listitem spec">
                                            <li class="xans-record-">
                                                <strong class="title">
                                                    <span style="font-size:12px;color:#555555;">작성자${article.writer_id.username}</span>
                                                </strong>
                                                <span style="font-size:12px;color:#000000;font-weight:bold;">${article.writer_id.username}</span>
                                            </li>
                                        </ul>
           								<ul class="xans-element- xans-product xans-product-listitem spec">
                                            <li class="xans-record-">
                                                <strong class="title">
                                                    <span style="font-size:12px;color:#555555;">작성시간${article.created_at}</span>
                                                </strong>
                                                <span style="font-size:12px;color:#000000;font-weight:bold;">${article.created_at}</span>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </li>
                        </c:forEach>
                          <!-- 반복 -->
                     </ul>
                  </div>
               </div>
               <!-- 페이지네이션 및 기타 요소들은 원본과 동일하게 유지 -->
            </div>
         </div>
      </div>

   <script src="${cpath}/js/jquery-1.11.0.min.js"></script>
   <script src="${cpath}/js/ui-easing.js"></script>
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
           integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
           crossorigin="anonymous"></script>
   <script src="https://unpkg.com/isotope-layout@3/dist/isotope.pkgd.min.js"></script>
   <script src="${cpath}/js/plugins.js"></script>
   <script src="${cpath}/js/script.js"></script>
   
   
</body>

</html>