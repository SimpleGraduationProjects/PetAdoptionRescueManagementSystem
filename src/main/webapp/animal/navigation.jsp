<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>
        <sitemesh:write property='title' /></title>
    <sitemesh:write property='head' />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/js/jquery-2.2.3.min.js"></script>
    <script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js"></script>
    <!-- Owl-Carousel-CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" type="text/css" media="all" />
</head>
<body>
<!-- sticky navigation -->
<div class="nav-links">
    <nav class='navbar navbar-default'>
        <div class='container'>
            <div class='collapse navbar-collapse'>
                <ul>
                    <li>
                        <a href="${pageContext.request.contextPath}/animal/index.jsp">主页</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/animal/about.jsp">宠物领养救助知识</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/animal/pet_list.jsp">领养中心</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/animal/teamBlog.jsp">团队活动</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/animal/team.jsp">我的团队</a>
                    </li>

                    <!-- 判断是否登录 显示哪个内容 -->
                    <%
                        boolean isLogin=false;
                        Object user = request.getSession().getAttribute("user");
                        if (user!=null){
                            isLogin = true;
                        }
                        request.getSession().setAttribute("isLogin",isLogin);
                    %>
                    <c:if test="${sessionScope.isLogin}" var="flage" scope="session">
                        <li id="edit_logout">
                            <div class="img"><img src="${user.getPic()}" alt="" width="60px" style="border-radius:50% " value="${user.getId()}" id="user_edit_modal_btn">
                            <p>欢迎：${user.getUserName()}</p>
                            </div>
                        </li>
                        <li id="my-pets">
                            <a href="#" data-toggle="modal" data-target="#myPetsModal">我的领养</a>
                        </li>
                        <a href="javascript:void(0)" id="logout">退出</a>
                    </c:if>
                    <c:if test="${!flage}" var="flage" scope="session">
                        <li id="login_register">
                            <a href="#" data-toggle="modal" data-target="#login">注册/登录</a>
                        </li>
                    </c:if>
                </ul>
            </div>
        </div>
    </nav>
</div>
<!-- 注册登录模块框 -->
<div class="modal fade" id="login" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">
                    <div role="tabpanel">
                        <!-- Nav tabs -->
                        <ul class="nav nav-tabs" role="tablist">
                            <li role="presentation" class="active">
                                <a href="#home" aria-controls="login" role="tab" data-toggle="tab">登录</a>
                            </li>
                            <li role="presentation">
                                <a href="#tab" aria-controls="register" role="tab" data-toggle="tab">注册</a>
                            </li>
                        </ul>
                    </div>
                </h4>
            </div>
            <div class="tab-content">
                <div role="tabpanel" class="tab-pane active" id="home">
                    <div class="modal-body">
                        <form class="form-horizontal" id="user_login_form">
                            <div class="form-group">
                                <label for="new_loginName" class="col-sm-2 control-label">账号</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="new_loginName" placeholder="请填写账号"
                                           name="userName">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="new_loginPwd" class="col-sm-2 control-label">密码</label>
                                <div class="col-sm-8">
                                    <input type="password" class="form-control" id="new_loginPwd" placeholder="请填写密码"
                                           name="password">
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class=" btn-default" data-dismiss="modal">关闭</button>
                        <button type="button" class="btn-primary" id="user_login_btn">登录</button>
                    </div>
                </div>
                <div role="tabpanel" class="tab-pane" id="tab">
                    <div class="modal-body">
                        <form class="form-horizontal" id="user_register_form" method="post" enctype="multipart/form-data">
                            <div class="form-group">
                                <label for="add-userName" class="col-sm-2 control-label">
                                    用户名字
                                </label>
                                <div class="col-sm-4">
                                    <input type="text" class="form-control" id="add-userName" placeholder="请填写用户名称" name="userName">
                                </div>
                                <label for="add-password" class="col-sm-2 control-label">
                                    用户密码
                                </label>
                                <div class="col-sm-4">
                                    <input type="password" class="form-control" id="add-password" placeholder="请填写用户密码" name="password">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="new_sex" class="col-sm-2 control-label">
                                    性别
                                </label>
                                <div class="col-sm-4">
                                    <select class="form-control" id="new_sex" name="sex">
                                        <option value="男">男</option>
                                        <option value="女">女</option>
                                    </select>
                                </div>
                                <label for="add-age" class="col-sm-2 control-label">
                                    年龄
                                </label>
                                <div class="col-sm-4">
                                    <input type="text" class="form-control" id="add-age" placeholder="请填写年龄" name="age">
                                </div>

                            </div>
                            <div class="form-group">
                                <label for="add-telphone" class="col-sm-2 control-label">
                                    手机号
                                </label>
                                <div class="col-sm-4">
                                    <input type="text" class="form-control" id="add-telphone" placeholder="请填写手机号" name="telephone">
                                </div>
                                <label for="add-email" class="col-sm-2 control-label">
                                    邮箱
                                </label>
                                <div class="col-sm-4">
                                    <input type="text" class="form-control" id="add-email" placeholder="请填写邮箱"  name="Email">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="add-address" class="col-sm-2 control-label">
                                    地址
                                </label>
                                <div class="col-sm-4">
                                    <input type="text" class="form-control" id="add-address" placeholder="请填写地址" name="address">
                                </div>
                                <label for="new_state" class="col-sm-2 control-label">
                                    经历
                                </label>
                                <div class="col-sm-4">
                                    <select class="form-control" id="new_state" name="state">
                                        <option value="0">有领养经历</option>
                                        <option value="1">无领养经历</option>
                                    </select>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class=" btn-default" data-dismiss="modal">关闭</button>
                        <button type="button" class=" btn-primary" id="user_register_btn">注册</button>
                    </div>
                </div>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<!--我的领养-->
