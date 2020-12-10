package com.proj.command.cookingcls;

import java.util.Map;

import org.springframework.ui.Model;

import com.command.ajax.cookingcls.RecipeDAO;
import com.proj.beans.cookingcls.RecipeDTO;

import common.Command;
import common.D;

public class AdminRecipeUp implements Command{

	@Override
	public void execute(Model model) {
		// TODO Auto-generated method stub
		Map<String, Object> map= model.asMap();
		RecipeDTO dto = (RecipeDTO)map.get("dto");
		RecipeDAO dao = D.sqlSession.getMapper(RecipeDAO.class);

		
		model.addAttribute("rid",dto.getRid());
		model.addAttribute("result",dao.update(dto.getRid(), dto));
	}
}
