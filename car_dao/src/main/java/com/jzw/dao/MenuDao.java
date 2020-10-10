package com.jzw.dao;

import com.jzw.vo.MenuInfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface MenuDao {



    /**
     * 根据父id,菜单类型 查询子菜单信息
     *
     * @param pid   父id
     * @param nodeType 菜单类型
     * @return
     */
    public List<MenuInfo> querymenuBypidandnodeType(@Param("pid") int pid, @Param("nodeType") int nodeType);




}
