<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="plugins/common/common.css" />
    <link rel="stylesheet" href="plugins/layui/css/layui.css" />
    <script src="plugins/common/jquery.js"></script>
    <script src="plugins/common/common.js"></script>
    <script src="plugins/layui/layui.js"></script>

    <script src="plugins/menu/menu.js"></script>
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
                {id:3,name:"类别管理",pId:1,menuUrl:"admin/shop/type/show.html"},
                {id:2,name:"菜品管理",pId:1,menuUrl:"admin/shop/cook/show.html"},
                {id:4,name:"订单管理",pId:0},
                {id:5,name:"已完成",pId:4,menuUrl:"admin/order/ok/show.html"},
                {id:6,name:"未完成",pId:4,menuUrl:"admin/order/ok/show.html"},
                {id:9,name:"系统管理",pId:0},
                {id:11,name:"用户管理",pId:9,menuUrl:"admin/system/user/show.html"},

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
    <div class="logo">订</div>
    <div class="user">
        [
        <a href="#">登陆</a>
        |
        <a href="#">注册</a>
        ]
    </div>
</header>
<div class="menu" id="menu" data-name="treeMenu">

</div>
<div class="message" id="message">

</div>

</body>
</html>
