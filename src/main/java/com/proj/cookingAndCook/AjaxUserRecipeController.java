package com.proj.cookingAndCook;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.mahout.cf.taste.common.TasteException;
import org.apache.mahout.cf.taste.impl.common.LongPrimitiveIterator;
import org.apache.mahout.cf.taste.impl.model.file.FileDataModel;
import org.apache.mahout.cf.taste.impl.neighborhood.ThresholdUserNeighborhood;
import org.apache.mahout.cf.taste.impl.recommender.GenericItemBasedRecommender;
import org.apache.mahout.cf.taste.impl.recommender.GenericUserBasedRecommender;
import org.apache.mahout.cf.taste.impl.similarity.PearsonCorrelationSimilarity;
import org.apache.mahout.cf.taste.model.DataModel;
import org.apache.mahout.cf.taste.neighborhood.UserNeighborhood;
import org.apache.mahout.cf.taste.recommender.RecommendedItem;
import org.apache.mahout.cf.taste.recommender.UserBasedRecommender;
import org.apache.mahout.cf.taste.similarity.ItemSimilarity;
import org.apache.mahout.cf.taste.similarity.UserSimilarity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.command.ajax.recipe.AjaxRecipeSeleteUserIdCommand;
import com.command.ajax.userRecipe.AjaxUserRecipeSeleteUserIdCommand;
import com.proj.beans.like.RecipeLikeDTO;
import com.proj.beans.like.UserRecipeLikeDTO;
import com.proj.beans.member.MemberDAO;
import com.proj.beans.member.MemberDTO;
import com.proj.beans.recipe.AjaxRecipeResult;
import com.proj.beans.recipe.RecipeDTO;
import com.proj.beans.userRecipe.AjaxUserRecipeResult;
import com.proj.beans.userRecipe.UserRecipeDTO;
import com.proj.command.member.MemberSelectCommand;
import com.proj.command.recipe.RecipeSelectByKindAndTasteCommand;
import com.proj.command.recipe.RecipeSelectByKindCommand;
import com.proj.command.recipe.RecipeSelectByTasteCommand;
import com.proj.command.recipeLike.RecipeLikeListCommand;
import com.proj.command.userRecipe.UserRecipeSelectByKindAndTasteCommand;
import com.proj.command.userRecipe.UserRecipeSelectByKindCommand;
import com.proj.command.userRecipe.UserRecipeSelectByTasteCommand;
import com.proj.command.userRecipeLike.UserRecipeLikeListCommand;

import common.D;

@RestController
@RequestMapping("/userRecipe")
public class AjaxUserRecipeController {
	
	@RequestMapping(value =  "/userItembased", method = RequestMethod.POST)
	public AjaxUserRecipeResult itemBased(Model model, HttpServletRequest request) throws IOException, TasteException {
		
		int user_rid = Integer.parseInt(request.getParameter("user_rid"));
		
		String filepath = request.getSession().getServletContext().getRealPath("/csv");
		
		List<UserRecipeLikeDTO> list = new UserRecipeLikeListCommand().giveList(model);
		List<Integer> noList = new ArrayList<Integer>();
		
		int cnt = createCSV(list, "userRecipeLike", filepath);
		
		DataModel dataModel = new FileDataModel(new File(filepath+"/userRecipeLike.csv"));
		
		ItemSimilarity itemSimilarity = new PearsonCorrelationSimilarity(dataModel);
		GenericItemBasedRecommender itemRecommender = new GenericItemBasedRecommender(dataModel, itemSimilarity);
		
		int x = 1;
		for (LongPrimitiveIterator items = dataModel.getItemIDs(); items.hasNext();) {
			long itemID = items.nextLong();
			
			List<RecommendedItem> itemRecommendations = itemRecommender.mostSimilarItems(itemID, 8);
			
			for (RecommendedItem recommendedItem : itemRecommendations) {
				
				if(user_rid == itemID) {
					noList.add((int) recommendedItem.getItemID());
				}
				
				System.out.println(itemID + "," + recommendedItem.getItemID() + "," + recommendedItem.getValue());
			}
			
			x++;
			if(x>list.size()) break;
			
		}
		
		model.addAttribute("noList", noList);
		new AjaxUserRecipeSeleteUserIdCommand().execute(model);
	
		return bulidList(model);
	}
	
