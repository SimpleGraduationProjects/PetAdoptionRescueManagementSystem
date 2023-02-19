<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html><head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="Content-Type" content="multipart/form-data; charset=utf-8" />
    <title>用户管理列表</title>
    <%@include file="common/header.jsp"%>
    <style>
        .tabletd{
        text-align: center;
        }
    </style>
</head>
<body>
<div id="wrapper">
    <%@include file="common/menu.jsp"%>
    <!-- 班级列表查询部分  start-->
    <div id="page-wrapper">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">用户管理</h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->
        <div class="panel panel-default">
            <!-- 搜索部分 -->
            <div class="panel-body">
                <form class="form-inline" method="get" action="">
                    <div class="form-group">
                        <label for="findByName">用户名称</label>
                        <input type="text" class="form-control" id="findByName" value="" name="userName">
                    </div>
                    <button type="button" class="btn btn-primary" id="user_find_modal_btn">查询</button>
                </form>
            </div>
        </div>
        <button class="btn btn-primary" id="user_add_modal_btn">添加</button>
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">用户信息列表</div>
                    <!-- /.panel-heading -->
                    <table class="table table-bordered table-striped" id="user_table">
                        <thead>
                        <tr>
                            <th>
                                <input type="checkbox" id="check_all"/>
                            </th>
                            <th>编号</th>
                            <th>用户名</th>
                            <th>性别</th>
                            <th>年龄</th>
                            <th>电话</th>
                            <th>地址</th>
                            <th>有无领养</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>

                        </tbody>
                    </table>
                    <div class="row">
                        <!--分页文字信息  -->
                        <div class="col-md-8" id="page_info_area"></div>
                        <!-- 分页条信息 -->
                        <div class="col-md-4" id="page_nav_area">

                        </div>
                    </div>
                    <!-- /.panel-body -->
                </div>
                <!-- /.panel -->
            </div>
            <!-- /.col-lg-12 -->
        </div>
    </div>
    <!-- 用户查询  end-->
</div>
<!-- 添加用户模态框 id newUser form users-->
<div class="modal fade" id="newUsers" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">添加用户信息</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="new_users_form" method="post" enctype="multipart/form-data">
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
                <button type="button" class="btn btn-default" data-dismiss="modal" id="user_saveDown-btn">关闭</button>
                <button type="button" class="btn btn-primary" id="user-add-save-btn">确认</button>
            </div>
        </div>
    </div>
</div>
<!-- 修改用户模态框 -->
<div class="modal fade" id="editUsers" tabindex="-1" role="dialog" aria-labelledby="myModalLabe">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
                <h4 class="modal-title" id="myModalLabe">修改用户信息</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="edit_user_form" method="post" enctype="multipart/form-data">
                    <input type="hidden" id="edit_id" name="id">
                    <div class="form-group">
                        <label for="edit_userName" class="col-sm-2 control-label">
                            用户名称
                        </label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="edit_userName" placeholder="请填写用户名称" value="" name="userName">
                        </div>
                        <label for="edit_password" class="col-sm-2 control-label">
                            用户密码
                        </label>
                        <div class="col-sm-4">
                            <input type="password" class="form-control" id="edit_password" placeholder="请填写用户密码" value="" name="password">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="edit_sex" class="col-sm-2 control-label">
                            性别
                        </label>
                        <div class="col-sm-4">
                            <select class="form-control" id="edit_sex" value="" name="sex">
                                <option value="男">男</option>
                                <option value="女">女</option>
                            </select>
                        </div>
                        <label for="edit_age" class="col-sm-2 control-label">
                            年龄
                        </label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="edit_age" placeholder="请填写年龄" name="age">
                        </div>

                    </div>
                    <div class="form-group">
                        <label for="edit_telephone" class="col-sm-2 control-label">
                            手机号码
                        </label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="edit_telephone" placeholder="请填写手机号码" value="" name="telephone">
                        </div>
                        <label for="edit_Email" class="col-sm-2 control-label">
                            邮箱
                        </label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="edit_Email" placeholder="请填写邮箱" value=""  name="Email">
                        </div>

                    </div>
                    <div class="form-group">
                        <label for="edit_address" class="col-sm-2 control-label">
                            地址
                        </label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="edit_address" placeholder="请填写地址" value="" name="address">
                        </div>
                        <label for="edit_state" class="col-sm-2 control-label">
                            经历
                        </label>
                        <div class="col-sm-4">
                            <select class="form-control" id="edit_state" value="" name="state">
                                <option value="0">有领养经历</option>
                                <option value="1">无领养经历</option>
                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal" id="user_updateDown-btn">关闭</button>
                <button type="button" class="btn btn-primary" id="user_edit_save_btn">确认</button>
            </div>
        </div>
    </div>
