<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 导航栏部分 -->
<nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
    <div class="navbar-header">
        <a class="navbar-brand" href="">宠物领养救助管理系统</a>
    </div>
    <!-- 导航栏右侧图标部分 -->
    <!-- 导航栏右侧图标部分 -->
    <ul class="nav navbar-top-links navbar-right">
        <!-- 消息通知 end -->
        <!-- 用户信息和系统设置 start -->
        <li class="dropdown">
            <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                欢迎:${admin.adminName}登录系统
                <i class="fa fa-user fa-fw"></i>
                <i class="fa fa-caret-down"></i>
            </a>
            <ul class="dropdown-menu dropdown-user ">
                <li>
                    <a href="${pageContext.request.contextPath}/admin/logout.action">
                        <i class="fa fa-sign-out fa-fw"></i>退出登录
                    </a>
                </li>
            </ul>
        </li>
        <!-- 用户信息和系统设置结束 -->
    </ul> <!-- 左侧显示列表部分 start-->
    <div class="navbar-default sidebar" role="navigation">
        <div class="sidebar-nav navbar-collapse">
            <!-- 教学管理  折叠的分组列表 -->
            <div class="panel-heading" id="collapseListGroupHeading3" data-toggle="collapse" data-target="#collapseListGroup3" role="tab">
                <h4 class="panel-title">
                    宠物领养救助管理系统 <span class="fa fa-chevron-up right"></span>
                </h4>
            </div>
            <div id="collapseListGroup3" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="collapseListGroupHeading3">
                <ul class="list-group">
                    <li class="list-group-item my_font">
                        <a href="${pageContext.request.contextPath}/animal/admin/users.jsp">
                            <i class="fa fa-user "></i> 用户管理
                        </a>
                    </li>
                    <li class="list-group-item my_font">
                        <a href="${pageContext.request.contextPath}/animal/admin/index.jsp">
                            <i class="fa fa-users"></i> 管理员管理
                        </a>
                    </li>
                    <li class="list-group-item my_font">
                        <a href="${pageContext.request.contextPath}/animal/admin/pet.jsp">
                            <i class="fa fa-university"></i> 宠物领养救助管理
                        </a>
                    </li>
                    <li class="list-group-item my_font">
                        <a href="${pageContext.request.contextPath}/animal/admin/adopt.jsp">
                            <i class="fa fa-paw"></i> 领养管理
                        </a>
                    </li>
                    <li class="list-group-item my_font">
                        <a href="${pageContext.request.contextPath}/animal/admin/comment.jsp">
                            <i class="fa  fa-list-ul"></i> 评论管理
                        </a>
                    </li>
                    <li class="list-group-item my_font">
                        <a href="${pageContext.request.contextPath}/animal/admin/blog.jsp">
                            <i class="fa fa-tasks"></i> 活动管理
                        </a>
                    </li>
                    <li class="list-group-item my_font">
                        <a href="${pageContext.request.contextPath}/animal/admin/apply.jsp">
                            <i class="fa fa-plus-circle"></i> 志愿者申请
                        </a>
                    </li>
                    <li class="list-group-item my_font">
                        <a href="${pageContext.request.contextPath}/animal/admin/agree.jsp">
                            <i class="fa fa-check "></i> 同意领养列表
                        </a>
                    </li>
                    <li class="list-group-item my_font">
                        <a href="${pageContext.request.contextPath}/animal/admin/disAgree.jsp">
                            <i class="fa fa-close"></i> 不同意领养列表
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </div><!-- 左侧显示列表部分 end-->
</nav>
