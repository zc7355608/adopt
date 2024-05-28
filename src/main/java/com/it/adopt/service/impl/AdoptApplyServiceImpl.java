package com.it.adopt.service.impl;

import com.it.adopt.bean.AdoptApply;
import com.it.adopt.mapper.AdoptApplyMapper;
import com.it.adopt.service.AdoptApplyService;
import com.it.adopt.service.ApplyService;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.time.Instant;
import java.util.List;

/**
 * ClassName: AdoptApplyServiceImpl
 * Package: com.it.adopt.service.impl
 * Description:
 *
 * @Author: ZC
 * @Create: 2024/4/22 21:30
 * @Version: 1.0.0
 */
@Service
public class AdoptApplyServiceImpl implements AdoptApplyService {
    @Resource
    private AdoptApplyMapper mapper;

    @Override
    public int apply(AdoptApply apply) {
        apply.setId(null);
        apply.setApplyTime(new Timestamp(System.currentTimeMillis()));
        apply.setState((byte)0);
        if(apply.getAdopterSex().length() != 1){
            apply.setAdopterSex("无");
        }
        int rows = mapper.insert(apply);
        return rows;
    }

    @Override
    public int count() {
        return mapper.count();
    }

    @Override
    public List<AdoptApply> findAll() {
        return mapper.selectAll();
    }

    @Override
    public int updateById(AdoptApply adoptApply) {
        return mapper.updateByPrimaryKey(adoptApply);
    }

    @Override
    public AdoptApply findById(Integer id) {
        return mapper.selectByPrimaryKey(id);
    }

    @Override
    public List<AdoptApply> findByState(Integer state) {
        return mapper.selectByState(state);
    }

    @Override
    public List<AdoptApply> findByAdopterName(String adoptName) {
        return mapper.selectByAdopterName(adoptName);
    }

    @Override
    public List<AdoptApply> findByStateAndAdopterName(String adopterName, Integer state) {
        return mapper.selectByStateAndAdopterName(adopterName, state);
    }
}
