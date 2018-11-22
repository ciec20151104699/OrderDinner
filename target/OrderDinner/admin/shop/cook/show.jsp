<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="basePath" value="${pageContext.request.contextPath}"/>
<div class="search_box">
    <form autocapitalize="off" >
        <div class="sea_type_2">
            <label>订单编号：</label>
            <input type="text" id="type">
        </div>
        <div class="sea_type_btn">
            <input type="button" class="btn_base btn_search" value="搜索" id="search"/>
        </div>
    </form>
</div>
<div class="new_btn_type">
    <a href="javascript:;" onclick="mode_view('新增类别','admin/shop/cook/add.jsp','470')" class="btn_base btn_add">
        新增
    </a>
</div>
<div id="editDatas" style="display: none"></div>
<div class="tab_box" >
    <table class="layui-hide" id="test"></table>
</div>

<script>
    layui.use('table', function () {
        var table = layui.table;
        table.render({
            elem: '#test'
            , url: '${basePath}/menu/list' //数据接口
            , page: true //开启分页
            , cellMinWidth: 80 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
            , cols: [[
                {type: 'numbers'},
                {field: 'foodName', title: '菜品名称'}
                , {field: 'price', title: '价格'}
                , {field: 'image', title: '图片'}
                , {field: 'updateTime', title: '添加时间'}
                , {field: 'flag', title: '添加类别'}
                , {field: 'operation', title: '操作',templet: function (d) {
                        var str = d.id;

                        var html =
                            '                            <span class="dele" onclick="deleteMenu(' + str + ')">删除</span>';
                        return html;
                    }
                }
            ]]
        });
    });
    $("#search").click(function () {

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

    function deleteMenu(id) {
        $.post("${basePath}/menu/delete",{id:id},function (result) {
            layer.msg("删除成功",{time:2500},function () {
                var table = layui.table;
                table.reload('test', {
                    page: {
                        curr: 1 //重新从第 1 页开始
                    }
                });

            })
        })
    }
</script>