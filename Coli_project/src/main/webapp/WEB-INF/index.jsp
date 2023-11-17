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

   <link rel="stylesheet" type="text/css" href="icomoon/icomoon.css">
   <link rel="stylesheet" type="text/css" href="css/vendor.css">
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
   <link rel="stylesheet" type="text/css" href="css/style.css">

   <link rel="preconnect" href="https://fonts.googleapis.com">
   <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
   <link
      href="https://fonts.googleapis.com/css2?family=Montserrat:wght@900&family=Roboto:ital,wght@0,400;0,700;1,400;1,700&display=swap"
      rel="stylesheet">
</head>
<body>

   <%@ include file="/WEB-INF/header.jsp"%>

   <section id="intro" class="scrollspy-section">
      <div class="main-slider">
         <div class="slider-item jarallax" data-speed="0.2">
            <img src="images/main-banner1.png" alt="banner" class="jarallax-img">
            <div class="banner-content">
               <h2 class="banner-title txt-fx">Draw Coli</h2>
               <div class="btn-wrap">
                  <a href="${cpath}/board/draw" class="btn-with-line">Let's Draw</a>
               </div>
            </div><!--banner-content-->
         </div><!--slider-item-->

         <div class="slider-item jarallax" data-speed="0.2">
            <img src="images/main-banner2.png" alt="banner" class="jarallax-img">
            <div class="banner-content">
               <h2 class="banner-title txt-fx">Move, it will be drawn</h2>
               <div class="btn-wrap">
                  <a href="#" class="btn-with-line">Let's Draw</a>
               </div>
            </div><!--banner-content-->
         </div><!--slider-item-->

         <div class="slider-item jarallax" data-speed="0.2">
            <img src="images/main-banner3.png" alt="banner" class="jarallax-img">
            <div class="banner-content">
               <h2 class="banner-title txt-fx">My own character</h2>
               <div class="btn-wrap">
                  <a href="draw.jsp" class="btn-with-line">Let's Draw</a>
               </div>
            </div><!--banner-content-->
         </div><!--slider-item-->
      </div><!--slider-->

      <div class="button-container">
         <button class="prev slick-arrow">
            <i class="icon icon-chevron-thin-left"></i>
         </button>
         <button class="next slick-arrow">
            <i class="icon icon-chevron-thin-right"></i>
         </button>
      </div>
   </section>

   <section id="about" class="scrollspy-section padding-xlarge">
      <div class="container">
         <div class="row">

            <div class="col-md-12">

               <div class="section-header">
                  <div class="title">
                     <span>What's Drawcoli?</span>
                  </div>
                  <h2 class="section-title">About Us</h2>
               </div>
            </div>

         </div>

         <div class="row">

            <div class="col-md-6">
               <figure class="jarallax-keep-img">
                  <img src="images/singleimage.jpg" alt="about us" class="jarallax-img single-image">
               </figure>
            </div>
            <div class="col-md-6 description text-lead">
               <p><strong>처음 그림을 그리시는 분들도 쉽게 그림을 그릴 수 있도록 도와주는 웹 서비스입니다.
               인체그리기가 어려우신 분들은 저희 드로콜리를 통해 자동으로 생성된 3D모델 위에 작업을 하게되면
               완벽한 인체 그림을 그릴 수 있습니다.</strong></p>
               <p>저희가 제공하는 기본 포즈들을 이용해서 모델을 생성해도 되고,
               원하는 포즈를 취한 이미지를 업로드해서 모델을 생성해도 좋습니다.
               두 가지 방법으로 원하는 포즈를 찾지 못했다면 직접 영상을 촬영해보세요! 나의 움직임에 따라 모델이 생성됩니다.</p>
               <p>드로콜리가 제공하는 캐릭터를 이용해 나만의 캐릭터를 만들어보세요.
               내가 가지고 있는 캐릭터가 있다면 생성된 모델에 적용시켜보세요!
               내가 원하는 자세로 캐릭터가 생성됩니다.</p>

               <div class="btn-wrap">
                  <a href="#" class="btn btn-accent btn-xlarge btn-rounded">GO TO MAKE</a>
               </div>

            </div>

         </div>

      </div>
   </section>

   <section id="portfolio" class="scrollspy-section bg-dark padding-large">
      <div class="container">

         <div class="row">
            <div class="col-md-12">

               <div class="section-header">
                  <div class="title">
                     <span>Some of Our Works</span>
                  </div>
                  <h2 class="section-title light">Our Portfolio</h2>
               </div>
            </div>
         </div>

         <div class="row">

            <div id="filters" class="button-group d-flex flex-wrap gap-4 py-5" data-aos="fade-up">
               <a href="#" class="btn btn-outline-light rounded-pill text-uppercase is-checked"
                  data-filter=".design">3DMODEL</a>
               <a href="#" class="btn btn-outline-light rounded-pill text-uppercase"
                  data-filter=".interior">CHARACTER</a>
               <a href="#" class="btn btn-outline-light rounded-pill text-uppercase"
                  data-filter=".landscape">WEBTOON</a>
            </div>

         </div>

         <div class="grid p-0 clearfix row row-cols-2 row-cols-lg-3 row-cols-xl-3" data-aos="fade-up">
            <div class="col mb-4 portfolio-item construction interior">
               <a href="images/portfolio-large-2.jpg" class="image-link"
                  title="Sample Caption goes here for Portfolio Item 1."><img src="images/portfolio-thumb-1.jpg"
                     class="img-fluid" alt="portfolio"></a>
            </div>
            <div class="col mb-4 portfolio-item construction construction">
               <a href="images/portfolio-large-2.jpg" class="image-link"
                  title="Sample Caption goes here for Portfolio Item 2."><img src="images/portfolio-thumb-2.jpg"
                     class="img-fluid" alt="portfolio"></a>
            </div>
            <div class="col mb-4 portfolio-item construction">
               <a href="images/portfolio-large-2.jpg" class="image-link"
                  title="Sample Caption goes here for Portfolio Item 3."><img src="images/portfolio-thumb-11.jpg"
                     class="img-fluid" alt="portfolio"></a>
            </div>
            <div class="col mb-4 portfolio-item construction">
               <a href="images/portfolio-large-2.jpg" class="image-link"
                  title="Sample Caption goes here for Portfolio Item 4."><img src="images/portfolio-thumb-4.jpg"
                     class="img-fluid" alt="portfolio"></a>
            </div>
            <div class="col mb-4 portfolio-item interior">
               <a href="images/portfolio-large-2.jpg" class="image-link"
                  title="Sample Caption goes here for Portfolio Item 5."><img src="images/portfolio-thumb-5.jpg"
                     class="img-fluid" alt="portfolio"></a>
            </div>
            <div class="col mb-4 portfolio-item design">
               <a href="images/portfolio-large-1.jpg" class="image-link"
                  title="Sample Caption goes here for Portfolio Item 6."><img src="images/portfolio-thumb-6.jpg"
                     class="img-fluid" alt="portfolio"></a>
            </div>
            <div class="col mb-4 portfolio-item design">
               <a href="images/portfolio-large-1.jpg" class="image-link"
                  title="Sample Caption goes here for Portfolio Item 7."><img src="images/portfolio-thumb-7.jpg"
                     class="img-fluid" alt="portfolio"></a>
            </div>
            <div class="col mb-4 portfolio-item design">
               <a href="images/portfolio-large-1.jpg" class="image-link"
                  title="Sample Caption goes here for Portfolio Item 8."><img src="images/portfolio-thumb-8.jpg"
                     class="img-fluid" alt="portfolio"></a>
            </div>
            <div class="col mb-4 portfolio-item design">
               <a href="images/portfolio-large-2.jpg" class="image-link"
                  title="Sample Caption goes here for Portfolio Item 9."><img src="images/portfolio-thumb-9.jpg"
                     class="img-fluid" alt="portfolio"></a>
            </div>
            <div class="col mb-4 portfolio-item design">
               <a href="images/portfolio-large-2.jpg" class="image-link"
                  title="Sample Caption goes here for Portfolio Item1 0."><img src="images/portfolio-thumb-10.jpg"
                     class="img-fluid" alt="portfolio"></a>
            </div>
            <div class="col mb-4 portfolio-item design">
               <a href="images/portfolio-large-1.jpg" class="image-link"
                  title="Sample Caption goes here for Portfolio Item1 1."><img src="images/portfolio-thumb-11.jpg"
                     class="img-fluid" alt="portfolio"></a>
            </div>
            <div class="col mb-4 portfolio-item construction">
               <a href="images/portfolio-large-1.jpg" class="image-link"
                  title="Sample Caption goes here for Portfolio Item1 2."><img src="images/portfolio-thumb-2.jpg"
                     class="img-fluid" alt="portfolio"></a>
            </div>
            <div class="col mb-4 portfolio-item interior">
               <a href="images/portfolio-large-1.jpg" class="image-link"
                  title="Sample Caption goes here for Portfolio Item 1."><img src="images/portfolio-thumb-3.jpg"
                     class="img-fluid" alt="portfolio"></a>
            </div>
            <div class="col mb-4 portfolio-item landscape">
               <a href="images/portfolio-large-2.jpg" class="image-link"
                  title="Sample Caption goes here for Portfolio Item 2."><img src="images/portfolio-thumb-8.jpg"
                     class="img-fluid" alt="portfolio"></a>
            </div>
            <div class="col mb-4 portfolio-item landscape">
               <a href="images/portfolio-large-1.jpg" class="image-link"
                  title="Sample Caption goes here for Portfolio Item 3."><img src="images/portfolio-thumb-1.jpg"
                     class="img-fluid" alt="portfolio"></a>
            </div>
            <div class="col mb-4 portfolio-item interior">
               <a href="images/portfolio-large-1.jpg" class="image-link"
                  title="Sample Caption goes here for Portfolio Item 4."><img src="images/portfolio-thumb-4.jpg"
                     class="img-fluid" alt="portfolio"></a>
            </div>
            <div class="col mb-4 portfolio-item interior">
               <a href="images/portfolio-large-2.jpg" class="image-link"
                  title="Sample Caption goes here for Portfolio Item 5."><img src="images/portfolio-thumb-5.jpg"
                     class="img-fluid" alt="portfolio"></a>
            </div>
            <div class="col mb-4 portfolio-item interior">
               <a href="images/portfolio-large-1.jpg" class="image-link"
                  title="Sample Caption goes here for Portfolio Item 6."><img src="images/portfolio-thumb-6.jpg"
                     class="img-fluid" alt="portfolio"></a>
            </div>
            <div class="col mb-4 portfolio-item landscape">
               <a href="images/portfolio-large-1.jpg" class="image-link"
                  title="Sample Caption goes here for Portfolio Item 7."><img src="images/portfolio-thumb-7.jpg"
                     class="img-fluid" alt="portfolio"></a>
            </div>
            <div class="col mb-4 portfolio-item landscape">
               <a href="images/portfolio-large-2.jpg" class="image-link"
                  title="Sample Caption goes here for Portfolio Item 8."><img src="images/portfolio-thumb-8.jpg"
                     class="img-fluid" alt="portfolio"></a>
            </div>
            <div class="col mb-4 portfolio-item landscape">
               <a href="images/portfolio-large-2.jpg" class="image-link"
                  title="Sample Caption goes here for Portfolio Item1 0."><img src="images/portfolio-thumb-10.jpg"
                     class="img-fluid" alt="portfolio"></a>
            </div>
            <div class="col mb-4 portfolio-item construction">
               <a href="images/portfolio-large-1.jpg" class="image-link"
                  title="Sample Caption goes here for Portfolio Item1 1."><img src="images/portfolio-thumb-11.jpg"
                     class="img-fluid" alt="portfolio"></a>
            </div>
            <div class="col mb-4 portfolio-item landscape">
               <a href="images/portfolio-large-2.jpg" class="image-link"
                  title="Sample Caption goes here for Portfolio Item1 2."><img src="images/portfolio-thumb-1.jpg"
                     class="img-fluid" alt="portfolio"></a>
            </div>
         </div>

      </div>
   </section>

   <section id="services" class="scrollspy-section padding-large">
      <div class="container">
         <div class="row">
            <div class="section-header col-12">
               <div class="title">
                  <span>Our Membership</span>
               </div>
               <h2 class="section-title">Service Plan</h2>
            </div>

         </div>

         <div class="row">

            <div class="col-md-4">
               <div class="services-item">
                  <span class="number">01</span>
                  <h3>Free</h3>
                  <p>• 500 개 이상의 다양한 포즈 선택<br>
                     • AI 드로잉 (일 10회 제공)<br>
                     • 기본 캐릭터 제공<br>
                     • 모델 및 캐릭터 다운로드 (일 3회)</p>
               </div>
            </div>

            <div class="col-md-4">
               <div class="services-item">
                  <span class="number">02</span>
                  <h3>Standard</h3>
                  <p>• 500 개 이상의 다양한 포즈 선택<br>
                     • 이미지 업로드를 통한 포즈 생성<br>
                     • AI 드로잉 (무제한)<br>
                     • 기본 캐릭터 제공<br>
                     • 모델 및 캐릭터 다운로드 (무제한)</p>
               </div>

            </div>

            <div class="col-md-4">
               <div class="services-item">
                  <span class="number">03</span>
                  <h3>Pro</h3>
                  <p>• 500 개 이상의 다양한 포즈 선택<br>
                     • 이미지 업로드를 통한 포즈 생성<br>
                     • 영상 인식을 통한 포즈 생성<br>
                     • AI 드로잉 (무제한)<br>
                     • 기본 캐릭터 제공<br>
                     • 모델 및 캐릭터 다운로드 (무제한)</p>
               </div>
            </div>

         </div>

      </div>
   </section>

   <section id="subscribe" class="scrollspy-section padding-small">
      <div class="container">
         <div class="row">
            <div class="col-md-6">
               <figure class="subscribe-image">
                  <img src="images/subscribe-image.png" alt="subscribe">
               </figure>
            </div>
            <div class="col-md-6">
               <div class="subscribe-content">
                  <h2 class="section-title">subscribe us</h2>
                  <p>Join our newsletter to stay updated with super discounts and amazing offers. 300+ have
                     already subscribed us.</p>
                  <form id="form">
                     <input type="text" name="email" placeholder="enter your email address">
                     <button class="btn btn-accent btn-rounded btn-full btn-xlarge">Subscribe</button>
                  </form>
               </div>
            </div>
         </div>
      </div>
   </section>

   <section id="latest-blog" class="scrollspy-section bg-grey padding-large">
      <div class="container">

         <div class="row">

            <div class="col">

               <div class="section-header">
                  <div class="title">
                     <span>read our blog</span>
                  </div>
                  <h2 class="section-title">latest blog</h2>
               </div>
            </div>

         </div>

         <div class="row">
            <div class="col-md-12">

               <div class="post-grid">
                  <div class="row">

                     <div class="col-md-4">

                        <article class="post-item">

                           <figure>
                              <a href="#" class="image-hvr-effect">
                                 <img src="images/postimg1.jpg" alt="post" class="post-image">
                              </a>
                           </figure>

                           <div class="post-content">
                              <div class="meta-date">Mar 30, 2021</div>
                              <h3 class="post-title"><a href="#">modern vibes bedrooms, todays trending
                                    design</a></h3>
                              <p>Lectus molestie id enim ipsum. Netus sed cursus nibh iaculis ipsum turpis
                                 nulla blandit dui.</p>
                           </div>
                        </article>

                     </div>

                     <div class="col-md-4">

                        <article class="post-item">
                           <figure>
                              <a href="#" class="image-hvr-effect">
                                 <img src="images/postimg2.jpg" alt="post" class="post-image">
                              </a>
                           </figure>
                           <div class="post-content">
                              <div class="meta-date">Mar 29, 2021</div>
                              <h3 class="post-title"><a href="#">How to make minimalist living rooms
                                    pop-out</a></h3>
                              <p>Lectus molestie id enim ipsum. Netus sed cursus nibh iaculis ipsum turpis
                                 nulla blandit dui.</p>
                           </div>
                        </article>
                     </div>

                     <div class="col-md-4">
                        <article class="post-item">
                           <figure>
                              <a href="#" class="image-hvr-effect">
                                 <img src="images/postimg3.jpg" alt="post" class="post-image">
                              </a>
                           </figure>
                           <div class="post-content">
                              <div class="meta-date">Mar 27, 2021</div>
                              <h3 class="post-title"><a href="#">how to make your resort that looks
                                    outstanding</a></h3>
                              <p>Lectus molestie id enim ipsum. Netus sed cursus nibh iaculis ipsum turpis
                                 nulla blandit dui.</p>
                           </div>
                        </article>
                     </div>

                  </div>
               </div>

            </div>



         </div>

         <div class="row">
            <div class="col">

               <div class="btn-wrap align-center">
                  <a href="#" class="btn btn-xlarge btn-accent btn-rounded">View all blog</a>
               </div>

            </div>
         </div>

      </div>
   </section>

   <section id="contact" class="scrollspy-section bg-dark padding-large">
      <div class="container">

         <div class="row">
            <div class="col-md-6">

               <div class="left-content">

                  <div class="section-header">
                     <div class="title">
                        <span>Get in touch</span>
                     </div>
                     <h2 class="section-title light">Contact us</h2>
                  </div>

                  <p>If you have any question about our process or company? Let us know how we can help you.</p>

                  <form id="form-contact" class="form-light" action="contact.php">
                     <p>
                        <input type="text" name="name" placeholder="Your Full Name*" required>
                     </p>
                     <p>
                        <input type="text" name="email" placeholder="Your Email Address" required>
                     </p>
                     <p>
                        <textarea name="message" placeholder="Your Message" required></textarea>
                     </p>
                     <p>
                        <label for="agree">
                           <input id="agree" name="agree" type="checkbox" required></input>
                           <span>I agree to privacy policy</span>
                        </label>
                     </p>
                     <button class="btn btn-accent btn-rounded btn-xlarge btn-full">Submit</button>
                  </form>


               </div>

            </div><!--left-content-->

            <div class="col-md-6">
               <div class="right-content">

                  <div class="iconbox">
                     <i class="icon icon-location"></i>
                     <div class="detail">
                        <strong>Address 1:</strong>
                        <p>3927 Red Maple Drive, Los Angeles</p>
                     </div>
                  </div>
                  <div class="iconbox">
                     <i class="icon icon-location2"></i>
                     <div class="detail">
                        <strong>Address 2:</strong>
                        <p>2489 Locust Court, Los Angeles</p>
                     </div>
                  </div>
                  <div class="iconbox">
                     <i class="icon icon-phone"></i>
                     <div class="detail">
                        <strong>Phone:</strong>
                        <p>+63 667 341 3463</p>
                     </div>
                  </div>
                  <div class="iconbox">
                     <i class="icon icon-mail3"></i>
                     <div class="detail">
                        <strong>Email:</strong>
                        <p><a href="#">contact@example.com</a></p>
                     </div>
                  </div>

               </div>
            </div><!--right-content-->

         </div>

      </div>
   </section>

   <section id="testimonial" class="padding-large">
      <div class="container">

         <div class="row">

            <div class="col-md-6">

               <figure class="jarallax-keep-img testimonial-image" data-speed="0.5">
                  <img src="images/review-bg.jpg" alt="review" class="jarallax-img">
               </figure>

            </div>

            <div class="col-md-6">

               <div class="testimonial-block">
                  <div class="section-header">
                     <div class="title">
                        <span>What clients says</span>
                     </div>
                     <h2 class="section-title">Testimonials</h2>
                  </div>
                  <div class="testimonials-inner">
                     <q>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Placerat venenatis tempor,
                        turpis dolor. Aliquam faucibus velit, volutpat vulputate risus urna enim.</q>
                     <div class="testimonial-author">
                        <div class="author-detail">
                           <div class="name">Lucifer</div>
                           <div class="author-title">CEO, unity real state</div>
                        </div>
                     </div>
                  </div>
               </div><!--reviews-content-->

            </div>
         </div><!--grid-->

      </div>
   </section>

   <footer id="footer">
      <div class="container">
         <div class="row">

            <div class="col-md-3">

               <div class="footer-menu menu-item-01">
                  <img src="images/logo.png" alt="logo" class="footer-logo">
                  <p>Tristique lacus ullamcorper massa posuere nisl molestie. Nullam motes, tortor masa. Nisl
                     tellus etiam.</p>
                  <div class="social-links">
                     <ul>
                        <li>
                           <a href="#"><i class="icon icon-facebook"></i></a>
                        </li>
                        <li>
                           <a href="#"><i class="icon icon-twitter"></i></a>
                        </li>
                        <li>
                           <a href="#"><i class="icon icon-youtube-play"></i></a>
                        </li>
                        <li>
                           <a href="#"><i class="icon icon-behance-square"></i></a>
                        </li>
                     </ul>
                  </div>
               </div>

            </div>

            <div class="col-md-2">

               <div class="footer-menu menu-item-02">
                  <h5>quick links</h5>
                  <ul class="menu-list">
                     <li class="menu-item">
                        <a href="#">home</a>
                     </li>
                     <li class="menu-item">
                        <a href="#">about us </a>
                     </li>
                     <li class="menu-item">
                        <a href="#">services</a>
                     </li>
                     <li class="menu-item">
                        <a href="#">portfolios</a>
                     </li>
                     <li class="menu-item">
                        <a href="#">blogs</a>
                     </li>
                     <li class="menu-item">
                        <a href="#">contact us</a>
                     </li>
                  </ul>
               </div>

            </div>

            <div class="col-md-4">

               <div class="footer-menu menu-item-03">
                  <h5>contact info</h5>
                  <ul class="menu-list">
                     <li class="menu-item">
                        <i class="icon icon-location"></i>2489 Locust Court, Los Angeles
                     </li>
                     <li class="menu-item">
                        <i class="icon icon-location2"></i>3927 Red Maple Drive, Los Angeles
                     </li>
                     <li class="menu-item">
                        <i class="icon icon-phone"></i>+63 667 341 3463
                     </li>
                     <li class="menu-item">
                        <i class="icon icon-envelope-o"></i><a href="#" class="mail-id">contact@example.com</a>
                     </li>
                  </ul>
               </div>

            </div>

            <div class="col-md-3">

               <div class="footer-menu menu-item-04">
                  <h5>gallery</h5>
                  <div class="gallery">
                     <a href="images/spacejoy.jpg" data-lightbox-gallery="gallery1"
                        title="Calm Before The Storm (One Shoe Photography Ltd.)" class="image-link"><img
                           src="images/tab1.jpg" alt="house" class="gallery-image"></a>
                     <a href="images/interior.jpg" data-lightbox-gallery="gallery1"
                        title="Grasmere Lake (Phil 'the link' Whittaker (gizto29))" class="image-link"><img
                           src="images/tab2.jpg" alt="house" class="gallery-image"></a>
                     <a href="images/interior.jpg" data-lightbox-gallery="gallery1"
                        title="Grasmere Lake (Phil 'the link' Whittaker (gizto29))" class="image-link"><img
                           src="images/tab3.jpg" alt="house" class="gallery-image"></a>
                     <a href="images/interior.jpg" data-lightbox-gallery="gallery1"
                        title="Grasmere Lake (Phil 'the link' Whittaker (gizto29))" class="image-link"><img
                           src="images/postimg1.jpg" alt="house" class="gallery-image"></a>
                     <a href="images/interior.jpg" data-lightbox-gallery="gallery1"
                        title="Grasmere Lake (Phil 'the link' Whittaker (gizto29))" class="image-link"><img
                           src="images/postimg2.jpg" alt="house" class="gallery-image"></a>
                     <a href="images/interior.jpg" data-lightbox-gallery="gallery1"
                        title="Grasmere Lake (Phil 'the link' Whittaker (gizto29))" class="image-link"><img
                           src="images/postimg3.jpg" alt="house" class="gallery-image"></a>
                  </div>
               </div>

            </div>

         </div>
      </div>
   </footer>

   <div id="footer-bottom">
      <div class="container">
         <div class="row">
            <div class="col-md-6">
               <div class="copyright">
                  <p>© 2023 DrawColi. All rights reserved.</p>
               </div>
            </div>
            <div class="col-md-6">
               <div class="copyright text-right">
                  <p>DrawColi by TeamColi</p>
               </div>
            </div>
         </div>
      </div>
   </div>

   <script src="js/jquery-1.11.0.min.js"></script>
   <script src="js/ui-easing.js"></script>
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
      crossorigin="anonymous"></script>
   <script src="https://unpkg.com/isotope-layout@3/dist/isotope.pkgd.min.js"></script>
   <script src="js/plugins.js"></script>
   <script src="js/script.js"></script>

</body>
</html>