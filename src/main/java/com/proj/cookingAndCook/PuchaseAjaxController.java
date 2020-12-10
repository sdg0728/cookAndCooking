package com.proj.cookingAndCook;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.mahout.cf.taste.common.TasteException;
import org.apache.mahout.cf.taste.impl.model.file.FileDataModel;
import org.apache.mahout.cf.taste.impl.neighborhood.ThresholdUserNeighborhood;
import org.apache.mahout.cf.taste.impl.recommender.GenericUserBasedRecommender;
import org.apache.mahout.cf.taste.impl.similarity.PearsonCorrelationSimilarity;
import org.apache.mahout.cf.taste.model.DataModel;
import org.apache.mahout.cf.taste.neighborhood.UserNeighborhood;
import org.apache.mahout.cf.taste.recommender.RecommendedItem;
import org.apache.mahout.cf.taste.recommender.UserBasedRecommender;
import org.apache.mahout.cf.taste.similarity.UserSimilarity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.command.ajax.purchase.ABuyPurchaseCommand;
import com.command.ajax.purchase.ACartDeleteAllCommand;
import com.command.ajax.purchase.ACartListCommand;
import com.command.ajax.purchase.ADeleteCartCommand;
import com.command.ajax.purchase.AOrdersListCommand;
import com.command.ajax.purchase.ARecipeProdInsertCommand;
import com.command.ajax.purchase.ARecipeProductCommand;
import com.command.ajax.purchase.ARecipeSearchCommand;
import com.command.ajax.purchase.AReviewDeleteCommand;
import com.command.ajax.purchase.AReviewUpdateCommand;
import com.command.ajax.purchase.AUserinfoCommand;
import com.command.ajax.purchase.UserScoreCheckCommand;
import com.proj.beans.member.MemberDAO;
import com.proj.beans.member.MemberDTO;
import com.proj.beans.purchase.ProductReviewDTO;
import com.proj.beans.purchase.PurchaseDTO;
import com.proj.beans.purchase.RecipeOrdersAjaxList;
import com.proj.beans.purchase.RecipeProductAjaxList;
import com.proj.beans.purchase.RecipeProductDTO;
import com.proj.beans.purchase.RecipeUserinfoAjaxList;
import com.proj.beans.purchase.UserinfoAjaxList;
import com.proj.command.member.MemberSelectCommand;
import com.proj.command.purchase.ProductSelectByKindAndTasteCommand;
import com.proj.command.purchase.ProductSelectByKindCommand;
import com.proj.command.purchase.ProductSelectByTasteCommand;
import com.proj.command.purchase.RecipeProdCommand;
import com.proj.command.purchase.ReviewSelectCommand;

import common.D;

@RestController
@RequestMapping("/purchase")
public class PuchaseAjaxController {
	
	@SuppressWarnings("unchecked")
	public RecipeProductAjaxList buildList(Model model) {
		RecipeProductAjaxList result = new RecipeProductAjaxList();
		
		result.setStatus((String)model.getAttribute("status"));
		result.setMessage((String)model.getAttribute("message"));
		
		List<RecipeProductDTO> list = (List<RecipeProductDTO>)model.getAttribute("list");
		if(list != null) {
			result.setCount(list.size());
			result.setList(list);
		} else {
			result.setCount(0);
		}
		
		return result;
	}
	
	@GetMapping("/{kind}")
	public RecipeProductAjaxList list(Model model, @PathVariable int kind) {
		model.addAttribute("kind", kind);
		
		new ARecipeProductCommand().execute(model);
		
		return buildList(model);
	}
	
