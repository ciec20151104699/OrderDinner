function fileAlert(str){
    var htmlStr="<div id='fileAlert' style='font-size:16px;text-align:center; width:200px; position:fixed;color:#fff;background:#000; border-radius:10px;padding:10px; z-index:99999999999;top:100px; margin-left:-110px; left:50%;opacity:0.7;'>"+str+"</div>"
    $('body').append(htmlStr)
    setTimeout(function(){
        $("#fileAlert").remove();
    },3000)
}
function getMenuList(){
    var menuList = window.localStorage.getItem("menuList");
    menuList = JSON.parse(menuList);
    return menuList;
}
function hrefJump(hrefUrl){
    $.get(hrefUrl,function(data){
        $("#mainMes").html(data);//跳转方法
    });
}
function hrefClick(hrefUrl){//点击方法
    $("#treeMenu li[rel='"+hrefUrl+"']").click();
}
function suffix(str){
    var suffix=str.substring(str.lastIndexOf(".")+1,str.length);
    return suffix.toLowerCase();
}

//判断拿到的数据是否为空或未定义，展示时设置为空
function isnull(str){
    if (str == null || str == undefined) {
        str = '';
        return str;
    }
    return str;
}

//单位拼接
function unit(str,unit){
    if(str == null || str == undefined || str === ""){
        str = '';
        return str;
    }else{
        if(str == 999999.99){
            return "--";
        }
        if(unit == null || unit == undefined || unit == ""){
            unit = '';
            return str;
        }
        return str+unit;
    }
}

/**
 *转换日期对象为日期字符串
 * @param date 日期对象
 * @param isFull 是否为完整的日期数据,
 *               为true时, 格式如"2000-03-05 01:05:04"
 *               为false时, 格式如 "2000-03-05"
 * @return 符合要求的日期字符串
 */
function getSmpFormatDate(date, isFull) {
    var pattern = "";
    if (isFull == true || isFull == undefined) {
        pattern = "yyyy-MM-dd hh:mm:ss";
    } else {
        pattern = "yyyy-MM-dd";
    }
    return getFormatDate(date, pattern);
}

/**
 *转换日期对象为日期字符串
 * @param l long值
 * @param pattern 格式字符串,例如：yyyy-MM-dd hh:mm:ss
 * @return 符合要求的日期字符串
 */
function getFormatDate(date, pattern) {
    if (date == undefined || date == 'Invalid Date' || Number(date) == 0) {
        return "";
    }
    if (pattern == undefined) {
        pattern = "yyyy-MM-dd hh:mm:ss";
    }

    return date.format(pattern);
}
function getFormatDates(date, pattern) {
    if (date == undefined || date == 'Invalid Date') {
        date = "";
    }
    if (pattern == undefined) {
        pattern = "yyyy-MM-dd hh:mm:ss";
    }

    return date.format(pattern);
}


//js里面格式化日期
/**
 * @param strTime
 */
function FormatDate (strTime) {
    if(strTime==0||strTime===null){
        return "";
    }
    var date = new Date(strTime);
    return date.getFullYear()+"-"+(date.getMonth()+1)+"-"+date.getDate();
}
function FormatTime (strTime) {
    if(strTime==0||strTime===null){
        return "";
    }
    var date = new Date(strTime);
    return date.getFullYear()+"/"+(date.getMonth()+1)+"/"+date.getDate();
}
/**
 * Date Format
 * @param style date format like 'yyyyMMdd'
 */
Date.prototype.format = function(style) {
    var o = {
        "M+" : this.getMonth() + 1, //month
        "d+" : this.getDate(),      //day
        "h+" : this.getHours(),     //hour
        "m+" : this.getMinutes(),   //minute
        "s+" : this.getSeconds(),   //second
        "w+" : "日一二三四五六".charAt(this.getDay()),   //week
        "q+" : Math.floor((this.getMonth() + 3) / 3),  //quarter
        "S"  : this.getMilliseconds() //millisecond
    }
    if(/(y+)/.test(style)) {
        style = style.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
    }
    for(var k in o){
        if(new RegExp("("+ k +")").test(style)){
            style = style.replace(RegExp.$1, RegExp.$1.length == 1 ? o[k] : ("00" + o[k]).substr(("" + o[k]).length));
        }
    }
    return style;
};
function GetUrlStr(name){
    var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
    var r = window.location.search.substr(1).match(reg);
    if(r!=null)
        return decodeURI(r[2]);
    return null;
}
//js里面格式化日期
/**
 * @param strTime
 */
