package com.proj.cookingAndCook;

import org.apache.ibatis.session.SqlSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;


import common.Command;
import common.D;

@Controller
@RequestMapping("/userRecipe")
public class UserRecipeController {
	
	private Command command;
	
	private SqlSession sqlSession;
	
	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
		D.sqlSession = sqlSession;
	}
 	
}
