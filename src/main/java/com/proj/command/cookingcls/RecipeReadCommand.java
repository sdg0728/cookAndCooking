package com.proj.command.cookingcls;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;

import com.command.ajax.cookingcls.RecipeDAO;
import com.proj.beans.cookingcls.RecipeDTO;

import common.Command;
import common.D;

public class RecipeReadCommand implements Command{

	@Override
	public void execute(Model model) {
		// TODO Auto-generated method stub
//	
		Map<String, Object> map = model.asMap();
		int rid = (Integer)map.get("rid");
		
		RecipeDAO dao = D.sqlSession.getMapper(RecipeDAO.class);	
		RecipeDTO dto = dao.select(rid);
		
		//String [] kindName = {"한식" ,"중식","일식" ,"양식","퓨전","기타"};
		List<String> rec_list = new ArrayList<String>();
	
		if(dto.getRecipe_1()!=null&&dto.getRecipe_1()!="") {rec_list.add(dto.getRecipe_1());}
		if(dto.getRecipe_2()!=null&&dto.getRecipe_2()!="") {rec_list.add(dto.getRecipe_2());}
		if(dto.getRecipe_3()!=null&&dto.getRecipe_3()!="") {rec_list.add(dto.getRecipe_3());}
		if(dto.getRecipe_4()!=null&&dto.getRecipe_4()!="") {rec_list.add(dto.getRecipe_4());}
		if(dto.getRecipe_5()!=null&&dto.getRecipe_5()!="") {rec_list.add(dto.getRecipe_5());}
		if(dto.getRecipe_6()!=null&&dto.getRecipe_6()!="") {rec_list.add(dto.getRecipe_6());}
		if(dto.getRecipe_7()!=null&&dto.getRecipe_7()!="") {rec_list.add(dto.getRecipe_7());}
		if(dto.getRecipe_8()!=null&&dto.getRecipe_8()!="") {rec_list.add(dto.getRecipe_8());}
		if(dto.getRecipe_9()!=null&&dto.getRecipe_9()!="") {rec_list.add(dto.getRecipe_9());}
		if(dto.getRecipe_10()!=null&&dto.getRecipe_10()!=""){rec_list.add(dto.getRecipe_10());}
	
		//model.addAttribute("kind",kindName[dto.getKind()-1]);
		model.addAttribute("list", dto);
		model.addAttribute("rec_list", rec_list);
		
		
	}
	
}
