package com.proj.cookingAndCook;

import java.util.List;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.proj.beans.cookingcls.AjaxCookList;
import com.proj.beans.cookingcls.AjaxRecipeList;
import com.proj.beans.cookingcls.AjaxRecipeResult;
import com.proj.beans.cookingcls.CookRegDTO;
import com.proj.beans.cookingcls.CookingDTO;
import com.proj.beans.cookingcls.RecipeDTO;
import com.proj.beans.cookingcls.UserInfoDTO;
import com.proj.command.cookingcls.AdminCookOneCommand;
import com.proj.command.cookingcls.AdminCookSelCommand;
import com.proj.command.cookingcls.AdminDelCookCommand;
import com.proj.command.cookingcls.CookClassListCommand;
import com.proj.command.cookingcls.CookCreateCommand;
import com.proj.command.cookingcls.CookEmailCommand;
import com.proj.command.cookingcls.CookOneClassCommond;
import com.proj.command.cookingcls.CookRegisterCommand;
import com.proj.command.cookingcls.CookingCreatedCommand;
import com.proj.command.cookingcls.PeopleCookCommand;
import com.proj.command.cookingcls.RecipeRidCommand;
import com.proj.command.cookingcls.ScoreChkCommand;

@RestController
@RequestMapping("/cooking")
public class CookAjaxController {


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
	   
	   
	   @GetMapping("/mycls.ajax")
	   public AjaxCookList viewAjax(String email, Model model) {
		  // System.out.println("으에에에에에");
	      model.addAttribute("email", email);	
	      new CookEmailCommand().execute(model);
	      
	      return buildList(model);
	   }
	   
	   @GetMapping("/mycls2.ajax")
	   public AjaxCookList newAjax(String email, Model model) {
		  // System.out.println("으에에에에에");
	      model.addAttribute("email", email);	
	      new CookingCreatedCommand().execute(model);
	      
	      return buildList(model);
	   }
	   
	   @GetMapping("/clsAll.ajax")
	   public AjaxCookList allAjax(Model model) {
		   //System.out.println("으에에에에에");
	    //  model.addAttribute("email", email);	
	      new CookClassListCommand().execute(model);
	      
	      return buildList(model);
	   }
	   
	   @GetMapping("/clsOne.ajax")
	   public AjaxCookList oneAjax(int cno,Model model) {
		 // System.out.println("으에에에에에");
	      model.addAttribute("cno", cno);	
	      new CookOneClassCommond().execute(model);
	      
	      return buildList(model);
	   }
	   
	   @GetMapping("/clsOne2.ajax")
	   public AjaxCookList one2Ajax(int cno,Model model) {
		 // System.out.println("으에에에에에");
	      model.addAttribute("cno", cno);	
	      new AdminCookOneCommand().execute(model);
	      
	      return buildList(model);
	   }
	   
	   @GetMapping("/score.ajax")
	   public AjaxCookList scoreAjax(String email, Model model) {
		  // System.out.println("으에에에에에");
	      model.addAttribute("email", email);	
	      new ScoreChkCommand().execute(model);
	      
	      return buildList(model);
	   }
	   
	   @PostMapping("/create.ajax")
	   public AjaxCookList createAjax(CookingDTO dto, Model model) {
		  // System.out.println("으에에에에에");
	      model.addAttribute("dto", dto);	
	      new CookCreateCommand().execute(model);
	      
	      return buildList(model);
	   }
	   
	   @GetMapping("/register.ajax")
	   public AjaxCookList registerAjax(CookRegDTO dto, Model model) {
		  // System.out.println("으에에에에에");
	      model.addAttribute("dto", dto);	
	      new CookRegisterCommand().execute(model);
	      
	      return buildList(model);
	   }
	   
	   @GetMapping("/delcook.ajax")
	   public AjaxCookList delAjax(int cno, Model model) {
		   model.addAttribute("cno",cno);
		   new AdminDelCookCommand().execute(model);
	      
	      return buildList(model);
	   }
	   
	   @GetMapping("/people.ajax")
	   public AjaxCookList peopleAjax(int cno, Model model) {
		   model.addAttribute("cno",cno);
		   new PeopleCookCommand().execute(model);
	      
	      return buildList(model);
	   }
	   
}
