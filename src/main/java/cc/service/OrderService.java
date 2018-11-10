package cc.service;

import cc.entity.model.UserMenu;
import com.github.pagehelper.PageHelper;

import java.util.List;

public interface OrderService {
    //    查看购物车
    List<UserMenu> findShop(Integer pageNum, Integer pageSize);

    //    查看订单
    List<UserMenu> findOrder(Integer pageNum, Integer pageSize);

    //    添加菜品
    int insertFoodKind(UserMenu userMenu);

    //    删除菜品
    int deleteFoodKinde(Integer id);

    int finshOrder(Long time);
}
