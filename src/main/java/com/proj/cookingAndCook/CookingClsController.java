package com.proj.cookingAndCook;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.proj.beans.cookingcls.CookingDTO;
import com.proj.command.cookingcls.CookClassListCommand;
import com.proj.command.cookingcls.CookInsertCommand;
import com.proj.command.cookingcls.CookNewCommand;
import com.proj.command.cookingcls.MyClassCommand;

@Controller
@RequestMapping("/cooking")
public class CookingClsController {
	
	@RequestMapping("/usercls")
	public String usercls(Model model) {
		
//		new CookClassListCommand().execute(model);
		
		return "cookingCls/cookingcls";
	}
	
	@RequestMapping("/mycls")
	public String myCls(Model model) {
	
		return "cookingCls/clsmyPage";
	}
	

	@RequestMapping("/juso")
	public String addressPop() {
		
		return "cookingCls/jusoPopup";
	}
	
	@RequestMapping("/juso2")
	public String addressPop2() {
		
		return "cookingCls/Sample";
	}
	

	@RequestMapping("/createcls")
	public String createCls(Model model,String email) {
		model.addAttribute("email",email);
		new CookNewCommand().execute(model);
		
		return "cookingCls/clsDetail";
	}
	
	@RequestMapping("/createOk")
	
	public String cookNew(Model model , CookingDTO dto,Date end) {
		model.addAttribute("end",end);
		model.addAttribute("dto",dto);
		new CookInsertCommand().execute(model);
		
		return "cookingCls/createOk";
	}
	
	
}
