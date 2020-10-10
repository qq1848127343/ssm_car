package com.jzw.controller;

import com.jzw.service.RoleService;
import com.jzw.vo.RoleInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Arrays;
import java.util.List;

@Controller
public class RoleController {

    @Autowired
    RoleService roleService;

    @RequestMapping("/queryallroles.action")
    @ResponseBody
    public List<RoleInfo> queryallroles(){
        return roleService.queryallroles();
    }



}
