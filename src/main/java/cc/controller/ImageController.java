package cc.controller;


import cc.utils.ResultEntity;
import org.apache.commons.lang3.StringUtils;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

@Controller
@RequestMapping("/image")
public class ImageController {

    /**
     * 文件上传
     *
     * @param file
     * @throws Exception
     */
    @ResponseBody
    @RequestMapping(value = "/background/upload", method = RequestMethod.POST)
    public ResultEntity uploads(@Param("file") MultipartFile file, HttpServletRequest request) throws Exception {
        FileOutputStream fos = null;
        InputStream fis = null;
        try {
            //imgName = appadd.png
            String imgName =  request.getParameter("imgName");
            if ("".equals(imgName)) {
                imgName = file.getOriginalFilename();
            }

            // 固定值  APP_DETAIL_PATH、USER_HEADERS_PATH 其他类别额外添加就行
//            String imgPath =  request.getParameter("imgPath");
//            imgPath = imgPath + formatDate(new Date(), "yyyyMM") + "/";

            //fullPath =C:/smartRing/vfsroot/201808/
//            String fullPath = "C:/aa/";
            String fullPath = request.getSession().getServletContext().getRealPath("/images/");
//            String fullPath = "C:/"+ imgPath;
            File dir = new File(fullPath);
            if (!dir.exists()) {
                dir.mkdirs();
            }
            String uuid = UUID.randomUUID().toString();
            // StringUtils 引用 org.apache.commons.lang3.StringUtils
            String key = StringUtils.replace(uuid, "-", "");
            //suffix为: .png  .jpg
            String suffix = imgName.substring(imgName.lastIndexOf("."));

            fis = file.getInputStream();
            File f = new File(fullPath+"/" +key+suffix);
            fos = new FileOutputStream(f);
            byte[] b = new byte[1024];
            int nRead = 0;
            while ((nRead = fis.read(b)) != -1) {
                fos.write(b, 0, nRead);
            }
            fos.flush();


            Map<String, String> pathMap = new HashMap<>();
            pathMap.put("imgRequestUrl", "/images/"  +key+ suffix);
            pathMap.put("fileName", imgName);

             return ResultEntity.success(pathMap);
        } catch (Exception e) {

        } finally {
            fos.close();
            fis.close();
        }
        return ResultEntity.errorEntity("");
    }


//    /*
//     * 文件回显
//     *
//     * */
//    @RequestMapping(value = "/pic/show", method = RequestMethod.GET)
//    public void showPicture(HttpServletRequest request, HttpServletResponse response) throws Exception {
//        String id =  ServletUtil.getRequestParm(request, "id");
//        Info info = infoService.getInfoById(Integer.parseInt(id));
//        long begin = System.currentTimeMillis();
////        School school = schoolService.getSchoolByParentId(0);
//        String picPath = "";
//        File file = null;
//        if (null != info) {
//            picPath = info.getImage();
//            if (picPath != null && !"".equals(picPath)) {
//                if (picPath.indexOf(FileUtils.VFS_ROOT_PATH) >= 0) {
//                    file = new File(picPath);
//                } else {
//                    file = new File(FileUtils.VFS_ROOT_PATH + picPath);
//                }
//            } else {
//                String filePath = FileUtils.VFS_ROOT_PATH + "/" + info.getImage();
//                file = new File(filePath);
//            }
//        }
//
//
////        file.exists();
//        if (null == file || !file.exists()) {
//
//            String filePath = request.getSession().getServletContext().getRealPath("/assetsNew/images/brokenimg.png");
//            filePath = request.getSession().getServletContext().getRealPath("/assets/intersource/images/logo.png");
//            file = new File(filePath);
//        }
//
//        if (!file.exists()) return;      //再次判断，避免异常
//        response.setContentType("multipart/form-data");
//        InputStream reader = null;
//        try {
//            reader = VFSUtil.getInputStream(file, true);
//            byte[] buf = new byte[4096];
//            int len = 0;
//
//            OutputStream out = response.getOutputStream();
//
//            while ((len = reader.read(buf)) != -1) {
//                out.write(buf, 0, len);
//            }
//            out.flush();
//        } catch (Exception ex) {
//            System.out.println("显示图片时发生错误");
//        } finally {
//            if (reader != null) {
//                try {
//                    reader.close();
//                } catch (Exception ex) {
//
//                    System.out.println("关闭文件流出错");
//                }
//            }
//            long end = System.currentTimeMillis();
//            System.out.println(end - begin + "显示总共用时ms");
//        }
//    }


    private String formatDate(Date date, String format) {
        SimpleDateFormat sdf = new SimpleDateFormat(format);
        return sdf.format(date);
    }

}
