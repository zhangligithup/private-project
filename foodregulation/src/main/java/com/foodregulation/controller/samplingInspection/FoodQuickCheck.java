package com.foodregulation.controller.samplingInspection;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("foodQuickCheck")
public class FoodQuickCheck {

	@RequestMapping("/foodQuickCheckTask")
	public String foodQuickCheckIndex() {
		return "samplingInspection/foodQuickCheckTask";
	}
}
