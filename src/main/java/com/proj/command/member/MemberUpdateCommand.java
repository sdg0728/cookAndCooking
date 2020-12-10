package com.proj.command.member;

import java.util.Map;

import org.springframework.ui.Model;

import com.proj.beans.member.MemberDAO;
import com.proj.beans.member.MemberDTO;

import common.Command;
import common.D;

public class MemberUpdateCommand implements Command {

	@Override
	public void execute(Model model) {
		
		Map<String, Object> map = model.asMap();
		
		MemberDTO dto = (MemberDTO)map.get("dto");
		String email = (String)map.get("email");
		
		
		MemberDAO dao = D.sqlSession.getMapper(MemberDAO.class);
		
		model.addAttribute("result", dao.update(dto));

	}

}
