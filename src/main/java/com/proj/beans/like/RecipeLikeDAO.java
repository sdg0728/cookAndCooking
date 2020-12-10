package com.proj.beans.like;

import java.util.List;

import org.mybatis.spring.annotation.MapperScan;

@MapperScan
public interface RecipeLikeDAO {
	public List<RecipeLikeDTO> select();
	public List<RecipeLikeDTO> selectByUid(int user_id);
}
