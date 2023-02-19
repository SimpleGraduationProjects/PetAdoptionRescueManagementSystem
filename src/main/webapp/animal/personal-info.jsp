<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta content="multipart/form-data; charset=utf-8" />

    <title>个人信息修改</title>

    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <!-- bootstrap -->
    <!-- bootstrap -->
    <link  href="${pageContext.request.contextPath}/bootstrap/bootstrap/bootstrap.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/bootstrap/bootstrap/bootstrap-responsive.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/bootstrap/bootstrap/bootstrap-overrides.css" type="text/css" rel="stylesheet" />


    <!-- global styles -->
    <link  rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/layout.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/elements.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/icons.css" />



    <!-- this page specific styles 游泳-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/personal-info.css" type="text/css" media="screen" />

    <!-- open sans font -->
    <link href='http://fonts.useso.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css' />


    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" /></head>
<body>
<!-- end navbar -->

<!-- main container .wide-content is used for this layout without sidebar :)  -->
<div class="content wide-content">
    <div class="container-fluid">
        <div class="settings-wrapper" id="pad-wrapper">


            <!-- avatar column -->
            <div class="span3 avatar-box">
                <div class="personal-image">
                    <img src="${user.pic}" alt="" class="avatar img-circle"  id="user_pic_modal_btn"/>
                    <form id="update_file" style="display: none"  enctype="multipart/form-data">
                        <input type="file"  name="file" id="myFile" />
                    </form>
                </div>
            </div>

            <!-- edit form column -->
            <div class="span7 personal-info">
                <h5 class="personal-title">个人信息修改</h5>
                <form id="user_edit_form">
                    <input type="hidden" id="edit-ic" name="pic"  value="${user.pic}"/>
                    <input type="hidden" id="edit_id" name="id" value="${user.id}">
                <div class="field-box">
                    <label>用户名:</label>
                    <input type="text" class="span5 inline-input" id="edit_userName" placeholder="用户名称" name="userName" value="${user.userName}" />
                </div>
                <div class="field-box">
                    <label>密码:</label>
                    <input type="password" class="span5 inline-input" id="edit_password" placeholder="用户密码" name="password" value="${user.password}"/>
                </div>
                <div class="field-box">
                    <label>年龄:</label>
                    <input type="text" class="span5 inline-input" id="edit_age" placeholder="年龄" name="age" value="${user.age}"/>
                </div>
                <div class="field-box">
                    <label>性别:</label>
                    <div class="ui-select">
                        <select id="edit_sex" name="sex" value="${user.sex}">
                            <option value="男" <c:if test="${user.sex=='男'}">selected</c:if>>男</option>
                            <option value="女"<c:if test="${user.sex=='女'}">selected</c:if>>女</option>
                        </select>
                    </div>
                </div>

                <div class="field-box">
                    <label>电话密码:</label>
                    <input type="text" class="span5 inline-input" id="edit_telephone" placeholder="电话" name="telephone" value="${user.telephone}" />
                </div>
                <div class="field-box">
                    <label>邮箱:</label>
                    <input type="text" class="span5 inline-input" id="edit_Email" placeholder="Email"  name="Email" value="${user.email}"/>
                </div>

                <div class="field-box">
                    <label>地址:</label>
                    <input type="text" class="span5 inline-input" id="edit_address" placeholder="地址" name="address" value="${user.address}"/>
                </div>
                <div class="field-box">
                    <label>有无领养经历:</label>
                    <div class="ui-select">
                        <select id="edit_state" name="state" value="${user.state}">
                            <option value="0" <c:if test="${user.state==0}">selected</c:if>>有领养经历</option>
                            <option value="1" <c:if test="${user.state==1}">selected</c:if>>无领养经历</option>
                        </select>
                    </div>
                </div>
                <div class="span6 field-box actions">
                    <input type="button" class="btn-glow primary" value="确认" id="user_update_btn" />
                    <input type="button" class="btn-glow primary" value="返回主页" id="return_btn" />
                </div>
                </form>
            </div>
        </div>
    </div>
</div>
<script src="${pageContext.request.contextPath}/js/jquery-2.2.3.min.js"></script>
<script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js"></script>

<script type="text/javascript">

    $(document).ready(function(){

    })
    //点击更新按钮弹出模态框。
    $("#user_update_btn").click(function(){
        var username=$("#edit_userName").val();
        var password=$("#edit_password").val();
        var phone=$("#edit_telephone").val();
        var age=$("#edit_age").val();
        var email=$("#edit_Email").val();
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
            url:"${pageContext.request.contextPath}/user/edit.action",
            type:"POST",
            async:"false",
            data:$("#user_edit_form").serialize(),
            success:function (result) {
                if(result.code=="100"){
                    alert("用户信息更新成功！");
                    $("#user_updateDown-btn").click();
                    to_page(currentPage);
                }else{
                    alert(result.message);
                }
            },
            error:function(result){
                alert("网络错误！");
            }
        });
    });

    $("#return_btn").click(function () {
        window.location.href="${pageContext.request.contextPath}/animal/index.jsp";
    });
    
    
    $("#user_pic_modal_btn").click(function () {
        var file= $("#myFile");
        file.click();
        file.change(function () {
            var formData = new FormData();
            formData.append('photo',document.getElementById('myFile').files[0]);
            $.ajax({
                url:'${pageContext.request.contextPath}/upload/photo',
                type:'post',
                data:formData,
                contentType:false,
                processData:false,
                success:function(data){
                    if(data.type == 'success'){
                        $("#edit-ic").val(data.filepath);
                        $("#user_pic_modal_btn").attr("src",data.filepath);
                    }else{
                        alert(data.message);
                    }
                },
                error:function(data){
                    alert("网络错误");
                }
            });
        });
    })
</script>
</body>
</html>
