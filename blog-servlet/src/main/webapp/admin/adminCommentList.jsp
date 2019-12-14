<%@ page import="com.hyp.blog.pojo.Comment" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%--<%@ taglib uri="http://displaytag.sf.net" prefix="display" %>--%>
<%@include file="header.jsp" %>
<base href="<%=basePath%>">
<%
    List list = (List) request.getAttribute("list");
    Comment comment = null;
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

<h2>评论管理</h2>

<%--<display:table name="list" pagesize="4" class="its" requestURI="/servlet/CommentServlet" id="c">--%>
<%--<display:column property="id" title="编号" sortable="true"/>--%>
<%--<display:column property="userName" sortable="true" title="作者"/>--%>
<%--<display:column property="content" title="内容"/>--%>
<%--<display:column property="createdTime" title="日期" sortable="true"/>--%>
<%--<display:column title="操作">--%>
<%--<a href="comment?method=edit&id=${c.id}"><img src="admin/images/edit.gif " border="0"/></a>--%>
<%--<a href="comment?method=delete&id=${c.id}" onclick="javascript:return del()"><img--%>
<%--src="admin/images/delete.gif" border="0"/></a>--%>
<%--</display:column>--%>
<%--</display:table>--%>

<table id="tab">
    <tr>
        <th>编号</th>
        <th>作者</th>
        <th>内容</th>
        <th>创建时间</th>
        <th>操作</th>
    </tr>
    <%
        for (int i = 0; i < list.size(); i++) {
            comment = (Comment) list.get(i);
    %>
    <tr>
        <td><%=comment.getId()%>
        </td>
        <td><%=comment.getUserName()%>
        </td>
        <td><%=comment.getContext()%>
        </td>
        <td><%=comment.getCreateTime()%>
        </td>
        <td align="center">

            <a href="comment?method=edit&id=<%=comment.getId()%>"><img src="admin/images/edit.gif " border="0"/></a>
            <a href="comment?method=delete&id=<%=comment.getId()%>" onclick="return del()"><img
                    src="admin/images/delete.gif" border="0"/></a>
        </td>
    </tr>
    <%} %>
</table>
<%@include file="footer.jsp" %>

