<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>宠物的信息</title>
    <style type="text/css">
        .myDiv{
            margin-top: 40px;
        }
    </style>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css">
    <link href="${pageContext.request.contextPath}/css/jquery.slideBox.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/show.css">
    <script src="${pageContext.request.contextPath}/js/jquery-2.2.3.min.js"></script>
    <script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.slideBox.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.comment.js"></script>
</head>
<body>

<div class="myDiv" >
    <div >
        <h2>宠物的信息</h2>
        <center>
                <img class="my-img" src="${pics}">
            <div class="name">
                <span>${pet.petName}</span>
            </div>
        </center>
        <div class="animal">
            <div class="group">
                <div class="animalX1">
                    <img src="../images/home/number.png"><span>编号</span><br>
                    <p>${pet.id}</p>
                </div>
                <div class="animalX2">
                    <img src="../images/home/birthday.png"><span>生日</span><br>
                    <p>
                        <fmt:formatDate pattern="yyyy-MM-dd" value="${pet.birthday}"/>
                    </p>
                </div>
            </div>
            <div class="group">
                <div class="animalX3">
                    <img src="../images/home/type.png"><span>品种</span><br>
                    <p>${pet.petType}</p>
                </div>
                <div class="animalX4">
                    <img src="../images/home/sex.png"><span>性别</span><br>
                    <p>${pet.sex}</p>
                </div>
            </div>
        </div>
        <div class="animal_me">
            <div >详细介绍</div>
            <div class="animal_me2" style="width: 1000px"><p>大家好，我是${pet.petName}。${pet.remark}。你能带我回家吗？</p></div>
        </div>
        <div class="my_btn">
            <button class="btn btn-primary btn-lg" id="pet_adopt_modal_btn" data-user="${user.id}">我要领养</button>
            <button class="btn btn-primary btn-lg" id="tianchuan_btn" style="float: right;position: relative;left: 150px;bottom: 45px">返回主页</button>
        </div>
    </div>

    <div class="container">
    <!--存放评论的地方-->
        <div class="comment-list">

        </div>

        <div class="commentbox">
                <textarea cols="80" rows="50" placeholder="来说几句吧" class="mytextarea" id="content"></textarea>
                <div class="btn btn-info pull-right" id="comment">评论</div>
            </div>
    </div>
