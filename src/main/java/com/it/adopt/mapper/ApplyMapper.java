package com.it.adopt.mapper;

import com.it.adopt.bean.Apply;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ApplyMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Apply row);

    Apply selectByPrimaryKey(Integer id);

    List<Apply> selectAll();

    int updateByPrimaryKey(Apply row);

    List<Apply> selectByState(Byte state);

    List<Apply> selectByNameAndState(@Param("name") String name, @Param("state") Byte state);
}