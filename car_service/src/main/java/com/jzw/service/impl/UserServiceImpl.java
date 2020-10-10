package com.jzw.service.impl;

import com.github.pagehelper.PageHelper;
import com.jzw.dao.UserDao;
import com.jzw.service.UserService;
import com.jzw.vo.PageVo;
import com.jzw.vo.UserInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    UserDao userDao;

    /**
     * 登录方法  根据用户名和密码查询用户是否存在
     * @param userInfo
     * @return  如果用户存在 返回该用户信息  如果不存在返回null
     */
    @Override
    public UserInfo login(UserInfo userInfo) {
        return userDao.queryuserbynameandpwd(userInfo);
    }
}
