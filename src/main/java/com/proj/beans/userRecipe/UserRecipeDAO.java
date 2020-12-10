package com.proj.beans.userRecipe;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.annotation.MapperScan;

@MapperScan
public interface UserRecipeDAO {
	public List<UserRecipeDTO> select();
	public List<UserRecipeDTO> selectByRid(int user_rid);
	public List<UserRecipeDTO> selectByKind(int kind);
	public List<UserRecipeDTO> selectByTaste(int taste);
	public List<UserRecipeDTO> selectByKindAndTaste(HashMap<String, Object> map);
}