</div>
<%@include file="common/footer.jsp"%>
<!-- 编写js代码 -->
<script type="text/javascript">

    var totalRecord,currentPage,currentSize,currentPageSize,currentPages;
    $(document).ready(function(){
        var key=$("#selectRefundReason").val();
        //根据值让option选中
        $("#user_time_zone option[value='"+key+"']").attr("selected","selected");
    });
    $(function(){
        to_page(1);
    });
    function to_page(pn){
        $.ajax({
            url:"${pageContext.request.contextPath}/user/users.action",
            data:"pn="+pn,
            type:"GET",
            success:function(result){
                resolving(result);
            }
        });
    }

    function resolving(result){
        //1、解析并显示员工数据
        build_users_table(result);
        //2、解析并显示分页信息
        build_page_info(result);
        //3、解析显示分页条数据
        build_page_nav(result);
    }
    function build_users_table(result){
        //清空table表格
        $("#user_table tbody").empty();
        //index：下标 user：单个对象
        var users=result.extend.pageInfo.list;
        $.each(users,function(index,user){
            var checkBoxTd = $("<td class='tabletd'><input type='checkbox' class='check_item'/></td>");
            var userIdTd = $("<td class='tabletd'></td>").append(user.id);
            var userNameTd = $("<td class='tabletd'></td>").append(user.userName);
            var sexTd = $("<td class='tabletd'></td>").append(user.sex);
            var ageTd=$("<td class='tabletd'></td>").append(user.age);
            var telephoneTd=$("<td class='tabletd'></td>").append(user.telephone);
            var addressTd=$("<td class='tabletd'></td>").append(user.address);
            var stateTd=null;
            if(user.state==0){
                stateTd=$("<td class='tabletd'></td>").append("有领养经历");
            }else{
                stateTd=$("<td class='tabletd'></td>").append("没有领养经历");
            }

            var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("修改");
            //为编辑按钮添加一个自定义的属性，来表示当前员工id
            editBtn.attr("edit-id",user.id);
            var delBtn =  $("<button></button>").addClass("btn btn-danger btn-sm delete_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除");
            //为删除按钮添加一个自定义的属性来表示当前删除的员工id
            delBtn.attr("del-id",user.id);
            var btnTd = $("<td></td>").append(editBtn).append(" ").append(delBtn);
            //var delBtn =
            //append方法执行完成以后还是返回原来的元素
            $("<tr></tr>").append(checkBoxTd)
                .append(userIdTd)
                .append(userNameTd)
                .append(sexTd)
                .append(ageTd)
                .append(telephoneTd)
                .append(addressTd)
                .append(stateTd)
                .append(btnTd)
                .appendTo("#user_table tbody");
        });
    }

    //解析显示分页信息
    function build_page_info(result){
        $("#page_info_area").empty();
        $("#page_info_area").append("当前"+result.extend.pageInfo.pageNum+"页,总"+
            result.extend.pageInfo.pages+"页,总"+
            result.extend.pageInfo.total+"条记录");
        totalRecord = result.extend.pageInfo.total;//最后的数据
        currentPage = result.extend.pageInfo.pageNum;//当前页
        currentPages=result.extend.pageInfo.pages;
        currentSize=result.extend.pageInfo.size;//当前页面的尺寸
        currentPageSize=result.extend.pageInfo.pageSize;//每页的尺寸
    }
    //解析显示分页条，点击分页要能去下一页....
    function build_page_nav(result){
        //page_nav_area
        $("#page_nav_area").empty();
        var ul = $("<ul></ul>").addClass("pagination");

        //构建元素
        var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href","#"));
        var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;"));
        if(result.extend.pageInfo.hasPreviousPage == false){
            firstPageLi.addClass("disabled");
            prePageLi.addClass("disabled");
        }else{
            //为元素添加点击翻页的事件
            firstPageLi.click(function(){
                to_page(1);
            });
            prePageLi.click(function(){
                to_page(result.extend.pageInfo.pageNum -1);
            });
        }

        var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
        var lastPageLi = $("<li></li>").append($("<a></a>").append("末页").attr("href","#"));
        if(result.extend.pageInfo.hasNextPage == false){
            nextPageLi.addClass("disabled");
            lastPageLi.addClass("disabled");
        }else{
            nextPageLi.click(function(){
                to_page(result.extend.pageInfo.pageNum +1);
            });
            lastPageLi.click(function(){
                to_page(result.extend.pageInfo.pages);
            });
        }

        //添加首页和前一页 的提示
        ul.append(firstPageLi).append(prePageLi);
        //1,2，3遍历给ul中添加页码提示
        $.each(result.extend.pageInfo.navigatepageNums,function(index,item){

            var numLi = $("<li></li>").append($("<a></a>").append(item));
            if(result.extend.pageInfo.pageNum == item){
                numLi.addClass("active");
            }
            numLi.click(function(){
                to_page(item);
            });
            ul.append(numLi);
        });
        //添加下一页和末页 的提示
        ul.append(nextPageLi).append(lastPageLi);

        //把ul加入到nav
        var navEle = $("<nav></nav>").append(ul);
        navEle.appendTo("#page_nav_area");
    }


    //清空表单样式及内容
    function reset_form(ele){
        $(ele)[0].reset();
        //清空表单样式
        $(ele).find("*").removeClass("has-error has-success");
        $(ele).find(".help-block").text("");
    }

    //点击新增按钮弹出模态框。
    $("#user_add_modal_btn").click(function(){
        //清除表单数据（表单完整重置（表单的数据，表单的样式））
        reset_form("#newUsers form");
        //弹出模态框
        $("#newUsers").modal({
            backdrop:"static"
        });
    });

    //点击保存，保存员工。
    $("#user-add-save-btn").click(function(){
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
        //2、发送ajax请求保存员工
        $.ajax({
            url:"${pageContext.request.contextPath}/user/add.action",
            type:"POST",
            data:$("#newUsers form").serialize(),
            success:function (result) {
                if(result.code=="100"){
                    alert("用户添加成功");
                    $("#user_saveDown-btn").click();
                    if(currentSize==currentPageSize) {
                        to_page(currentPages + 1);
                    }else{
                        to_page(currentPages);
                    }
                }else{
                    alert(result.message)
                }
            },
            error:function (result) {
                alert("网络错误");

            }
        });
    });

    //点击编辑按钮弹出模态框。
    $(document).on("click",".edit_btn",function(){
        //1、发送ajax,根据id获取用户信息
        //清除表单数据（表单完整重置（表单的数据，表单的样式））
        reset_form("#editUsers form");
        var id = $(this).attr("edit-id");
        $.ajax({
            url:"${pageContext.request.contextPath}/user/findById.action?id="+id,
            type:"GET",
            success:function(result){
                //填充用户信息
                $("#edit_id").val(result.extend.user.id);
                $("#edit_userName").val(result.extend.user.userName);
                $("#edit_password").val(result.extend.user.password);
                $("#edit_age").val(result.extend.user.age);
                $("#edit_sex").val(result.extend.user.sex);
                $("#edit_telephone").val(result.extend.user.telephone);
                $("#edit_Email").val(result.extend.user.email);
                $("#edit_address").val(result.extend.user.address);
                $("#edit_state").val(result.extend.user.state);
            }});
        //2、弹出模态框
        $("#editUsers").modal({
            backdrop:"static"
        });

    });

    //点击更新按钮弹出模态框。
    $("#user_edit_save_btn").click(function(){
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
            data:$("#edit_user_form").serialize(),
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
                to_page(currentPage);
            }
        });
    });

    //单个删除
    $(document).on("click",".delete_btn",function(){
        //1、弹出是否确认删除对话框
        var userName = $(this).parents("tr").find("td:eq(2)").text();
        var userId = $(this).attr("del-id");

        if(confirm("确认删除【"+userName+"】吗？")){
            //确认，发送ajax请求删除即可
            $.ajax({
                url:"${pageContext.request.contextPath}/user/delete.action?id="+userId,
                type:"GET",
                success:function (result) {
                    if(result.code=="100"){
                        alert("用户删除成功！");
                        if(currentSize==1){
                            to_page(currentPage-1);
                        } else {
                            to_page(currentPage);
                        }
                    }else{
                        alert(result.message);
                    }
                },
                error:function (result) {
                    alert("网络错误");
                    to_page(currentPage);
                }
            });
        }
    });

    $("#user_find_modal_btn").click(function () {
        $("#user_table tbody").empty();
        var userName=$("#findByName").val();
        to_findByNamePage(1,userName);
    });

    function to_findByNamePage(pn,userName) {
        $.ajax({
            url:"${pageContext.request.contextPath}/user/findByName.action?",
            type:"POST",
            dataType:"json",
            data:{"userName":userName,"pn":pn},
            async:"true",
            success:function (result) {
                build_users_table(result);
                build_page_info(result);
                build_page_findByName(result,userName);
            },
            error:function (result) {
                alert("查询用户信息错误")
            }
        });
    }


    //解析显示分页条，点击分页要能去下一页....
    function build_page_findByName(result,userName){
        //page_nav_area
        $("#page_nav_area").empty();
        var ul = $("<ul></ul>").addClass("pagination");

        //构建元素
        var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href","#"));
        var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;"));
        if(result.extend.pageInfo.hasPreviousPage == false){
            firstPageLi.addClass("disabled");
            prePageLi.addClass("disabled");
        }else{
            //为元素添加点击翻页的事件
            firstPageLi.click(function(){
                to_findByNamePage(1,userName);
            });
            prePageLi.click(function(){
                to_findByNamePage(result.extend.pageInfo.pageNum -1);
            });
        }

        var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
        var lastPageLi = $("<li></li>").append($("<a></a>").append("末页").attr("href","#"));
        if(result.extend.pageInfo.hasNextPage == false){
            nextPageLi.addClass("disabled");
            lastPageLi.addClass("disabled");
        }else{
            nextPageLi.click(function(){
                to_findByNamePage(result.extend.pageInfo.pageNum +1,userName);
            });
            lastPageLi.click(function(){
                to_findByNamePage(result.extend.pageInfo.pages,userName);
            });
        }

        //添加首页和前一页 的提示
        ul.append(firstPageLi).append(prePageLi);
        //1,2，3遍历给ul中添加页码提示
        $.each(result.extend.pageInfo.navigatepageNums,function(index,item){

            var numLi = $("<li></li>").append($("<a></a>").append(item));
            if(result.extend.pageInfo.pageNum == item){
                numLi.addClass("active");
            }
            numLi.click(function(){
                to_findByNamePage(item,userName);
            });
            ul.append(numLi);
        });
        //添加下一页和末页 的提示
        ul.append(nextPageLi).append(lastPageLi);

        //把ul加入到nav
        var navEle = $("<nav></nav>").append(ul);
        navEle.appendTo("#page_nav_area");
    }
</script>

</body></html>
