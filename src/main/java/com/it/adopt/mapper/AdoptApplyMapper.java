package com.it.adopt.mapper;

import com.it.adopt.bean.AdoptApply;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AdoptApplyMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(AdoptApply row);

    AdoptApply selectByPrimaryKey(Integer id);

    List<AdoptApply> selectAll();
    int count();

    int updateByPrimaryKey(AdoptApply row);

    List<AdoptApply> selectByAdopterName(String adoptName);

    List<AdoptApply> selectByState(Integer state);

    List<AdoptApply> selectByStateAndAdopterName(@Param("adopterName") String adopterName, @Param("state") Integer state);
}