package com.proj.cookingAndCook;

import java.util.List;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.proj.beans.cookingcls.AjaxCookList;
import com.proj.beans.cookingcls.AjaxRecipeResult;
import com.proj.beans.cookingcls.CookingDTO;
import com.proj.beans.cookingcls.UserInfoDTO;
import com.proj.command.cookingcls.AdminCookOneCommand;
import com.proj.command.cookingcls.AdminCookPerCommand;
import com.proj.command.cookingcls.AdminCookSelCommand;
import com.proj.command.cookingcls.AdminDelCookCommand;
import com.proj.command.cookingcls.CookEmailCommand;
import com.proj.command.cookingcls.CookUserCommand;

@RestController
@RequestMapping("/admin")
public class AdminCookAjax {

	   public AjaxRecipeResult buildResult(Model model) {
		   AjaxRecipeResult result = new AjaxRecipeResult();
	      
	      result.setStatus((String)model.getAttribute("status"));
	      result.setMessage((String)model.getAttribute("message"));
	      result.setCount((Integer)model.getAttribute("result"));
	      
	      return result;
	   }
	   
	   
	   @SuppressWarnings("unchecked")
	   public AjaxCookList buildList(Model model) {
		   AjaxCookList result = new AjaxCookList();
	      
	      result.setStatus((String)model.getAttribute("status"));
	      result.setMessage((String)model.getAttribute("message"));
	      
	      List<CookingDTO> list = (List<CookingDTO>)model.getAttribute("list");
	      result.setList(list);
	      
	      UserInfoDTO user = (UserInfoDTO)model.getAttribute("user");
	      result.setUser(user);
	      
	    //  System.out.println(list.get(0).toString());
	      
	      return result;
	   }
	   
	   
	   @GetMapping("/adClsAll.ajax")
	   public AjaxCookList viewAjax(Model model) {
		  // System.out.println("으에에에에에");
	      //model.addAttribute("email", email);	
	      new AdminCookSelCommand().execute(model);
	      
	      return buildList(model);
	   }
	   
	   
	   @GetMapping("/AdclsOne.ajax")
	   public AjaxCookList oneAjax(int cno, Model model) {
		   model.addAttribute("cno",cno);
	      new AdminCookOneCommand().execute(model);
	      
	      return buildList(model);
	   }
	   
	   @GetMapping("/permit.ajax")
	   public AjaxCookList permitAjax(CookingDTO dto, Model model) {
		   model.addAttribute("dto",dto);
		   new AdminCookPerCommand().execute(model);
	      
	      return buildList(model);
	   }
	   
	   @GetMapping("/move.ajax")
	   public AjaxCookList moveAjax(int cno, Model model) {
		   model.addAttribute("cno",cno);
		   new CookUserCommand().execute(model);
	      
	      return buildList(model);
	   }

	   
}
