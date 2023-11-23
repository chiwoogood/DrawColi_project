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
   
       <style>
        /* Textarea 스타일링 */
        .styled-textarea {
            width: 100%;
            min-height: 200px; /* 원하는 높이로 조절하세요 */
            padding: 10px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 5px;
            resize: none; /* 크기 조절 비활성화 */
        }
        
        /* Optional: 포커스 시 스타일 변경 */
        .styled-textarea:focus {
            border-color: #007BFF;
            box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
        }
    </style>
</head>
<body style="overflow-x: hidden;">
		      <%@ include file="/WEB-INF/header.jsp"%>
		      <section id="login-intro" class="login-section">
		      <div class="log-in">
		         <div class="login-top">
		            <img src="${cpath}/images/main-banner1.png" alt="banner" class="login-img">
		            <div class="login-content">
		               <h2 class="login-title">Upload</h2>
		            </div><!--banner-content-->
		         </div><!--slider-item-->
		      </div>
		      </section>
    <div class="container mt-4">
        <div class="card">
            <div class="card-header">
                <h2>COLI GALLERY - 게시글 수정</h2>
            </div>
            <form action="${cpath}/board/modify" method="POST">
                <div class="card-body">
                    <input type="hidden" name="atc_id" value="${article.atc_id}">
                    <div class="mb-3">
                        <label for="atc_title" class="form-label">제목</label>
                        <input type="text" class="form-control" id="atc_title" name="atc_title" value="${article.atc_title}" required>
                    </div>
                    <div class="mb-3">
                        <label for="atc_content" class="form-label">내용</label>
                        <textarea class="form-control styled-textarea" id="atc_content" name="atc_content" required>${article.atc_content}</textarea>
                    </div>
                </div>
                <div class="card-footer text-center">
                    <button type="submit" class="btn btn-warning me-2">수정하기</button>
                    <a href="javascript:history.back()" class="btn btn-secondary">취소</a>
                </div>
            </form>
        </div>
    </div>
   <script>
       // 파일 업로드 폼 전송 함수
       function submitFileUploadForm() {
           // 파일 업로드 폼을 서브밋
           var fileUploadForm = document.getElementById("fileUploadForm");
           fileUploadForm.submit();
       }
   
       // 글 작성 폼 전송 함수
       function submitArticleForm() {
           // 글 작성 폼을 서브밋
           var articleForm = document.getElementById("articleForm");
           articleForm.submit();
       }
       function updateArticleForm(){
    	   
       }
       function deleteArticleForm(){
    	   
       }
   </script>
    <script>
    // 문서가 로드된 후 실행될 JavaScript 코드
       document.addEventListener('DOMContentLoaded', function() {
           // content_BODY 요소를 선택
           var atc_content = document.getElementById('atc_content');
   
           // content_BODY를 클릭할 때 실행되는 함수
           atc_content.addEventListener('click', function() {
               // content_BODY 내용을 빈 문자열로 설정하여 텍스트를 사라지게 함
               atc_content.innerHTML = '';
           });
       });
   </script>
   
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