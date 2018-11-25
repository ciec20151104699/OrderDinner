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
        <%--<div class="model_item">--%>
            <%--<label>--%>
                <%--排序：--%>
            <%--</label>--%>
            <%--<input  value="" type="text" placeholder="请输入类别名称" id="cookRank" name="cookRank"/>--%>
        <%--</div>--%>
        <div class="model_item">
            <label>
                价格(￥)：
            </label>
            <input  value="" type="text" placeholder="请输入价格" id="cookPrice" name="cookPrice"/>
        </div>
        <div class="model_item">
            <label>选择图片：</label>
            <a href="javascript:void(0);" class="file_pic" id="filePic">浏览
                <%--<input type="file" name="filePic"id="filePic"  onchange="newFile('filePic','cookPic')"   />--%>

            </a>


            <input type="file" id="file-input" style="display: none" accept="image/*">
            <input type="hidden" name="backUrl" id="backUrl" value="">
            <%--<ul class="img-list-icon" style="height:100px;width: 100px;margin:0 auto;margin-top:20px;">--%>
                <%--<li style="width: 100%;height: 100%;margin: 0;">--%>
                    <%--<img src="${pageContext.request.contextPath}/image/pic/show" data-url="${pageContext.request.contextPath}/image/pic/show" width="15%" height="20%" id="back_url">--%>
                <%--</li>--%>
                <%--<div style="left:42%;top:33%;">--%>
                    <%--<span id="iconUpload" class="uploadBtn-a">点击上传图片</span>--%>
                <%--</div>--%>
            <%--</ul>--%>
        </div>
        <div class="model_item">
            <img src="/fork/img/kfc.jpg" id="cookPic" />

                <%--<img src="" data-url="" width="15%" height="20%" id="back_url" >--%>
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
    // function newFile(inputNames,imgNames) {
    //     var windowURL = window.URL || window.webkitURL;
    //     var loadImg = windowURL.createObjectURL(document.getElementById(inputNames).files[0]);
    //     document.getElementById(imgNames).setAttribute('src',loadImg);
    // }
    function insertMenu() {
        var cookName = $("#cookName").val()
        var cookPrice = $("#cookPrice").val()
        var type = $("#type").val()
        var img = $("#backUrl").val();
        var reg =/^[1-9]\d*$/
        ;
        if (!reg.test(cookPrice)) {
            layer.msg("价格必须是非0开头数字");
            return;
        }
        if(img == null ||img == ""){
            layer.msg("图片不能为空");
            return;
        }
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

    $(document).ready(function () {
        var iconChoose = document.getElementById("file-input");
        $("#filePic").on("click", function () {
            iconChoose.click();
        }).on("touchstart", function () {
            $(this).addClass("touch")
        }).on("touchend", function () {
            $(this).removeClass("touch")
        });
        iconChoose.onchange = function () {
            if (!this.files.length) return;
            var files = Array.prototype.slice.call(this.files);
            if (files.length > 9) {
                layer.msg("最多同时只可上传9张图片");
                return;
            }
            files.forEach(function (file, i) {
                if (!/\/(?:jpeg|png)/i.test(file.type)){
                    layer.msg('只支持jpeg,png,gif图片，建议您上传png图片');
                    return;
                }
                var reader = new FileReader();
                var li = document.createElement("li");
                $(li).attr("style","width: 100%;height: 100%");

                var picSize = file.size;
                if(picSize>5*1024*1024){
                    layer.msg("上传的图片不能超过5M");
                    return;
                }
                // 获取图片大小
                var size = file.size / 1024 > 1024 ? (~~(10 * file.size / 1024 / 1024)) / 10 + "MB" : ~~(file.size / 1024) + "KB";
                li.innerHTML = '<div class="progress"><span></span></div><div class="size">' + size + '</div>';
                $(".img-list-icon").children().remove();
                $(".img-list-icon").append($(li));
                reader.onload = function () {
                    var result = this.result;
                    var img = document.createElement("img");
                    $(img).attr("width", "100%");
                    $(img).attr("height", "100%");
                    $(img).attr("data-url", "");
                    $(img).attr("class", "pictures");
                    img.src = result;
                    $(li).append(img);
                    //如果图片大小小于100kb，则直接上传
                    if (result.length <= 100*1024) {
                        img = null;
                        uploads(result, file.type, $(li), file.name);
                        return;
                    }
                    //      图片加载完毕之后进行压缩，然后上传
                    if (img.complete) {
                        callback();
                    } else {
                        img.onload = callback;
                    }
                    function callback() {
                        var data = compress(img);
                        uploads(data, file.type, $(li), file.name);
                        img = null;
                    }
                };
                reader.readAsDataURL(file);
            })
        };
        function uploads(basestr, type, $li, name) {
            var text = window.atob(basestr.split(",")[1]);
            var buffer = new Uint8Array(text.length);
            var pecent = 0, loop = null;
            for (var i = 0; i < text.length; i++) {
                buffer[i] = text.charCodeAt(i);
            }
            var blob = getBlob([buffer], type);
            var xhr = new XMLHttpRequest();
            var formdata = getFormData();
            formdata.append('file', blob);
            formdata.append("imgName", name);
            xhr.open('post', '${pageContext.request.contextPath}/image/background/upload');
            xhr.onreadystatechange = function () {
                if (xhr.readyState == 4 && xhr.status == 200) {
                    var imageData = JSON.parse(xhr.responseText);
                    var text = imageData.data.imgRequestUrl ? '上传成功' : '上传失败';
                    clearInterval(loop);
                    //当收到该消息时上传完毕
                    $li.find(".progress span").animate({'width': "100%"}, pecent < 95 ? 200 : 0, function () {
                        $(this).html(text);
                    });
                    $("#backUrl").val(imageData.data.imgRequestUrl);
                    $("#back_url").attr("data-url", imageData.data.imgRequestUrl);
                    $("#cookPic").attr("src","${basePath}/"+imageData.data.imgRequestUrl);
                }
            };
            //数据发送进度，前50%展示该进度
            xhr.upload.addEventListener('progress', function (e) {
                if (loop) return;
                mockProgress();
            }, false);
            //数据后50%用模拟进度
            function mockProgress() {
                if (loop) return;
                loop = setInterval(function () {
                    pecent++;
                    $li.find(".progress span").css('width', pecent + "%");
                    if (pecent == 100) {
                        clearInterval(loop);
                    }
                }, 50)
            }

            xhr.send(formdata);
        }
    });
    function getBlob(buffer, format) {
        try {
            return new Blob(buffer, {type: format});
        } catch (e) {
            var bb = new (window.BlobBuilder || window.WebKitBlobBuilder || window.MSBlobBuilder);
            buffer.forEach(function (buf) {
                bb.append(buf);
            });
            return bb.getBlob(format);
        }
    }

    function getFormData() {
        var isNeedShim = ~navigator.userAgent.indexOf('Android')
            && ~navigator.vendor.indexOf('Google')
            && !~navigator.userAgent.indexOf('Chrome')
            && navigator.userAgent.match(/AppleWebKit\/(\d+)/).pop() <= 534;
        return isNeedShim ? new FormDataShim() : new FormData()
    }
</script>
