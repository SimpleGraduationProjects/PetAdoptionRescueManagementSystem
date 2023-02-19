<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html><head>
    <meta content="text/html; charset=UTF-8">
    <meta http-equiv="Content-Type" content="multipart/form-data; charset=utf-8" />
    <title>宠物领养救助管理列表</title>
    <%@include file="common/header.jsp"%>
    <style>
        .mySize{
            width: 268px;
            height: 268px;
        }
        .tabletd{
            text-align: center;
        }
    </style>
</head>
<body>
<div id="wrapper">
    <%@include file="common/menu.jsp"%>
    <!-- pet信息查询部分  start-->
    <div id="page-wrapper">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">宠物领养救助信息管理</h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->
        <div class="panel panel-default">
            <!-- 搜索部分 -->
            <div class="panel-body">
                <form class="form-inline" method="get" action="#">
                    <div class="form-group">
                        <label for="findByPetType">宠物类型</label>
                        <input type="text" class="form-control" id="findByPetType" value="" name="petName">
                    </div>
                    <button type="button" class="btn btn-primary" id="pet_find_modal_btn">查询</button>
                </form>
            </div>
        </div>
        <button class="btn btn-primary" id="pet_add_modal_btn">添加</button>
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">宠物领养救助列表</div>
                    <!-- /.panel-heading -->
                    <table class="table table-bordered table-striped" id="pet_table">
                        <thead>
                        <tr>
                            <th>
                                <input type="checkbox" id="check_all"/>
                            </th>
                            <th>宠物编号</th>
                            <th>宠物名</th>
                            <th>种类</th>
                            <th>性别</th>
                            <th>生日</th>
                            <th>照片</th>
                            <th>领养状态</th>
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
                        <div class="col-md-4" id="page_nav_area"></div>
                    </div>
                    <!-- /.panel-body -->
                </div>
                <!-- /.panel -->
            </div>
            <!-- /.col-lg-12 -->
        </div>
    </div>
    <!-- 班级列表查询部分  end-->
</div>
<!-- 添加宠物领养救助模态框 -->
<div class="modal fade" id="newPet" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document"  style="width: 1000px;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">添加宠物信息</h4>
            </div>
            <div class="modal-body">
                <input type="file" id="select-file" onchange="upload(this)"  style="display: none"/>
                <form class="form-horizontal" id="new_pet_form" method="post" enctype="multipart/form-data">
                    <div class="form-group">
                        <label for="new_petName" class="col-sm-2 control-label">
                            宠物名称
                        </label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="new_petName" placeholder="请填写宠物名称"
                                   name="petName">
                        </div>
                        <label for="new_petType" class="col-sm-2 control-label">
                            宠物类型
                        </label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="new_petType" placeholder="请填写宠物类型"
                                   name="petType">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="new_sex" class="col-sm-2 control-label">
                            性别
                        </label>
                        <div class="col-sm-4">
                            <select class="form-control" id="new_sex" name="sex">
                                <option value="雄性">雄性</option>
                                <option value="雌性">雌性</option>
                            </select>
                        </div>
                        <label for="new_birthday" class="col-sm-2 control-label">
                            生日
                        </label>
                        <div class="col-sm-4">
                            <input type="date" class="form-control" id="new_birthday" placeholder="请选择生日"
                                   name="birthday">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="new_state" class="col-sm-2 control-label">
                            领养状态
                        </label>
                        <div class="col-sm-4">
                            <select class="form-control" id="new_state" name="state">
                                <option value="0">还未被申请领养</option>
                                <option value="2">被领养</option>
                                <option value="1">被申请领养</option>
                            </select>
                        </div>

                    </div>
                    <div class="form-group">
                        <label for="new_remark" class="col-sm-2 control-label">
                            备注
                        </label>
                        <div class="col-sm-10">
                            <textarea class="form-control"  style="height: 150px;" id="new_remark" placeholder="请填写备注"
                                      name="remark"></textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <img id="add-img" style="margin-left: 30px;" src="${pageContext.request.contextPath}/images/pet/01.jpg" alt="" class="img-thumbnail">
                        <label for="new_pic" class="col-sm-2 control-label">
                            照片
                        </label>
                        <div class="col-sm-1">
                            <button type="button" class="btn btn-primary" id="upload-pic">上传照片</button>
                            <input type="hidden" value="" id="new_pic" name="pic">
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal" id="pet_saveDown_btn">关闭</button>
                <button type="button" class="btn btn-primary" id="form-add-save-btn">确认</button>
            </div>
        </div>
    </div>
