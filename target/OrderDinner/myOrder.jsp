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
    <style>
        body {
            background: #eee;
            color: #666;
        }

        header {
            width: 100%;
            height: 50px;
            display: block;
            line-height: 50px;
            margin: 0;
            background: rgb(255, 178, 64);
        }

        .inner {
            width: 1200px;
            height: 100%;
            margin: 0 auto;
        }

        header .logo {
            width: 30px;
            float: left;
            height: 30px;
            line-height: 30px;
            margin-top: 10px;
            font-size: 18px;
            color: #fff;
            font-family: "KAITI";
            text-align: center;
            border: 2px solid #fff;
            border-radius: 50%;
        }

        .user, .log_msg {
            float: right;
            color: #fff;
        }

        .user a.log_msg a {
            color: #fff;
        }

        .log_msg a {
            padding: 2px 12px;
            color: #fff;
            display: inline-block;
        }

        .search {
            height: 70px;
            width: 100%;
            margin: 20px 0 0 0;
        }

        .search .inner {
            background: #fff;
        }

        .search .border_input {
            width: 1100px;
            margin: 20px 0 0 50px;
            float: left;
            height: 40px;
        }

        .search input[type="text"] {
            font-size: 18px;
            outline: none;
            width: 700px;
            border: 1px solid #f6ac1b;
            float: left;
            height: 40px;
            border-radius: 20px 0 0 20px;
            border-right: none;
            padding: 0 20px;
            box-sizing: border-box;
        }

        .search input[type="button"] {
            background: #f6ac1b;
            color: #fff;
            width: 150px;
            line-height: 40px;
            height: 40px;
            text-align: center;
            border-radius: 0 20px 20px 0;
            outline: none;
            float: left;
            cursor: pointer;
        }

        .shop {
            width: 200px;
            background: #fcfcfc;
            height: 40px;
            cursor: pointer;
            border: 1px solid #f6ac1b;
            float: right;
            margin-right: 20px;
            color: #f6ac1b;
            position: relative;
            text-align: center;
            line-height: 40px;
        }

        .shop:hover {
            border-bottom: none;
        }

        .shop .shop_tit {
            width: 100%;
            height: 100%;
            background: #fcfcfc;
            float: left;
            font-size: 18px;
            position: absolute;
            left: 0;
            top: 0;
            z-index: 9;
        }

        .shop_con {
            display: none;
            position: absolute;
            right: -1px;
            top: 39px;
            z-index: 8;
            width: 220px;
            color: #666;
            text-align: left;
            border: 1px solid #f6ac1b;
            background: #fcfcfc;
        }

        .shop_list {
            width: 210px;
            height: 50px;
            float: left;
            margin: 5px;
            border-bottom: 1px dashed #ccc;
        }

        .shop_list img {
            width: 60px;
            height: 40px;
            float: left;
            margin: 5px;
        }

        .shop_list .shop_name, .shop_list .shop_price {
            width: 130px;
            height: 20px;
            margin-top: 5px;
            line-height: 20px;
            margin-left: 10px;
        }

        .shop_list .shop_price {
            color: #f6ac1b;
            margin-top: 0;
        }

        #shop_num {
            padding: 0 6px;
            z-index: 10;
            position: absolute;
            right: -10px;
            top: -10px;
            height: 24px;
            border-radius: 12px;
            text-align: center;
            line-height: 24px;
            background: #f6ac1b;
            color: #fff;
            display: inline-block;
        }

        .cook_list {
            width: 100%;
            margin: 0;
            height: 900px;
        }

        .cook_list .inner {
            background: #fff;
            position: relative;
        }

        .cook_list .cook_mes_list {
            width: 130px;
            margin-left: 10px;
            height: 100%;
            float: left;
            box-sizing: border-box;
        }

        .type_msg {
            width: 100%;
            cursor: pointer;
            background: rgb(240, 243, 240);
            height: 40px;
            line-height: 40px;
            text-align: center;
        }

        .type_msg_first {
            background: sandybrown;
        }

        .cook_list_msg {
            width: 900px;
            margin-left: 50px;
            float: left;
            height: 900px;
            overflow-x: hidden;
            overflow-y: auto;
        }

        .type_msg_content {
            width: 100%;
            height: 100px;
            position: relative;
            border-bottom: 1px solid #ccc;
            margin-top: 10px;
        }

        .type_msg_content img {
            width: 140px;
            height: 80px;
            margin: 10px;
            float: left;
            display: block;
            border: none;
        }

        .cook_name {
            width: 500px;
            height: 30px;
            color: #555;
            font-size: 16px;
            font-weight: 600;
            line-height: 30px;
            float: left;
            margin-top: 10px;
            margin-left: 30px;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
        }

        .msg_note {
            width: 500px;
            height: 50px;
            line-height: 25px;
            margin-left: 30px;
            float: left;
            font-size: 14px;
            color: #999;
        }

        .counter, .msg_price {
            width: 160px;
            position: absolute;
            right: 5px;
            bottom: 10px;
            height: 30px;
        }

        .msg_price {
            top: 20px;
            line-height: 30px;
            text-align: center;
            color: #f6ac1b;
            font-size: 16px;
            font-weight: 600;
        }

        .cou_sub, .cou_add {
            cursor: pointer;
            background: #f6ac1b;
            color: #fff;
            font-size: 16px;
            width: 30px;
            height: 30px;
            border-radius: 3px 0 0 3px;
            border: 1px solid #ddd;
            text-align: center;
            line-height: 30px;
            float: left;
            box-sizing: border-box;
        }

        .cou_num {
            width: 90px;
            height: 30px;
            box-sizing: border-box;
            border-top: 1px solid #ddd;
            border-bottom: 1px solid #ddd;
            float: left;
            text-align: center;
            line-height: 30px;
        }

        .cou_add {
            border-radius: 0 3px 3px 0;
        }

        .shop_pay {
            width: 210px;
            float: left;
            margin: 5px;
            background: #f1f1f1;
        }

        .shop_pay .shop_txt {
            width: 100%;
            line-height: 20px;
            padding: 0 10px;
            box-sizing: border-box;
            border-radius: 5px 5px 0 0;
        }

        .shop_pay .pay_for {
            width: 100%;
            text-align: center;
            height: 40px;
            background: #f6ac1b;
            color: #fff;
            border-radius: 0 0 5px 5px;
            font-size: 16px
        }


    </style>
