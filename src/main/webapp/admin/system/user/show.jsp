<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="basePath" value="${pageContext.request.contextPath}"/>
<div class="search_box">
    <form autocapitalize="off" >
        <div class="sea_type_2">
            <label>用户名：</label>
            <input type="text" id="type">
        </div>
        <div class="sea_type_btn">
            <input type="button" class="btn_base btn_search" value="搜索" id="search"/>
        </div>
    </form>
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
            , url: '${basePath}/user/user/list' //数据接口
            , page: true //开启分页
            , cellMinWidth: 80 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
            , cols: [[
                {type: 'numbers'},
                {field: 'userName', title: '账号'}
                , {field: 'name', title: '用户名'}
                , {field: 'password', title: '密码'}
                , {field: 'sex', title: '性别',templet:function (d) {
                        if (d.sex==0){
                            return"女";
                        }else{
                            return"男";
                        }

                    }}
                , {field: 'flag', title: '身份',templet:function (d) {
                        if (d.flag==0){
                            return"商家";
                        }else{
                            return"用户";
                        }

                    }}
            ]]
        });
    });
    $("#search").click(function () {
        debugger;
        var name = $("#type").val();
        var table = layui.table;
        table.reload('test', {
            where: { //设定异步数据接口的额外参数，任意设
                name: name
            }
            , page: {
                curr: 1 //重新从第 1 页开始
            }
        });
    })
</script>
