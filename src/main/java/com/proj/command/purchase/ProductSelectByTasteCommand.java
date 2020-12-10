package com.proj.command.purchase;

import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;

import com.proj.beans.purchase.RecipeProductDAO;
import com.proj.beans.purchase.RecipeProductDTO;

import common.Command;
import common.D;

public class ProductSelectByTasteCommand implements Command {

	@Override
	public void execute(Model model) {
		
		Map<String, Object> map = model.asMap();
		int p_taste = (int) map.get("taste");
		
		RecipeProductDAO dao = D.sqlSession.getMapper(RecipeProductDAO.class);
		model.addAttribute("list2", dao.selectByTaste(p_taste));

	}
	
	public List<RecipeProductDTO> getList(Model model) {
		Map<String, Object> map = model.asMap();
		int p_taste = (int) map.get("taste");
		
		RecipeProductDAO dao = D.sqlSession.getMapper(RecipeProductDAO.class);
		List<RecipeProductDTO> list = dao.selectByTaste(p_taste);
		
		return list;
	}

}
