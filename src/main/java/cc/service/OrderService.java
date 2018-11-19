package cc.service;

import cc.entity.model.UserMenu;

import java.util.List;
import java.util.Map;

public interface OrderService {
    //    查看购物车
    Map<String,List<UserMenu>> findShop(Integer pageNum, Integer pageSize, int userId);

    //    查看订单
    Map<String,List<UserMenu>> findOrder(Integer pageNum, Integer pageSize,int userId);

    //    添加菜品
    int insertFoodKind(UserMenu userMenu);

    //    删除菜品
    int deleteFoodKinde(Integer id);

    int finshOrder(Long time);
}