function FormatDateTime (strTime) {
    if(strTime==0||strTime===null){
        return "";
    }
    var date = new Date(strTime);
    return date.getFullYear()+"-"+(date.getMonth()+1)+"-"+date.getDate()+" "+date.getHours()+":"+date.getMinutes()+":"+date.getSeconds();
}
/**
 * 只转年
 * @param strTime
 * @returns
 */
function FormatDateTimeYear (strTime) {
    if(strTime==0||strTime===null){
        return "";
    }
    var date = new Date(strTime);
    return date.getFullYear();
}

function dateTimestr(str){
    str = str.replace(/-/g,'/');
    var date = new Date(str);
    return date;
}
/**
 * 将度转换成为度分秒
 * @param value
 * @returns
 */


/**
 * on 开
 * off 关
 * @param id
 * @returns {Boolean}
 */
function addTranLoad(id){
    var str='<div class="traRotate" id="traRotate"><div class="traRotateInner"><i class="fa fa-spinner"></i></div></div>'
    if(id=="on"){
        $("body").append(str);
    }else if(id=="off"){
        $("#traRotate").fadeOut();
        $("#traRotate").remove();

    }else{
        return false;
    }
}
$("input,select,textarea").focus(function(){
    $(this).css("border-color","#66b550")
})
$("input,select,textarea").blur(function(){
    $(this).css("border-color","#ccc")
});
//保留两位小数
function toFix(num){
    if(num != ""){
        num = num.toFixed(2)
    }
    return num;
}
function mode_view(title,url,height){
    layui.use('layer', function(){
        var $ = layui.jquery, layer = layui.layer;
        layer.open({
            type: 2,
            title:title,
            shade: [0.3, '#393D49'],
            area:['625px',height+'px'],
            maxmin: false,
            content:url,
            success:function(){
                $(".layui-layer-content").height(height-42)
            }
        });
    })
}
function mode_view_edit(title,url,height,data,obj,func,func1){
    window.localStorage.setItem("editData",JSON.stringify(data));
    layui.use('layer', function(){
        var $ = layui.jquery, layer = layui.layer;
        layer.open({
            type: 2,
            title:title,
            btn:["确认"],
            shade: [0.3, '#393D49'],
            area:['800px',height+'px'],
            maxmin: false,
            content:url,
            yes:function(index){
                var row = window["layui-layer-iframe" + index].callbackdata();
                console.log(row)
                func(row,obj)
                func1(row,obj)
                layer.closeAll();
            },
            success:function(){
                $(".layui-layer-content").height(height-100)
                $("#workOrderNumber").text(obj.workOrderNumber)
            }
        });
    })
}
function  isLogin(str) {
    $.get(str,function(data){
        if(data.substring(0,9)==="<!--登录-->"){
            window.location.href="/html/login.html";
            window.location.reload();
            return 0;
        }else{
            return 1;
        }
    })
}
function getView(str,boxName){
    $(boxName).html("");
    $.get(str,function(data){
        if(data.substring(0,9)==="<!--登录-->"){
            window.location.href="/html/login.html"
            window.location.reload();
        }else{
            $(boxName).html(data);
        }
    });
}
function cancel(){
    var index = parent.layer.getFrameIndex(window.name);
    parent.layer.close(index);
}

function newFile(inputNames,imgNames) {
    var windowURL = window.URL || window.webkitURL;
    var loadImg = windowURL.createObjectURL(document.getElementById(inputNames).files[0]);
    document.getElementById(imgNames).setAttribute('src',loadImg);
}

