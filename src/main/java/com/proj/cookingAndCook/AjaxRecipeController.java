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
import com.proj.beans.like.RecipeLikeDTO;
import com.proj.beans.member.MemberDAO;
import com.proj.beans.member.MemberDTO;
import com.proj.beans.recipe.AjaxRecipeResult;
import com.proj.beans.recipe.RecipeDTO;
import com.proj.command.member.MemberSelectCommand;
import com.proj.command.recipe.RecipeSelectByKindAndTasteCommand;
import com.proj.command.recipe.RecipeSelectByKindCommand;
import com.proj.command.recipe.RecipeSelectByTasteCommand;
import com.proj.command.recipeLike.RecipeLikeListCommand;

import common.D;

@RestController
@RequestMapping("/recipe")
public class AjaxRecipeController {
	
	@RequestMapping(value =  "/itembased", method = RequestMethod.POST)
	public AjaxRecipeResult itemBased(Model model, HttpServletRequest request) throws IOException, TasteException {
		System.out.println("???");
		int rid = Integer.parseInt(request.getParameter("rid"));
		
		String filepath = request.getSession().getServletContext().getRealPath("/csv");
		
		List<RecipeLikeDTO> list = new RecipeLikeListCommand().giveList(model);
		List<Integer> noList = new ArrayList<Integer>();
		
		int cnt = createCSV(list, "recipeLike", filepath);
		
		DataModel dataModel = new FileDataModel(new File(filepath+"/recipeLike.csv"));
		
		ItemSimilarity itemSimilarity = new PearsonCorrelationSimilarity(dataModel);
		GenericItemBasedRecommender itemRecommender = new GenericItemBasedRecommender(dataModel, itemSimilarity);
		
		int x = 1;
		for (LongPrimitiveIterator items = dataModel.getItemIDs(); items.hasNext();) {
			long itemID = items.nextLong();
			
			List<RecommendedItem> itemRecommendations = itemRecommender.mostSimilarItems(itemID, 8);
			
			for (RecommendedItem recommendedItem : itemRecommendations) {
				
				if(rid == itemID) {
					noList.add((int) recommendedItem.getItemID());
				}
				
				System.out.println(itemID + "," + recommendedItem.getItemID() + "," + recommendedItem.getValue());
			}
			
			x++;
			if(x>list.size()) break;
			
		}
		
		model.addAttribute("noList", noList);
		new AjaxRecipeSeleteUserIdCommand().execute(model);
	
		return bulidList(model);
	}
	
	@RequestMapping(value =  "/userbased", method = RequestMethod.POST)
	public AjaxRecipeResult userBased(Model model, HttpServletRequest request) throws IOException, TasteException {
		
		String email = request.getParameter("email");
		
		MemberDAO dao = D.sqlSession.getMapper(MemberDAO.class);
		
		int user_id = dao.selectUserIdByEmail(email); 
		
		String filepath = request.getSession().getServletContext().getRealPath("/csv");
		
		List<RecipeLikeDTO> list = new RecipeLikeListCommand().giveList(model);
		
		List<Integer> noList = new ArrayList<Integer>();
		
		int cnt = createCSV(list, "recipeLike", filepath);
		
		// csv 파일 읽기
		DataModel dataModel = new FileDataModel(new File(filepath+"/recipeLike.csv"));
		
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
		new AjaxRecipeSeleteUserIdCommand().execute(model);
		
		return bulidList(model);
		
	}
	
	@RequestMapping("/tastebased")
	public AjaxRecipeResult tasteBased(HttpServletRequest request, Model model) {
		
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
			List<RecipeDTO> result = new ArrayList<RecipeDTO>();
			for (int i = 0; i < temp.length; i++) {
				int kind = Integer.parseInt(temp[i]);
				model.addAttribute("kind", kind);
				result.addAll(new RecipeSelectByKindCommand().getList(model));
				status = "OK";
			}
			model.addAttribute("list", result);
			model.addAttribute("status", status);
			model.addAttribute("message", message.toString());		
			return bulidList(model);
		}else if((list.get(0).getTaste() != null && list.get(0).getTaste().length() >0)
				&& (list.get(0).getKind() == null || list.get(0).getKind().length() == 0)) {
			
			
			String temp [] = list.get(0).getTaste().split(",");
			List<RecipeDTO> result = new ArrayList<RecipeDTO>();
			for (int i = 0; i < temp.length; i++) {
				int taste = Integer.parseInt(temp[i]);
				model.addAttribute("taste", taste);
				result.addAll(new RecipeSelectByTasteCommand().getList(model));
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
			List<RecipeDTO> result = new ArrayList<RecipeDTO>();
			for (int i = 0; i < temp1.length; i++) {
				int kind = Integer.parseInt(temp1[i]);
				model.addAttribute("kind", kind);
				
				for (int j = 0; j < temp2.length; j++) {
					int taste = Integer.parseInt(temp2[j]);
					model.addAttribute("taste", taste);
					result.addAll(new RecipeSelectByKindAndTasteCommand().getList(model));
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
	
	public int createCSV(List<RecipeLikeDTO> list, String title, String filepath) {
		int result = 0;
		
		try {
			BufferedWriter fw = new BufferedWriter(new FileWriter(filepath+"/"+title+".csv"));
			
			for (RecipeLikeDTO dto : list) {
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
	public AjaxRecipeResult bulidList(Model model) {
		AjaxRecipeResult result = new AjaxRecipeResult();
		
		result.setStatus((String)model.getAttribute("status"));
		result.setMessage((String)model.getAttribute("message"));
		
		List<RecipeDTO> list = (List<RecipeDTO>)model.getAttribute("list");
		result.setResult(list);
		
		return result;
	}
	
}
