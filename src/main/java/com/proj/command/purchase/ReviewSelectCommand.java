package com.proj.command.purchase;

import java.util.List;

import org.springframework.ui.Model;

import com.proj.beans.purchase.ProductReviewDTO;
import com.proj.beans.purchase.RecipeProductDAO;

import common.Command;
import common.D;

public class ReviewSelectCommand implements Command {

	@Override
	public void execute(Model model) {
		RecipeProductDAO dao = D.sqlSession.getMapper(RecipeProductDAO.class);
		List<ProductReviewDTO> list = dao.reviewByPidToCSV();
		model.addAttribute("list", list);

	}
	
	public List<ProductReviewDTO> giveList(Model model) {
		RecipeProductDAO dao = D.sqlSession.getMapper(RecipeProductDAO.class);
		List<ProductReviewDTO> list = dao.reviewByPidToCSV();
		model.addAttribute("list", list);
		
		return list;
	}

}
