<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>宠物领养救助领养管理后台</title>
    <%@include file="common/header.jsp" %>
    <style>
        .tabletd {
            text-align: center;
        }
    </style>
</head>
<body>
<div id="wrapper">
    <%@include file="common/menu.jsp" %>
    <div id="page-wrapper">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">活动管理</h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->
        <div class="panel panel-default">
            <!-- 搜索部分 -->
            <div class="panel-body">
                <form class="form-inline" method="get" action="">
                    <div class="form-group">
                        <label for="findByTime">活动时间</label>
                        <input type="date" class="form-control" id="findByTime" value="" name="actionTime">
                    </div>
                    <button type="button" class="btn btn-primary" id="blog_find_modal_btn">查询</button>
                </form>
            </div>
        </div>
        <button class="btn btn-primary" id="blog_add_modal_btn">添加</button>
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">活动列表</div>
                    <!-- /.panel-heading -->
                    <table class="table table-bordered table-striped" id="blog_table">
                        <thead>
                        <tr>
                            <th>
                                <input type="checkbox" id="check_all"/>
                            </th>
                            <th>编号</th>
                            <th>活动标题</th>
                            <th>活动时间</th>
                            <th>活动地址</th>
                            <th>适合人群</th>
                            <th>活动内容</th>
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
<!-- 创建用户模态框 id newUser form users-->
<div class="modal fade" id="newBlog" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">添加活动信息</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="new_blog_form">
                    <div class="form-group">
                        <label for="new_title" class="col-sm-2 control-label">
                            活动标题
                        </label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="new_title" placeholder="请填写标题" name="title">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="new_actionTime" class="col-sm-2 control-label">
                            活动时间
                        </label>
                        <div class="col-sm-10">
                            <input type="date" class="form-control" id="new_actionTime" placeholder="请选择活动时间"
                                   name="actionTime">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="new_address" class="col-sm-2 control-label">
                            活动地点
                        </label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="new_address" placeholder="请填写活动地点"
                                   name="address">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="new_peoples" class="col-sm-2 control-label">
                            活动适合群体
                        </label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="new_peoples" placeholder="请填写活动适合群体"
                                   name="peoples">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="new_event" class="col-sm-2 control-label">
                            活动介绍
                        </label>
                        <div class="col-sm-10">
                            <textarea class="form-control" style="height: 300px;" id="new_event" placeholder="请填写活动介绍" name="event"></textarea>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal" id="blog_saveDown_btn">关闭</button>
                <button type="button" class="btn btn-primary" id="blog_save_btn">提交</button>
            </div>
        </div>
    </div>
</div>
<!-- 修改班级模态框 -->
<div class="modal fade" id="editBlog" tabindex="-1" role="dialog" aria-labelledby="myModalLabe">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
                <h4 class="modal-title" id="myModalLabe">修改活动信息</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="edit_blog_form">
                    <input type="hidden" id="edit_id" name="id">
                    <div class="form-group">
                        <label for="edit_title" class="col-sm-2 control-label">
                            活动标题
                        </label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="edit_title" placeholder="请填写标题"
                                   value="" name="title">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="edit_actionTime" class="col-sm-2 control-label">
                            活动时间
                        </label>
                        <div class="col-sm-10">
                            <input type="date" class="form-control" id="edit_actionTime" placeholder="请选择活动时间"
                                   value="" name="actionTime">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="edit_address" class="col-sm-2 control-label">
                            活动地点
                        </label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="edit_address" placeholder="请填写活动地点"
                                   value="" name="address">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="edit_peoples" class="col-sm-2 control-label">
                            活动适合群体
                        </label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="edit_peoples" placeholder="请填写活动适合群体"
                                   value="" name="peoples">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="edit_event" class="col-sm-2 control-label">
                            活动介绍
                        </label>
                        <div class="col-sm-10">
                            <textarea class="form-control" style="height: 300px;" id="edit_event" placeholder="请填写活动介绍" value=""
                                      name="event"></textarea>
                        </div>
                    </div>

                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal" id="blog_updateDown_btn">关闭</button>
                <button type="button" class="btn btn-primary" id="blog_edit_btn">保存修改</button>
            </div>
        </div>
    </div>
