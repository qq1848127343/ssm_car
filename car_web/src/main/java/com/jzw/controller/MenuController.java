package com.jzw.controller;


import com.jzw.service.MenuService;
import com.jzw.vo.MenuInfo;
import com.jzw.vo.UserInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class MenuController {

    @Autowired
    MenuService menuService;



    //查询出所有的菜单信息(菜单显示用，有层级关系)
    @RequestMapping("/queryallmenus.action")
    @ResponseBody
    public List<MenuInfo> queryallmenus(){

        return  menuService.queryallmenus(2);
    }

    //查询出所有的菜单信息(授权页面用，显示到按钮级别)
    @RequestMapping("/queryallmenus2.action")
    @ResponseBody
    public List<MenuInfo> queryallmenus2(){

        return  menuService.queryallmenus(3);
    }


}
