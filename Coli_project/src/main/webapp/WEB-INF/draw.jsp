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
      
   <script src="https://cdn.jsdelivr.net/npm/@mediapipe/pose/pose.js" crossorigin="anonymous"></script>
</head>
<body>
   <%@ include file="/WEB-INF/header.jsp"%>
      <section id="login-intro" class="login-section"">
      <div class="log-in"">
         <div class="login-top"">
            <img src="${cpath}/images/main-banner1.png" alt="banner" class="login-img">
            <div class="login-content">
               <h2 class="login-title">Draw</h2>
            </div><!--banner-content-->
         </div><!--slider-item-->
                  
         <div class="contentarea">
              <h1>
                  Using Javascript to capture Photo
              </h1>
              <div class="camera">
                  <video id="video">Video stream not available.</video>
              </div>
              <div><button id="startbutton">Take photo</button></div>
              <canvas id="canvas"></canvas>
              <div class="output">
                  <img id="photo" alt="The screen capture will appear in this box.">
              </div>
          </div>
          <button id="savebutton">Save Results</button>
   
   
   <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
   <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
   <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
      
   <script src="${cpath}/js/jquery-1.11.0.min.js"></script>
   <script src="${cpath}/js/ui-easing.js"></script>
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
      crossorigin="anonymous"></script>
   <script src="${cpath}/js/plugins.js"></script>
   <script src="${cpath}/js/script.js"></script>
   
    <script type="text/javascript">
    (function () {
        var width = 320;
        var height = 0;
        var streaming = false;
        var video = null;
        var canvas = null;
        var photo = null;
        var startbutton = null;
        
        // 전역으로 pose 객체 선언
        var pose = null;

        function startup() {
            video = document.getElementById('video');
            canvas = document.getElementById('canvas');
            photo = document.getElementById('photo');
            startbutton = document.getElementById('startbutton');

            navigator.mediaDevices.getUserMedia({
                    video: true,
                    audio: false
                })
                .then(function (stream) {
                    video.srcObject = stream;
                    video.play();
                })
                .catch(function (err) {
                    console.log("An error occurred: " + err);
                });

            video.addEventListener('canplay', function (ev) {
                if (!streaming) {
                    height = video.videoHeight / (video.videoWidth / width);

                    if (isNaN(height)) {
                        height = width / (4 / 3);
                    }

                    video.setAttribute('width', width);
                    video.setAttribute('height', height);
                    canvas.setAttribute('width', width);
                    canvas.setAttribute('height', height);
                    streaming = true;
                }
            }, false);

            startbutton.addEventListener('click', function (ev) {
                takepicture();
                ev.preventDefault();
            }, false);
            
            var saveButton = document.getElementById('savebutton');
            saveButton.addEventListener('click', function (ev) {
                saveResults();
                ev.preventDefault();
            }, false);

            clearphoto();
        }

        function saveResults() {
            if (pose && pose.lastResults && pose.lastResults.poseLandmarks) {
                // poseLandmarks 데이터에서 x, y, z 값을 객체 형태로 추출하여 배열로 변환
                var landmarksData = pose.lastResults.poseLandmarks.map(landmark => ({
                    x: landmark.x,
                    y: landmark.y,
                    z: landmark.z
                }));

                // 결과 배열을 JSON 문자열로 변환
                var jsonString = JSON.stringify(landmarksData, null, 2); // 포맷팅을 위해 추가적인 인자 사용

                // JSON 파일 다운로드
                downloadJSON(jsonString, 'pose_landmarks.json');
            } else {
                console.log('No results to save.');
            }
        }

        function downloadJSON(data, filename) {
            var blob = new Blob([data], { type: 'application/json' });
            var link = document.createElement('a');
            link.href = URL.createObjectURL(blob);
            link.download = filename;
            document.body.appendChild(link);
            link.click();
            document.body.removeChild(link);
        }



        function clearphoto() {
            var context = canvas.getContext('2d');
            context.fillStyle = "#AAA";
            context.fillRect(0, 0, canvas.width, canvas.height);

            var data = canvas.toDataURL('image/png');
            photo.setAttribute('src', data);
        }

        function takepicture() {
            var context = canvas.getContext('2d');
            if (width && height) {
                canvas.width = width;
                canvas.height = height;
                context.drawImage(video, 0, 0, width, height);

                // 이미지 데이터 얻기
                var imageData = context.getImageData(0, 0, width, height);
                var data = canvas.toDataURL('image/png');
                photo.setAttribute('src', data);
                // 딜레이를 둔 후에 이미지 분석
                setTimeout(function () {
                    analyzeImage(imageData);
                }, 1000);
            } else {
                clearphoto();
            }
        }

        function analyzeImage(imageData) {
            if (!pose) {
                pose = new Pose({
                    locateFile: (file) => {
                       return 'https://cdn.jsdelivr.net/npm/@mediapipe/pose/' + file;
                    }
                });

                pose.setOptions({
                    upperBodyOnly: true,
                    modelComplexity: 1,
                    smoothLandmarks: true,
                    enableSegmentation: false,
                    minDetectionConfidence: 0.5,
                    minTrackingConfidence: 0.5
                });

                pose.onResults((results) => {
                    console.log(results);
                    pose.lastResults = results; // 결과 업데이트
                    
                });
            }

            // Mediapipe에 이미지 전달
            pose.send({
                image: imageData
            });
        }
        


        window.addEventListener('load', startup, false);
    })();


    </script>
      
</body>

</html>