</div>
<!-- 修改宠物领养救助模态框 -->
<div class="modal fade" id="editPet" tabindex="-1" role="dialog" aria-labelledby="myModalLabe">
    <div class="modal-dialog" role="document" style="width: 1000px;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
                <h4 class="modal-title" id="myModalLabe">修改宠物信息</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="edit_pet_from" enctype="multipart/form-data">
                    <input type="hidden" id="edit_id" name="id">
                    <div class="form-group">
                        <label for="edit_petName" class="col-sm-2 control-label">
                            宠物名称
                        </label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="edit_petName" placeholder="请填写宠物名称" value=""
                                   name="petName">
                        </div>
                        <label for="edit_petType" class="col-sm-2 control-label">
                            宠物类型
                        </label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="edit_petType" placeholder="请填写宠物类型" value="${pet.petType}"
                                   name="petType">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="edit_sex" class="col-sm-2 control-label">
                            性别
                        </label>
                        <div class="col-sm-4">
                            <select class="form-control" id="edit_sex" name="sex" value="">
                                <option value="雄性">雄性</option>
                                <option value="雌性">雌性</option>
                            </select>
                        </div>
                        <label for="edit_birthday" class="col-sm-2 control-label">
                            生日
                        </label>
                        <div class="col-sm-4">
                            <input type="date" class="form-control" id="edit_birthday" placeholder="请选择生日" value=""
                                   name="birthday">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="edit_state" class="col-sm-2 control-label">
                            领养状态
                        </label>
                        <div class="col-sm-4">
                            <select class="form-control" id="edit_state" value="" name="state">
                                <option value="0">还未被申请领养</option>
                                <option value="1">正在被申请领养</option>
                                <option value="2">已经被人领养</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="edit_remark" class="col-sm-2 control-label">
                            备注
                        </label>
                        <div class="col-sm-10">
                            <textarea class="form-control" style="height: 150px;" id="edit_remark" placeholder="请填写备注" value=""
                                      name="remark"></textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <img id="edit-img" style="margin-left: 30px;" src="" alt="" class="img-thumbnail">
                        <label for="edit_pic" class="col-sm-2 control-label">
                            照片
                        </label>
                        <div class="col-sm-1">
                            <button type="button" class="btn btn-primary" id="upload-edit-pic">上传照片</button>
                            <input type="hidden" value="" id="edit_pic" name="pic">
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal" id="pet_updateDown_btn">关闭</button>
                <button type="button" class="btn btn-primary" id="form-edit-save-btn">确认</button>
            </div>
        </div>
    </div>
</div>


<%@include file="common/footer.jsp"%>

