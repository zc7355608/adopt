package com.it.adopt.service;

import com.it.adopt.bean.Apply;

import java.util.List;

/**
 * ClassName: ApplyService
 * Package: com.it.adopt.service
 * Description:
 *
 * @Author: ZC
 * @Create: 2024/4/24 18:59
 * @Version: 1.0.0
 */
public interface ApplyService {
    int insertApply(Apply apply);

    Apply selectById(Integer id);

    int updateById(Apply apply);

    List<Apply> selectAll();

    List<Apply> selectByState(Byte state);

    List<Apply> selectByNameAndState(String name, Byte state);

    List<Apply> selectByNameAndDateAndState(String name, String start, String end, Byte state);
    List<Apply> selectByDateAndState(String start, String end, Byte state);
}
