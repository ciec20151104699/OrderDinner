package cc.service.impl;

import cc.entity.dao.MenuMapper;
import cc.entity.dao.MenuTypeMapper;
import cc.entity.model.Menu;
import cc.entity.model.MenuExample;
import cc.entity.model.MenuType;
import cc.entity.model.MenuTypeExample;
import cc.service.MenuService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MenuServiceImpl implements MenuService {
    @Autowired
    MenuMapper menuMapper;
    @Autowired
    MenuTypeMapper menuTypeMapper;

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
        return menuMapper.updateByExample(menu, menuExample);
    }

    @Override
    public Menu selectMenuById(int id) {
        return menuMapper.selectByPrimaryKey(id);
    }

    @Override
    public PageInfo<Menu> menuList(int pageSize, int pageNum, String flag,String name) {
        PageHelper.startPage(pageNum, pageSize);
        MenuExample menuExample = new MenuExample();
        MenuExample.Criteria criteria = menuExample.createCriteria();
        if (flag != null) {
            criteria.andFlagEqualTo(Integer.parseInt(flag));
        }
        if (name!=null){
            criteria.andFoodNameLike("%"+name+"%");
        }
        List<Menu> menuList = menuMapper.selectByExample(menuExample);
        return new PageInfo<Menu>(menuList);
    }

    @Override
    public int addMenuType(MenuType menu) {

        return menuTypeMapper.insert(menu);
    }

    @Override
    public PageInfo<MenuType> pageInfoMentType(Integer pageSize, Integer pageNum, String typeName) {
        PageHelper.startPage(pageNum, pageSize);
        MenuTypeExample menuTypeExample = new MenuTypeExample();
        menuTypeExample.createCriteria().andNameLike(typeName);
        List<MenuType> menuType = menuTypeMapper.selectByExample(menuTypeExample);
        return new PageInfo<>(menuType);
    }

    @Override
    public List<MenuType> menuTypeList() {
        return menuTypeMapper.selectByExample(new MenuTypeExample());
    }
}
