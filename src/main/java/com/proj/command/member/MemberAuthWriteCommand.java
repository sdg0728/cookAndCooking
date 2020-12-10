package com.proj.command.member;

import java.util.Map;

import org.springframework.ui.Model;

import com.proj.beans.member.MemberAuthDTO;
import com.proj.beans.member.MemberDAO;
import com.proj.beans.member.MemberDTO;

import common.Command;
import common.D;

public class MemberAuthWriteCommand implements Command {

	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();

		
		MemberDTO dto = (MemberDTO)map.get("dto");
		
		MemberAuthDTO authDto = new MemberAuthDTO(); 
		
		authDto.setUser_id(dto.getUser_id());
		authDto.setAuth("ROLE_MEMBER");
		
		MemberDAO dao = D.sqlSession.getMapper(MemberDAO.class);
		
		model.addAttribute("auth", dao.insertTOUserInfoAuth(authDto));
	}

}
