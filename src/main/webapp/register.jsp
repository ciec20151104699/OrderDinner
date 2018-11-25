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

    <script src="${basePath}/plugins/common/jquery.js"></script>
    <style>
        .logos{ position: absolute; left:20px; font-weight: 600;color: #fff; top:5px; height: 40px; line-height: 40px; font-size: 24px; font-family: KAITI;}
        .register{ width:360px; height: 560px;position: absolute;background:rgba(255,255,255,0.3);
            left: 50%; margin-left: -180px;
            top:50%; margin-top: -180px; border-radius: 10px; }
        .register h1{ width: 100%;text-align: center; height: 50px; line-height: 50px;  font-size: 24px; color: #fff; }
        .register p{ height: 40px; line-height: 40px; width:100%; margin-top: 30px; }
        .register label{ text-align: right; color: #fff; margin-left: 20px; margin-right: 10px;font-size: 16px; width: 80px; height: 30px;margin-top: 7px;  display:inline-block;float: left; }
        .register input{ font-size: 16px; color: #fff; box-sizing: border-box; outline: none; background: none; width:200px; height: 30px;border: none; border-bottom: 1px solid #fff;display:inline-block;/*float: left;*/ margin-top:5px;line-height: 30px; padding: 0 10px;  }
        .register button{ width: 90%; margin-left: 5%; border: none; background: #fff; color: rgb(0,43,90);cursor: pointer; border-radius: 5px; height: 40px;line-height: 40px;  }
        .footer { position: absolute;bottom: 0; left: 0; height: 30px; line-height: 30px; width: 100%; font-size: 16px; text-align: center; color: #fff; font-family: KAITI;}
    </style>
</head>
<body>
<div id="particles-js"><canvas class="particles-js-canvas-el"  style="width: 100%; height: 100%;"></canvas></div>
<div class="register">
    <h1>用户注册</h1>
    <p><label>账　　号</label><input type="text" value="" placeholder="请输入用户名" id="username"></p>
    <p><label>密　　码</label><input type="password" value="" placeholder="请输入注册密码"  id="password"></p>
    <p><label>性　　别</label><input type="radio" value="1" placeholder=""  name="sex" style="width: 20px"><span style="color: #fff;">男</span><input type="radio" value="0" name="sex"  style="width: 20px" ><span style="color: #fff;">女</span></p>
    <p><label>昵    称</label><input type="text" value="" placeholder="请输入昵称"  id="name"></p>
    <p><label>确认密码</label><input type="password" value="" placeholder="请输入注册密码"  id="passwords"></p>
    <p><button onclick="login()">注册</button></p>
</div>

<div class="logos">
    订餐管理平台
</div>
<script src="${basePath}/plugins/particles/particles.min.js"></script>
<script src="${basePath}/plugins/particles/app.js"></script>
<script src="${basePath}/plugins/particles/stats.js"></script>
<script src="${basePath}/plugins/layui/lay/modules/layer.js"></script>
<script>
    function login(){
        var username = $("#username").val();
        var password = $("#password").val();
        var sex =  $('input[name="sex"]:checked').val();
        var name = $("#name").val();
        if (username==""||password==""||sex==undefined||name==""){
            layer.msg("请输入必填项")
            return;
        }
        $.post("${basePath}/user/register/user",{password:password,
            username:username,sex:sex,
            name:name},function (result) {
            var code = result.code;
            if (0 == code) {
                window.location.href="${basePath}/user/login/index";
            }else{
                layer.msg("用户名重复");
            }
        })
    }
</script>

</body></html>