</head>
<body>
    <header>
        <div class="inner">
            <div class="logo"><a href="fork.jsp">订</a></div>
            <c:if test="${sessionScope.user==null}">
                <div class="user">
                    [
                    <a onclick="loginView()">登陆</a>
                    |
                    <a href="${basePath}/user/register">注册</a>
                    ]
                </div>
            </c:if>
            <c:if test="${sessionScope.user!=null}">
                [
                <span>你好！${sessionScope.user.name}</span>
                ]
            </c:if>
            <div class="log_msg">
                <c:if test="${sessionScope.user!=null}">
                    <a href="myOrder.jsp">我的订单</a>|
                </c:if>

                <c:if test="${sessionScope.user.flag==0}">
                    <a href="${basePath}/index.jsp">管理员</a>
                </c:if>
                <c:if test="${sessionScope.user!=null}">|
                    <a href="${basePath}/user/invalidate">退出</a>
                </c:if>
            </div>
        </div>

    </header>
    <div class="inner">
        <div class="search_box">
            <form autocapitalize="off" >
                <%--<div class="sea_type_2">--%>
                    <%--<label>订单名称：</label>--%>
                    <%--<input type="text" id="type">--%>
                <%--</div>--%>
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
            ,url:'${basePath}/order/user/order/'
            , page: true //开启分页
            ,cellMinWidth: 80 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
            ,cols: [[
                {field:'updateTime', title: '时间', sort: true,templet:function (d) {
                        var date = new Date(d.updateTime)
                        return formatDate(date);
                    }}
                ,{field:'image', title: '图片',templet:function (d) {
                        var html =
                            '                            <img style="height:30px;width:30px" src="${basePath}/'+d.image+'"/>';
                        return html;
                    }}
                ,{field:'foodName', title: '菜品名称'}
                ,{field:'price',  title: '价格', sort: true}

            ]]
        });
    });
    function formatDate(now) {
        var year=now.getFullYear();
        var month=now.getMonth()+1;
        var date=now.getDate();
        var hour=now.getHours();
        var minute=now.getMinutes();
        var second=now.getSeconds();
        return year+"-"+month+"-"+date+" "+hour+":"+minute+":"+second;
    }
</script>