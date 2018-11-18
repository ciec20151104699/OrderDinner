function cancelBubble(event) {
    var e = arguments.callee.caller.arguments[0] || event; //若省略此句，下面的e改为event，IE运行可以，但是其他浏览器就不兼容
    if (e && e.stopPropagation) {
        // this code is for Mozilla and Opera
        e.stopPropagation();
    } else if (window.event) {
        // this code is for IE
        window.event.cancelBubble = true;
    }
}
function menus(idName, treeArr, idNumber){
    var menus = '';
    GetData(idNumber, treeArr);
    $(idName).html(menus);
    $.each($(idName+" li"), function () {
        if(!$(this).is(':has(ul)')){
            $(this).children('p').children('i').remove();
        }
    })
    $(idName).children("ul").children("li:first-child").children("ul").show();
    $(idName).children("ul").children("li").children('p').css({"background":"#fff","text-indent":"1em","color":"#67b54f","font-size":"14px","font-weight":600})
    $(idName).children("ul").children("li:first-child").children("p").css({"background":"#fdf2dc","color":"#ffb240"})
    $(idName).children("ul").children("li:first-child").css({"background":"#fffdf8","border-bottom":"1px solid #fdf2dc"})
    $(idName).children("ul").children("li:first-child").children("p").children("i").removeClass("iconLeft").addClass("iconDown");
    $(idName).children("ul").children("li").children('ul').children("li").children("p").css({"text-indent":"2em",'font-size':'12px'})
    $(idName).children("ul").children("li").children("ul").children("li").children('ul').children("li").children("p").css({"text-indent":"3em"})
    $(idName).children("ul").children("li").children("ul").children("li").children("ul").children("li").children('ul').children("li").children("p").css({"text-indent":"4em"})
    $(idName+" li").click(function(){
        $(idName+" ul li ul li p").css('color','#333');
        $(this).children("p").css('color','#ffb751');
        cancelBubble();
        if($(this).children('p').children('i').hasClass("iconDown")) {
            $(this).children("ul").slideUp();
            $(this).children('p').children('i').removeClass("iconDown").addClass("iconLeft");
            return false;
        }else if($(this).children('p').children('i').hasClass("iconLeft")){
            if($(this).parent().parent().attr("data-name")=="treeMenu"){
                $(idName).children("ul").children("li").children('p').css({"background":"#fff","color":"#67b54f"})
                $(idName).children("ul").children("li").css({"background":"#fff","border":"none"})
                $(this).children("p").css({"background":"#fdf2dc","color":"#ffb240"})
                $(this).css({"background":"#fffdf8","border-bottom":"1px solid #fdf2dc"})
            }
            $(this).children("ul").slideDown();
            $(this).children('p').children('i').removeClass("iconLeft").addClass("iconDown");
            $(this).nextAll().children("ul").slideUp();
            $(this).prevAll().children("ul").slideUp();
            $(this).nextAll().children('p').children('i').removeClass("iconDown").addClass("iconLeft");
            $(this).prevAll().children('p').children('i').removeClass("iconDown").addClass("iconLeft");
            return false;
        }

    })
    $(idName).children("ul").children("li").click(function(){
        if($(this).children('p').find('i').length==0){
            $(idName).children("ul").children("li").children("p").css({"background":"#fff","color":"#67b54f"})
            $(".iconDown").parent("p").parent("li").children("ul").slideUp();
            $(idName).children("ul").children("li").children("p").children("i").removeClass("iconDown").addClass("iconLeft");
            $(this).children("p").css({"background":"#fdf2dc","color":"#ffb240"})
        }

    })
    if($(idName).children("ul").children("li:first-child").children('ul').children("li:first-child").children("p").children("i").hasClass("iconLeft")){
        $(idName).children("ul").children("li:first-child").children('ul').children("li:first-child").children("p").children("i").removeClass("iconLeft").addClass("iconDown")
        $(idName).children("ul").children("li:first-child").children('ul').children("li:first-child").children("ul").show()
        $(idName).children("ul").children("li:first-child").children('ul').children("li:first-child").children("ul").children("li:first-child").click();
    }else{
        $(idName).children("ul").children("li:first-child").children('ul').children("li:first-child").click()
    }

    function GetData(id, arry) {
        var childArry = GetParentArry(id, arry);
        if (childArry.length > 0) {
            menus += '<ul class="parenTree" >';
            for (var i in childArry) {
                menus += '<li class="clickLeft" rel="'+childArry[i].menuUrl+'"><p>' + childArry[i].name;
                menus += '<i class="iconLeft"></i></p>'
                GetData(childArry[i].id, arry);
                menus += '</li>';
            }
            menus += '</ul>';
        }
    }
    function GetParentArry(id, arry) {
        var newArry = new Array();
        for (var i in arry) {
            if (arry[i].pId == id)
                newArry.push(arry[i]);
        }
        return newArry;
    }
}

