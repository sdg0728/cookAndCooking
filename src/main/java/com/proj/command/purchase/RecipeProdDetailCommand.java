package com.proj.command.purchase;

import java.util.List;

import org.springframework.ui.Model;

import com.proj.beans.purchase.ProductReviewDTO;
import com.proj.beans.purchase.RecipeProductDAO;
import com.proj.beans.purchase.RecipeProductDTO;

import common.Command;
import common.D;

public class RecipeProdDetailCommand implements Command{

	@Override
	public void execute(Model model) {
		int pid = (Integer)model.getAttribute("pid");
		
		RecipeProductDAO dao = D.sqlSession.getMapper(RecipeProductDAO.class);
		RecipeProductDTO dto = dao.selectByPid(pid);
		List<ProductReviewDTO> list = dao.reviewByPid(pid);
		
		model.addAttribute("dto", dto);
		model.addAttribute("list", list);
	}

}
