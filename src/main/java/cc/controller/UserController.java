package cc.controller;

import cc.entity.model.User;
import cc.service.UserService;
import cc.utils.ResultEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/user")
public class UserController {
    @Resource
    UserService userService;

    @RequestMapping(value = "/login/index",method = RequestMethod.GET)
    public String  loginIndexView(HttpServletRequest request,Model model){
        System.out.println("123");
        return "/login";
    }
    @RequestMapping(value = "/register",method = RequestMethod.GET)
    public String  register(HttpServletRequest request,Model model){
        System.out.println("123");
        return "/register";
    }

    @RequestMapping(value = "/login/index",method = RequestMethod.POST)
    public ResultEntity<User> loginIndex(HttpServletRequest request, Model model){
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        if (username==null||null==password){
            ResultEntity.errorEntity("用户名或密码为空");
        }
        User user = userService.loginUserByPasswordAndUserName(username,password);
        if (user==null){
            ResultEntity.errorEntity("用户名或密码错误");
        }
        request.getSession().setAttribute("ussr",user);
        return ResultEntity.success(user);
    }

    @RequestMapping("/register/user")
    public ResultEntity<String> registerUser(HttpServletRequest request,Model model){
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String _sex = request.getParameter("sex");
        String name = request.getParameter("name");
        boolean flag = userService.checkUerName(username);
        if (flag){
            ResultEntity.errorEntity("用户名重复");
        }
        Integer sex = Integer.parseInt(_sex);
        User user = new User();
        user.setName(name);
        user.setSex(sex);
        user.setUserName(username);
        user.setPassword(password);
        userService.registerUser(user);
        return ResultEntity.success("");
    }

}
