package cc.controller;

import cc.service.OrderService;
import cc.utils.ResultEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;

@Controller
@RequestMapping("/order")
public class OrderController {
    @Resource
    OrderService orderService;
    @RequestMapping("/index")
    public ResultEntity orderIndex(){
        
        return ResultEntity.success("");
    }
}
