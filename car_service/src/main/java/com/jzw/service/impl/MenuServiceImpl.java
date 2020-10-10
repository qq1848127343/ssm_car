package com.jzw.service.impl;

import com.jzw.dao.MenuDao;
import com.jzw.service.MenuService;
import com.jzw.vo.MenuInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MenuServiceImpl implements MenuService {

    @Autowired
    MenuDao menuDao;



    /**
     * 根据菜单节点类型 拼装菜单数据
     * 首先菜单显示用到，授权页面显示也用到
     * 此处考虑用递归进行封装
     * @param nodetype
     * @return
     */
    @Override
    public List<MenuInfo> queryallmenus(int nodetype) {
        //查询所有的父菜单  父节点为0  菜单类型为1
        List<MenuInfo> menus =menuDao.querymenuBypidandnodeType(0,1);

        //将所有的父菜单的子菜单查询出来，绑定好
        for (MenuInfo menu:menus) {
            List<MenuInfo> childsmenu = menuDao.querymenuBypidandnodeType(menu.getId().intValue(),2);
            menu.setChildMenu(childsmenu);

            if(nodetype ==3){
                for (MenuInfo menu2:childsmenu) {
                    List<MenuInfo> childsmenu2 = menuDao.querymenuBypidandnodeType(menu2.getId().intValue(),3);
                    menu2.setChildMenu(childsmenu2);
                }
            }
        }

        return menus;
    }
}
