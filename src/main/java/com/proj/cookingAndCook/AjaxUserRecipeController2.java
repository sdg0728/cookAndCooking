package com.proj.cookingAndCook;

import java.util.List;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.command.ajax.userRecipe.AjaxMyRecipeRidCommand;
import com.proj.beans.member.MemberDAO;
import com.proj.beans.userRecipe.AjaxNotifyList;
import com.proj.beans.userRecipe.AjaxWriteList;
import com.proj.beans.userRecipe.AjaxWriteResult;
import com.proj.beans.userRecipe.PreferenceDTO;
import com.proj.beans.userRecipe.RecipeWriteDTO;
import com.proj.beans.userRecipe.Ur_commentDTO;
import com.proj.command.userRecipe.CommentRecipeDelete;
import com.proj.command.userRecipe.MyRecipeRidCommand;
import com.proj.command.userRecipe.MyRecipekindCommand;
import com.proj.command.userRecipe.RecipeNotifyCancleCommand;
import com.proj.command.userRecipe.RecipeNotifyCommand;
import com.proj.command.userRecipe.RecipeNotifySelectCommand;
import com.proj.command.userRecipe.RecipePreferenceCommand;
import com.proj.command.userRecipe.RecipePreferenceDeleteCommand;
import com.proj.command.userRecipe.RecipeSearchCommand;
import com.proj.command.userRecipe.RecipeSelectCommand;
import com.proj.command.userRecipe.UserCommentRecipeCommand;

import common.D;

@RestController
@RequestMapping(value = {"/userRecipe","/adminRecipe"})
public class AjaxUserRecipeController2 {
	
	public AjaxWriteResult buildResult(Model model) {
		AjaxWriteResult result = new AjaxWriteResult();
		
		result.setStatus((String)model.getAttribute("status"));
		result.setMessage((String)model.getAttribute("message"));
		result.setCount((Integer)model.getAttribute("result"));
		
		return result;
	}
	
	
	@SuppressWarnings("unchecked")
	public AjaxWriteList buildList(Model model) {
		AjaxWriteList result = new AjaxWriteList();
		result.setStatus((String)model.getAttribute("status"));
		result.setMessage((String)model.getAttribute("message"));
		
		List<RecipeWriteDTO> list = (List<RecipeWriteDTO>)model.getAttribute("list");
		List<RecipeWriteDTO> list1 = (List<RecipeWriteDTO>)model.getAttribute("list1");
		List<PreferenceDTO> isChk = (List<PreferenceDTO>)model.getAttribute("result");
		List<String> list2 = (List<String>)model.getAttribute("list2");
		if(isChk != null) {
			result.setIsChk(isChk);
		} else {
			result.setIsChk(null);
		}
		result.setList(list);
		result.setList1(list1);
		result.setList2(list2);
		
		
		return result;
	}
	
	public AjaxNotifyList notifyCheck(Model model) {
		AjaxNotifyList result = new AjaxNotifyList();
		
		result.setStatus((String)model.getAttribute("status"));
		result.setMessage((String)model.getAttribute("message"));
		result.setCount((Integer)model.getAttribute("result"));
		int notifydata = 0;
		if((Integer)model.getAttribute("notifydata") == null) {
			notifydata = 0;
		} else {
			notifydata = (Integer) model.getAttribute("notifydata");
		}
		result.setNotifydata(notifydata);
		
		return result;
	}
	
	
	@GetMapping("/recipeView")
	public AjaxWriteList view(int user_rid, Model model, String email) {
		model.addAttribute("user_rid", user_rid);
		model.addAttribute("email", email);
		new AjaxMyRecipeRidCommand().execute(model);
		return buildList(model);
	}
	
	@GetMapping("/search.ajax")
	   public AjaxWriteList searchAjax(String search, Model model) {
	      System.out.println("이름이 뭔지 아니 ?"+search);
	      model.addAttribute("search","%"+search+"%");   
	      new RecipeSearchCommand().execute(model);
	      
	      return buildList(model);
	   }
	

	@GetMapping("/comment.ajax")
	   public AjaxWriteList usercoAjax(Ur_commentDTO dto, Model model) {
	      model.addAttribute("dto",dto);   
	      new UserCommentRecipeCommand().execute(model);
	      
	      return buildList(model);
	   }
	
	 @GetMapping("/comload.ajax")
	   public AjaxWriteList comloadAjax(int rid,Model model) {
	     model.addAttribute("rid", rid);
	     new RecipeSelectCommand().execute(model);
	     
	      
	      return buildList(model);
	   } 
	   
	   @GetMapping("/del.ajax")
	   public AjaxWriteList delAjax(int cid,Model model) {
	     model.addAttribute("cid", cid);
	     new CommentRecipeDelete().execute(model);
	     
	      
	      return buildList(model);
	   } 
	
	
	
	
	@GetMapping("/userkind")
	public AjaxWriteList kind(int kind, Model model) {
		model.addAttribute("kind", kind);
		new MyRecipekindCommand().execute(model);
		System.out.println("eee");
		return buildList(model);
	}
	
	@GetMapping("/notifyOk")
	public AjaxWriteResult notify(String email,int user_rid, int status, Model model) {
		model.addAttribute("email", email);
		MemberDAO dao = D.sqlSession.getMapper(MemberDAO.class);
		
		int user_id = dao.selectUserIdByEmail(email);
		model.addAttribute("user_id", user_id);
		model.addAttribute("user_rid", user_rid);
		
		if(status == 0) {
			new RecipeNotifyCommand().execute(model);
		}else {
			new RecipeNotifyCancleCommand().execute(model);
		}
		
		//new MyRecipekindCommand().execute(model);
		return notifyCheck(model);
	}
	
	

	@GetMapping("/notifyChk")
	public AjaxWriteResult notifyChk(String email,int user_rid, Model model) {
		model.addAttribute("email", email);
		MemberDAO dao = D.sqlSession.getMapper(MemberDAO.class);
		
		int user_id = dao.selectUserIdByEmail(email);
		model.addAttribute("user_id", user_id);
		model.addAttribute("user_rid", user_rid);
		
		new RecipeNotifySelectCommand().execute(model);
		
		return notifyCheck(model);
	}
	
	@PutMapping("/preference")
	public AjaxWriteResult preference(Model model, String email, String user_id, int user_rid, double preference) {
		model.addAttribute("email", email);
		model.addAttribute("user_rid", user_rid);
		model.addAttribute("user_id", user_id);
		model.addAttribute("preference", preference);
		System.out.println("PUT[ "+email + " " + user_rid + " " + user_id+" ]");
		
		new RecipePreferenceCommand().execute(model);
		
		return notifyCheck(model);
	}
	
	@DeleteMapping("/preferenceDel")
	public AjaxWriteResult preferenceDel(Model model, String email, String user_id, int user_rid, double preference) {
		System.out.println("DELETE[ "+email + " " + user_rid+" ]");
		model.addAttribute("email", email);
		model.addAttribute("user_rid", user_rid);
		model.addAttribute("user_id", user_id);
		model.addAttribute("preference", preference);
		
		new RecipePreferenceDeleteCommand().execute(model);
		
		return notifyCheck(model);
	}
}
