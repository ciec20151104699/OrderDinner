package cc.controller;

import cc.entity.model.Menu;
import cc.service.MenuService;
import cc.utils.ResultEntity;
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
    public ResultEntity menuList(HttpServletRequest request){
        String flag = request.getParameter("flag");
        String pageSize = request.getParameter("pageSize");
        String pageNum = request.getParameter("pageNum");
        List<Menu> menuList = menuService.menuList(Integer.parseInt(pageSize),Integer.parseInt(pageNum),Integer.parseInt(flag));
        return ResultEntity.success(menuList);
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
}
