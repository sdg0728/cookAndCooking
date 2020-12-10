package com.proj.command.member;

import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;

import com.proj.beans.member.MemberDAO;
import com.proj.beans.member.MemberDTO;

import common.Command;
import common.D;

public class MemberSelectCommand implements Command {

	@Override
	public void execute(Model model) {
		
		Map<String, Object> map = model.asMap();
		
		int user_id = (Integer)map.get("user_id");
		
		MemberDAO dao = D.sqlSession.getMapper(MemberDAO.class);
		
		model.addAttribute("list", dao.selectByUserId(user_id));

	}
	
	public List<MemberDTO> getList(Model model) {
		
		Map<String, Object> map = model.asMap();
		
		int user_id = (Integer)map.get("user_id");
		
		MemberDAO dao = D.sqlSession.getMapper(MemberDAO.class);
		List<MemberDTO> list = dao.selectByUserId(user_id);
		
		return list;
		
	}
}
