package com.proj.command.purchase;

import java.util.ArrayList;
import java.util.List;

import org.springframework.ui.Model;

import com.proj.beans.purchase.RecipeProductDAO;
import com.proj.beans.purchase.RecipeProductDTO;

import common.Command;
import common.D;

public class RecipeProdCommand implements Command{

	@Override
	public void execute(Model model) {
		
		StringBuffer message = new StringBuffer();
		String status = "FAIL";
		
		RecipeProductDAO dao = D.sqlSession.getMapper(RecipeProductDAO.class);
		List<Integer> noList = (List<Integer>)model.getAttribute("noList");
		List<RecipeProductDTO> list = new ArrayList<RecipeProductDTO>();
		
		try {
			for (int i = 0; i < noList.size(); i++) {
				List<RecipeProductDTO> temp = new ArrayList<RecipeProductDTO>();
				temp.add(dao.selectByPid(noList.get(i)));
				list.addAll(temp);
			}
			
			for (RecipeProductDTO dto : list) {
				dto.setR_score((double)((int)(dto.getR_score() * 10)) / 10); 
			}
			status = "OK";
		}catch (Exception e) {
			status = "FAIL";
		}
		
		model.addAttribute("list", list);
		model.addAttribute("status", status);
		model.addAttribute("message", message.toString());
	}
	
}
