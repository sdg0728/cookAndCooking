package com.command.ajax.admin;

import java.util.ArrayList;
import java.util.List;

import org.springframework.ui.Model;

import com.proj.beans.member.MemberDAO;
import com.proj.beans.member.MemberDTO;

import common.Command;
import common.D;

public class MemberAllListCommand implements Command {

	@Override
	public void execute(Model model) {
		
		MemberDAO dao = D.sqlSession.getMapper(MemberDAO.class);
		List<MemberDTO> list = new ArrayList<MemberDTO>();
		StringBuffer message = new StringBuffer();
		String status = "FAIL";
		
		try {
			
			list = dao.select();
			
			status = "OK";
			
		}catch (Exception e) {
			status = "FAIL";
		}
		
		model.addAttribute("list", list);
		model.addAttribute("status", status);
		model.addAttribute("message", message.toString());

	}

}
