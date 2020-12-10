package com.proj.command.purchase;

import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;

import com.proj.beans.purchase.RecipeProductDAO;
import com.proj.beans.purchase.RecipeProductDTO;

import common.Command;
import common.D;

public class ProductSelectByKindCommand implements Command {

	@Override
	public void execute(Model model) {
		
		Map<String, Object> map = model.asMap();
		String p_kind = (String) map.get("kind");
		
		RecipeProductDAO dao = D.sqlSession.getMapper(RecipeProductDAO.class);
		model.addAttribute("list2", dao.selectByKind(p_kind));

	}
	
	public List<RecipeProductDTO> getList(Model model) {
		Map<String, Object> map = model.asMap();
		String p_kind = (String) map.get("kind");
		
		RecipeProductDAO dao = D.sqlSession.getMapper(RecipeProductDAO.class);
		List<RecipeProductDTO> list = dao.selectByKind(p_kind);
		
		return list;
	}

}
