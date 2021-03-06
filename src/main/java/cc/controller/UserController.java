package cc.controller;

import cc.entity.model.User;
import cc.service.UserService;
import cc.utils.ResultEntity;
import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/user")
public class UserController {
    @Resource
    UserService userService;

    @RequestMapping(value = "/login/index", method = RequestMethod.GET)
    public String loginIndexView(HttpServletRequest request, Model model) {

        return "/login";
    }

    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public String register(HttpServletRequest request, Model model) {

        return "/register";
    }

    @ResponseBody
    @RequestMapping(value = "/login/index", method = RequestMethod.POST)
    public ResultEntity<User> loginIndex(HttpServletRequest request, Model model) {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        if (username == null || null == password) {
            return ResultEntity.errorEntity("用户名或密码为空");
        }
        User user = userService.loginUserByPasswordAndUserName(username, password);
        if (user == null) {
            return ResultEntity.errorEntity("用户名或密码错误");
        }
        request.getSession().setAttribute("user", user);
        return ResultEntity.success(user);
    }

    @ResponseBody
    @RequestMapping("/register/user")
    public ResultEntity<String> registerUser(HttpServletRequest request, Model model) {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String _sex = request.getParameter("sex");
        String name = request.getParameter("name");
        boolean flag = userService.checkUerName(username);
        if (flag) {
            ResultEntity.errorEntity("用户名重复");
        }
        Integer sex = Integer.parseInt(_sex);
        User user = new User();
        user.setName(name);
        user.setSex(sex);
        user.setUserName(username);
        user.setPassword(password);
        user.setFlag("1");
        userService.registerUser(user);
        return ResultEntity.success("");
    }


    @ResponseBody
    @RequestMapping("/user/list")
    public String userList(HttpServletRequest request, Model model) {
        String page = request.getParameter("page");
        String limit = request.getParameter("limit");

        String name = request.getParameter("name");
        PageInfo<User> userPageInfo = userService.userPageInfo(Integer.parseInt(page), Integer.parseInt(limit), name);
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("code", 0);
        jsonObject.put("msg", "");
        jsonObject.put("count", userPageInfo.getTotal());
        jsonObject.put("data", userPageInfo.getList());
        return jsonObject.toString();
    }

    @RequestMapping("/invalidate")
    public String invalidate(HttpServletRequest request, Model model) {

        HttpSession session = request.getSession();
      session.invalidate();
        return "fork";
    }
}
