<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="basePath" value="${pageContext.request.contextPath}"/>
<html lang="en"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>登录运维系统</title>
    <meta name="description" content="">
    <meta name="author" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <link rel="stylesheet" href="${basePath}/plugins/common/common.css">
    <link rel="stylesheet" media="screen" href="${basePath}/plugins/particles/style.css">
    <link rel="stylesheet" media="screen" href="${basePath}/plugins/layui/css/modules/layer/default/layer.css">

    <script src="${basePath}/plugins/common/jquery.js"></script>
    <style>
        .logos{ position: absolute; left:20px; font-weight: 600;color: #fff; top:5px; height: 40px; line-height: 40px; font-size: 24px; font-family: KAITI;}
        .login{ width:360px; height: 300px;position: absolute;background:rgba(255,255,255,0.3); right:50px; top:50%;margin-top:-200px; border-radius: 10px; }
        .login h1{ width: 100%;text-align: center; height: 50px; line-height: 50px;  font-size: 24px; color: #fff; }
        .login p{ height: 40px; line-height: 40px; width:100%; margin-top: 30px; }
        .login label{ color: #fff; margin-left: 30px; font-weight: bolder;font-size: 16px; width: 80px; height: 30px;margin-top: 7px; text-align: center; display:inline-block;float: left; }
        .login input{ font-size: 16px; color: #fff; box-sizing: border-box; outline: none; background: none; width:200px; height: 30px;border: none; border-bottom: 1px solid #fff;display:inline-block;float: left; margin-top:5px;line-height: 30px; padding: 0 10px;  }
        .login button{ width: 90%; margin-left: 5%; border: none; background: #fff; color: rgb(0,43,90);cursor: pointer; border-radius: 5px; height: 40px;line-height: 40px;  }
        .footer { position: absolute;bottom: 0; left: 0; height: 30px; line-height: 30px; width: 100%; font-size: 16px; text-align: center; color: #fff; font-family: KAITI;}
    </style>
</head>
<body>
<div id="particles-js"><canvas class="particles-js-canvas-el"  style="width: 100%; height: 100%;"></canvas></div>
<div class="login">
    <h1>用户登录</h1>
    <p><label>账　号</label><input type="text" placeholder="请输入账号" id="username"></p>
    <p><label>密　码</label><input type="password" placeholder="请输入密码" id="password"></p>
    <p><button onclick="login()">登录</button></p>
</div>

<div class="logos">
    订餐管理平台
</div>
<div class="footer" style="background: transparent;">技术支持&copy;内蒙古师范大学</div>
<script src="${basePath}/plugins/particles/particles.min.js "></script>
<script src="${basePath}/plugins/particles/app.js"></script>
<script src="${basePath}/plugins/particles/stats.js"></script>
<script src="${basePath}/plugins/layui/lay/modules/layer.js"></script>
<script>
    function login(){
        var username = $("#username").val();
        var password = $("#password").val();
        $.post("${basePath}/user/login/index",{password:password,username:username},function (result) {
            var code = result.code;
            if (0 == code) {
                window.location.href = "${basePath}/fork.jsp"
            }else{
                layer.msg("用户名密码错误");
            }
        })
        // alert("欢迎访问！！")

    }
</script>

</body></html>
