package cc.service.impl;

import cc.entity.dao.UserMapper;
import cc.entity.model.User;
import cc.entity.model.UserExample;
import cc.service.UserService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class UserServiceImpl implements UserService {
    @Autowired
    UserMapper userMapper;
    @Override
    public User loginUserByPasswordAndUserName(String name, String password) {
        UserExample userExample = new UserExample();
        userExample.createCriteria().andUserNameEqualTo(name).andPasswordEqualTo(password);
        User user = null;
        List<User> userList = userMapper.selectByExample(userExample);
        if (userList!=null&& userList.size()!=0){
           user = userList.get(0);
        }
        return user ;
    }

    @Override
    public int registerUser(User user) {
        return userMapper.insert(user);
    }

    @Override
    public boolean checkUerName(String name) {
        UserExample userExample = new UserExample();
        userExample.createCriteria().andUserNameEqualTo(name);
        List<User> userList = userMapper.selectByExample(userExample);
        boolean flag = true;
        if (userList!=null &&userList.size()>0 ){
            flag = false;
        }
        return flag;
    }

    @Override
    public PageInfo<User> userPageInfo(Integer pageNum, Integer pageSize, String name) {
        PageHelper.startPage(pageNum,pageSize);
        UserExample userExample = new UserExample();
        UserExample.Criteria criteria = userExample.createCriteria();
        if (name!=null) {
            criteria.andNameLike("%"+name+"%");
        }
        return new PageInfo<User>(userMapper.selectByExample(userExample));
    }
}
