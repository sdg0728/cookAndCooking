package com.proj.command.userRecipe;


import org.springframework.ui.Model;

import com.command.ajax.userRecipe.UserRecipeDAO;
import com.proj.beans.member.MemberDAO;

import common.Command;
import common.D;

public class MyRecipeCommand implements Command{
	
	@Override
	public void execute(Model model) {
	
	String email = (String)model.getAttribute("email");
	System.out.println(email);
	UserRecipeDAO dao = D.sqlSession.getMapper(UserRecipeDAO.class);
	MemberDAO dao2 = D.sqlSession.getMapper(MemberDAO.class);
	model.addAttribute("list",dao.selectByEmail(email));
	model.addAttribute("name", dao2.selectName(email));
	
	}
}
