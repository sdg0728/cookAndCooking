package com.proj.cookingAndCook;

import java.util.List;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.command.ajax.admin.AdminApplyByCheckCommand;
import com.command.ajax.admin.AdminApplyCheckCommand;
import com.command.ajax.admin.AdminApplyDetailCommand;
import com.command.ajax.admin.AdminApplySearchCommand;
import com.command.ajax.admin.AdminRecipeDeleteCommand;
import com.command.ajax.admin.AdminRecipeListAjaxCommand;
import com.command.ajax.admin.AdminRecipeSearchCommand;
import com.command.ajax.admin.AdminSearchPurchaseCommand;
import com.command.ajax.admin.AdminSellPageCommand;
import com.command.ajax.admin.AdminSellUpdataCommand;
import com.command.ajax.admin.AjaxPurchaseStateCommand;
import com.command.ajax.admin.AjaxRecipeStateCommand;
import com.command.ajax.admin.AjaxUserRecipeStateCommand;
import com.command.ajax.admin.MemberAllListCommand;
import com.command.ajax.admin.MemberSelectedCommand;
import com.proj.beans.admin.AdminApplyAjaxList;
import com.proj.beans.admin.AdminProducAjaxtList;
import com.proj.beans.admin.AdminPurchaseAjaxtList;
import com.proj.beans.admin.AdminRecipeProductDTO;
import com.proj.beans.admin.MemberListResult;
import com.proj.beans.admin.PurchaseStateResult;
import com.proj.beans.admin.RecipeStateResult;
import com.proj.beans.admin.UserRecipeStateResult;
import com.proj.beans.member.MemberDTO;
import com.proj.beans.purchase.ApplyRecipeDTO;
import com.proj.beans.purchase.PurchaseDTO;

@RestController
@RequestMapping("/admin")
public class AjaxAdminController {

	@PostMapping("/memberlist")
	public MemberListResult memberList(Model model) {
		
		new MemberAllListCommand().execute(model);
		
		return bulidCheck(model);
	}
	
	@PostMapping("/seletedMember")
	public MemberListResult memberSeleted(String search, Model model) {
		
		model.addAttribute("email", search);
		model.addAttribute("name", search);
		
		new MemberSelectedCommand().execute(model);
		
		return bulidCheck(model);
	}
	
	@PostMapping("/recipeState")
	public RecipeStateResult recipeState(Model model) {
		
		new AjaxRecipeStateCommand().execute(model);
		
		return bulidRecipeState(model);
	}
	
	@PostMapping("/userRecipeState")
	public UserRecipeStateResult userRecipeState(Model model) {
		
		new AjaxUserRecipeStateCommand().execute(model);
		
		return bulidUserRecipeState(model);
	}
	
	@PostMapping("/purchaseState")
	public PurchaseStateResult purchaseState(Model model) {
		
		new AjaxPurchaseStateCommand().execute(model);
		
		return bulidPurchaseState(model);
	}
	
	@SuppressWarnings("unchecked")
	public MemberListResult bulidCheck(Model model) {
		MemberListResult result = new MemberListResult();
		
		result.setStatus((String)model.getAttribute("status"));
		result.setMessage((String)model.getAttribute("message"));
		
		result.setList((List<MemberDTO>)model.getAttribute("list"));
		
		return result;
		
	}
	
	@SuppressWarnings("unchecked")
	public RecipeStateResult bulidRecipeState(Model model) {
		RecipeStateResult result = new RecipeStateResult();
		
		result.setStatus((String)model.getAttribute("status"));
		result.setMessage((String)model.getAttribute("message"));
		
		result.setList((List<Integer>)model.getAttribute("list"));
		
		return result;
	}
	
	@SuppressWarnings("unchecked")
	public UserRecipeStateResult bulidUserRecipeState(Model model) {
		UserRecipeStateResult result = new UserRecipeStateResult();
		
		result.setStatus((String)model.getAttribute("status"));
		result.setMessage((String)model.getAttribute("message"));
		
		result.setList((List<Integer>)model.getAttribute("list"));
		
		return result;
	}
	
	@SuppressWarnings("unchecked")
	public PurchaseStateResult bulidPurchaseState(Model model) {
		PurchaseStateResult result = new PurchaseStateResult();
		
		result.setStatus((String)model.getAttribute("status"));
		result.setMessage((String)model.getAttribute("message"));
		
		result.setList((List<Integer>)model.getAttribute("list"));
		
		return result;
	}
	
