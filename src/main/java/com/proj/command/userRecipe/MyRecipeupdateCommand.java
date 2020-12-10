package com.proj.command.userRecipe;



import java.util.Map;

import org.springframework.ui.Model;

import com.command.ajax.userRecipe.UserRecipeDAO;
import com.proj.beans.userRecipe.RecipeWriteDTO;

import common.Command;
import common.D;

public class MyRecipeupdateCommand implements Command{
	
	
	@Override
	public void execute(Model model) {
	Map<String, Object> map= model.asMap();
	RecipeWriteDTO dto = (RecipeWriteDTO)map.get("dto");
	UserRecipeDAO dao = D.sqlSession.getMapper(UserRecipeDAO.class);
	System.out.println(dto);
	System.out.println(dto.getImg()+"fefe");
	model.addAttribute("result",dao.update(dto.getUser_rid(), dto));
	model.addAttribute("email", dto.getEmail());
	}
}
