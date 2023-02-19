<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <title>宠物领养救助收养首页</title>
    <!-- Meta tag Keywords -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta charset="UTF-8" />
    <meta name="keywords" content=""/>
    <%@include file="common/header.jsp"%>
    <style type="text/css">
        .img-responsive{
            width: 93px;
            height: 93px;
        }
    </style>

</head>
<body>
<jsp:include page="navigation.jsp"></jsp:include>
<!-- //sticky navigation 首页轮播图 -->
<div class="w3l-main" id="home1">
    <div class="container">
        <!-- header -->
        <div class="header">
            <div class="logo">
                <h1>
                    <a href="${pageContext.request.contextPath}/animal/index.jsp">
                        <img class="logo-img center-block" src="${pageContext.request.contextPath}/images/logo.jpg" alt="" /> 宠物领养救助收养中心
                    </a>
                </h1>
            </div>
            <div class="clearfix"> </div>
        </div>
        <!-- //header -->
    </div>
    <!-- Slider -->
    <div class="slider">
        <div class="callbacks_container">
            <ul class="rslides" id="slider">
                <li>
                    <div class="slider-img-w3layouts one">
                        <div class="w3l-overlay">
                            <div class="container">
                                <div class="banner-text-info">
                                    <h3>快带亲爱的小宠物们
                                        <span>回家</span> 一起玩耍吧
                                        <span>快快快</span>！
                                    </h3>
                                    <p>宠物是人们最衷心、最亲切的朋友</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="slider-img-w3layouts two">
                        <div class="w3l-overlay">
                            <div class="container">
                                <div class="banner-text-info">
                                    <h3>流浪的宠物
                                        <span>需要</span> 你们
                                        <span>带他们回家</span>!</h3>
                                    <p>宠物是人们最衷心、最亲切的朋友</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="slider-img-w3layouts three">
                        <div class="w3l-overlay">
                            <div class="container">
                                <div class="banner-text-info">
                                    <h3>宠物 是你的
                                        <span>朋友</span>！&nbsp;&nbsp;宠物是你的
                                        <span>家人</span> !</h3>
                                    <p> 宠物是人们最衷心、最亲切的朋友</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="slider-img-w3layouts four">
                        <div class="w3l-overlay">
                            <div class="container">
                                <div class="banner-text-info">
                                    <h3>养宠物虽然很累但是
                                        <span>他会一直陪在你身边</span> 直到老去
                                        <span>所以</span>好好照顾他们!</h3>
                                    <p> 宠物是人们最衷心、最亲切的朋友</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </li>
            </ul>
        </div>
        <div class="clearfix"></div>
    </div>
    <!--//Slider-->
</div>
<!--//banner-->



<!-- footer -->
<section class="footer-w3">
    <div class="container">
        <div class="col-lg-4 col-md-4 col-sm-4 footer-agile1" data-aos="zoom-in">
            <h3>网站简介</h3>
            <p class="footer-p1">
               该网站只为做慈善网站，为流浪的宠物重新寻找新的主人，希望你们好好地爱护他们，他们是人类最真挚的朋友。
                当你工作忙的时候可以养一只宠物陪伴你们身边，陪着你们一起走过快乐时光！
            </p>
        </div>
        <div class="col-lg-4 col-md-4 col-sm-4 footer-mid-w3" data-aos="zoom-in">
            <h3>宠物领养救助展示</h3>
            <div class="agileinfo_footer_grid1">
                <a href="#">
                    <img src="../images/home/f1.jpg" alt=" " class="img-responsive">
                </a>
            </div>
            <div class="agileinfo_footer_grid1">
                <a href="#">
                    <img src="../images/home/f2.jpg" alt=" " class="img-responsive">
                </a>
            </div>
            <div class="agileinfo_footer_grid1">
                <a href="#">
                    <img src="../images/home/f3.jpg" alt=" " class="img-responsive">
                </a>
            </div>
            <div class="agileinfo_footer_grid1">
                <a href="#">
                    <img src="../images/home/f4.jpg" alt=" " class="img-responsive">
                </a>
            </div>
            <div class="agileinfo_footer_grid1">
                <a href="#">
                    <img src="../images/home/f5.jpg" alt=" " class="img-responsive">
                </a>
            </div>
            <div class="agileinfo_footer_grid1">
                <a href="#">
                    <img src="../images/home/f6.jpg" alt=" " class="img-responsive">
                </a>
            </div>
            <div class="clearfix"> </div>
        </div>
        <!--联系方式-->
        <div class="col-lg-4 col-md-4 col-sm-4 footer-agile1" data-aos="zoom-in">
            <h3>联系方式</h3>
            <p>手机号<span style="font-size: 22px;color: red;margin-left: 5px;">15518166541</span></p>
            <br>
            <p>邮箱<span style="font-size: 22px;color: red;margin-left: 5px;">W15518166541@163.com</span></p>
            <br>
            <p>官网<span style="font-size: 22px;color: red;margin-left: 5px;">chongwulingyang.shop.liebiao.com</span></p>
            <br>
            <p><a href="${pageContext.request.contextPath}/animal/admin/login.jsp">前往后台</a></p>
        </div>

    </div>

</section>


<!-- js 非得用2.0版本得jQuery-->
<script src="${pageContext.request.contextPath}/js/jquery-2.2.3.min.js"></script>

<script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js"></script>
<!-- Necessary-JavaScript-File-For-Bootstrap -->
<!-- //js -->

<!-- Banner Slider -->
<script src="${pageContext.request.contextPath}/js/responsiveslides.min.js"></script>
<script>
    $(function () {
        $("#slider").responsiveSlides({
            auto: true,
            pager: true,
            nav: true,
            speed: 1000,
            namespace: "callbacks",
            before: function () {
                $('.events').append("<li>before event fired.</li>");
            },
            after: function () {
                $('.events').append("<li>after event fired.</li>");
            }
        });
    });

</script>
<!-- //Banner Slider -->

</body>
</html>
