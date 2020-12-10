package com.proj.command.userRecipe;

import java.util.List;

import org.springframework.ui.Model;

import com.command.ajax.userRecipe.UserRecipeDAO;
import com.proj.beans.member.MemberDAO;
import com.proj.beans.userRecipe.PreferenceDTO;
import com.proj.beans.userRecipe.RecipeWriteDTO;

import common.Command;
import common.D;

public class MyRecipeRidCommand implements Command{
	
	@Override
	public void execute(Model model) {
	UserRecipeDAO dao = D.sqlSession.getMapper(UserRecipeDAO.class);
	MemberDAO dao2 = D.sqlSession.getMapper(MemberDAO.class);
	List<RecipeWriteDTO> list = null;
	List<String> name = null;
	int user_id = 0;
	List<PreferenceDTO> result = null;
	
	int user_rid = (Integer)model.getAttribute("user_rid");
	String email = (String)model.getAttribute("email");
	
	StringBuffer message = new StringBuffer();
	String status = "FAIL";
	
	try {			
		list = dao.selectByUid(user_rid); // 읽기
		System.out.println(list);
		user_id = list.get(0).getUser_id();
		
		name = dao2.selectNameByUserId(user_id);
		result = dao.preferenceChk(user_rid, email);
		System.out.println(result);
		if(list.size() == 0) {
			message.append("[해당 데이터가 없습니다]");
		} else {
			status = "OK";
		}
	} catch (Exception e) {
		e.printStackTrace();
		message.append("[에러: " + e.getMessage() + "]");
	}
	
	model.addAttribute("list1", list);
	model.addAttribute("list2", name);
	model.addAttribute("result", result);
	model.addAttribute("status", status);
	model.addAttribute("message", message.toString());
	}
}