</div>
<%@include file="common/footer.jsp" %>

<!-- 编写js代码 -->

<script type="text/javascript">
    //总的数据 当前的页面

    var totalRecord, currentPage, currentSize, currentPageSize, currentPages;

    $(function () {
        to_page(1);
    });

    function to_page(pn) {
        $.ajax({
            url: "${pageContext.request.contextPath}/blog/blogs.action",
            data: "pn=" + pn,
            type: "GET",
            success: function (result) {
                resolving(result);
            }
        });
    }

    function resolving(result) {
        //1、解析并显示员工数据
        build_blogs_table(result);
        //2、解析并显示分页信息
        build_page_info(result);
        //3、解析显示分页条数据
        build_page_nav(result);
    }

    function build_blogs_table(result) {
        //清空table表格
        $("#blog_table tbody").empty();
        //index：下标 user：单个对象
        var blogs = result.extend.pageInfo.list;
        $.each(blogs, function (index, blog) {
            var checkBoxTd = $("<td class='tabletd'><input type='checkbox' class='check_item'/></td>");

            var blogIdTd = $("<td class='tabletd'></td>").append(blog.id);
            var titleTd = $("<td class='tabletd'></td>").append(blog.title);
            var actionTimed = $("<td class='tabletd'></td>").append(blog.actionTime);
            var addressTd = $("<td class='tabletd'></td>").append(blog.address);
            var peoplesTd = $("<td class='tabletd'></td>").append(blog.peoples);
            var eventTd = $("<td class='tabletd'></td>").append(blog.event);

            var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("修改");
            //为编辑按钮添加一个自定义的属性，来表示当前员工id
            editBtn.attr("edit-id", blog.id);
            var delBtn = $("<button></button>").addClass("btn btn-danger btn-sm delete_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除");
            //为删除按钮添加一个自定义的属性来表示当前删除的员工id
            delBtn.attr("del-id", blog.id);
            var btnTd = $("<td class='tabletd'></td>").append(editBtn).append(" ").append(delBtn);
            //var delBtn =
            //append方法执行完成以后还是返回原来的元素
            $("<tr></tr>").append(checkBoxTd)
                .append(blogIdTd)
                .append(titleTd)
                .append(actionTimed)
                .append(addressTd)
                .append(peoplesTd)
                .append(eventTd)

                .append(btnTd)
                .appendTo("#blog_table tbody");
        });
    }

    //解析显示分页信息
    function build_page_info(result) {
        $("#page_info_area").empty();
        $("#page_info_area").append("当前" + result.extend.pageInfo.pageNum + "页,总" +
            result.extend.pageInfo.pages + "页,总" +
            result.extend.pageInfo.total + "条记录");
        totalRecord = result.extend.pageInfo.total;//最后的数据
        currentPage = result.extend.pageInfo.pageNum;//当前页
        currentPages = result.extend.pageInfo.pages;//总的页数
        currentSize = result.extend.pageInfo.size;//当前页面的尺寸
        currentPageSize = result.extend.pageInfo.pageSize;//每页的尺寸
    }

    //解析显示分页条，点击分页要能去下一页....
    function build_page_nav(result) {
        //page_nav_area
        $("#page_nav_area").empty();
        var ul = $("<ul></ul>").addClass("pagination");

        //构建元素
        var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href", "#"));
        var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;"));
        if (result.extend.pageInfo.hasPreviousPage == false) {
            firstPageLi.addClass("disabled");
            prePageLi.addClass("disabled");
        } else {
            //为元素添加点击翻页的事件
            firstPageLi.click(function () {
                to_page(1);
            });
            prePageLi.click(function () {
                to_page(result.extend.pageInfo.pageNum - 1);
            });
        }

        var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
        var lastPageLi = $("<li></li>").append($("<a></a>").append("末页").attr("href", "#"));
        if (result.extend.pageInfo.hasNextPage == false) {
            nextPageLi.addClass("disabled");
            lastPageLi.addClass("disabled");
        } else {
            nextPageLi.click(function () {
                to_page(result.extend.pageInfo.pageNum + 1);
            });
            lastPageLi.click(function () {
                to_page(result.extend.pageInfo.pages);
            });
        }

        //添加首页和前一页 的提示
        ul.append(firstPageLi).append(prePageLi);
        //1,2，3遍历给ul中添加页码提示
        $.each(result.extend.pageInfo.navigatepageNums, function (index, item) {

            var numLi = $("<li></li>").append($("<a></a>").append(item));
            if (result.extend.pageInfo.pageNum == item) {
                numLi.addClass("active");
            }
            numLi.click(function () {
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
    function reset_form(ele) {
        $(ele)[0].reset();
        //清空表单样式
        $(ele).find("*").removeClass("has-error has-success");
        $(ele).find(".help-block").text("");
    }

    //点击新增按钮弹出模态框。
    $("#blog_add_modal_btn").click(function () {
        //清除表单数据（表单完整重置（表单的数据，表单的样式））
        reset_form("#newBlog form");
        //弹出模态框
        $("#newBlog").modal({
            backdrop: "static"
        });
    });
    //点击保存，保存员工。
    $("#blog_save_btn").click(function () {
        var title = $("#new_title").val();
        var time = $("#new_actionTime").val();
        var address = $("#new_address").val();
         var people=$("#new_peoples").val();
         var content=$("#new_event").val();
         if(title==""){
             alert("请填写活动标题");
             return;
         }
        if(time==""){
            alert("请填写活动时间");
            return;
        }
        if(address==""){
            alert("请填写活动地址");
            return;
        }
        if(people==""){
            alert("请填写活动适合人群");
            return;
        }
        if(content==""){
            alert("请填写活动内容");
            return;
        }
        //2、发送ajax请求保存员工
        $.ajax({
            url: "${pageContext.request.contextPath}/blog/add.action",
            type: "POST",
            data: $("#newBlog form").serialize(),
            success: function (result) {
                if(result.code=="100"){
                    alert("活动添加成功");
                    $("#blog_saveDown_btn").click();
                    if (currentSize == currentPageSize) {
                        to_page(currentPages + 1);
                    } else {
                        to_page(currentPages)
                    }
                }else{
                    alert(rsult.message);
                }

            },
            error: function (result) {
                alert("网络错误");

            }
        });
    });


    //点击编辑按钮弹出模态框。
    $(document).on("click", ".edit_btn", function () {
        //1、发送ajax,根据id获取用户信息
        //清除表单数据（表单完整重置（表单的数据，表单的样式））
        reset_form("#editBlog form");
        var id = $(this).attr("edit-id");
        $.ajax({
            url: "${pageContext.request.contextPath}/blog/findById.action?id=" + id,
            type: "GET",
            success: function (result) {
                $("#edit_id").val(result.extend.blog.id);
                $("#edit_actionTime").val(result.extend.blog.actionTime);
                $("#edit_address").val(result.extend.blog.address);
                $("#edit_peoples").val(result.extend.blog.peoples)
                $("#edit_event").val(result.extend.blog.event);
                $("#edit_title").val(result.extend.blog.title);

            }
        });
        //2、弹出模态框
        $("#editBlog").modal({
            backdrop: "static"
        });

    });

    //点击更新按钮弹出模态框。
    $("#blog_edit_btn").click(function () {
        var title = $("#edit_title").val();
        var time = $("#edit_actionTime").val();
        var address = $("#edit_address").val();
        var people=$("#edit_peoples").val();
        var content=$("#edit_event").val();
        if(title==""){
            alert("请填写活动标题");
            return;
        }
        if(time==""){
            alert("请填写活动时间");
            return;
        }
        if(address==""){
            alert("请填写活动地址");
            return;
        }
        if(people==""){
            alert("请填写活动适合人群");
            return;
        }
        if(content==""){
            alert("请填写活动内容");
            return;
        }
        $.ajax({
            url: "${pageContext.request.contextPath}/blog/edit.action",
            type: "POST",
            data: $("#edit_blog_form").serialize(),
            success: function (result) {
                if(result.code=="100"){
                    alert("活动信息更新成功！");
                    $("#blog_updateDown_btn").click();
                    to_page(currentPage);
                }else{
                    alert(result.message);
                }
            },
            error: function (result) {
                alert("网络错误");
                to_page(currentPage);
            }
        });

    });

    //单个删除
    $(document).on("click", ".delete_btn", function () {
        debugger;
        //1、弹出是否确认删除对话框
        var title = $(this).parents("tr").find("td:eq(2)").text();
        var id = $(this).attr("del-id");

        if (confirm("确认删除标题为：【" + title + "】吗？")) {
            //确认，发送ajax请求删除即可
            $.ajax({
                url: "${pageContext.request.contextPath}/blog/delete.action?id=" + id,
                type: "GET",
                success: function (result) {
                    if(result.code=="100"){
                        alert("活动删除成功！");
                        if (currentSize == 1) {
                            to_page(currentPage - 1);
                        } else {
                            to_page(currentPage);
                        }
                    }else{
                        alert(result.message);
                    }

                },
                error: function (result) {
                    alert("网络错误");
                    to_page(currentPage);
                }
            });
        }
    });


    $("#blog_find_modal_btn").click(function () {
        $("#blog_table tbody").empty();
        var actionTime = $("#findByTime").val();
        to_findByTime(1, actionTime);

    });

    function to_findByTime(pn, actionTime) {
        $.ajax({
            url: "${pageContext.request.contextPath}/blog/findByTime.action?",
            type: "POST",
            dataType: "json",
            data: {"pn": pn, "actionTime": actionTime},
            async: "true",
            success: function (result) {
                build_blogs_table(result);
                build_page_info(result);
                build_page_findByTime(result, actionTime);
            },
            error: function (result) {
                alert("查询错误")
            }
        });
    }

    //解析显示分页条，点击分页要能去下一页....
    function build_page_findByTime(result, actionTime) {
        //page_nav_area
        $("#page_nav_area").empty();
        var ul = $("<ul></ul>").addClass("pagination");

        //构建元素
        var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href", "#"));
        var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;"));
        if (result.extend.pageInfo.hasPreviousPage == false) {
            firstPageLi.addClass("disabled");
            prePageLi.addClass("disabled");
        } else {
            //为元素添加点击翻页的事件
            firstPageLi.click(function () {
                to_findByTime(1, actionTime);
            });
            prePageLi.click(function () {
                to_findByTime(result.extend.pageInfo.pageNum - 1, actionTime);
            });
        }

        var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
        var lastPageLi = $("<li></li>").append($("<a></a>").append("末页").attr("href", "#"));
        if (result.extend.pageInfo.hasNextPage == false) {
            nextPageLi.addClass("disabled");
            lastPageLi.addClass("disabled");
        } else {
            nextPageLi.click(function () {
                to_findByTime(result.extend.pageInfo.pageNum + 1, actionTime);
            });
            lastPageLi.click(function () {
                to_findByTime(result.extend.pageInfo.pages, actionTime);
            });
        }

        //添加首页和前一页 的提示
        ul.append(firstPageLi).append(prePageLi);
        //1,2，3遍历给ul中添加页码提示
        $.each(result.extend.pageInfo.navigatepageNums, function (index, item) {

            var numLi = $("<li></li>").append($("<a></a>").append(item));
            if (result.extend.pageInfo.pageNum == item) {
                numLi.addClass("active");
            }
            numLi.click(function () {
                to_findByTime(item, actionTime);
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
