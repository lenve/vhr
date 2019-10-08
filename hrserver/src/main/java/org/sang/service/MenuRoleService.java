package org.sang.service;

import org.apache.ibatis.annotations.Param;
import org.sang.mapper.MenuRoleMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by sang on 2018/1/2.
 */
@Service
@Transactional
public class MenuRoleService {
    @Autowired
    MenuRoleMapper menuRoleMapper;

    public int updateMenuRole(Long rid, Long[] mids) {
    	//删除
        menuRoleMapper.deleteMenuByRid(rid); //总结，每次都先全部删除，然后再新增所有数据
        if (mids.length == 0) {
            return 0;
        }
        //新增
        return menuRoleMapper.addMenu(rid, mids);
    }
}
