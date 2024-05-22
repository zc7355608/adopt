package com.it.adopt.service.impl;

import com.it.adopt.bean.Apply;
import com.it.adopt.mapper.ApplyMapper;
import com.it.adopt.service.ApplyService;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Service;

import java.sql.Date;
import java.util.List;

/**
 * ClassName: ApplyServiceImpl
 * Package: com.it.adopt.service.impl
 * Description:
 *
 * @Author: ZC
 * @Create: 2024/4/24 18:59
 * @Version: 1.0.0
 */
@Service
public class ApplyServiceImpl implements ApplyService {
    @Resource
    private ApplyMapper mapper;

    @Override
    public int insertApply(Apply apply) {
        apply.setApplyTime(new Date(System.currentTimeMillis()));
        return mapper.insert(apply);
    }

    @Override
    public Apply selectById(Integer id) {
        return mapper.selectByPrimaryKey(id);
    }

    @Override
    public int updateById(Apply apply) {
        return mapper.updateByPrimaryKey(apply);
    }

    public List<Apply> selectAll(){
        return mapper.selectAll(null,null,null,null);
    }

    @Override
    public List<Apply> selectByState(Byte state) {
        return mapper.selectAll(null,null,null, state);
    }

    @Override
    public List<Apply> selectByNameAndState(String name, Byte state) {
        return mapper.selectAll(name,null,null, state);
    }

    @Override
    public List<Apply> selectByNameAndDateAndState(String name, String start, String end, Byte state) {
        return mapper.selectAll(name, start, end, state);
    }

    @Override
    public List<Apply> selectByDateAndState(String start, String end, Byte state) {
        return mapper.selectAll(null, start, end, state);
    }
}
