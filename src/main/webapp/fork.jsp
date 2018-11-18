<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="plugins/common/common.css" />
    <script src="plugins/common/jquery.js"></script>
    <style>
        body{background: #eee; color: #666;}
        header{ width: 100%; height: 50px;display: block; line-height: 50px; margin: 0; background: rgb(255, 178, 64);}
        .inner{ width: 1200px; height: 100%; margin: 0 auto; }
        header .logo{ width:30px; float: left; height: 30px;line-height: 30px; margin-top:10px;  font-size: 18px; color: #fff; font-family: "KAITI"; text-align: center;border: 2px solid #fff; border-radius: 50%; }
        .user ,.log_msg{float: right; color: #fff;}
        .user span.log_msg span{color: #fff;}
        .log_msg a{padding:  2px 12px;color: #fff; display: inline-block;}
        .search { height: 70px; width: 100%;  margin: 20px 0 0 0;}
        .search .inner{background: #fff;}
        .search .border_input{ width: 1100px; margin:20px 0 0 50px;float: left ; height: 40px;}
        .search input[type="text"]{font-size: 18px; outline: none; width: 700px; border: 1px solid #f6ac1b;float: left; height: 40px; border-radius: 20px 0 0 20px; border-right: none; padding: 0 20px; box-sizing: border-box; }
        .search input[type="button"]{background: #f6ac1b; color: #fff; width: 150px; line-height: 40px; height: 40px;
            text-align: center; border-radius: 0 20px 20px 0; outline: none; float:left;  cursor: pointer;
        }
        .shop{ width: 200px;  background:#fcfcfc; height:40px; cursor: pointer; border: 1px solid #f6ac1b; float: right;margin-right:20px;  color: #f6ac1b; position: relative; text-align: center;line-height: 40px; }
        .shop:hover{border-bottom: none;}
        .shop .shop_tit{width: 100%; height: 100%; background:#fcfcfc; float: left; font-size: 18px;position: absolute;left: 0 ;top:0;z-index:9;}
        .shop_con{display: none; position: absolute; right: -1px; top:39px;z-index:8;
                width: 220px; color: #666; text-align: left; border: 1px solid #f6ac1b ;
            background:#fcfcfc;
        }
        .shop_list{width:210px; height: 50px; float: left;margin: 5px; border-bottom: 1px dashed #ccc;}
        .shop_list img{ width: 60px; height: 40px; float: left; margin: 5px; }
        .shop_list .shop_name,.shop_list .shop_price{ width: 130px; height: 20px; margin-top: 5px; line-height: 20px;margin-left: 10px; }
        .shop_list .shop_price{ color: #f6ac1b; margin-top: 0;}
        #shop_num{ padding: 0 6px; z-index:10;
            position: absolute;right:-10px;top:-10px;
            height: 24px; border-radius: 12px; text-align: center;line-height: 24px; background: #f6ac1b;color: #fff; display: inline-block; }
        .cook_list{width: 100%; margin:0;height: 900px;}
        .cook_list .inner{background: #fff; position: relative;}
        .cook_list .cook_mes_list{ width: 150px; height: 100%; float: left; box-sizing: border-box; }
        .type_msg{ width: 100%; height: 40px; line-height: 40px; text-align: center; border: 1px solid #ccc;}
        .type_msg_first{border-right: 0;}
        .cook_list_msg{ width: 900px; margin-left: 50px;  float: left; height: 900px;}
        .type_msg_content { width: 100%; height: 100px; position: relative; border-bottom: 1px solid #ccc;  margin-top: 10px;   }
        .type_msg_content img{ width: 140px; height:80px; margin: 10px;float: left; display: block;border: none; }
        .cook_name{ width: 500px;height: 30px;color: #555; font-size: 16px; font-weight:600; line-height: 30px; float: left;margin-top: 10px; margin-left: 30px; overflow: hidden;text-overflow: ellipsis;white-space: nowrap; }
        .msg_note{ width: 500px; height: 50px;line-height: 25px; margin-left: 30px; float: left; font-size: 14px; color: #999; }
        .counter,.msg_price{width: 160px;position:absolute; right: 5px; bottom:10px; height: 30px; }
        .msg_price{ top:20px; line-height: 30px; text-align: center; color: #f6ac1b ;font-size: 16px;font-weight: 600;}
        .cou_sub,.cou_add{ cursor: pointer; background: #f6ac1b; color: #fff; font-size: 16px; width: 30px; height: 30px; border-radius: 3px 0 0 3px; border: 1px solid #ddd;text-align: center;line-height: 30px; float: left; box-sizing: border-box;}
        .cou_num{ width: 90px ; height: 30px; box-sizing: border-box; border-top: 1px solid #ddd; border-bottom: 1px solid #ddd;  float: left; text-align: center; line-height: 30px;  }
        .cou_add{border-radius: 0 3px 3px 0;}
        .shop_pay{ width: 210px; float:left;margin: 5px;background: #f1f1f1;  }
        .shop_pay .shop_txt{ width: 100%; line-height: 20px; padding:0 10px; box-sizing: border-box; border-radius: 5px 5px 0 0;}
        .shop_pay .pay_for{ width: 100%; text-align: center; height: 40px; background: #f6ac1b;color: #fff; border-radius: 0 0 5px 5px; font-size: 16px}




    </style>
</head>
<body>
<header>
    <div class="inner">
        <div class="logo">订</div>
        <div class="user">
            [
            <span onclick="loginView()">登陆</span>
            |
            <a span="#">注册</a>
            ]
        </div>
        <div class="log_msg">
            <a href="myOrder.jsp">我的订单</a>|
            <a href="">管理员</a>|
            <a href="">退出</a>
        </div>
    </div>

</header>
<div class="search">
    <div class="inner">
        <div class="border_input">
            <input id="search" name="search" type="text" placeholder="请输入菜品名称" />
            <input id="btn" type="button" value="搜索"  />
            <div class="shop" id="shop">
                <span id="shop_num">0</span>
                <div class="shop_tit">购物车&nbsp;</div>
                <div class="shop_con">
                    你没有购买任何商品
                </div>
            </div>
        </div>
    </div>

</div>
<div class="cook_list">
    <div class="inner">
        <div class="cook_mes_list" id="type">

        </div>
        <div class="cook_list_msg" id="msg">

        </div>
    </div>
</div>
<div class="">

</div>
<script>
    function getContextPath(){
        var pathName = document.location.pathname;
        var index = pathName.substr(1).indexOf("/");
        var result = pathName.substr(0,index+1);
        return result;
    }


    function loginView() {
        window.location.href=getContextPath()+"/user/login/index";
    }
    // let login=true;
    // if(login==true){
    //     $(".log_msg").show();
    //     $(".user").hide();
    // }else{
    //     $(".log_msg").hide();
    //     $(".user").show();
    // }
    let counter=0;
    let typeData=[
        {id:1,
         name:"主食"
        },
        {id:2,
         name:"今日特卖"
        },
        {
            id:3,
            name:"热菜"
        },
        {
            id:4,
            name:"饮料"
        },
        {
            id:5,
            name:"凉菜"
        }
    ]
    let str=""
    for (let i=0;i<typeData.length;i++){
        if(i==0){
            str+="<div class='type_msg type_msg_first' data-type='"+typeData[i].id+"'>"+typeData[i].name+"</div>"

        }else{
            str+="<div class='type_msg' data-type='"+typeData[i].id+"'>"+typeData[i].name+"</div>"
        }
    }
    $("#type").html(str)

    let data=[
        {id:1, name:"打卤面", times:"", typeId:1, imgSrc:"./img/kfc.jpg", price:"12.70", note:"这是一道神奇的菜神奇的我也不知道为什么要用肯德基的图片对了这事测试数据所以无所谓了"},
        {id:2, name:"打卤面", times:"", typeId:1, imgSrc:"img/kfc.jpg", price:"12.70", note:""},
        {id:3, name:"打卤面", times:"",typeId:1, imgSrc:"img/kfc.jpg", price:"12.70", note:""},
        {id:4, name:"打卤面", times:"",typeId:1, imgSrc:"img/kfc.jpg", price:"12.70", note:""},
        {id:5, name:"打卤面", times:"",typeId:1, imgSrc:"img/kfc.jpg", price:"12.70", note:""},
        {id:6, name:"打卤面", times:"",typeId:1, imgSrc:"img/kfc.jpg", price:"12.70", note:""},

    ]
    let strCook="";
    for (let i=0;i<data.length;i++){
        strCook+="<div class='type_msg_content type_'"+data[i].typeId+" data-type='"+data[i].id+"'>" +
            "<img src='"+data[i].imgSrc+"'  /> " +
            "<div class='cook_name'>"+data[i].name+"</div> " +
            "<div class='msg_note'>"+data[i].note+"</div> "+
            "<div class='msg_price'>￥"+data[i].price+"</div>"+
            "<div class='counter' data-key='"+i+"'>" +
                "<div class='cou_sub'>-</div><div class='cou_num'>0</div><div class='cou_add'>+</div> "+
            "</div>"+
            "</div>"
    }
    $("#msg").html(strCook);
    $(".cou_sub").click(function () {
        let num1=$(this).next().html()-0;
        let key= $(this).parent().attr("data-key")-0;

        if(num1===0){
            alert("已经没有东西了")
        }else{
            counter--;
            $("#shop_num").text(counter);
            num1=num1-1;
            data[key].times=num1;
            $(this).next().html(num1)
        }
    });

    $(".cou_add").click(function () {
        let num2=$(this).prev().html()-0;
        let key= $(this).parent().attr("data-key")-0;

        if(num2===99){
            alert("最多99个")
        }else{
            if(counter===99){
                alert("最多99个")
                $("#shop_num").text(counter);
                return false;
            }
            counter++;
            num2 = num2+1;
            data[key].times=num2;
            $("#shop_num").text(counter);
            $(this).prev().html(num2)
        }
    })
    $("#shop").mouseover(function(){
        let dom=$(this).find(".shop_con")
        $(this).find(".shop_con").show();
        let strShop="";
        let times=0;
        let allPrice=0;
        for (let i=0;i<data.length;i++){
            if(data[i].times!==0&&data[i].times!==""){
                times++;

                strShop+="<div class='shop_list'>" +
                    "<img src='"+data[i].imgSrc+"'  />" +
                    "<div class='shop_name'>"+data[i].name+"</div> " +
                    "<div class='shop_price'>￥"+data[i].price+"*"+data[i].times+"</div>"+
                "</div>"
                allPrice+=((data[i].price-0)*100*(data[i].times-0))/100;

                if(times!=0){
                    dom.html(strShop);
                    dom.append("<div class='shop_pay'>" +
                        "<div class='shop_txt'>您一共购买了"+counter+"件商品，共消费"+allPrice+"元</div> " +
                        "<div class='pay_for'>付款￥"+allPrice+"</div> " +
                        "</div>")
                }
            }

        }

    })
    $("#shop").mouseout(function () {
        $(".shop_con").hide();
    })

</script>
</body>
</html>
