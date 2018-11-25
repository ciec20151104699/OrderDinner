package cc.controller;

import cc.entity.model.User;
import cc.entity.model.UserMenu;
import cc.service.OrderService;
import cc.utils.DateUtils;
import cc.utils.ResultEntity;
import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/order")
public class OrderController {
    @Resource
    OrderService orderService;
    @ResponseBody
    @RequestMapping("/user/shop")
    public ResultEntity shopIndex(HttpServletRequest request){
        User user= (User)request.getSession().getAttribute("user");
        String pageNum = request.getParameter("pageNum");
        String pageSize = request.getParameter("pageSize");
        Map<String, List<UserMenu>> shop = orderService.findShop(Integer.parseInt(pageNum), Integer.parseInt(pageSize), user.getId());
        return ResultEntity.success(shop);
    }

    @ResponseBody
    @RequestMapping("/user/order" )
    public String orderIndex(HttpServletRequest request){
        User user= (User)request.getSession().getAttribute("user");
        String pageNum = request.getParameter("page");
        String pageSize = request.getParameter("limit");
         PageInfo<Map<String, Object>> order = orderService.findOrder(Integer.parseInt(pageNum), Integer.parseInt(pageSize), user.getId());
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("code", 0);
        jsonObject.put("msg", "");
        jsonObject.put("count", order.getTotal());
        jsonObject.put("data", order.getList());
        return jsonObject.toString();
    }
    @ResponseBody
    @RequestMapping("/user/order/all" )
    public String orderAllIndex(HttpServletRequest request){
        String pageNum = request.getParameter("page");
        String pageSize = request.getParameter("limit");
        PageInfo<Map<String, Object>> order = orderService.findOrder(Integer.parseInt(pageNum), Integer.parseInt(pageSize), null);
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("code", 0);
        jsonObject.put("msg", "");
        jsonObject.put("count", order.getTotal());
        jsonObject.put("data", order.getList());
        return jsonObject.toString();
    }
    @ResponseBody
    @RequestMapping("/user/finish" )
    public ResultEntity finishIndex(HttpServletRequest request){
        orderService.finshOrder(System.currentTimeMillis());
        return ResultEntity.success("订餐完成");
    }

    @ResponseBody
    @RequestMapping("/user/delete" )
    public ResultEntity orderDelete(HttpServletRequest request){
        String id = request.getParameter("id");
        orderService.deleteFoodKinde(Integer.parseInt(id));
        return ResultEntity.success("删除成功");
    }

    @ResponseBody
    @RequestMapping("/user/insert" )
    public ResultEntity orderInsert(HttpServletRequest request){
        try {
            String menuId = request.getParameter("menuId");
            User user = (User) request.getSession().getAttribute("user");
            UserMenu userMenu = new UserMenu();
            userMenu.setFlag(1);
            userMenu.setUpdateTime(System.currentTimeMillis());
            userMenu.setUserId(user.getId());
            userMenu.setMenuId(Integer.parseInt(menuId));
            userMenu.setDataDay(DateUtils.timneTempZero());
            orderService.insertFoodKind(userMenu);
            return ResultEntity.success("付款成功");
        }catch (Exception e){
            e.printStackTrace();
            return ResultEntity.errorEntity("付款成功");
        }
    }
}
