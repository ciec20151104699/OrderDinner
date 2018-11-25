package cc.controller;

import cc.entity.model.Menu;
import cc.entity.model.MenuType;
import cc.service.MenuService;
import cc.utils.ResultEntity;
import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/menu")
public class MenuController {
    @Resource
    MenuService menuService;

    @ResponseBody
    @RequestMapping("/list")
    public String menuList(HttpServletRequest request){
        String flag = request.getParameter("flag");
        String typeName = request.getParameter("typeName");
        String pageSize = request.getParameter("limit");
        String pageNum = request.getParameter("page");
        PageInfo<Menu> menuList = menuService.menuList(Integer.parseInt(pageSize),Integer.parseInt(pageNum),flag,typeName);
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("code", 0);
        jsonObject.put("msg", "");
        jsonObject.put("count", menuList.getTotal());
        jsonObject.put("data", menuList.getList());
        return jsonObject.toString();
    }

    @ResponseBody
    @RequestMapping("/insert")
    public ResultEntity menuInsert(HttpServletRequest request){
        String foodName = request.getParameter("foodName");
        String price = request.getParameter("price");
        String image = request.getParameter("image");
        String flag = request.getParameter("flag");
        Menu menu = new Menu();
        menu.setFlag(Integer.parseInt(flag));
        menu.setImage(image);
        menu.setPrice(price);
        menu.setFoodName(foodName);
        menu.setUpdateTime(System.currentTimeMillis());
        menuService.addMenu(menu);
        return ResultEntity.success("插入成功");
    }

    @ResponseBody
    @RequestMapping("/delete")
    public ResultEntity menuDelete(HttpServletRequest request){
        String id = request.getParameter("id");
        menuService.deleteMenu(Integer.parseInt(id));
        return ResultEntity.success("删除成功");
    }


    @ResponseBody
    @RequestMapping("/update")
    public ResultEntity menuUpdate(HttpServletRequest request){
        String id = request.getParameter("id");
        String foodName = request.getParameter("foodName");
        String price = request.getParameter("price");
        String image = request.getParameter("image");
        String flag = request.getParameter("flag");
        Menu menu = new Menu();
        menu.setFlag(Integer.parseInt(flag));
        menu.setImage(image);
        menu.setPrice(price);
        menu.setFoodName(foodName);
        menu.setUpdateTime(System.currentTimeMillis());
        menuService.updateMenu(Integer.parseInt(id),menu);
        return ResultEntity.success("删除成功");
    }


    @ResponseBody
    @RequestMapping("/entity/id")
    public ResultEntity menuById(HttpServletRequest request){
        String id = request.getParameter("id");
        Menu menu = menuService.selectMenuById(Integer.parseInt(id));
        return ResultEntity.success(menu);
    }

    @ResponseBody
    @RequestMapping("/type/insert")
    public ResultEntity menuTypeInsert(HttpServletRequest request){
        String name = request.getParameter("name");
        String remarks = request.getParameter("remarks");
        MenuType menu = new MenuType();
        menu.setName(name);
        menu.setRemark(remarks);
        menuService.addMenuType(menu);
        return ResultEntity.success("插入成功");
    }

    @ResponseBody
    @RequestMapping("/type/select")
    public String menuTypeSelect(HttpServletRequest request){
        String pageSize = request.getParameter("limit");
        String pageNum = request.getParameter("page");
        String typeName = request.getParameter("typeName");
        if (typeName==null){
            typeName="";
        }
        typeName="%"+typeName+"%";
        PageInfo<MenuType> menuTypePageInfo = menuService.pageInfoMentType(Integer.parseInt(pageNum),Integer.parseInt(pageSize),typeName);
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("code", 0);
        jsonObject.put("msg", "");
        jsonObject.put("count", menuTypePageInfo.getTotal());
        jsonObject.put("data", menuTypePageInfo.getList());
        return jsonObject.toString();
    }

    @ResponseBody
    @RequestMapping("/type/select/all")
    public ResultEntity menuTypeAll(HttpServletRequest request){
        return ResultEntity.success(menuService.menuTypeList());
    }
    @ResponseBody
    @RequestMapping("/type/menu")
    public ResultEntity menuByType(HttpServletRequest request){
        return ResultEntity.success(menuService.menuList());
    }
}
