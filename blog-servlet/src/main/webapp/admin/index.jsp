<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/admin";
%>
<base href="<%=basePath%>">
<% response.sendRedirect("admin.jsp"); %>