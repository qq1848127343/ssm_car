<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/9/27
  Time: 15:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <title></title>
    <meta charset="UTF-8" />
    <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/css/bootstrap-tree.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/js/bootstrap-tree.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap-tabs.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap-table.min.js"></script>

    <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap-table-zh-CN.min.js">
    </script>

    <link rel="stylesheet" href="css/bootstrap-table.min.css">

    <style type="text/css">
        body {
            padding-top: 50px;
            font-family: "微软雅黑";
        }

        .navbar-brand {
            padding-top: 0;
            padding-bottom: 0;
        }

        .navbar-nav a {
            font-size: 18px;
        }

        .navbar a:hover {
            font-weight: bold;
        }

        .listitem .listitem-head {
            float: left;
            padding-bottom: 20px;
        }

        .listitem img {
            width: 64px;
            height: 64px;
        }

        .listitem .listitem-body {
            float: left;
            padding: 0 10px;
            text-align: left;
        }

        .listitem .listitem-body .listitem-body-title {
            font-weight: bold;
        }

        .listitem a {
            color: #85c5f3;
            text-decoration: none;
        }

        .listitem a:hover {
            color: #ff6a00;
        }
    </style>
</head>

<body>

<%
//此处模拟登录成功  获取当前的用户拥有的角色id  为1
    //登录成功会将角色id保存到会话session 中
    //此处使用jsp内置对象session直接保存 一个角色id 等下带来其他页面时，
    //每个页面按钮都需要根据该角色id 验证权限
    session.setAttribute("rid",1);


%>

<script>
    $(function() {
        //初始化tab
        initTabbable("#tabs");

    });
</script>

<!-- 顶部导航栏开始 -->
<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#nav">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">
                <img src="images/logo.png" style="height: 50px" />
            </a>
        </div>
        <div class="collapse navbar-collapse" id="nav">
            <ul class="nav navbar-nav">
                <li>
                    <a href="#">操作系统</a>
                </li>
                <li class="active">
                    <a href="#">数据库</a>
                </li>
                <li>
                    <a href="#">UI</a>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        编程语言
                        <span class="caret"></span>
                    </a>
                    <ul class="dropdown-menu">
                        <li>
                            <a href="#">Java</a>
                        </li>
                        <li>
                            <a href="#">C#</a>
                        </li>
                        <li>
                            <a href="#">C++</a>
                        </li>
                    </ul>
                </li>
            </ul>
            <form class="navbar-form navbar-left">
                <div class="input-group">
                    <input type="text" class="form-control" placeholder="查找...">
                    <span class="input-group-btn">
					        <button class="btn btn-default" type="button">
					        	<span class="glyphicon glyphicon-search"></span>
							</button>
                </div>
            </form>
            <ul class="nav navbar-nav navbar-right">
                <li>
                    <a href="#" data-toggle="modal" data-target="#login">登录</a>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        选择语言
                        <span class="caret"></span>
                    </a>
                    <ul class="dropdown-menu">
                        <li>
                            <a href="#">中文</a>
                        </li>
                        <li>
                            <a href="#">English</a>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>
<!-- 顶部导航栏结束 -->

<div style="height: 20px;"></div>

<div class="container">
    <!-- 左侧可伸缩菜单栏开始 -->
    <div class="col-md-3" style="height: 500px;">
        <div class="panel-group" id="accordion" >
          <%--  <div class="panel panel-default">
                <div class="panel-heading">
                    <h4 class="panel-title">
                        <a data-toggle="collapse" data-parent="#accordion"
                           href="#panel1">
                            系统管理
                        </a>
                    </h4>
                </div>
                <div id="panel1" class="panel-collapse collapse in">
                    <div class="panel-body">
                        <div class="list-group" style="margin:0">
                            <a class="list-group-item active" href="#" url="userlist.html">
                                用户管理
                            </a>
                            <a class="list-group-item" href="#" url="rolelist.html">
                                角色管理
                            </a>
                            <a class="list-group-item" href="#" url="child.html">
                                菜单管理
                            </a>
                            <a class="list-group-item" href="#"  url="child.html">
                                用户角色管理
                            </a>
                            <a class="list-group-item" href="#" url="authority.html">
                                授权管理
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h4 class="panel-title">
                        <a data-toggle="collapse" data-parent="#accordion" href="#panel2">
                            审批管理
                        </a>
                    </h4>
                </div>
                <div id="panel2" class="panel-collapse collapse">
                    <div class="panel-body">
                        <div class="list-group" style="margin:0">
                            <a class="list-group-item" href="#"  url="child.html">
                                借出审批<span class="badge">20</span>
                            </a>
                            <a class="list-group-item" href="#"  url="child.html">
                                借出记录<span class="badge">10</span>
                            </a>
                            <a class="list-group-item" href="#"  url="child.html">
                                还车审批<span class="badge">30</span>
                            </a>
                            <a class="list-group-item" href="#"  url="child.html">
                                还车记录<span class="badge">30</span>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h4 class="panel-title">
                        <a data-toggle="collapse" data-parent="#accordion" href="#panel3">
                            统计管理
                        </a>
                    </h4>
                </div>
                <div id="panel3" class="panel-collapse collapse">
                    <div class="panel-body">
                        <div class="list-group" style="margin:0">
                            <a class="list-group-item" href="#"  url="child.html">
                                财务统计<span class="badge">20</span>
                            </a>
                            <a class="list-group-item" href="#"  url="child.html">
                                车辆统计<span class="badge">10</span>
                            </a>
                            <a class="list-group-item" href="#"  url="child.html">
                                Java<span class="badge">30</span>
                            </a>
                        </div>
                    </div>
                </div>
            </div>--%>
        </div>
    </div>
<script type="text/javascript" src="js/bootstrap-accordion.js"></script>

    <script type="text/javascript">


        $.get("queryallmenus.action",function (data) {
            initaccordion("#accordion",data);
        },"json");




        //点击菜单 背景选择效果添加
        $("#accordion").click(function(e) {
            //如果点击的是手风琴组件里面的列表项
            if($(e.target).hasClass("list-group-item")) {
                //将所有列表项的选中状态清空
                $("#accordion").find("a").removeClass("active");
                //将点击的列表项设置上选中状态
                $(e.target).addClass("active");
                //打开/选中 一个选项卡 tab，展示当前点击的a标签的地址

                addTabbable("#tabs", $(e.target).text(),
                    "glyphicon-screenshot", $(e.target).attr("url"));

            }
        });
    </script>
    <!-- 左侧可伸缩菜单栏结束 -->

    <!-- 页面主内容开始 -->
    <div class="col-md-9">

        <!-- tab开始 -->
        <div id="tabs"></div>
        <!-- tab结束 -->
    </div>
    <!-- 页面主内容结束 -->
</div>

<!-- 页尾开始 -->
<div class="container text-center">
    <hr /> 硅谷高科教育科技有限公司
    <br />
    <br />
</div>

</body>

</html>