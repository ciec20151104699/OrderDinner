<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="basePath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="${basePath}/plugins/common/common.css" />
    <link rel="stylesheet" media="screen" href="${basePath}/plugins/layui/css/modules/layer/default/layer.css">
    <link href="${basePath}/css/model_view.css" rel="stylesheet" />
    <script src="${basePath}/plugins/common/jquery.js"></script>
    <script src="${basePath}/plugins/layui/lay/modules/layer.js"></script>
</head>
<body>
<div class="model_wrap">
    <form id="formData" action="" autocomplete="off">
        <div class="model_item">
            <label>
                菜品名称：
            </label>
            <input  value="" type="text" placeholder="请输入菜品名称" id="cookName" name="cookName"/>
        </div>
        <div class="model_item">
            <label>
                所属类别：
            </label>
           <select id="type" name="type" >
               <option>请选择</option>
           </select>
        </div>
        <div class="model_item">
            <label>
                排序：
            </label>
            <input  value="" type="text" placeholder="请输入类别名称" id="cookRank" name="cookRank"/>
        </div>
        <div class="model_item">
            <label>
                价格(￥)：
            </label>
            <input  value="" type="text" placeholder="请输入价格" id="cookPrice" name="cookPrice"/>
        </div>
        <div class="model_item">
            <label>选择图片：</label>
            <a href="javascript:void(0);" class="file_pic"  >浏览
                <input type="file" name="filePic" id="filePic" onchange="newFile('filePic','cookPic')"   />
            </a>
        </div>
        <div class="model_item">
            <img src="/fork/img/kfc.jpg" id="cookPic" />


        </div>
        <%--<div class="model_item">--%>
            <%--<label>--%>
                <%--备注：--%>
            <%--</label>--%>
            <%--<textarea id="note" name="note" placeholder="请输入备注..."></textarea>--%>
        <%--</div>--%>
        <div class="model_item model_btn">
            <a href="javascript:void(0);"  class="btn_base btn_sure" onclick="insertMenu()">确认

            </a>
        </div>
    </form>
</div>
</body>
</html>
<script>
    function newFile(inputNames,imgNames) {
        var windowURL = window.URL || window.webkitURL;
        var loadImg = windowURL.createObjectURL(document.getElementById(inputNames).files[0]);
        document.getElementById(imgNames).setAttribute('src',loadImg);
    }
    function insertMenu() {
        var cookName = $("#cookName").val()
        var cookPrice = $("#cookPrice").val()
        var type = $("#type").val()
        var img = $("#type").val()
        $.post("${basePath}/menu/insert",{foodName:cookName,price:cookPrice,flag:type,image:img},function (result) {
            layer.msg("添加成功",{time:2500},function () {
                parent.layui.table.reload('test',{page:{curr:1}});
                parent.layer.closeAll();
            })
        })
    }


    $.post("${basePath}/menu/type/select/all",function (result) {
        $("#type").html('');
        var data = result.data;
        var html ='';
        for (var key in data){
            var d = data[key];
            html+=' <option value="'+d.id+'">'+d.name+'</option>'
        }
        $("#type").append(html);
    })
</script>
