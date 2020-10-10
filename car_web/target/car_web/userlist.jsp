<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/10/5
  Time: 22:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

权限表 给 <br>
添加按钮和编辑按钮设置了权限
<br>
删除按钮没有权限
<br>
根据session提供的角色id，可以查询到当前角色 拥有的所有的功能的菜单编码集合
<br> 集合元素 包含以下字符串<br>
userMgr:add
userMgr:edit


        <%

            //模拟从数据库查询到拥有权限的菜单代码

            List<String> list = new ArrayList<String>();
            list.add("userMgr:add");
            list.add("userMgr:edit");

        %>


        <input type="button" class="btn btn-success" <% if(!list.contains("userMgr:add")){   %>
               disabled="disabled"
            <% } %>
               value=" 添加 ">

        <input type="button" class="btn btn-danger" <% if(!list.contains("userMgr:edit")){   %>
               disabled="disabled"
            <% } %> value=" 编辑 ">

        <input type="button" class="btn btn-warning" <% if(!list.contains("userMgr:delete")){   %>
               disabled="disabled"
            <% } %> value=" 删除 ">

</body>
</html>
