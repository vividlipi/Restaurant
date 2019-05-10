package com.zzu.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zzu.bean.Dish;
import com.zzu.bean.Msg;
import com.zzu.service.DishService;

@Controller
public class DishController {
	@Autowired
	private DishService service;

	/**
	 * 返回所有菜品的列表
	 * 
	 * @return
	 */
	@RequestMapping("/dishes")
	@ResponseBody
	public Msg getDishes() {
		List<Dish> dishes = service.getDishes();
		return Msg.success().add("dishes", dishes);
	}

	@ResponseBody
	@RequestMapping("/dishes/{kind}")
	public Msg getDishByKind(@PathVariable("kind") Integer kind) {
		List<Dish> dishes = service.getDishByKind(kind);
		return Msg.success().add("dishes", dishes);
	}

	/**
	 * 页面跳转请求
	 * 
	 * @return
	 */
	@RequestMapping("/car")
	public String DealCar() {
		return "myCar";
	}

	/**
	 * 订单处理
	 * 
	 * @param car
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/dealCar")
	public Msg dealCar(@RequestParam("car") String car) {

		List<Dish> dishs = new ArrayList<>();
		if (!"".equals(car)) {
			try {
				car = car.substring(0, car.length() - 1);
				String[] cars = car.split(",");

				for (String s : cars) {
					Dish dish = service.getDishById(Integer.parseInt(s));
					dishs.add(dish);
				}
			} catch (Exception e) {
				System.out.println("出现异常");
			}
		}
		return Msg.success().add("dishs", dishs);
	}

}
