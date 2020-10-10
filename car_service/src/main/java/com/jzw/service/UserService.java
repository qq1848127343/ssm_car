package com.jzw.service;

import com.jzw.vo.PageVo;
import com.jzw.vo.UserInfo;

import java.util.List;

public interface UserService {


    //登陆方法
    public UserInfo login(UserInfo userInfo);
}
