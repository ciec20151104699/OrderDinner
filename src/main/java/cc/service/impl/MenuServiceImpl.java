package cc.service.impl;

import cc.entity.dao.MenuMapper;
import cc.entity.model.Menu;
import cc.entity.model.MenuExample;
import cc.service.MenuService;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class MenuServiceImpl implements MenuService {
    @Autowired
    MenuMapper menuMapper;
    @Override
    public int addMenu(Menu menu) {
        return menuMapper.insert(menu);
    }

    @Override
    public int deleteMenu(int id) {
        return menuMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int updateMenu(int id, Menu menu) {
        MenuExample menuExample = new MenuExample();
        menuExample.createCriteria().andIdEqualTo(id);
        return menuMapper.updateByExample(menu,menuExample);
    }

    @Override
    public Menu selectMenuById(int id) {
        return menuMapper.selectByPrimaryKey(id);
    }

    @Override
    public List<Menu> menuList(int pageSize, int pageNum,int flag) {
        PageHelper.startPage(pageNum,pageSize);
        MenuExample menuExample = new MenuExample();
        menuExample.createCriteria().andFlagEqualTo(flag);
        List<Menu> menuList = menuMapper.selectByExample(menuExample);
        return menuList;
    }
}
