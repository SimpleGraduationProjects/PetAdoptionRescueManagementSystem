<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>关于我们</title>
    <!-- Meta tag Keywords -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta charset="UTF-8" />
    <meta name="keywords" content=""/>
    <%@include file="common/header.jsp"%>
    <style>
        .about-image{
            width: 424px;
            height: 283px;
        }
    </style>
</head>
<body>
<jsp:include page="navigation.jsp"></jsp:include>
<!-- welcome -->
<div class="about" id="about">
    <div class="container">
        <h3 class="agile-title">宠物联盟</h3>
        <div class="about-top w3ls-agile">
            <div class="col-md-6 red">
                <img class="img-responsive" src="/images/about1.jpg" alt="">
            </div>
            <div class="col-md-6 come">
                <div class="about-wel">
                    <h5>关于我们
                        <span>宠物领养救助</span>
                    </h5>
                    <p>
                        宠物联盟是上海xx公司运营项目，专注于宠物领养救助领域的供需资源全要素对接平台，为全国大小宠物领养救助基地、收容中心、救助协会提供宣传、管理一站式解决方案，并通过爱微慈善向各困难基地给予定向援助。
                    </p>
                    <ul>
                        <li>
                            <i class="glyphicon glyphicon-ok"></i>宠物的健康和关怀</li>
                        <li>
                            <i class="glyphicon glyphicon-ok"></i>宠物的爱好</li>
                        <li>
                            <i class="glyphicon glyphicon-ok"></i>宠物的食物</li>
                        <li>
                            <i class="glyphicon glyphicon-ok"></i>宠物的活动</li>
                    </ul>
                </div>
                <div class="button-styles">
                    <a href="#cat" data-toggle="modal" data-target="#Catbtn">养狗注意的方式</a>
                    <a href="#dog" data-toggle="modal" data-target="#Dogbtn">养猫注意的方式</a>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Gallery -->
<div id="gallery" class="gallery">
    <div class="container">
        <h3 class="agile-title">照片墙</h3>
    </div>
    <div class="agileinfo-gallery-row">
        <div class="col-md-3 col-sm-3 col-xs-4 w3gallery-grids">
            <a href="/images/about2.jpg" class="imghvr-hinge-right figure">
                <img src="/images/about2.jpg" alt="" title="Cat Life Image" />
            </a>
        </div>
        <div class="col-md-3 col-sm-3 col-xs-4 w3gallery-grids">
            <a href="/images/about3.jpg" class="imghvr-hinge-right figure">
                <img src="/images/about3.jpg" alt="" class="about-image" title="Cat Life Image" />
            </a>
        </div>
        <div class="col-md-3 col-sm-3 col-xs-4 w3gallery-grids">
            <a href="/images/about1.jpg" class="imghvr-hinge-right figure">
                <img src="/images/about1.jpg"  class="about-image"  alt="" title="Cat Life Image" />
            </a>
        </div>
        <div class="col-md-3 col-sm-3 col-xs-4 w3gallery-grids">
            <a href="/images/about4.jpg" class="imghvr-hinge-right figure">
                <img src="/images/about4.jpg" class="about-image"  alt="" title="Cat Life Image" />
            </a>
        </div>
        <div class="col-md-3 col-sm-3 col-xs-4 w3gallery-grids">
            <a href="/images/about5.jpg" class="imghvr-hinge-right figure">
                <img src="/images/about5.jpg"  class="about-image"  alt="" title="Cat Life Image" />
            </a>
        </div>
        <div class="col-md-3 col-sm-3 col-xs-4 w3gallery-grids">
            <a href="/images/about6.jpg" class="imghvr-hinge-right figure">
                <img src="/images/about6.jpg"class="about-image"  alt="" title="Cat Life Image" />
            </a>
        </div>
        <div class="col-md-3 col-sm-3 col-xs-4 w3gallery-grids">
            <a href="/images/about7.jpg" class="imghvr-hinge-right figure">
                <img src="/images/about7.jpg" class="about-image"  alt="" title="Cat Life Image" />
            </a>
        </div>
        <div class="col-md-3 col-sm-3 col-xs-4 w3gallery-grids">
            <a href="/images/about8.jpg" class="imghvr-hinge-right figure">
                <img src="/images/about8.jpg" class="about-image"  alt="" title="Cat Life Image" />
            </a>
        </div>
        <div class="clearfix"> </div>
    </div>
</div>
<!-- Modal5 -->
<div class="modal fade" id="Catbtn" tabindex="-1" role="dialog">
    <div class="modal-dialog">
        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <div class="modal-info">
                    <h4>养狗的注意方式</h4>
                    <img src="${pageContext.request.contextPath}/images/detail01.jpg" alt=" " class="img-responsive" />
                    <p class="para-agileits-w3layouts">
                        喂养宠物定时定量有利于狗狗的胃液分泌和肠胃蠕动的规律，有助于狗狗消化吸收，
                        喂食的时间要准，尽量按照在原主人家的习惯喂养，不要喂它们过多的甜食、咸食和刺激性强的食品。
                        刚来的宝宝，主人要亲自喂食，时日积久，便能和爱犬建立起深厚的感情，加深相互信任的程度，
                        主人的另一个重要任务是要帮助小家伙克服离开母亲的痛苦，尽快适应新环境。
                    </p>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Modal5 -->
<div class="modal fade" id="Dogbtn" tabindex="-1" role="dialog">
    <div class="modal-dialog">
        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <div class="modal-info">
                    <h4>养猫的注意事项</h4>
                    <img src="${pageContext.request.contextPath}/images/about9.jpg" alt=" " class="img-responsive" />
                    <p class="para-agileits-w3layouts">
                        当准备领养小猫咪时,千万不要只顾着呼喊'小猫很可爱'，因为照顾小猫需要很费心机的，需要主人全心全力的投入。
                        我们不能一直将小猫放在家里面养，我们需要时不时的将小猫带出去溜溜,然后，我们在养小猫的时候，还需要多陪小猫玩耍。
                        我们在养小猫的时候，还需要多打理打理它的毛发。
                    </p>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- //Gallery -->
<!-- js -->
<script src="${pageContext.request.contextPath}/JQuery/jquery-3.4.1.min.js"></script>
<script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js"></script>
<!-- Necessary-JavaScript-File-For-Bootstrap -->
<!-- //js -->
<script>
    $(function () {

    });
</script>


<!-- Light-box css -->
<!-- //simple-lightbox -->

</body>
</html>
