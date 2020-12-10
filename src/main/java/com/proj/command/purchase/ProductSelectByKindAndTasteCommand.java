package com.proj.command.purchase;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;

import com.proj.beans.purchase.RecipeProductDAO;
import com.proj.beans.purchase.RecipeProductDTO;

import common.Command;
import common.D;

public class ProductSelectByKindAndTasteCommand implements Command {

	@Override
	public void execute(Model model) {
		
		Map<String, Object> map = model.asMap();
		HashMap<String, Object> map2 = new HashMap<String, Object>();
		String p_kind = (String) map.get("kind");
		int p_taste = (Integer)map.get("taste");
		
		map2.put("p_kind", p_kind);
		map2.put("p_taste", p_taste);
		
		RecipeProductDAO dao = D.sqlSession.getMapper(RecipeProductDAO.class);
		model.addAttribute("list2", dao.selectByKindAndTaste(map2));

	}
	
	public List<RecipeProductDTO> getList(Model model) {
		Map<String, Object> map = model.asMap();
		HashMap<String, Object> map2 = new HashMap<String, Object>();
		String p_kind = (String) map.get("kind");
		int p_taste = (Integer)map.get("taste");
		
		map2.put("p_kind", p_kind);
		map2.put("p_taste", p_taste);
		
		RecipeProductDAO dao = D.sqlSession.getMapper(RecipeProductDAO.class);
		List<RecipeProductDTO> list = dao.selectByKindAndTaste(map2);
		
		return list;
	}

}
