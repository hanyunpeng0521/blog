<%@ page import="com.hyp.blog.pojo.User" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
        request.getRequestDispatcher("/admin/login.jsp").forward(request, response);
    }
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
    <%
        String path = request.getContextPath();
        String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    %>
    <base href="<%=basePath%>">
    <title></title>
    <meta http-equiv="content-type" content="text/html;charset=UTF-8">
    <link href="./admin/style.css" type="text/css" rel="stylesheet">
</head>
<body>
<div id="container">
    <div id="banner">
        <h1>平心的博客</h1>
    </div>
    <div id="menu">
        欢迎, xxx用户
        | <a href="">发博文</a>
        | <a href="">博文管理</a>
        | <a href="">分类管理</a>
        | <a href="">评论管理</a>
        | <a href="">修改密码</a>
        | <a href="">退出</a>
    </div>
    <br/>
    <div id="main">