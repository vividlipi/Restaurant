package com.zzu.dao;

import com.zzu.bean.Dish;
import com.zzu.bean.DishExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface DishMapper {
    long countByExample(DishExample example);

    int deleteByExample(DishExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Dish record);

    int insertSelective(Dish record);

    List<Dish> selectByExample(DishExample example);

    Dish selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Dish record, @Param("example") DishExample example);

    int updateByExample(@Param("record") Dish record, @Param("example") DishExample example);

    int updateByPrimaryKeySelective(Dish record);

    int updateByPrimaryKey(Dish record);
}