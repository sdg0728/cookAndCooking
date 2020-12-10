package com.proj.cookingAndCook;
import java.util.List;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.proj.beans.cookingcls.AjaxRecipeList;
import com.proj.beans.cookingcls.AjaxRecipeResult;
import com.proj.beans.cookingcls.PreferenceDTO;
import com.proj.beans.cookingcls.RecipeCommentDTO;
import com.proj.beans.cookingcls.RecipeDTO;
import com.proj.beans.cookingcls.UserInfoDTO;
import com.proj.command.cookingcls.CommentInsertCommend;
import com.proj.command.cookingcls.CommentRecipeDelete;
import com.proj.command.cookingcls.RecipeKindCommand;
import com.proj.command.cookingcls.RecipePreferenceCommand;
import com.proj.command.cookingcls.RecipePreferenceDeleteCommand;
import com.proj.command.cookingcls.RecipeRidCommand;
import com.proj.command.cookingcls.RecipeSearchCommand;
import com.proj.command.cookingcls.RecipeSelectCommand;


@RestController
@RequestMapping("/recipe")
public class RecipeAjaxController {
   
   public AjaxRecipeResult buildResult(Model model) {
	   AjaxRecipeResult result = new AjaxRecipeResult();
      
      result.setStatus((String)model.getAttribute("status"));
      result.setMessage((String)model.getAttribute("message"));
      result.setCount((Integer)model.getAttribute("result"));
      
      return result;
   }
   
   
   @SuppressWarnings("unchecked")
   public AjaxRecipeList buildList(Model model) {
	   AjaxRecipeList result = new AjaxRecipeList();
      
      result.setStatus((String)model.getAttribute("status"));
      result.setMessage((String)model.getAttribute("message"));
      
      if(((List<PreferenceDTO>)model.getAttribute("pref")) != null) {
    	  System.out.println("[pref] " + ((List<PreferenceDTO>)model.getAttribute("pref")).toString());
    	  result.setPref((List<PreferenceDTO>)model.getAttribute("pref"));
      }
      
      List<RecipeDTO> list = (List<RecipeDTO>)model.getAttribute("list");
      result.setList(list);
      
      //System.out.println(list.get(2).getName());
      
      return result;
   }
   
   
   @GetMapping("/view.ajax")
   public AjaxRecipeList viewAjax(int rid, String user_id, Model model) {
      model.addAttribute("rid", rid);
      model.addAttribute("user_id", user_id);
      new RecipeRidCommand().execute(model);
      
      return buildList(model);
   }
   
   @GetMapping("/kind.ajax")
   public AjaxRecipeList kindAjax(int kind, Model model) {
      model.addAttribute("kind",kind);	
      System.out.println("[kind]");
      new RecipeKindCommand().execute(model);
      
      return buildList(model);
   }
   
   @GetMapping("/search.ajax")
   public AjaxRecipeList searchAjax(String search, Model model) {
	   System.out.println("이름이 뭔지 아니 ?"+search);
      model.addAttribute("search","%"+search+"%");	
      new RecipeSearchCommand().execute(model);
      
      return buildList(model);
   }
   
   
   //// 수정
   @GetMapping("/comment.ajax")
   public AjaxRecipeList commentAjax(Model model, RecipeCommentDTO dto) {
   
	   model.addAttribute("dto", dto);
	   new CommentInsertCommend().execute(model);
	   
      return buildList(model);
   } 
   
   
   //// 수정
   @GetMapping("/comload.ajax")
   public AjaxRecipeList comloadAjax(int rid,Model model) {
	  model.addAttribute("rid", rid);
	  new RecipeSelectCommand().execute(model);
	  
	   
      return buildList(model);
   } 
   
   @GetMapping("/del.ajax")
   public AjaxRecipeList delAjax(int cid,Model model) {
	  model.addAttribute("cid", cid);
	  new CommentRecipeDelete().execute(model);
	  
	   
      return buildList(model);
   } 
   
   @PutMapping("/preference")
	public AjaxRecipeList preference(Model model, String user_id, int rid, double preference) {
		model.addAttribute("user_id", user_id);
		model.addAttribute("rid", rid);
		model.addAttribute("preference", preference);
		System.out.println("PUT[ "+user_id + " " + rid + " " + preference+" ]");
		
		new RecipePreferenceCommand().execute(model);
		
		return buildList(model);
	}
	
	@DeleteMapping("/preference")
	public AjaxRecipeList preferenceDel(Model model, String user_id, int rid) {
		System.out.println("DELETE[ "+user_id + " " + rid+" ]");
		model.addAttribute("user_id", user_id);
		model.addAttribute("rid", rid);
		
		new RecipePreferenceDeleteCommand().execute(model);
		
		return buildList(model);
	}
}