	@GetMapping("/recommend")
	public RecipeProductAjaxList recommend(Model model, HttpServletRequest request) throws IOException, TasteException {
		
		String email = request.getParameter("email");
		
		MemberDAO dao = D.sqlSession.getMapper(MemberDAO.class);
		
		int user_id = dao.selectUserIdByEmail(email); 
		
		String filepath = request.getSession().getServletContext().getRealPath("/csv");
		
		List<ProductReviewDTO> list = new ReviewSelectCommand().giveList(model);
		
		List<Integer> noList = new ArrayList<Integer>();
		
		int cnt = createCSV(list, "puchase", filepath);
		
		// csv 파일 읽기
		
		File f = new File(filepath+"/puchase.csv");
		BufferedReader br = new BufferedReader(new FileReader(f));
		String sLine = null;
		
		if((sLine = br.readLine()) != null) {
			DataModel dataModel = new FileDataModel(f);
			
			// 유저 기반 유사성
			UserSimilarity userSimilarity = new PearsonCorrelationSimilarity(dataModel);
			// 0.1 보다 큰 유사성을 가진 모든 것을 사용
			UserNeighborhood neighborhood = new ThresholdUserNeighborhood(0.1, userSimilarity, dataModel);
			
			// 유저 기준 추천 모델
			UserBasedRecommender recommender = new GenericUserBasedRecommender(dataModel, neighborhood, userSimilarity);
			List<RecommendedItem> recommendations = recommender.recommend(user_id, 8);
			for (RecommendedItem recommendedItem : recommendations) {
				noList.add((int) recommendedItem.getItemID());
				System.out.println(recommendedItem);
			}
			
			model.addAttribute("noList", noList);
			
			new RecipeProdCommand().execute(model);
		}	

		return buildList(model);
	}
	
	@GetMapping("/taste")
	public RecipeProductAjaxList taste(Model model, HttpServletRequest request) {
		
		String email = request.getParameter("email");
		
		MemberDAO dao = D.sqlSession.getMapper(MemberDAO.class);
		
		int user_id = dao.selectUserIdByEmail(email);
		
		model.addAttribute("user_id", user_id);
		StringBuffer message = new StringBuffer();
		String status = "FAIL";
		// 취향 추천
		List<MemberDTO> mList = new MemberSelectCommand().getList(model);
		
		if((mList.get(0).getKind() != null && mList.get(0).getKind().length() > 0)
				&& (mList.get(0).getTaste() == null || mList.get(0).getTaste().length() == 0)) {
			
			String temp [] = mList.get(0).getKind().split(",");
			List<RecipeProductDTO> result = new ArrayList<RecipeProductDTO>();
			for (int i = 0; i < temp.length; i++) {
				String kind = temp[i];
				model.addAttribute("kind", kind);
				result.addAll(new ProductSelectByKindCommand().getList(model));
				status = "OK";
			}
			model.addAttribute("list", result);
			model.addAttribute("status", status);
			model.addAttribute("message", message.toString());		
			return buildList(model);
		}else if((mList.get(0).getTaste() != null || mList.get(0).getTaste().length() >0)
				&& (mList.get(0).getKind() == null && mList.get(0).getKind().length() == 0)) {
			String temp [] = mList.get(0).getTaste().split(",");
			List<RecipeProductDTO> result = new ArrayList<RecipeProductDTO>();
			for (int i = 0; i < temp.length; i++) {
				int taste = Integer.parseInt(temp[i]);
				model.addAttribute("taste", taste);
				result.addAll(new ProductSelectByTasteCommand().getList(model));
				status = "OK";
			}
			model.addAttribute("list", result);
			model.addAttribute("status", status);
			model.addAttribute("message", message.toString());
			return buildList(model);
		}else if ((mList.get(0).getTaste() != null && mList.get(0).getTaste().length() > 0)
				&& (mList.get(0).getKind() != null && mList.get(0).getKind().length() > 0)) {
			
			String temp1 [] = mList.get(0).getKind().split(",");
			String temp2 [] = mList.get(0).getTaste().split(",");
			List<RecipeProductDTO> result = new ArrayList<RecipeProductDTO>();
			
			for (int i = 0; i < temp1.length; i++) {
				String kind = temp1[i];
				model.addAttribute("kind", kind);
				
				for (int j = 0; j < temp2.length; j++) {
					int taste = Integer.parseInt(temp2[j]);
					model.addAttribute("taste", taste);
					result.addAll(new ProductSelectByKindAndTasteCommand().getList(model));
					status = "OK";
				}
			}
			model.addAttribute("list", result);
			model.addAttribute("status", status);
			model.addAttribute("message", message.toString());
			return buildList(model);
		}else {
			status = "FAIL";
			model.addAttribute("status", status);
			model.addAttribute("message", message.toString());
			return buildList(model);
		}
		
		
	}
	
	@GetMapping("/recipeSearch")
	public RecipeProductAjaxList search(Model model, String search) {
		model.addAttribute("search", search);
		
		new ARecipeSearchCommand().execute(model);
		
		return buildList(model);
	}
	
