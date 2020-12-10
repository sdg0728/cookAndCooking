package com.proj.beans.purchase;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.mybatis.spring.annotation.MapperScan;

@MapperScan
public interface RecipeProductDAO {
	public List<RecipeProductDTO> select();
	public RecipeProductDTO selectByPid(@Param("pid") int pid);
	public List<ProductReviewDTO> reviewByPid(@Param("pid") int pid);
	public List<ProductReviewDTO> reviewByPidToCSV();
	public List<RecipeProductDTO> selectByKind(String p_kind);
	public List<RecipeProductDTO> selectByTaste(int p_taste);
	public List<RecipeProductDTO> selectByKindAndTaste(HashMap<String, Object> map);
	public int reviewOk(
			@Param("r_comment") String r_comment,
			@Param("r_img") String r_img,
			@Param("r_score") double r_score,
			@Param("email") String email,
			@Param("pid") int pid
	);
	public List<PurchaseDTO> cartList(@Param("email") String email);
	public int applyRecipe(ApplyRecipeDTO dto);                                                                           
}
  