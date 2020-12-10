package com.proj.command.purchase;

import org.springframework.ui.Model;

import com.proj.beans.purchase.RecipeProductDAO;
import com.proj.beans.purchase.ReviewDTO;

import common.Command;
import common.D;

public class ProductReviewOkCommand implements Command {

	@Override
	public void execute(Model model) {
		RecipeProductDAO dao = D.sqlSession.getMapper(RecipeProductDAO.class);
		ReviewDTO dto = (ReviewDTO)model.getAttribute("dto");
		
		String r_comment = dto.getR_comment();
		String r_img = dto.getR_img();
		double r_score = dto.getR_score();
		String email = (String)model.getAttribute("email");
		int pid = dto.getPid();
		model.addAttribute("pid", pid);
		int result = dao.reviewOk(r_comment, r_img, r_score, email, pid);
		model.addAttribute("result", result);
	}

}
