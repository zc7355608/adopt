package com.it.adopt.service;

import com.it.adopt.bean.AdoptApply;

import java.util.List;

/**
 * ClassName: AdoptApplyService
 * Package: com.it.adopt.service
 * Description:
 *
 * @Author: ZC
 * @Create: 2024/4/22 21:28
 * @Version: 1.0.0
 */
public interface AdoptApplyService {
    int apply(AdoptApply apply);
    int count();
    List<AdoptApply> findAll();

    int updateById(AdoptApply adoptApply);

    AdoptApply findById(Integer id);

    List<AdoptApply> findByState(Integer state);

    List<AdoptApply> findByAdopterName(String adoptName);

    List<AdoptApply> findByStateAndAdopterName(String adopterName, Integer state);
}
