package cc.entity.dao;

import cc.entity.model.MenuType;
import cc.entity.model.MenuTypeExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface MenuTypeMapper {
    int countByExample(MenuTypeExample example);

    int deleteByExample(MenuTypeExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(MenuType record);

    int insertSelective(MenuType record);

    List<MenuType> selectByExample(MenuTypeExample example);

    MenuType selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") MenuType record, @Param("example") MenuTypeExample example);

    int updateByExample(@Param("record") MenuType record, @Param("example") MenuTypeExample example);

    int updateByPrimaryKeySelective(MenuType record);

    int updateByPrimaryKey(MenuType record);
}