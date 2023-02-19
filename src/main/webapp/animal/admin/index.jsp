<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="Content-Type" content="multipart/form-data; charset=utf-8" />
    <title>管理员管理列表</title>
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
                <h1 class="page-header">管理员管理</h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->
        <div class="panel panel-default">
            <!-- 搜索部分 -->
            <div class="panel-body">
                <form class="form-inline" method="get" >
                    <div class="form-group">
                        <label for="findByName">账号</label>
                        <input type="text" class="form-control" id="findByName" value="" name="adminName">
                    </div>
                    <button type="button" class="btn btn-primary" id="admin_find_modal_btn">查询</button>
                </form>
            </div>
        </div>

        <button class="btn btn-primary" id="admin_add_modal_btn">添加</button>
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">管理员信息列表</div>
                    <!-- /.panel-heading -->
                    <table class="table table-bordered table-striped" id="admin_table">
                        <thead>
                        <tr>
                            <th>
                                <input type="checkbox" id="check_all"/>
                            </th>
                            <th>编号</th>
                            <th>账号</th>
                            <th>真实姓名</th>
                            <th>电话</th>
                            <th>邮箱</th>
                            <th>生日</th>
                            <th>性别</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>
                    <div class="col-md-12 text-right">

                    </div>
                    <!-- /.panel-body -->
                </div>
                <!-- /.panel -->
            </div>
            <!-- /.col-lg-12 -->
            <!-- 显示分页信息 -->
            <div class="row">
                <!--分页文字信息  -->
                <div class="col-md-8" id="page_info_area"></div>
                <!-- 分页条信息 -->
                <div class="col-md-4" id="page_nav_area">

                </div>
            </div>
        </div>
    </div>
    <!-- 用户查询  end-->
</div>
<!-- 添加管理员模态框 id newUser form users-->
<div class="modal fade" id="newAdmin" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">添加管理员信息</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="new_admin_form">
                    <div class="form-group">
                        <label for="new_adminName" class="col-sm-2 control-label">
                            账号
                        </label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="new_adminName" placeholder="请填写账号" name="adminName">
                        </div>
                        <label for="new_password" class="col-sm-2 control-label">
                            密码
                        </label>
                        <div class="col-sm-4">
                            <input type="password" class="form-control" id="new_password" placeholder="请填写密码" name="adminPwd">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="new_Name" class="col-sm-2 control-label">
                           名字
                        </label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="new_Name" placeholder="请填写名字" name="realName">
                        </div>
                        <label for="new_sex" class="col-sm-2 control-label">
                            性别
                        </label>
                        <div class="col-sm-4">
                            <select class="form-control" id="new_sex" name="sex">
                                <option value="男">男</option>
                                <option value="女">女</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="new_telephone" class="col-sm-2 control-label">
                            手机号
                        </label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="new_telephone" placeholder="请填写手机号" name="telephone">
                        </div>
                        <label for="new_Email" class="col-sm-2 control-label">
                            邮箱
                        </label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="new_Email" placeholder="请填写邮箱"  name="Email">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="new_birthday" class="col-sm-2 control-label">
                            生日
                        </label>
                        <div class="col-sm-4">
                            <input type="date" class="form-control" id="new_birthday" placeholder="请选择生日" name="birthday">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="new_remark" class="col-sm-2 control-label">
                            个人介绍
                        </label>
                        <div class="col-sm-10">
                            <textarea class="form-control" id="new_remark" placeholder="请填写个人介绍" name="remark"></textarea>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal" id="admin_saveDown_btn">关闭</button>
                <button type="button" class="btn btn-primary" id="form-add-save-btn">确认</button>
            </div>
        </div>
    </div>
</div>
<!-- 修改管理员模态框 -->
<div class="modal fade" id="editAdmin" tabindex="-1" role="dialog" aria-labelledby="myModalLabe">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
                <h4 class="modal-title" id="myModalLabe">修改管理员信息</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="edit_admin_form" >
                    <input type="hidden" id="edit_id" name="id">
                    <div class="form-group">
                        <label for="edit_adminName" class="col-sm-2 control-label">
                            账号
                        </label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="edit_adminName" placeholder="请填写账号" value="" name="adminName">
                        </div>
                        <label for="edit_password" class="col-sm-2 control-label">
                           密码
                        </label>
                        <div class="col-sm-4">
                            <input type="password" class="form-control" id="edit_password" placeholder="请填写密码" value="" name="adminPwd">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="edit_Name" class="col-sm-2 control-label">
                            名字
                        </label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="edit_Name" placeholder="请填写名字" value="" name="realName">
                        </div>
                        <label for="edit_sex" class="col-sm-2 control-label">
                            性别
                        </label>
                        <div class="col-sm-4">
                            <select class="form-control" id="edit_sex" value="" name="sex">
                                <option value="男">男</option>
                                <option value="女">女</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="edit_telephone" class="col-sm-2 control-label">
                            手机号
                        </label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="edit_telephone" placeholder="请填写手机号" value="" name="telephone">
                        </div>
                        <label for="edit_Email" class="col-sm-2 control-label">
                            邮箱
                        </label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="edit_Email" placeholder="请填写邮箱" value="${admin.email}"  name="Email">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="edit_birthday" class="col-sm-2 control-label">
                            生日
                        </label>
                        <div class="col-sm-4">
                            <input type="date" class="form-control" id="edit_birthday" placeholder="请选择生日" value="${admin.birthday}" name="birthday">
                        </div>

                    </div>
                    <div class="form-group">
                        <label for="edit_remark" class="col-sm-2 control-label">
                            个人介绍
                        </label>
                        <div class="col-sm-10">
                            <textarea class="form-control" id="edit_remark" placeholder="请填写个人介绍" value="${admin.remark}" name="remark"></textarea>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal" id="admin_updateDown_btn">关闭</button>
                <button type="button" class="btn btn-primary" id="form-edit-save-btn">确认</button>
            </div>
        </div>
    </div>