<div class="modal fade" id="myPetsModal" tabindex="-1" role="dialog" aria-labelledby="myPetsModal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
                <h4 class="modal-title" >我的领养宠物信息</h4>
            </div>
            <div class="modal-body">
                <table class="table table-bordered">
                   <thead>
                   <tr>
                       <th>宠物名称</th>
                       <th>领养状态</th>
                       <th>领养时间</th>
                   </tr>
                   </thead>
                    <tbody>
                    <c:forEach items="${adoptRecordList}" var="record">
                        <tr>
                            <td>${record.pet.petName}</td>
                            <td>
                                <c:if test="${record.state=='0'}">
                                    不同意
                                </c:if>
                                <c:if test="${record.state=='1'}">
                                    未审核
                                </c:if>
                                <c:if test="${record.state=='2'}">
                                    同意
                                </c:if>
                            </td>
                            <td><fmt:formatDate value="${record.adoptTime}" type="date" dateStyle="medium"/></td>
                        </tr>
                    </c:forEach>

                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<!-- 注册登录模块框 -->
<!--个人信息修改的模态框-->
<div class="modal fade" id="editUser" tabindex="-1" role="dialog" aria-labelledby="myModalLabe">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
                <h4 class="modal-title" id="myModalLabe">修改用户信息</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="user_edit_form" method="post" enctype="multipart/form-data">
                    <input type="hidden" id="edit_id" name="id">
                    <div class="form-group">
                        <label for="edit_userName" class="col-sm-2 control-label">
                            用户名称
                        </label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="edit_userName" placeholder="用户名称" name="userName" value="${user.userName}">
                        </div>
                        <label for="edit_password" class="col-sm-2 control-label">
                            用户密码
                        </label>
                        <div class="col-sm-4">
                            <input type="password" class="form-control" id="edit_password" placeholder="用户密码" name="password" value="${user.password}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="edit_age" class="col-sm-2 control-label">
                            年龄
                        </label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="edit_age" placeholder="年龄" name="age" value="${user.age}">
                        </div>
                        <label for="edit_sex" class="col-sm-2 control-label">
                            性别
                        </label>
                        <div class="col-sm-4">
                            <select class="form-control" id="edit_sex" name="sex" value="${user.sex}">
                                <option value="男">男</option>
                                <option value="女">女</option>
                            </select>
                        </div>

                    </div>
                    <div class="form-group">
                        <label for="edit_telephone" class="col-sm-2 control-label">
                            电话号码
                        </label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="edit_telephone" placeholder="电话" name="telephone" value="${user.telephone}">
                        </div>
                        <label for="edit_Email" class="col-sm-2 control-label">
                            Email
                        </label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="edit_Email" placeholder="Email"  name="Email" value="${user.email}">
                        </div>

                    </div>
                    <div class="form-group">
                        <label for="edit_address" class="col-sm-2 control-label">
                            地址
                        </label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="edit_address" placeholder="地址" name="address" value="${user.address}">
                        </div>
                        <label for="edit_state" class="col-sm-2 control-label">
                            经历
                        </label>
                        <div class="col-sm-4">
                            <select class="form-control" id="edit_state" name="state" value="${user.state}">
                                <option value="0">有领养经历</option>
                                <option value="1">无领养经历</option>
                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class=" btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class=" btn-primary" id="user_update_btn">保存修改</button>
            </div>
        </div>
    </div>
