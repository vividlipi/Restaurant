package com.zzu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zzu.bean.Dish;
import com.zzu.bean.DishExample;
import com.zzu.dao.DishMapper;
@Service
public class DishService {
	@Autowired
	private DishMapper dishMapper;
	public List<Dish> getDishes(){
		return dishMapper.selectByExample(null);
	}
	public List<Dish> getDishByKind(Integer kind){
		DishExample example=new DishExample();
		example.createCriteria().andKindEqualTo(kind);
		
		return dishMapper.selectByExample(example);
	}
	public Dish getDishById(Integer id) {
		return dishMapper.selectByPrimaryKey(id);
	}
}
