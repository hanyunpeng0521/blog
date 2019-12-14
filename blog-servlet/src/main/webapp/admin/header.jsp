<%@ page import="com.hyp.blog.pojo.User" %>
<%@ page import="com.hyp.blog.utils.SessionUtils" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/admin";
%>
<base href="<%=basePath%>">
<%
    User user = SessionUtils.getAccount(request);
    if (user == null) {
        request.getRequestDispatcher("/admin/login.jsp").forward(request, response);
    }
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
    <title></title>
    <meta http-equiv="content-type" content="text/html;charset=UTF-8">
    <link href="./style.css" type="text/css" rel="stylesheet">
</head>
<body>
<div id="container">
    <div id="banner">
        <h1>平心的博客</h1>
    </div>
    <div id="menu">
        欢迎, <% if (user != null) {
        out.print(user.getName());
    }%>用户
        | <a href="blog/add/pre">发博文</a>
        | <a href="blog/list?page=1&size=100">博文管理</a>
        | <a href="./admin/addCategory.jsp">添加分类</a>
        | <a href="category?method=list">分类管理</a>
        | <a href="comment">评论管理</a>
        | <a href="./admin/changePassword.jsp">修改密码</a>
        | <a href="user/logout?method=logout">退出</a>
    </div>
    <br/>
    <div id="main">