</div>
<!--主回复-->
<div class="modal fade" id="saveAnswer" tabindex="-1" role="dialog" aria-labelledby="myModalLabel1" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel1">评论</h4>
            </div>
            <div class="modal-body">
                <form id="save_answer_form">
                    <input type="hidden" name="id" id="edit_id" value="${comment.id}">
                    <textarea class="form-control" id="edit_content" placeholder="请发表评论！" name="content"></textarea>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal" id="comment_btn">关闭</button>
                <button type="button" class="btn btn-primary" id="save_answer_btn">提交</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<div class="modal fade" id="saveAnswers" tabindex="-1" role="dialog" aria-labelledby="myModalLabel2" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel2">评论</h4>
            </div>
            <div class="modal-body">
                <form id="save_answers_form">
                    <input type="hidden" name="id" id="answer_id" value="${answer.id}">
                    <input type="hidden" name="comment_id" id="comment_id" value="${answer.comment.id}">
                    <textarea class="form-control" id="answer_content" placeholder="请发表评论！" name="content"></textarea>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal" id="answer_btn">关闭</button>
                <button type="button" class="btn btn-primary" id="save_answers_btn">提交</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<script>
    var user="${sessionScope.user}";

    var id="${sessionScope.pet}";

    $(function () {
        to_page();
    });

    function to_page(){
        //session里面的数据
        $.ajax({
            url:"${pageContext.request.contextPath}/comment/petComments.action?pet_id="+"${pet.id}",
            type:"GET",
            success:function(result){
                submit(result);
            },
            error:function (result) {
                alert("评论导出失败");
            }
        });
    }
    //字符串拼接
    function submit(result) {
        //清空数据
        $(".comment-list").empty();
        //对结果进行遍历
        var comments=result.extend.comment;
        $.each(comments,function(index,comment){
            var headTd=$("<header></header>").append($("<img>").attr("src",(comment.user.pic)));
            var head=$("<div></div>").addClass("comment-right");
            var userNameTd=$("<h3></h3>").append(comment.user.userName);
            var bodyTd=$("<div></div>").addClass("comment-content-header");
            var timeTd=$("<span></span>").append($("<i></i>").addClass("glyphicon glyphicon-time")).append(comment.commentTime);
            bodyTd.append(timeTd);
            var commentTd=$("<p></p>").addClass("content").append(comment.content);
            var answer=$("<div></div>").addClass("comment-content-footer");
            var answerHead=$("<div></div>").addClass("row");
            var answerbtn= $("<div></div>").addClass("col-md-2").append($("<span></span>").addClass("reply-btn").append("回复").attr("save-id",comment.id));
            answerHead.append(answerbtn);
            answer.append(answerHead);
            var replayListTd=null;
            if(comment.answer != null){
                var answers=comment.answer;
                replayListTd = $("<div></div>").addClass("reply-list");
                $.each(answers,function(index,answer) {
                    var replaysTd = $("<div></div>").addClass("reply");
                    var replay = $("<div></div>").append($("<a></a>").append(answer.user.userName)).append("回复：").append($("<a></a>").append(comment.user.userName).append("  ")).append($("<span></span>").append(answer.content));
                    var contentTd = $("<p></p>").append($("<span></span>").append(answer.answerTime)).append($("<span></span>").addClass("reply-list-btn").append("回复").attr("saves-id",answer.id));
                    replaysTd.append(replay).append(contentTd);
                    replayListTd.append(replaysTd);
                });
                var replayAnswerTd=to_answer(comment.id);
                replayListTd.append(replayAnswerTd);
            }
            head.append(userNameTd).append(bodyTd).append(commentTd).append(answer).append(replayListTd);
            $("<div></div>").addClass("comment-info")
                .append(headTd)
                .append(head)
                .appendTo(".comment-list")
        });
    };

    function to_answer(id){
        //session里面的数据
        var answer=null;
        $.ajax({
            url:"${pageContext.request.contextPath}/answer/findByCommentId.action?comment_id="+id,
            type:"GET",
            async:false,
            success:function(result){
                if(result.extend.answer.length > 0){
                    answer=answerSummit(result);
                }else{
                    return;
                }
            },
            error:function (result) {
                alert("评论导出失败");
            }
        });
        return answer;
    }
    function answerSummit(result){
        //清空数据
        //对结果进行遍历
        console.log(result.extend.answer);
        var answers=result.extend.answer;
        var replys=$("<div></div>").addClass("replys")
        $.each(answers,function(index,answer){
            var replay=$("<div></div>").append($("<a></a>").append(answer.user.userName)).append("回复：").append($("<a></a>").append(answer.answer.user.userName).append("  ")).append($("<span></span>").append(answer.content));
            var contentTd=$("<p></p>").append($("<span></span>").append(answer.answerTime)).append($("<span></span>").addClass("reply-list-btn").append("回复").attr("saves-id",answer.id));
            replayTd=$("<div></div>").addClass("reply").append(replay).append(contentTd);
            replys.append(replayTd);
        });
        return replys;

    }

    //评论操作
    $("#comment").click(function () {
        if($("#pet_adopt_modal_btn").attr("data-user")==""){
            alert("请先登录在评论");
            return;
        }
        var comment=$("#content").val();
        if(comment==null){
            alert("请填入评论后才能发表");
            return;
        };
        $.ajax({
            url:"${pageContext.request.contextPath}/comment/add.action",
            type:"POST",
            data:{"content":comment},
            dataType:'json',
            success:function (result) {
                if(result.code=="100"){
                    alert("评论成功");
                    to_page();
                }else{
                    alert(result.message);
                }
            },
            error:function (result) {
                alert("网络错误");
            }
        })
    });


    //清空表单样式及内容
    function reset_form(ele){
        $(ele)[0].reset();
        //清空表单样式
        $(ele).find("*").removeClass("has-error has-success");
        $(ele).find(".help-block").text("");
    }

    //点击新增按钮弹出模态框。
    $("#pet_adopt_modal_btn").click(function(){
        var user=$(this).attr("data-user");
        if(user==""){
        alert("请先去登录");
        return ;
        }
        $.ajax({
            url:"${pageContext.request.contextPath}/adopt/add.action",
            type:"POST",
            processData: false,  // 告诉jQuery不要去处理发送的数据
            contentType: false, // 告诉jQuery不要去设置Content-Type请求头
            date:"",
            success:function (result) {
                if(result.code=="100"){
                    alert("领养申请成功");
                    $("#adopt_btn").click();
                    window.location.href="${pageContext.request.contextPath}/animal/index.jsp";
                }else{
                    alert(result.message);
                }
            },
            error:function (result) {
                alert("网络错误");
                $("#adopt_btn").click();
            }
        });
    });

    $("#tianchuan_btn").click(function () {
        window.location.href="${pageContext.request.contextPath}/animal/index.jsp";
    });

    $(document).on("click",".reply-btn",function(){
        var id = $(this).attr("save-id");
        if($("#pet_adopt_modal_btn").attr("data-user")==""){
            alert("请先登录在评论");
            return;
        }
        $.ajax({
            url:"${pageContext.request.contextPath}/comment/findById.action?id="+id,
            type:"GET",
            success:function(result){
                //填充用户信息
                $("#edit_id").val(result.extend.comment.id);
            }});
        //2、弹出模态框
        $("#saveAnswer").modal({
            backdrop:"static"
        });
    });

    //回复操作
    $("#save_answer_btn").click(function () {
        debugger;
        if($("#pet_adopt_modal_btn").attr("data-user")==""){
            alert("请先登录在评论");
            return;
        }
        var id=$("#edit_id").val();
        var content=$("#edit_content").val()
        $.ajax({
            url:"${pageContext.request.contextPath}/answer/add.action",
            type:"POST",
            dataType:"json",
            data:{'ids':id,'content':content},
            success:function (result) {
                if(result.code=="100"){
                    alert("回复成功！");
                    $("#comment_btn").click();
                    to_page();
                }else{
                    alert(result.message);
                    $("#comment_btn").click();
                }

            },
            error:function (result) {
                alert("网络错误！");
                $("#comment_btn").click();
            }
        })
    });

    $(document).on("click",".reply-list-btn",function(){
        if($("#pet_adopt_modal_btn").attr("data-user")==""){
            alert("请先登录在评论");
            return;
        }
        var id = $(this).attr("saves-id");
        $.ajax({
            url:"${pageContext.request.contextPath}/answer/findById.action?id="+id,
            type:"GET",
            success:function(result){
                //填充用户信息
                $("#comment_id").val(result.extend.answer.comment.id);
                $("#answer_id").val(result.extend.answer.id);
            }});
        //2、弹出模态框
        $("#saveAnswers").modal({
            backdrop:"static"
        });
    });
    $("#save_answers_btn").click(function () {
        debugger;
        var comment_id=$("#comment_id").val();
        var id=$("#answer_id").val();
        var content=$("#answer_content").val()
        $.ajax({
            url:"${pageContext.request.contextPath}/answer/replyAdd.action",
            type:"POST",
            dataType:"json",
            data:{'id':id,'content':content,'comment_id':comment_id},
            success:function (result) {
                if(result.code=="100"){
                    alert("回复成功！");
                    to_page();
                    $("#answer_btn").click();
                }else{
                    alert(result.message);
                    $("#answer_btn").click();
                }

            },
            error:function (result) {
                alert("网络错误")
                $("#answer_btn").click();
            }
        })
    })

</script>
</body>
</html>


