<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>宠物领养救助领养管理后台</title>
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
    <!-- 领养表列表查询部分  start-->
    <div id="page-wrapper">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">志愿者列表</h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->
        <div class="panel panel-default">
            <!-- 搜索部分 -->
            <div class="panel-body">
                <form class="form-inline" method="get" action="">
                    <div class="form-group">
                        <label for="findByState">状态</label>
                        <select class="form-control" id="findByState" name="state">
                            <option value="2">未处理</option>
                            <option value="3">已处理</option>
                        </select>
                    </div>
                    <button type="button" class="btn btn-primary" id="find_modal_btn">查询</button>
                </form>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">志愿者列表</div>
                    <!-- /.panel-heading -->
                    <table class="table table-bordered table-striped" id="apply_table">
                        <thead>
                        <tr>
                            <th>
                                <input type="checkbox" id="check_all"/>
                            </th>
                            <th>编号</th>
                            <th>用户名称</th>
                            <th>邮箱</th>
                            <th>年龄</th>
                            <th>电话</th>
                            <th>申请理由</th>
                            <th>申请时间</th>
                            <th>状态</th>
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
<!-- 审核信息模态框 -->
<div class="modal fade" id="examModal" tabindex="-1" role="dialog" aria-labelledby="examModal">
    <div class="modal-dialog" role="document"  style="width: 1000px;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">审核信息</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" method="post" >
                    <div class="form-group">
                        <label for="exam-state" class="col-sm-2 control-label">
                            状态：
                        </label>
                        <div class="col-sm-4">
                            <select class="form-control" id="exam-state" name="state">
                                <option value="2">未处理</option>
                                <option value="3">已处理</option>
                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal" id="pet_saveDown_btn">关闭</button>
                <button type="button" class="btn btn-primary" id="form-exam-save-btn">确认</button>
            </div>
        </div>
    </div>
</div>
<%@include file="common/footer.jsp"%>


<!-- 编写js代码 -->
<script type="text/javascript">

    //总的数据 当前的页面

    var totalRecord,currentPage,currentSize,currentPageSize;

    $(function(){
        to_page(1);
    });
    function to_page(pn){
        $.ajax({
            url:"${pageContext.request.contextPath}/apply/applys.action",
            data:"pn="+pn,
            type:"GET",
            success:function(result){
                resolving(result);
            }
        });
    }

    function resolving(result){
        //1、解析并显示员工数据
        build_adopts_table(result);
        //2、解析并显示分页信息
        build_page_info(result);
        //3、解析显示分页条数据
        build_page_nav(result);
    }
    function build_adopts_table(result){
        //清空table表格
        $("#apply_table tbody").empty();
        //index：下标 user：单个对象
        var applys=result.extend.pageInfo.list;
        $.each(applys,function(index,apply){
            var checkBoxTd = $("<td class='tabletd'><input type='checkbox' class='check_item'/></td>");
            var applyIdTd = $("<td class='tabletd'></td>").append(apply.id);
            var nameTd = $("<td class='tabletd'></td>").append(apply.name);
            var emailTd = $("<td class='tabletd'></td>").append(apply.email);
            var ageTd=$("<td class='tabletd'></td>").append(apply.age);
            var telephoneTd=$("<td class='tabletd'></td>").append(apply.telephone);
            var messageTd=$("<td class='tabletd'></td>").append(apply.message);
            var applyTimeTd=$("<td class='tabletd'></td>").append(apply.applyTime);
            var stateTd=null;
            if(apply.state==2){
                stateTd=$("<td class='tabletd'></td>").append("未处理");
            }else{
                stateTd=$("<td class='tabletd'></td>").append("已处理");
            }
            var examBtn =  $("<button></button>").addClass("btn  btn-primary btn-sm exam-btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-log-out")).append("审核");
            //为删除按钮添加一个自定义的属性来表示当前删除的员工id
            examBtn.attr("data-id",apply.id);
            var delBtn =  $("<button></button>").addClass("btn btn-danger btn-sm delete_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除");
            //为删除按钮添加一个自定义的属性来表示当前删除的员工id
            delBtn.attr("del-id",apply.id);
            var btnTd = $("<td class='tabletd'></td>").append(examBtn).append(" ").append(delBtn);
            //var delBtn =
            //append方法执行完成以后还是返回原来的元素
            $("<tr></tr>").append(checkBoxTd)
                .append(applyIdTd)
                .append(nameTd)
                .append(emailTd)
                .append(ageTd)
                .append(telephoneTd)
                .append(messageTd)
                .append(applyTimeTd)
                .append(stateTd)
                .append(btnTd)
                .appendTo("#apply_table tbody");
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

    //单个删除
    $(document).on("click",".delete_btn",function(){
        //1、弹出是否确认删除对话框
        var name = $(this).parents("tr").find("td:eq(2)").text();
        var id = $(this).attr("del-id");
        if(confirm("确认删除【"+name+"】吗？")){
            //确认，发送ajax请求删除即可
            $.ajax({
                url:"${pageContext.request.contextPath}/apply/delete.action?id="+id,
                type:"GET",
                success:function (result) {
                    if(result.code==100){
                        alert("申请删除成功！");
                        if(currentSize==1){
                            to_page(currentPage-1);
                        } else {
                            to_page(currentPage);
                        }
                    }else{
                        alert("删除失败！");
                        to_page(currentPage);
                    }
                }
            });
        }
    });
    $("#find_modal_btn").click(function () {
        $("#apply_table tbody").empty();
        var state=$("#findByState").val();
        to_findByState(1,state);
    });


    function to_findByState(pn,state) {
        $.ajax({
            url:"${pageContext.request.contextPath}/apply/findByState.action",
            type:"POST",
            dataType:"json",
            data:{"pn":pn,"state":state},
            async:"true",
            success:function (result) {
                build_adopts_table(result);
                build_page_info(result);
                build_page_findByState(result,state);
            },
            error:function (result) {
                alert("查询失败")
            }
        });
    }
    $(document).on('click',".exam-btn",function(){
        $("#examModal").modal('show');
        var id=$(this).attr("data-id");
        $("#form-exam-save-btn").attr("data-id",id);
    });

    $("#form-exam-save-btn").click(function(){
       var id= $(this).attr("data-id");
       var state=$("#exam-state").val();
       $.ajax({
           url:'${pageContext.request.contextPath}/apply/exam_state',
           type:'POST',
           data:{id:id,state:state},
           dataType:'json',
           success:function(result){
                if(result.code=="100"){
                    alert("审核成功");
                    window.location.reload();
                }else{
                    alert(result.message);
                }
           },
           error:function(){
                alert("网络错误");
           }
       })
    })


    //解析显示分页条，点击分页要能去下一页....
    function build_page_findByState(result,state){
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
                to_findByState(1,state);
            });
            prePageLi.click(function(){
                to_findByState(result.extend.pageInfo.pageNum -1,state);
            });
        }

        var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
        var lastPageLi = $("<li></li>").append($("<a></a>").append("末页").attr("href","#"));
        if(result.extend.pageInfo.hasNextPage == false){
            nextPageLi.addClass("disabled");
            lastPageLi.addClass("disabled");
        }else{
            nextPageLi.click(function(){
                to_findByState(result.extend.pageInfo.pageNum +1,state);
            });
            lastPageLi.click(function(){
                to_findByState(result.extend.pageInfo.pages,state);
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
                to_findByState(item,state);
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
