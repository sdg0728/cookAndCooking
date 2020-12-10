package com.proj.beans.recipe;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.annotation.MapperScan;

@MapperScan
public interface RecipeDAO {
	public List<RecipeDTO> select();
	public List<RecipeDTO> selectByRid(int rid);
	public List<RecipeDTO> selectByKind(int kind);
	public List<RecipeDTO> selectByTaste(int taste);
	public List<RecipeDTO> selectByKindAndTaste(HashMap<String, Object> map);
}
