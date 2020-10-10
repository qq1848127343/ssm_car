package com.jzw.service;

import com.jzw.vo.MenuInfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface MenuService {


    /**
     * 查询所有的菜单信息
     * @return
     */
    public List<MenuInfo> queryallmenus(int nodetype);



}
