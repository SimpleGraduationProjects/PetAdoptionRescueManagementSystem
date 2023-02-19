
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en" >
<head>
    <meta charset="UTF-8">
    <title>登录页面</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/normalize.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style2.css">
</head>
<body>

<div class="container">
    <div class="left">
        <div class="header">
            <h2 class="animation a1">欢迎光临宠物领养救助管理系统</h2>
            <h4 class="animation a2">使用账号和密码登录</h4>
        </div>
        <div class="form">
            <input type="text" name="adminName" id="login-name" class="form-field animation a3" placeholder="请输入账号">
            <input type="password" name="adminPwd" id="login-password" class="form-field animation a4" placeholder="密码">
            <div class="form-group v_container">
                <div class="field">
                    <input type="text" class="form-field animation a4" name="code" id="code_input" placeholder="验证码" />
                    <div id="v_container" style="width: 100px;height: 45px;" class="passcode"></div>
                </div>
            </div>
            <button class="animation a6" id="login-btn">登录</button>
        </div>
    </div>
    <div class="right"></div>
</div>
<script src="${pageContext.request.contextPath}/js/gVerify.js"></script>
<script src="${pageContext.request.contextPath}/JQuery/jquery-3.4.1.min.js"></script>

<script>
    window.onload = function () {
        var verifyCode = new GVerify("v_container");
        document.getElementById("login-btn").onclick = function(){
            /*获取inputi面的值*/
            var res = verifyCode.validate(document.getElementById("code_input").value);
            if(res){
                var username=$("#login-name").val();
                var password=$("#login-password").val();
                if(username==""){
                    alert("请填写账号");
                    return;
                }
                if(password==""){
                    alert("请填写密码");
                    return;
                }
                $.ajax({
                    url:"${pageContext.request.contextPath}/admin/login/login.action",
                    type:'POST',
                    data:{"adminName":username,"adminPwd":password},
                    dataType:'json',
                    success:function(result){
                        if(result.type=="success"){
                          var br= confirm("登录成功");
                          if(br){
                              window.location.href="${pageContext.request.contextPath}/animal/admin/index.jsp";
                          }
                        }else{
                            alert(result.message);
                        }
                    },
                    error:function(){
                       alert("网络错误");
                    }
                });
            }else{
                alert("验证码错误");
            }
        }
    }
</script>
</body>
</html>
