package cc.service;

import cc.entity.model.Menu;
import cc.entity.model.MenuType;
import com.github.pagehelper.PageInfo;

import java.util.List;

public interface MenuService {
    int addMenu(Menu menu);

    int deleteMenu(int id);

    int updateMenu(int id,Menu menu);

    Menu selectMenuById(int id);

    PageInfo<Menu> menuList(int pageSize,int pageNum,String flag,String name);

    int addMenuType(MenuType menu);

    PageInfo<MenuType> pageInfoMentType(Integer pageSize,Integer pageNum,String typeName);

    List<MenuType> menuTypeList();

}
