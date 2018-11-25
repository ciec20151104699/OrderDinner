<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="basePath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
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

        header {padding: 0 40px; box-sizing: border-box;}
        .menu{ background: #fff; margin-top: 20px; box-sizing: border-box;
            float: left;box-shadow: 0 0 10px #ddd ;
            width: 200px; border-radius: 0 5px 5px 0; }
        .menu p{ width: 100%; height: 30px; line-height: 30px; text-indent: 1em;}
        .menu ul li ul{ display: none;}
    </style>
    <script>
        $(function(){
            var bodyWidth=$(window).height()-100;
            var bodyWid=$('body').width()-257;
            $("#message").width(bodyWid);
            $("#message").height(bodyWidth);
            $('.menu').css('min-height',bodyWidth);
            var menuArry = [];
            menuArry=[
                {id:1,name:"店铺管理",pId:0},
                {id:3,name:"类别管理",pId:1,menuUrl:"admin/shop/type/show.jsp"},
                {id:2,name:"菜品管理",pId:1,menuUrl:"admin/shop/cook/show.jsp"},
                {id:4,name:"订单管理",pId:0},
                {id:5,name:"已完成",pId:4,menuUrl:"admin/order/ok/show.jsp"},
//                {id:6,name:"未完成",pId:4,menuUrl:"admin/order/no/show.jsp"},
                {id:9,name:"系统管理",pId:0},
                {id:11,name:"用户管理",pId:9,menuUrl:"admin/system/user/show.jsp"},

            ]
            var strUrl="";
            menus("#menu",menuArry,0);
            $.each($("#menu li"),function(){
                if($(this).attr("rel")!=="null"&&$(this).attr("rel")!==""&&$(this).attr("rel")!=="undefined"){
                    strUrl=$(this).attr("rel");

                    return false;
                }
            })
            getView(strUrl,"#message")
            $('#menu li').click(function(){//点击li加载界面
                var current = $(this).attr('rel');
                $(".layui-laydate").hide();
                var userInfo = window.localStorage.getItem("userinfo");
                var locationStr = JSON.parse(userInfo);
                // if(locationStr!==null){
                //     window.location.href="";
                //     window.location.reload()
                // }else{
                if(current=='undefined'||current=='null'||current==""){
                    return false;
                }else{
                    getView(current,"#message");
                }
                // }
            });
        });
        window.onresize=function(){
            var bodyWidth=$(window).height()-100;
            var bodyWid=$('body').width()-257;
            $("#message").width(bodyWid);
            $("#message").height(bodyWidth);
            $('.menu').css('min-height',bodyWidth);
        };
    </script>
</head>
<body>
<header>
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
        <a>[
        <span>你好！${sessionScope.user.name}</span>
            ]</a>
        <div class="user">
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
    </c:if>

</header>
<div class="menu" id="menu" data-name="treeMenu">

</div>
<div class="message" id="message">

</div>

</body>
</html>
