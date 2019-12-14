<%@ page import="com.hyp.blog.pojo.Article" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%--<%@ taglib uri="http://displaytag.sf.net" prefix="display" %>--%>
<%@include file="header.jsp" %>
<base href="<%=basePath%>">
<%
    List list = (List) request.getAttribute("list");
    Article article = null;
%>
<style type="text/css" media="all">
    @import url("./css/screen.css");
</style>
<script type="text/javascript">
    function del() {
        var msg = "您真的确定要删除吗？\n\n请确认！";
        if (confirm(msg) == true) {
            return true;
        } else {
            return false;
        }
    }
</script>

<h2>博文管理</h2>

<%--<display:table name="list" pagesize="3" class="its" requestURI="blog/list" id="blog">--%>
<%--<display:column property="id" title="编号" sortable="true"/>--%>
<%--<display:column property="title" title="主题"/>--%>
<%--<display:column property="clzName" title="分类"/>--%>
<%--<display:column property="createTime" title="日期" sortable="true"/>--%>
<%--<display:column title="操作">--%>
<%--<a href="blog/add/pre?id=${blog.id}"><img src="admin/images/edit.gif " border="0"/></a>--%>
<%--<a href="blog/delete?id=${blog.id}" onclick="javascript:return del()"><img src="admin/images/delete.gif" border="0"/></a>--%>
<%--</display:column>--%>

<%--</display:table>--%>

<table id="tab">
    <tr>
        <th>编号</th>
        <th>作者</th>
        <th>主题</th>
        <th>分类</th>
        <th>创建时间</th>
        <th>操作</th>
    </tr>
    <%
        for (int i = 0; i < list.size(); i++) {
            article = (Article) list.get(i);
    %>
    <tr>
        <td><%=article.getId()%>
        </td>
        <td><%=article.getUserName()%>
        </td>
        <td><%=article.getTitle()%>
        </td>
        <td><%=article.getClzName()%>
        </td>
        <td><%=article.getCreateTime()%>
        </td>
        <td align="center">

            <a href="blog/edit/pre?id=<%=article.getId()%>"><img src="admin/images/edit.gif " border="0"/></a>
            <a href="blog/delete?id=<%=article.getId()%>" onclick="return del()"><img
                    src="admin/images/delete.gif" border="0"/></a>
        </td>
    </tr>
    <%} %>
</table>
<%@include file="footer.jsp" %>