package cc.entity.dao;

import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface EX_UserMenuMapper {

    List<Map<String,Object>> userOrder(@Param("id") Integer id);

}