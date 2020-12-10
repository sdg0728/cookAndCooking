package com.proj.beans.admin;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.mybatis.spring.annotation.MapperScan;

import com.proj.beans.purchase.ApplyRecipeDTO;
import com.proj.beans.purchase.PurchaseDTO;

@MapperScan
public interface RecipeAdminDAO {
	// Controller
	public List<AdminRecipeProductDTO> select(@Param("start") int start, @Param("end") int end);

	public int countAll();

	public int addRecipeProduct(RecipeProductDTO dto);

	public List<RecipeProductDTO> selectByPid(@Param("pid") int pid);

	public int recipeUpdate(@Param("pid") int pid, @Param("p_img") String p_img, @Param("p_price") int price,
			@Param("p_kind") int kind, @Param("p_taste") int taste, @Param("p_content") String content,
			@Param("p_count") int count);

	public List<PurchaseDTO> selectSelList(@Param("start") int start, @Param("end") int end);

	public List<AdminTotalPrice> selectPrice();
	
	public List<AdminTotalPrice> selectPriceByDate(String month);

	public int adminCountAll();
	
	public List<ApplyRecipeDTO> selectApplyList();

	// RestController
	public List<AdminRecipeProductDTO> search(@Param("search") String search);

	public int deleteRecipe(@Param("pid") int[] pid);

	public int updateDeliver(@Param("purchaseno") int purchaseno, @Param("deliverchk") int deliverchk);

	public int updateADeliver(@Param("purchaseno") int purchaseno, @Param("deliverchk") int deliverchk);
	
	public List<PurchaseDTO> serchPurchase1(@Param("search") String search);
	
	public List<PurchaseDTO> serchPurchase2(@Param("search") String search);
	
	public List<ApplyRecipeDTO> applyDetail(@Param("applyno") int applyno);
	
	public int applyCheck(@Param("applyno") int applyno, @Param("a_check") int a_check);
	
	public List<ApplyRecipeDTO> applyListByCheck(@Param("a_check") int a_check);
	
	public List<ApplyRecipeDTO> applyAllList();
	
	public List<ApplyRecipeDTO> applySearch(@Param("search") String search);
	
	public int applyProduct(@Param("applyno") int applyno);
}
