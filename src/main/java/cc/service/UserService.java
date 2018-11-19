package cc.service;

import cc.entity.model.User;

public interface UserService {
//    登陆
    User loginUserByPasswordAndUserName(String name , String password);
//    注册
    int registerUser(User user);

//    检查用户名
    boolean checkUerName(String name);
}
