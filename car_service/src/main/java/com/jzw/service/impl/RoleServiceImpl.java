package com.jzw.service.impl;

import com.jzw.dao.RoleDao;
import com.jzw.service.RoleService;
import com.jzw.vo.RoleInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class  RoleServiceImpl  implements RoleService {

    @Autowired
    RoleDao roleDao;

    @Override
    public List<RoleInfo> queryallroles() {
        return roleDao.queryallroles();
    }
}
