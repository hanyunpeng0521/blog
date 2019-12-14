<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@include file="header.jsp" %>
<base href="<%=basePath%>">
<%@page import="com.hyp.blog.pojo.Classify" %>
<%@ page import="java.util.List" %>
<%
    List list = (List) request.getAttribute("list");
    Classify category = null;
%>

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


<h2>分类管理</h2>

<table id="tab">
    <tr>
        <th>编号</th>
        <th>分类</th>
        <th>显示顺序</th>
        <th>操作</th>
    </tr>
    <%
        for (int i = 0; i < list.size(); i++) {
            category = (Classify) list.get(i);
    %>
    <tr>
        <td><%=category.getId()%>
        </td>
        <td><%=category.getName()%>
        </td>
        <td><%=category.getLevel()%>
        </td>
        <td align="center">

            <a href="category?method=edit&id=<%=category.getId()%>"><img src="admin/images/edit.gif " border="0"/></a>
            <a href="category?method=delete&id=<%=category.getId()%>" onclick="return del()"><img
                    src="admin/images/delete.gif" border="0"/></a>
        </td>
    </tr>
    <%} %>
</table>
<%@include file="footer.jsp" %>