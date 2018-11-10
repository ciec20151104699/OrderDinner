package cc.service.impl;

import cc.entity.dao.UserMenuMapper;
import cc.entity.model.UserMenu;
import cc.entity.model.UserMenuExample;
import cc.service.OrderService;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderServiceImpl implements OrderService{

    @Autowired
    UserMenuMapper userMenuMapper;
    @Override
    public List<UserMenu> findShop(Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum,pageSize);
        return null;
    }

    @Override
    public List<UserMenu> findOrder(Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum,pageSize);
        return null;
    }

    @Override
    public int insertFoodKind(UserMenu userMenu) {
        return userMenuMapper.insertSelective(userMenu);
    }

    @Override
    public int deleteFoodKinde(Integer id) {
        return userMenuMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int finshOrder(Long time) {
        UserMenuExample userMenuExample = new UserMenuExample();
        userMenuExample.createCriteria().andDataDayEqualTo(time);
        UserMenu userMenu = new UserMenu();
        userMenu.setFlag(2);
        return userMenuMapper.updateByExampleSelective(userMenu,userMenuExample);
    }
}
