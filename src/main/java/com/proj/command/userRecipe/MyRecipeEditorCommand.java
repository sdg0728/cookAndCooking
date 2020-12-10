package com.proj.command.userRecipe;



import java.util.ArrayList;
import java.util.List;

import org.springframework.ui.Model;

import com.command.ajax.userRecipe.UserRecipeDAO;
import com.proj.beans.userRecipe.RecipeWriteDTO;

import common.Command;
import common.D;

public class MyRecipeEditorCommand implements Command{
	
	
	@Override
	public void execute(Model model) {
	
//		List<St;ring> list = new ArrayList<String>();
		 
	int user_rid = (Integer)model.getAttribute("user_rid");
	UserRecipeDAO dao = D.sqlSession.getMapper(UserRecipeDAO.class);
	List<RecipeWriteDTO> list = dao.selectByUid(user_rid);
	
	List<String> rec_list = new ArrayList<String>();
	
	for (RecipeWriteDTO dd : list) {
		
		if(dd.getRecipe_1()!=null&&dd.getRecipe_1()!="") {rec_list.add(dd.getRecipe_1());}
		if(dd.getRecipe_2()!=null&&dd.getRecipe_2()!="") {rec_list.add(dd.getRecipe_2());}
		if(dd.getRecipe_3()!=null&&dd.getRecipe_3()!="") {rec_list.add(dd.getRecipe_3());}
		if(dd.getRecipe_4()!=null&&dd.getRecipe_4()!="") {rec_list.add(dd.getRecipe_4());}
		if(dd.getRecipe_5()!=null&&dd.getRecipe_5()!="") {rec_list.add(dd.getRecipe_5());}
		if(dd.getRecipe_6()!=null&&dd.getRecipe_6()!="") {rec_list.add(dd.getRecipe_6());}
		if(dd.getRecipe_7()!=null&&dd.getRecipe_7()!="") {rec_list.add(dd.getRecipe_7());}
		if(dd.getRecipe_8()!=null&&dd.getRecipe_8()!="") {rec_list.add(dd.getRecipe_8());}
		if(dd.getRecipe_9()!=null&&dd.getRecipe_9()!="") {rec_list.add(dd.getRecipe_9());}
		if(dd.getRecipe_10()!=null&&dd.getRecipe_10()!=""){rec_list.add(dd.getRecipe_10());}
		
	}
	
	model.addAttribute("result", list);
	model.addAttribute("rec_list", rec_list);
	
	
	}
}
