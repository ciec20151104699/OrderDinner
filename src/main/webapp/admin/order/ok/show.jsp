<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="basePath" value="${pageContext.request.contextPath}"/>

<div class="tab_box">
    <table class="layui-hide" id="test"></table>
</div>
<script>

    layui.use('table', function () {
        var table = layui.table;
        table.render({
            elem: '#test'
            , url: '${basePath}/order/user/order' //数据接口
            , page: true //开启分页
            , cellMinWidth: 80 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
            , cols: [[
                {type: 'numbers'},
                {field: 'updateTime', title: '时间',templet:function (d) {
                        var date = new Date(d.updateTime)
                        return formatDate(date);
                    }},
                {field: 'foodName', title: '菜品名称'},
                {field: 'typeName', title: '菜品类别'},
                {field: 'price', title: '价格'}
//                , {field: 'image', title: '类别描述'}

            ]]
        });
    });
    $("#search").click(function () {
        debugger;
        var typeName = $("#type").val();
        var table = layui.table;
        table.reload('test', {
            where: { //设定异步数据接口的额外参数，任意设
                typeName: typeName
            }
            , page: {
                curr: 1 //重新从第 1 页开始
            }
        });
    })
    //    function search() {
    //
    //    }

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

