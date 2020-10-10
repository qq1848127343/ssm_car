package com.jzw.controller;

import com.jzw.service.UserService;
import com.jzw.vo.PageVo;
import com.jzw.vo.UserInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class UserController {

    @Autowired
    UserService userService;


    @RequestMapping(value = "/login.action",produces = "text/json;charset=utf-8")
    @ResponseBody
    public String login(UserInfo userInfo,
                        HttpSession session){
        UserInfo userInfo1 = userService.login(userInfo);

        if(userInfo1!=null){

            //将对象 存入session
            session.setAttribute("user",userInfo1);

            return "登录成功";
        }
        return "登录失败";
    }
}