</div>


<script type="text/javascript">

    //登录按钮
    $("#user_login_btn").click(function () {
        var loginName=$("#new_loginName").val();
        var loginPassword=$("#new_loginPwd").val();
        if(loginName==""){
            alert("请填写账号");
            return;
        }
        if(loginPassword==""){
            alert("请填写密码");
            return;
        }
        $.ajax({
            url:"${pageContext.request.contextPath}/user/login.action",
            type:"POST",
            data:$("#user_login_form").serialize(),
            success:function (result) {
                if(result.code=="100"){
                    var br=confirm("登录成功");
                        if(br){
                            window.location.reload();
                        }
                }else{
                    alert(result.message);
                }

            },
            error:function (result) {
                alert("网络错误");
            }
        });
    });

    //清空表单样式及内容
    function reset_form(ele){
        $(ele)[0].reset();
        //清空表单样式
        $(ele).find("*").removeClass("has-error has-success");
        $(ele).find(".help-block").text("");
    }

    //点击编辑按钮弹出模态框。
    $("#user_edit_modal_btn").click(function(){

        window.location.href="${pageContext.request.contextPath}/animal/personal-info.jsp"

    });

    //点击更新按钮弹出模态框。
    $("#user_update_btn").click(function(){
        var file=document.getElementById("user_edit_form");
        var fd = new FormData(file);
        $.ajax({
            url:"${pageContext.request.contextPath}/user/update.action",
            type:"POST",
            processData: false,  // 告诉jQuery不要去处理发送的数据
            contentType: false, // 告诉jQuery不要去设置Content-Type请求头
            data:fd,
            success:function (result) {
                alert("用户信息更新成功！");
            },
            error:function(result){
                alert("用户信息更新失败！");
            }
        });

    });

    $("#logout").click(function () {
        $.ajax({
            url:"${pageContext.request.contextPath}/user/logout.action",
            type:"GET",
            success:function (result) {
                window.location.href="${pageContext.request.contextPath}/animal/index.jsp";
                alert("退出成功");
            },
            error:function (result) {
               alert("退出失败");
            }
        })
    })
    //注册操作
    $("#user_register_btn").click(function () {
        var username=$("#add-userName").val();
        var password=$("#add-password").val();
        var phone=$("#add-telphone").val();
        var age=$("#add-age").val();
        var email=$("#add-email").val();
        if(username==""){
            alert("请填写用户名");
            return;
        }
        if(password==""){
            alert("请填写密码");
            return;
        }
        if(phone==""){
            alert("请填写手机号");
            return;
        }
        if(age==""){
            alert("请填写年龄");
            return;
        }
        if(email==""){
            alert("请填写邮箱");
            return;
        }
        $.ajax({
            url:"${pageContext.request.contextPath}/user/add.action",
            type:"POST",
            data:$("#user_register_form").serialize(),
            success:function (result) {
                if(result.code=="100"){
                    var br=confirm("注册成功，请去登录！");
                    if(br){
                        window.location.reload();
                    }
                }else{
                    alert(result.message);
                }
            },
            error:function (result) {
                alert("网络错误");
            }
        });
    });


</script>
</body>
</html>
