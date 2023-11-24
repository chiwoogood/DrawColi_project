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
		                <h2>COLI GALLERY</h2>
		                <p>회원님들의 작품을 올려주세요.</p>
		            </div>
		            <div class="card-body">
		                <h5 class="card-title">제목 :${article.atc_title}</h5>
		                <p class="card-text">내용 : ${article.atc_content}</p>
		                <p class="card-text">게시일 : ${article.created_at} </p>
		            </div>
		            <div class="card-footer text-center">
		                <a href="${cpath}/board/gallery" class="btn btn-primary me-2">목록</a>
						<form action="${cpath}/board/modify" method="GET" class="d-inline">
						    <input type="hidden" name="atc_id" value="${atc_id}">
						    <button type="submit" class="btn btn-warning me-2">수정</button>
						</form>
		                <form action="${cpath}/board/remove" method="POST" class="d-inline">
		                    <input type="hidden" name="atc_id" value="${atc_id}">
		                    <button type="submit" class="btn btn-danger me-2">삭제</button>
		                </form>
		                <a href="javascript:history.back()" class="btn btn-secondary">취소</a>
		            </div>
		        </div>
		    </div>
		    
		    
		    <!-- 댓글 -->
			<div id="comment-form-container">
			    <h3>댓글 남기기</h3>
			    <form id="commentForm">
			        <input type="hidden" id="atc_id" name="atc_id" value="${article.atc_id}"> <!-- 게시글 ID -->
			        <div class="form-group">
			            <label for="comment_author">ID : ${user.member.username}</label>
			        </div>
			        <div class="form-group">
			            <label for="comment_content">댓글:</label>
			            <textarea id="comment_content" name="content" required></textarea>
			        </div>
			        <button type="button" onclick="commentSubmit()">댓글 작성</button>
			    </form>
			</div>
			<div id="comments">
			    <!-- 여기에 댓글 목록이 동적으로 표시됩니다 -->
			</div>
			<!-- 댓글 -->
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
	function commentSubmit() {
	    console.log("댓글작성시도");
	    var atc_id = $('#atc_id').val();
	    var comment_content = $('#comment_content').val();
	    
	    $.ajax({
	        type: 'POST',
	        url: '${cpath}/board/commentRegister', // 댓글 작성을 처리하는 서버의 URL
	        data: {"comment_content": comment_content, "atc_id": atc_id},
	        success: function(response) {
	            console.log("성공");
	            $("#comment_content").val(''); // 댓글 입력란 초기화
	            loadComments(); // 댓글 목록 갱신
	        },
	        error: function() {
	            alert('댓글 작성 중 오류가 발생했습니다.');
	        }
	    });
	}

	</script>

<script src="${cpath}/js/ui-easing.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<script src="https://unpkg.com/isotope-layout@3/dist/isotope.pkgd.min.js"></script>
<script src="${cpath}/js/plugins.js"></script>
<script src="${cpath}/js/script.js"></script>
</body>

</html>