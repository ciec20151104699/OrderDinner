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
                类别名称：
            </label>
            <input  value="" type="text" placeholder="请输入类别名称" id="typeName" name="typeName"/>
        </div>
        <!--<div class="model_item">-->
            <!--<label>-->
                <!--排序：-->
            <!--</label>-->
            <!--<input  value="" type="text" placeholder="请输入类别序号" id="typeRank" name="typeRank"/>-->
        <!--</div>-->
        <div class="model_item">
            <label>
                备注：
            </label>
            <textarea id="note" name="note" placeholder="请输入备注..."></textarea>
        </div>
        <div class="model_item model_btn">
            <a href="javascript:void(0);" onclick="insertMenuType()" class="btn_base btn_sure" >确认</a>
        </div>
    </form>
</div>
</body>
</html>
<script>
    function insertMenuType() {
        var typeName = $("#typeName").val();
        var note = $("#note").val();
        if (typeName==null||typeName==""){
            layer.msg("请填入类别名称")
            return;
        }
        $.post("${basePath}/menu/type/insert",{name:typeName,remarks:note},function (result) {
            layer.msg("添加成功",{time:2000},function () {
                parent.layui.table.reload('test',{page:{curr:1}});
                parent.layer.closeAll();
            })
            
        })
    }
</script>