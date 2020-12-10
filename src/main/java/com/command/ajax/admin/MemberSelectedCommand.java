package com.command.ajax.admin;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.ui.Model;

import com.proj.beans.member.MemberDAO;
import com.proj.beans.member.MemberDTO;

import common.Command;
import common.D;

public class MemberSelectedCommand implements Command {

	@Override
	public void execute(Model model) {
		
		MemberDAO dao = D.sqlSession.getMapper(MemberDAO.class);
		String email = (String)model.getAttribute("email");
		String name = (String)model.getAttribute("name");
		List<MemberDTO> list = new ArrayList<MemberDTO>();
		StringBuffer message = new StringBuffer();
		String status = "FAIL";
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("email", email);
		map.put("name", name);
		
		try {
			
			list = dao.searchMember(map);
			
			status = "OK";
			
		}catch (Exception e) {
			status = "FAIL";
		}
		
		model.addAttribute("list", list);
		model.addAttribute("status", status);
		model.addAttribute("message", message.toString());

	}

}
