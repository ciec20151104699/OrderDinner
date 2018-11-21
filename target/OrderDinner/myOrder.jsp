<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="basePath" value="${pageContext.request.contextPath}"/>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="${basePath}/plugins/common/common.css" />
    <link rel="stylesheet" href="${basePath}/plugins/layui/css/layui.css" />
    <script src="${basePath}/plugins/common/jquery.js"></script>
    <script src="${basePath}/plugins/common/common.js"></script>
    <script src="${basePath}/plugins/layui/layui.js"></script>

    <script src="${basePath}/plugins/menu/menu.js"></script>
</head>
<body>
    <header>
        <div class="inner">
            <div class="logo"><a href="${basePath}/fork.jsp">订</a></div>
            <div class="user">
                [
                <a href="#">登陆</a>
                |
                <a href="#">注册</a>
                ]
            </div>
        </div>

    </header>
    <div class="inner">
        <div class="search_box">
            <form autocapitalize="off" >
                <div class="sea_type_2">
                    <label>订单名称：</label>
                    <input type="text" id="type">
                </div>
                <div class="sea_type_btn">
                    <%--<input type="button" class="btn_base btn_search" value="搜索" id="search"/>--%>
                </div>
            </form>
        </div>

        <div id="editDatas" style="display: none"></div>

        <div class="tab_box" >

                <%--<table class="layui-hide" id="demo" lay-filter="test"></table>--%>

                    <table class="layui-hide" id="test"></table>
            </div>
        </div>
    </div>
</body>
</html>
<script>
    layui.use('table', function(){
        var table = layui.table;
        table.render({
            elem: '#test'
            ,url:'/demo/table/user/'
            ,cellMinWidth: 80 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
            ,cols: [[
                {field:'updateTime', title: '时间', sort: true}
                ,{field:'foodName', title: '菜品名称'}
                ,{field:'price',  title: '价格', sort: true}
                // ,{field:'city', width:80, title: '城市'}
                // ,{field:'sign', title: '签名', width: '30%', minWidth: 100} //minWidth：局部定义当前单元格的最小宽度，layui 2.2.1 新增
                // ,{field:'experience', title: '积分', sort: true}
                // ,{field:'score', title: '评分', sort: true}
                // ,{field:'classify', title: '职业'}
                // ,{field:'wealth', width:137, title: '财富', sort: true}
            ]]
        });
    });
</script>