	public AdminProducAjaxtList buildList(Model model) {
		AdminProducAjaxtList result = new AdminProducAjaxtList();
		
		result.setStatus((String)model.getAttribute("status"));
		result.setMessage((String)model.getAttribute("message"));
		
		@SuppressWarnings("unchecked")
		List<AdminRecipeProductDTO> list = (List<AdminRecipeProductDTO>)model.getAttribute("list");
		if(list != null) {
			result.setCount(list.size());
			result.setList(list);
		} else {
			result.setCount(0);
		}
		
		return result;
	}
	
	public AdminPurchaseAjaxtList buildPurcaseList(Model model) {
		AdminPurchaseAjaxtList result = new AdminPurchaseAjaxtList();
		
		result.setStatus((String)model.getAttribute("status"));
		result.setMessage((String)model.getAttribute("message"));
		
		@SuppressWarnings("unchecked")
		List<PurchaseDTO> list = (List<PurchaseDTO>)model.getAttribute("list");
		
		if(list != null) {
			result.setCount(list.size());
			result.setList(list);
		} else {
			result.setCount(0);
		}
		return result;
	}
	
	public AdminApplyAjaxList buildApplyList(Model model) {
		AdminApplyAjaxList result = new AdminApplyAjaxList();
		
		result.setStatus((String)model.getAttribute("status"));
		result.setMessage((String)model.getAttribute("message"));
		
		@SuppressWarnings("unchecked")
		List<ApplyRecipeDTO> list = (List<ApplyRecipeDTO>)model.getAttribute("list");
		
		if(list != null) {
			result.setCount(list.size());
			result.setList(list);
		} else {
			result.setCount(0);
		}
		
		return result;
	}
	
	@GetMapping("/{page}")
	public AdminProducAjaxtList showList(Model model, @PathVariable int page) {
		model.addAttribute("page", page);
		
		new AdminRecipeListAjaxCommand().execute(model);
		
		return buildList(model);
	}
	
	@GetMapping("/rsearch")
	public AdminProducAjaxtList recipeSearch(Model model, String search) {
		model.addAttribute("search", search);
		
		new AdminRecipeSearchCommand().execute(model);
		
		return buildList(model);
	}
	
	@DeleteMapping("/rdelete")
	public AdminProducAjaxtList deleteRecipe(Model model, int[] pid) {
		model.addAttribute("pid", pid);
		
		new AdminRecipeDeleteCommand().execute(model);
		
		return buildList(model);
	}
	
	@GetMapping("/showSellList")
	public AdminPurchaseAjaxtList showSellPage(Model model, int page) {
		model.addAttribute("page", page);
		
		new AdminSellPageCommand().execute(model);
		
		return buildPurcaseList(model);
	}
	
	@PutMapping("/updateDeliver")
	public AdminProducAjaxtList updateDeliver(Model model, int purchaseno, int deliverchk) {
		model.addAttribute("purchaseno", purchaseno);
		model.addAttribute("deliverchk", deliverchk);
		
		new AdminSellUpdataCommand().execute(model);
		
		return buildList(model);
	}
	
	@GetMapping("/searchPurchase")
	public AdminPurchaseAjaxtList searchPurchase(Model model, String search) {
		model.addAttribute("search", search);
		
		new AdminSearchPurchaseCommand().execute(model);
		
		return buildPurcaseList(model);
	}
	
	@GetMapping("/applyDetail")
	public AdminApplyAjaxList applyDetail(Model model, int applyno) {
		model.addAttribute("applyno", applyno);
		
		new AdminApplyDetailCommand().execute(model);
		
		AdminApplyAjaxList result = new AdminApplyAjaxList();
		
		return buildApplyList(model);
	}
	
	@PutMapping("/applyAccept")
	public AdminApplyAjaxList applycheck(Model model, int applyno, int a_check) {
		model.addAttribute("applyno", applyno);
		model.addAttribute("a_check", a_check);
		
		new AdminApplyCheckCommand().execute(model);
		
		return buildApplyList(model);
	}
	
	@GetMapping("/applyByCheck")
	public AdminApplyAjaxList applyByCheck(Model model, int a_check) {
		model.addAttribute("a_check", a_check);
		
		new AdminApplyByCheckCommand().execute(model);
		
		return buildApplyList(model);
	}
	
	@GetMapping("/applySearch")
	public AdminApplyAjaxList applySearch(Model model, String search) {
		model.addAttribute("search", search);
		
		new AdminApplySearchCommand().execute(model);
		
		return buildApplyList(model);
	}
	
}
