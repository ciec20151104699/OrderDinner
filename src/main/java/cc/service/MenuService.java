package cc.service;

import cc.entity.model.Menu;

import java.util.List;

public interface MenuService {
    int addMenu(Menu menu);

    int deleteMenu(int id);

    int updateMenu(int id,Menu menu);

    Menu selectMenuById(int id);

    List<Menu> menuList(int pageSize,int pageNum);

}
