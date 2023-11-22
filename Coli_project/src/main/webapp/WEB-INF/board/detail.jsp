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
      <div id="write-container">
       <div id="contents">
           <div class="xans-element- xans-board xans-board-writepackage-4 xans-board-writepackage xans-board-4">
               <div class="xans-element- xans-board xans-board-title-4 xans-board-title xans-board-4 ">
                   <div class="title">
                       <h2>
                           <font color="#555555">COLI GALLERY</font>
                       </h2>
                       <p>회원님들의 작품을 올려주세요.</p>
                   </div>
               </div>
               <!-- 파일 업로드 폼 -->
               <form id="fileUploadForm" action="${cpath}/board/articleFileUpload" method="post" target="_self" enctype="multipart/form-data">
                   <div class="xans-element- xans-board xans-board-write-4 xans-board-write xans-board-4">
                       <div class="ec-base-box typeProduct">
                           <p class="thumbnail">
                               <a href>
                                   <img id="iPrdImg" src="//img.echosting.cafe24.com/thumb/75x75.gif" onerror="this.src='//img.echosting.cafe24.com/thumb/75x75.gif'">
                               </a>
                           </p>
                           <div class="information">
                               <p>대표이미지를 선택해 주세요.</p>
                               <p class="button">
                                   <span>
                                       <input type="file" id="fileInput" name="file" style="display: none;">
                                       <a href="#none" onclick="document.getElementById('fileInput').click();">
                                           <img src="${cpath}/images/image/file_upload.png" alt="파일업로드">
                                       </a>
                                   </span>
                               </p>
                           </div>
                       </div>
                   </div>
               </form>
               
               <!-- 글 작성 폼 -->
               <form id="articleForm" action="${cpath}/board/register" method="post">
                   <div class="xans-element- xans-board xans-board-write-4 xans-board-write xans-board-4">
                       <div class="ec-base-table typeWrite ">
                           <table border="1" summary>
                               <caption>글쓰기 폼</caption>
                               <colgroup>
                                   <col style="width:130px;">
                                   <col style="width:auto;">
                               </colgroup>
                               <tbody>
                                   <tr>
                                 <th scope="row">제목</th>
                                 <td>
                                    <input id="atc_title" name="atc_title" fw-filter="isFill" fw-label="제목" fw-msg class="inputTypeText" placeholder maxlength="125" value type="text">
                                 </td>
                              </tr>
                                   <tr>
                                       <td colspan="2" class="clear">
											<textarea class="styled-textarea" id="atc_content" name="atc_content"></textarea>
                                       </td>
                                   </tr>
                               </tbody>
                               <tbody>
                                 <tr>
                                    <th scope="row" style="border: none!important;">첨부파일</th>
                                    <td style="border: none!important;">
                                       <input name="attach_file[]" type="file" style="background-color: transparent;" onchange="submitFileUploadForm()">
                                    </td>
                                 </tr>
                               </tbody>
                           </table>
                       </div>
                       <div class="ec-base-button ">
                        <span class="gLeft">
                           <a href="${cpath}/board/gallery" class="Button button-rounded button-small" >목록</a>
                        </span>
                        <span class="gRight">
                           <a href="#none" onclick="submitArticleForm()" class="Button button-rounded button-normal black">등록</a>
                           <a href="" class="Button button-rounded button-normal">취소</a>
                        </span>
                     </div>
                   </div>
               </form>
           </div>
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