	@RequestMapping(value =  "/userUserbased", method = RequestMethod.POST)
	public AjaxUserRecipeResult userBased(Model model, HttpServletRequest request) throws IOException, TasteException {
		
		String email = request.getParameter("email");
		
		MemberDAO dao = D.sqlSession.getMapper(MemberDAO.class);
		
		int user_id = dao.selectUserIdByEmail(email); 
		
		String filepath = request.getSession().getServletContext().getRealPath("/csv");
		
		List<UserRecipeLikeDTO> list = new UserRecipeLikeListCommand().giveList(model);
		
		List<Integer> noList = new ArrayList<Integer>();
		
		int cnt = createCSV(list, "userRecipeLike", filepath);
		
		// csv 파일 읽기
		DataModel dataModel = new FileDataModel(new File(filepath+"/userRecipeLike.csv"));
		
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
		new AjaxUserRecipeSeleteUserIdCommand().execute(model);
		
		return bulidList(model);
		
	}
	
	@RequestMapping("/userTastebased")
	public AjaxUserRecipeResult tasteBased(HttpServletRequest request, Model model) throws IOException {
		
		String email = request.getParameter("email");
		
		MemberDAO dao = D.sqlSession.getMapper(MemberDAO.class);
		
		int user_id = dao.selectUserIdByEmail(email);
		
		model.addAttribute("user_id", user_id);
		StringBuffer message = new StringBuffer();
		String status = "FAIL";
		List<MemberDTO> list = new MemberSelectCommand().getList(model);
		
		if((list.get(0).getKind() != null && list.get(0).getKind().length() > 0)
				&& (list.get(0).getTaste() == null || list.get(0).getTaste().length() == 0)) {
			
			String temp [] = list.get(0).getKind().split(",");
			List<UserRecipeDTO> result = new ArrayList<UserRecipeDTO>();
			for (int i = 0; i < temp.length; i++) {
				int kind = Integer.parseInt(temp[i]);
				model.addAttribute("kind", kind);
				result.addAll(new UserRecipeSelectByKindCommand().getList(model));
				status = "OK";
			}
			model.addAttribute("list", result);
			model.addAttribute("status", status);
			model.addAttribute("message", message.toString());		
			return bulidList(model);
		}else if((list.get(0).getTaste() != null && list.get(0).getTaste().length() >0)
				&& (list.get(0).getKind() == null || list.get(0).getKind().length() == 0)) {
			
			
			String temp [] = list.get(0).getTaste().split(",");
			List<UserRecipeDTO> result = new ArrayList<UserRecipeDTO>();
			for (int i = 0; i < temp.length; i++) {
				int taste = Integer.parseInt(temp[i]);
				model.addAttribute("taste", taste);
				result.addAll(new UserRecipeSelectByTasteCommand().getList(model));
				status = "OK";
			}
			model.addAttribute("list", result);
			model.addAttribute("status", status);
			model.addAttribute("message", message.toString());
			return bulidList(model);
		}else if ((list.get(0).getTaste() != null && list.get(0).getTaste().length() > 0)
				&& (list.get(0).getKind() != null && list.get(0).getKind().length() > 0)){
			
			String temp1 [] = list.get(0).getKind().split(",");
			String temp2 [] = list.get(0).getTaste().split(",");
			List<UserRecipeDTO> result = new ArrayList<UserRecipeDTO>();
			for (int i = 0; i < temp1.length; i++) {
				int kind = Integer.parseInt(temp1[i]);
				model.addAttribute("kind", kind);
				
				for (int j = 0; j < temp2.length; j++) {
					int taste = Integer.parseInt(temp2[j]);
					model.addAttribute("taste", taste);
					result.addAll(new UserRecipeSelectByKindAndTasteCommand().getList(model));
					status = "OK";
				}
				
			}
			model.addAttribute("list", result);
			model.addAttribute("status", status);
			model.addAttribute("message", message.toString());
			return bulidList(model);		
		} else {
			status = "FAIL";
			model.addAttribute("status", status);
			model.addAttribute("message", message.toString());
			return bulidList(model);
		}
		
	}
	
	public int createCSV(List<UserRecipeLikeDTO> list, String title, String filepath) {
		int result = 0;
		
		try {
			BufferedWriter fw = new BufferedWriter(new FileWriter(filepath+"/"+title+".csv"));
			
			for (UserRecipeLikeDTO dto : list) {
				fw.write(dto.getUser_id()+","+dto.getUser_rid()+","+dto.getPreference());
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
	
	@SuppressWarnings("unchecked")
	public AjaxUserRecipeResult bulidList(Model model) {
		AjaxUserRecipeResult result = new AjaxUserRecipeResult();
		
		result.setStatus((String)model.getAttribute("status"));
		result.setMessage((String)model.getAttribute("message"));
		
		List<UserRecipeDTO> list = (List<UserRecipeDTO>)model.getAttribute("list");
		result.setResult(list);
		
		return result;
	}
	
}
