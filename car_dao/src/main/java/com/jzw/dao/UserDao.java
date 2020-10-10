package com.jzw.dao;

import com.jzw.vo.UserInfo;

public interface UserDao {

    //根据用户名和密码  登录验证
    public UserInfo queryuserbynameandpwd(UserInfo userInfo);

}
