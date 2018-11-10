package cc.service.impl;

import cc.entity.dao.UserMenuMapper;
import cc.entity.model.UserMenu;
import cc.entity.model.UserMenuExample;
import cc.service.OrderService;
import cc.utils.DateUtils;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;
import java.util.stream.Collector;
import java.util.stream.Collectors;

@Service
public class OrderServiceImpl implements OrderService{

    @Autowired
    UserMenuMapper userMenuMapper;

    @Override
    public Map<String, List<UserMenu>> findShop(Integer pageNum, Integer pageSize,int userId) {
        UserMenuExample userMenuExample = new UserMenuExample();
        userMenuExample.createCriteria().andUserIdEqualTo(userId).andFlagEqualTo(2);
        List<UserMenu> menuList = userMenuMapper.selectByExample(userMenuExample);
        Map<Long, List<UserMenu>> collect = menuList.stream().collect(Collectors.groupingBy(UserMenu::getDataDay));
        Map<String, List<UserMenu>> data = new HashMap<>();
        for (Map.Entry<Long,List<UserMenu>> entry : collect.entrySet()){
            Long key = entry.getKey();
            List<UserMenu> values = entry.getValue();
            data.put(DateUtils.LongFormatDateString(key),values);
        }
        return data;
    }

    @Override
    public Map<String, List<UserMenu>> findOrder(Integer pageNum, Integer pageSize,int userId) {
        UserMenuExample userMenuExample = new UserMenuExample();
        userMenuExample.createCriteria().andUserIdEqualTo(userId).andFlagEqualTo(1);
        List<UserMenu> menuList = userMenuMapper.selectByExample(userMenuExample);
        Map<Long, List<UserMenu>> collect = menuList.stream().collect(Collectors.groupingBy(UserMenu::getDataDay));
        Map<String, List<UserMenu>> data = new HashMap<>();
        for (Map.Entry<Long,List<UserMenu>> entry : collect.entrySet()){
            Long key = entry.getKey();
            List<UserMenu> values = entry.getValue();
            data.put(DateUtils.LongFormatDateString(key),values);
        }
        return data;
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