</div>
<%@include file="common/footer.jsp"%>
<!-- 编写js代码 -->
<script type="text/javascript">

    //总的数据 当前的页面

    var totalRecord,currentPage,currentSize,currentPageSize,currentPages;

    var isFlush=0;

    $(function(){
       to_page(1);
    });
    function to_page(pn){
        $.ajax({
            url:"${pageContext.request.contextPath}/admin/admins.action",
            data:"pn="+pn,
            type:"GET",
            success:function(result){
                resolving(result);
            }
        });
    }


    function resolving(result){
        //1、解析并显示员工数据
        build_admins_table(result);
        //2、解析并显示分页信息
        build_page_info(result);
        //3、解析显示分页条数据
        build_page_nav(result);
    }
    function build_admins_table(result){
        //清空table表格
        $("#admin_table tbody").empty();
        //index：下标 user：单个对象
        var admins=result.extend.pageInfo.list;
        $.each(admins,function(index,admin){
            var checkBoxTd = $("<td class='tabletd'><input type='checkbox' class='check_item'/></td>");
            var adminIdTd = $("<td class='tabletd'></td>").append(admin.id);
            var adminNameTd = $("<td class='tabletd'></td>").append(admin.adminName);
            var realNameTd = $("<td class='tabletd'></td>").append(admin.realName);
            var telephoneTd=$("<td class='tabletd'></td>").append(admin.telephone);
            var emailTd=$("<td class='tabletd'></td>").append(admin.email);
            var birthdayTd=$("<td class='tabletd'></td>").append(admin.birthday);
            var sexTd=$("<td class='tabletd'></td>").append(admin.sex);

            var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("修改");
            //为编辑按钮添加一个自定义的属性，来表示当前员工id
            editBtn.attr("edit-id",admin.id);
            var delBtn =  $("<button></button>").addClass("btn btn-danger btn-sm delete_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除");
            //为删除按钮添加一个自定义的属性来表示当前删除的员工id
            delBtn.attr("del-id",admin.id);
            var btnTd = $("<td></td>").append(editBtn).append(" ").append(delBtn);
            //var delBtn =
            //append方法执行完成以后还是返回原来的元素
            $("<tr></tr>").append(checkBoxTd)
                .append(adminIdTd)
                .append(adminNameTd)
                .append(realNameTd)
                .append(telephoneTd)
                .append(emailTd)
                .append(birthdayTd)
                .append(sexTd)
                .append(btnTd)
                .appendTo("#admin_table tbody");
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
    $("#admin_add_modal_btn").click(function(){
        //清除表单数据（表单完整重置（表单的数据，表单的样式））
        reset_form("#newAdmin form");
        //弹出模态框
        $("#newAdmin").modal({
            backdrop:"static"
        });
    });
    //点击保存，保存信息
    $("#form-add-save-btn").click(function(){
        var name=$("#new_adminName").val();
        var password=$("#new_password").val();
        var trueName=$("#new_Name").val();
        var phone=$("#new_telephone").val();
        var email=$("#new_Email").val();
        var birthday=$("#new_birthday").val();
        if(name==""){
            alert("请填写账号");
            return;
        }
        if(password==""){
            alert("请填写密码");
            return;
        }
        if(trueName==""){
            alert("请填写真实姓名");
            return;
        }
        if(phone==""){
            alert("请填写手机号");
            return;
        }
        if(email==""){
            alert("请填写邮箱");
            return;
        }
        if(birthday==""){
            alert("请选择生日");
            return;
        }
        //2、发送ajax请求保存员工
        $.ajax({
            url:"${pageContext.request.contextPath}/admin/add.action",
            type:"POST",
            data:$("#newAdmin form").serialize(),
            success:function (result) {
                if(result.code=="100"){
                    alert("管理员添加成功");
                    $("#admin_saveDown_btn").click();
                    if(currentSize==currentPageSize){
                        to_page(currentPages+1);
                    } else {
                        to_page(currentPages);
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

    //点击编辑按钮弹出模态框。
    $(document).on("click",".edit_btn",function(){
        //1、发送ajax,根据id获取用户信息
        //清除表单数据（表单完整重置（表单的数据，表单的样式））
        reset_form("#editAdmin form");
        var id = $(this).attr("edit-id");
        $.ajax({
            url:"${pageContext.request.contextPath}/admin/findById.action?id="+id,
            type:"GET",
            success:function(result){
                //填充用户信息
                $("#edit_id").val(result.extend.admin.id);
                $("#edit_adminName").val(result.extend.admin.adminName);
                $("#edit_password").val(result.extend.admin.adminPwd);
                $("#edit_Name").val(result.extend.admin.realName)
                $("#edit_sex").val(result.extend.admin.sex);
                $("#edit_telephone").val(result.extend.admin.telephone);
                $("#edit_Email").val(result.extend.admin.email);
                $("#edit_birthday").val(result.extend.admin.birthday);
                $("#edit_remark").val(result.extend.admin.remark);
            }});
        //2、弹出模态框
        $("#editAdmin").modal({
            backdrop:"static"
        });

    });

    //点击更新按钮弹出模态框。
    $("#form-edit-save-btn").click(function(){
       var adminName= $("#edit_adminName").val();
       var password= $("#edit_password").val();
       var realName= $("#edit_Name").val()
       var phone= $("#edit_telephone").val();
       var email= $("#edit_Email").val();
       var birthday= $("#edit_birthday").val();
        if(adminName==""){
            alert("请填写账号");
            return;
        }
        if(password==""){
            alert("请填写密码");
            return;
        }
        if(realName==""){
            alert("请填写真实姓名");
            return;
        }
        if(phone==""){
            alert("请填写手机号");
            return;
        }
        if(email==""){
            alert("请填写邮箱");
            return;
        }
        if(birthday==""){
            alert("请选择生日");
            return;
        }
        var admin=document.getElementById("edit_admin_form");
        var adminInfo=new FormData(admin);
        $.ajax({
            url:"${pageContext.request.contextPath}/admin/edit.action",
            type:"POST",
            processData: false,  // 告诉jQuery不要去处理发送的数据
            contentType: false, // 告诉jQuery不要去设置Content-Type请求头
            data:adminInfo,
            success:function (result) {
                if(result.code=="100"){
                    alert("管理员编辑成功！");
                    $("#admin_updateDown_btn").click();
                    to_page(currentPage);
                }else{
                    alert(result.message);
                }
            },
            error:function(result){
                alert("网络错误");
                to_page(currentPage);
            }
        });

    });

    //单个删除
    $(document).on("click",".delete_btn",function(){
        //1、弹出是否确认删除对话框
        var adminName = $(this).parents("tr").find("td:eq(2)").text();
        var adminId = $(this).attr("del-id");
        if(confirm("确认删除【"+adminName+"】吗？")){
            //确认，发送ajax请求删除即可
            $.ajax({
                url:"${pageContext.request.contextPath}/admin/delete.action?id="+adminId,
                type:"GET",
                success:function (result) {
                    if(result.code==100){
                        alert("管理员删除成功！");
                        if(currentSize==1){
                            to_page(currentPage-1);
                        } else {
                            to_page(currentPage);
                        }
                    }else{
                        alert("管理员删除失败！");
                        to_page(currentPage);
                    }
                }
            });
        }
    });
    $("#admin_find_modal_btn").click(function () {
        $("#admin_table tbody").empty();
        var adminName=$("#findByName").val();
        to_findByName(1,adminName);
    });

    function to_findByName(pn,adminName) {
        $.ajax({
            url:"${pageContext.request.contextPath}/admin/findByName.action?",
            type:"POST",
            dataType:"json",
            data:{"pn":pn,"adminName":adminName},
            async:"true",
            success:function (result) {
                build_admins_table(result);
                build_page_info(result);
                build_page_findByName(result,adminName);
            },
            error:function (result) {
                alert("拆个年间哎你是")
            }
        });
    }

    //解析显示分页条，点击分页要能去下一页....
    function build_page_findByName(result,adminName){
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
                to_findByName(1,adminName);
            });
            prePageLi.click(function(){
                to_findByName(result.extend.pageInfo.pageNum -1,adminName);
            });
        }

        var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
        var lastPageLi = $("<li></li>").append($("<a></a>").append("末页").attr("href","#"));
        if(result.extend.pageInfo.hasNextPage == false){
            nextPageLi.addClass("disabled");
            lastPageLi.addClass("disabled");
        }else{
            nextPageLi.click(function(){
                to_findByName(result.extend.pageInfo.pageNum +1,adminName);
            });
            lastPageLi.click(function(){
                to_findByName(result.extend.pageInfo.pages,adminName);
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
                to_findByName(item,adminName);
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

</body>
</html>
