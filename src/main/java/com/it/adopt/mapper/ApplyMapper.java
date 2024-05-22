package com.it.adopt.mapper;

import com.it.adopt.bean.Apply;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ApplyMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Apply row);

    Apply selectByPrimaryKey(Integer id);

    int updateByPrimaryKey(Apply row);

    List<Apply> selectAll(@Param("name") String name, @Param("start") String start, @Param("end") String end, @Param("state") Byte state);
}