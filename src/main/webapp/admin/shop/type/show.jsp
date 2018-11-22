<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="basePath" value="${pageContext.request.contextPath}"/>
<div class="search_box">
    <form autocapitalize="off">
        <div class="sea_type_2">
            <label>类别名称：</label>
            <input type="text" id="type">
        </div>
        <div class="sea_type_btn">
            <input type="button" class="btn_base btn_search" value="搜索" id="search"  />
        </div>
    </form>
</div>
<div class="new_btn_type">
    <a href="javascript:;" onclick="mode_view('新增类别','admin/shop/type/add.jsp','470')" class="btn_base btn_add">
        新增
    </a>
</div>
<div id="editDatas" style="display: none"></div>
<div class="tab_box">
    <table class="layui-hide" id="test"></table>
</div>
<script>

    layui.use('table', function () {
        var table = layui.table;
        table.render({
            elem: '#test'
            , url: '${basePath}/menu/type/select' //数据接口
            , page: true //开启分页
            , cellMinWidth: 80 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
            , cols: [[
                {type: 'numbers'},
                {field: 'name', title: '菜品类别'}
                , {field: 'remark', title: '类别描述'}

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
</script>