<!-- 编写js代码 -->
<script type="text/javascript">
    function upload(t){
        if($("#select-file").val() == '')return;
        var formData = new FormData();
        formData.append('photo',document.getElementById('select-file').files[0]);
        $.ajax({
            url:'${pageContext.request.contextPath}/upload/photo',
            type:'post',
            data:formData,
            contentType:false,
            processData:false,
            success:function(data){
                if(data.type == 'success'){
                    $("#add-img").attr('src',data.filepath);
                    $("#new_pic").val(data.filepath);
                    $("#edit-img").attr('src',data.filepath);
                    $("#edit_pic").val(data.filepath);
                }else{
                    alert(data.message);
                }
            },
            error:function(data){
              alert("网络错误");
            }
        });
    }

    //总的数据 当前的页面
    var totalRecord,currentPage,currentSize,currentPageSize,currentPages;

    $(function(){
        to_page(1);
    });
    function to_page(pn){
        $.ajax({
            url:"${pageContext.request.contextPath}/pet/pets.action",
            data:"pn="+pn,
            type:"GET",
            success:function(result){
                resolving(result);
            }
        });
    }
    function resolving(result){
        //1、解析并显示员工数据
        build_pets_table(result);
        //2、解析并显示分页信息
        build_page_info(result);
        //3、解析显示分页条数据
        build_page_nav(result);
    }

    //解析并显示员工数据
    function build_pets_table(result){
        //清空table表格
        $("#pet_table tbody").empty();
        //index：下标 user：单个对象
        var pets=result.extend.pageInfo.list;
        $.each(pets,function(index,pet){
            var checkBoxTd = $("<td class='tabletd'><input type='checkbox' class='check_item'/></td>");
            var petIdTd = $("<td class='tabletd'></td>").append(pet.id);
            var petNameTd = $("<td class='tabletd'></td>").append(pet.petName);
            var petTypeTd = $("<td class='tabletd'></td>").append(pet.petType);
            var sexTd=$("<td class='tabletd'></td>").append(pet.sex);
            var birthdayTd=$("<td class='tabletd'></td>").append(pet.birthday);
            var picTd=$("<td class='tabletd'></td>").append($("<img/>").addClass("mySize").attr("src",pet.pic));
            var stateTd=null;
            if(pet.state==0){
                stateTd=$("<td class='tabletd'></td>").append("还未被申请领养");
            }else if(pet.state==1){
                stateTd=$("<td class='tabletd'></td>").append("正在被申请领养");
            }else{
                stateTd=$("<td class='tabletd'></td>").append("已经被领养");
            }

            var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("修改");
            //为编辑按钮添加一个自定义的属性，来表示当前员工id
            editBtn.attr("edit-id",pet.id);
            var delBtn =  $("<button  style='margin-left:2px;'></button>").addClass("btn btn-danger btn-sm delete_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除");
            //
            delBtn.attr("del-id",pet.id);
            var btnTd = $("<td></td>").append(editBtn).append("").append(delBtn);
            //var delBtn =
            //append方法执行完成以后还是返回原来的元素
            $("<tr></tr>").append(checkBoxTd)
                .append(petIdTd)
                .append(petNameTd)
                .append(petTypeTd)
                .append(sexTd)
                .append(birthdayTd)
                .append(picTd)
                .append(stateTd)
                .append(btnTd)
                .appendTo("#pet_table tbody");
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
        currentPages=result.extend.pageInfo.pages;//总的页数
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
    $("#pet_add_modal_btn").click(function(){
        //清除表单数据（表单完整重置（表单的数据，表单的样式））
        reset_form("#newPet form");
        //弹出模态框
        $("#newPet").modal({
            backdrop:"static"
        });
    });
    //点击保存，保存宠物信息。
    $("#form-add-save-btn").click(function(){
        var petName=$("#new_petName").val();
        var petType=$("#new_petType").val();
        var birthday=$("#new_birthday").val();
        var pic=$("#new_pic").val();
        var remark=$("#new_remark").val();
        if(petName==""){
            alert("请填写宠物名称");
            return;
        }
        if(petType==""){
            alert("请填写宠物类型");
            return;
        }
        if(birthday==""){
            alert("请填写宠物生日");
            return;
        }
        if(pic==""){
            alert("请上传宠物照片");
            return;
        }
        if(remark==""){
            alert("请填写宠物备注信息");
            return;
        }
        var data=$("#new_pet_form").serialize();
        $.ajax({
            url:"${pageContext.request.contextPath}/pet/add.action",
            type:"POST",
            data:data,
            dataType:'json',
            success:function (result) {
                if(result.code=="100"){
                    debugger;
                    alert("宠物添加成功");
                    $("#pet_saveDown_btn").click();
                    if(currentSize=currentPageSize){
                        to_page(currentPages+1);
                    } else {
                        to_page(currentPages)
                    }
                }else{
                    alert(result.message);
                }

            },
            error:function (result) {
                $("#pet_saveDown_btn").click();
                alert("网络错误");
            }
        });
    });


    //点击编辑按钮弹出模态框。
    $(document).on("click",".edit_btn",function(){
        //1、发送ajax,根据id获取用户信息
        //清除表单数据（表单完整重置（表单的数据，表单的样式））
        reset_form("#editPet form");
        var id = $(this).attr("edit-id");
        $.ajax({
            url:"${pageContext.request.contextPath}/pet/findById.action?id="+id,
            type:"GET",
            success:function(result){
                //填充宠物信息
                $("#edit_id").val(result.extend.pet.id);
                $("#edit_petName").val(result.extend.pet.petName);
                $("#edit_petType").val(result.extend.pet.petType);
                $("#edit_sex").val(result.extend.pet.sex);
                $("#edit_birthday").val(result.extend.pet.birthday);
                $("#edit_state").val(result.extend.pet.state);
                $("#edit_remark").val(result.extend.pet.remark);
                $("#edit-img").attr("src",result.extend.pet.pic);
                $("#edit_pic").val(result.extend.pet.pic);
            },
            error:function (result) {
                alert("通过id查询宠物失败")
           }
        });
        //2、弹出模态框
        $("#editPet").modal({
            backdrop:"static"
        });

    });

    //点击更新按钮弹出模态框。
    $("#form-edit-save-btn").click(function(){
        var petName=$("#edit_petName").val();
        var petType=$("#edit_petType").val();
        var birthday=$("#edit_birthday").val();
        var pic=$("#edit_pic").val();
        var remark=$("#edit_remark").val();
        if(petName==""){
            alert("请填写宠物名称");
            return;
        }
        if(petType==""){
            alert("请填写宠物类型");
            return;
        }
        if(birthday==""){
            alert("请填写宠物生日");
            return;
        }
        if(pic==""){
            alert("请上传宠物照片");
            return;
        }
        if(remark==""){
            alert("请填写宠物备注信息");
            return;
        }
        var data=$("#edit_pet_from").serialize();
        $.ajax({
            url:"${pageContext.request.contextPath}/pet/edit.action",
            type:"POST",
            data:data,
            dataType:'json',
            success:function (result) {
                if(result.code=="100"){
                    to_page(currentPage);
                    $("#pet_updateDown_btn").click();
                    alert("宠物信息更新成功！");
                }else{
                    alert(result.message);
                }
            },
            error:function(result){
                alert("网络错误！");
                $("#pet_saveDown_btn").click();
                to_page(currentPage);
            }
        });

    });

    //单个删除
    $(document).on("click",".delete_btn",function(){
        //1、弹出是否确认删除对话框
        var petName = $(this).parents("tr").find("td:eq(2)").text();
        var petId = $(this).attr("del-id");
        if(confirm("确认删除【"+petName+"】吗？")){
            //确认，发送ajax请求删除即可
            $.ajax({
                url:"${pageContext.request.contextPath}/pet/delete.action?id="+petId,
                type:"GET",
                success:function (result) {
                    if(result.code==100){
                        alert("宠物删除成功！");
                        if(currentSize==1){
                            to_page(currentPage-1);
                        } else {
                            to_page(currentPage);
                        }
                    }else{
                        alert("宠物删除失败！");
                        to_page(currentPage);
                    }
                }
            });
        }
    });



    $("#pet_find_modal_btn").click(function () {
        $("#pet_table tbody").empty();
        var petType=$("#findByPetType").val();
        to_findByPetType(1,petType);
    });

    function to_findByPetType(pn,petType) {
        $.ajax({
            url:"${pageContext.request.contextPath}/pet/findByPetType.action?",
            type:"POST",
            dataType:"json",
            data:{"pn":pn,"petType":petType},
            async:"true",
            success:function (result) {
                build_pets_table(result);
                build_page_info(result);
                build_page_findByPetType(result,petType);
            },
            error:function (result) {
                alert("查询错误")
            }
        });
    }


    //解析显示分页条，点击分页要能去下一页....
    function build_page_findByPetType(result,petType){
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
                to_findByPetType(1,petType);
            });
            prePageLi.click(function(){
                to_findByPetType(result.extend.pageInfo.pageNum -1,petType);
            });
        }

        var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
        var lastPageLi = $("<li></li>").append($("<a></a>").append("末页").attr("href","#"));
        if(result.extend.pageInfo.hasNextPage == false){
            nextPageLi.addClass("disabled");
            lastPageLi.addClass("disabled");
        }else{
            nextPageLi.click(function(){
                to_findByPetType(result.extend.pageInfo.pageNum +1,petType);
            });
            lastPageLi.click(function(){
                to_findByPetType(result.extend.pageInfo.pages,petType);
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
                to_findByPetType(item,petType);
            });
            ul.append(numLi);
        });
        //添加下一页和末页 的提示
        ul.append(nextPageLi).append(lastPageLi);

        //把ul加入到nav
        var navEle = $("<nav></nav>").append(ul);
        navEle.appendTo("#page_nav_area");
    }

    $("#upload-pic").click(function(){
        $("#select-file").click();
    })

    $("#upload-edit-pic").click(function(){
        $("#select-file").click();
    })
</script>

</body>
</html>
