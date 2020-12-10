package com.proj.beans.purchase;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.mybatis.spring.annotation.MapperScan;

import com.proj.beans.member.MemberDTO;

@MapperScan
public interface RecipeProductAjaxDAO {
	public List<RecipeProductDTO> selectByCate(@Param("kind") int kind);
	public List<RecipeProductDTO> searchRecipe(@Param("search") String search);
	public int countAll(@Param("kind") int kind);
	public int insertCart(
			@Param("email") String email,
			@Param("pid") int pid,
			@Param("p_name") String p_name,
			@Param("price") String price,
			@Param("deliverchk") int deliverchk,
			@Param("pchk") int pchk,
			@Param("count") int count
	);
	public int update(@Param("prid") int prid, @Param("r_comment") String r_comment);
	public int delete(@Param("prid") int prid);
	public List<PurchaseDTO> cartList(@Param("email") String email);
	public int deleteCart(@Param("purchaseno") int purchaseno);
	public int deleteCartAll(int[] purchaseno);
	public List<MemberDTO> callUserInfo(@Param("email") String email);
	public List<PurchaseDTO> orderlist(@Param("email") String enail);
	public int buyCart(
			@Param("purchasenos") int[] purchaseno,
			@Param("name") String name,
			@Param("phone") String phone,
			@Param("address") String address
	);
	public int adminBuyCart(@Param("purchasenos") int[] purchaseno);
}