	@PostMapping("/cartGo")
	public RecipeProductAjaxList insert(Model model, int pid, String p_name, String email, String price, int count, int pchk) {
		model.addAttribute("pid", pid);
		model.addAttribute("p_name", p_name);
		model.addAttribute("email", email);
		model.addAttribute("price", price);
		model.addAttribute("count", count);
		model.addAttribute("pchk", pchk);
		new ARecipeProdInsertCommand().execute(model);
		
		return buildList(model);
	}
	
	@PutMapping("/updateOk")
	public RecipeProductAjaxList update(Model model, int prid, String r_comment) {
		model.addAttribute("prid", prid);
		model.addAttribute("r_comment", r_comment);
		
		new AReviewUpdateCommand().execute(model);
		
		return buildList(model);
	}
	
	@DeleteMapping("/deleteOk")
	public RecipeProductAjaxList delete(Model model, int prid) {
		model.addAttribute("prid", prid);
		
		new AReviewDeleteCommand().execute(model);
		
		return buildList(model);
	}
	
	@GetMapping("/cartList")
	public RecipeProductAjaxList cartList(Model model, String email) {
		model.addAttribute("email", email);
		new ACartListCommand().execute(model);
		
		return buildList(model);
	}
	
	@DeleteMapping("/deletecart")
	public RecipeOrdersAjaxList deletecart(Model model, int purchaseno) {
		model.addAttribute("purchaseno", purchaseno);
		
		new ADeleteCartCommand().execute(model);
		
		return purchaseList(model);
	}
	
	@DeleteMapping("deletecartall")
	public RecipeProductAjaxList deletecartall(Model model, int[] purchaseno) {
		model.addAttribute("purchaseno", purchaseno);
		
		new ACartDeleteAllCommand().execute(model);
		
		return buildList(model);
	}
	
	@GetMapping("/userinfo")
	public RecipeUserinfoAjaxList userInfo(Model model, String email) {
		model.addAttribute("email", email);
		
		new AUserinfoCommand().execute(model);
		
		RecipeUserinfoAjaxList result = new RecipeUserinfoAjaxList();
		
		result.setStatus((String)model.getAttribute("status"));
		result.setMessage((String)model.getAttribute("message"));
		
		@SuppressWarnings("unchecked")
		List<MemberDTO> list = (List<MemberDTO>)model.getAttribute("list");
		
		if(list != null) {
			result.setCount(list.size());
			result.setList(list);
		} else {
			result.setCount(0);
		}
		
		return result;
	}
	
	@GetMapping("/orderlist")
	public RecipeOrdersAjaxList orderlist(Model model, String email) {
		model.addAttribute("email", email);
		
		new AOrdersListCommand().execute(model);
		
		return purchaseList(model);
	}
	
	@PutMapping("/buySuccess")
	public RecipeOrdersAjaxList buySuccess(Model model, int[] purchaseno, String name, String phone, String address) {
		model.addAttribute("purchaseno", purchaseno);
		model.addAttribute("name", name);
		model.addAttribute("phone", phone);
		model.addAttribute("address", address);
		
		new ABuyPurchaseCommand().execute(model);
		
		return purchaseList(model);
	}
	
	@GetMapping("checkScore")
	public UserinfoAjaxList checkScore(Model model, String email) {
		model.addAttribute("email", email);
		
		new UserScoreCheckCommand().execute(model);
		
		UserinfoAjaxList result = new UserinfoAjaxList();
		
		result.setStatus((String)model.getAttribute("status"));
		result.setMessage((String)model.getAttribute("message"));
		
		@SuppressWarnings("unchecked")
		List<MemberDTO> list = (List<MemberDTO>)model.getAttribute("list");
		
		if(list != null) {
			result.setCount(list.size());
			result.setList(list);
		} else {
			result.setCount(0);
		}
		
		return result;
	}
	
	public RecipeOrdersAjaxList purchaseList(Model model) {
		RecipeOrdersAjaxList result = new RecipeOrdersAjaxList();
		
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
	
	public int createCSV(List<ProductReviewDTO> list, String title, String filepath) {
		int result = 0;
		
		try {
			BufferedWriter fw = new BufferedWriter(new FileWriter(filepath+"/"+title+".csv"));
			
			for (ProductReviewDTO dto : list) {
				fw.write(dto.getUser_id()+","+dto.getPid()+","+dto.getR_score());
				fw.newLine();
				result++;
			}
			
			fw.flush();
			
			fw.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}
	
}
