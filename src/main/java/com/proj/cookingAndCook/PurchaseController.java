package com.proj.cookingAndCook;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
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
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.proj.beans.member.MemberDAO;
import com.proj.beans.member.MemberDTO;
import com.proj.beans.purchase.ApplyRecipeDTO;
import com.proj.beans.purchase.ProductReviewDTO;
import com.proj.beans.purchase.RecipeProductDTO;
import com.proj.beans.purchase.ReviewDTO;
import com.proj.command.member.MemberSelectCommand;
import com.proj.command.purchase.ProductReviewOkCommand;
import com.proj.command.purchase.ProductSelectByKindAndTasteCommand;
import com.proj.command.purchase.ProductSelectByKindCommand;
import com.proj.command.purchase.ProductSelectByTasteCommand;
import com.proj.command.purchase.RecipeApplyCommand;
import com.proj.command.purchase.RecipeProdCommand;
import com.proj.command.purchase.RecipeProdDetailCommand;
import com.proj.command.purchase.ReviewSelectCommand;
import com.proj.command.purchase.WebconnCommand;


import common.D;

@Controller
@RequestMapping("/purchase")
public class PurchaseController {
	
	private SqlSession sqlSession;
	
	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
		D.sqlSession = sqlSession;
	}
	
	@RequestMapping("/rlist")
	public String rlist(String email, Model model, HttpServletRequest request) {
		
		return "purchase/recipe_prod_list";
	}
	
	@RequestMapping("/rdetail")
	public String rdetail(Model model, int pid) {
		model.addAttribute("pid", pid);
		
		new RecipeProdDetailCommand().execute(model);
		return "purchase/recipe_prod_detail";
	}
	
	@RequestMapping("/plist")
	public String plist(Model model) {
		try {
			WebconnCommand webconnCommand = new WebconnCommand();
			model.addAttribute("list", webconnCommand.getProdList());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "purchase/prod_list";
	}
	
	@RequestMapping("/pdetail")
	public String pdetail(String no, String name, Model model) {
		try {
			model.addAttribute("dto", new WebconnCommand().getProd(no));
			model.addAttribute("name", name);
			responesJSON(model);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "purchase/prod_detail";
	}
	
	@PostMapping("/reviewOk")
	public String reviewOk(HttpServletRequest request, Model model, MultipartFile upload, ReviewDTO dto, String email) {
		String uploadPath = request.getSession().getServletContext().getRealPath("/upload/purchase");
		String savedName = upload.getOriginalFilename();
		
		try {
			savedName = uploadFile(savedName, upload.getBytes(), uploadPath);
			upload.transferTo(new File(uploadPath + "/" + savedName));
			dto.setR_img(savedName);
			model.addAttribute("dto", dto);
			model.addAttribute("email", email);
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		new ProductReviewOkCommand().execute(model);
		
		return "purchase/reviewOk";
	}
	
	@RequestMapping("/cart")
	public String cart() {
		return "purchase/cart";
	}
	
	@RequestMapping("/orders")
	public String orders() {
		return "purchase/orders";
	}
	
	@RequestMapping("/buy")
	public String buy() {
		return "purchase/buy";
	}
	
	@PostMapping("/buyOk")
	public String buyOk(Model model, String email, String address, String name, String phone, String zip, String purchaseno) {
		model.addAttribute("email",email);
		model.addAttribute("address",address);
		model.addAttribute("name",name);
		model.addAttribute("phone",phone);
		model.addAttribute("zip",zip);
		model.addAttribute("purchaseno",purchaseno);
		
		return "purchase/buyOk";
	}
	
	@GetMapping("/aprecipe")
	public String applyRecipe() {
		return "purchase/apply_recipe";
	}
	
	@PostMapping("applyOk")
	public String applyOk(HttpServletRequest request, Model model, MultipartFile upload, ApplyRecipeDTO dto) {
		String uploadPath = request.getSession().getServletContext().getRealPath("/upload/recipe");
		String savedName = upload.getOriginalFilename();
		
		try {
			savedName = uploadFile(savedName, upload.getBytes(), uploadPath);
			upload.transferTo(new File(uploadPath + "/" + savedName));
			dto.setA_img(savedName);
			model.addAttribute("dto", dto);
			
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println(dto);
		new RecipeApplyCommand().execute(model);
		
		return "purchase/apply_recipeOk";
	}
	
	private String uploadFile(String originalName, byte [] fileData, String uploadPath) throws Exception {
	      UUID uuid = UUID.randomUUID();
	      
	      String savedName = uuid.toString()+"_"+originalName;
	      File target = new File(uploadPath, savedName);
	      FileCopyUtils.copy(fileData, target);
	      
	      return savedName;
	      
	}
	
	public void responesJSON(Model model) throws Exception {

		String name = ((String)model.getAttribute("name")).split("/")[0];

		String clientID = "x2ZcgeUwW5KYJ6lvOcNH"; // 네이버 개발자 센터에서 발급받은 clientID입력
		String clientSecret = "l1rN4O6ySD"; // 네이버 개발자 센터에서 발급받은 clientSecret입력
		URL url = new URL("https://openapi.naver.com/v1/search/encyc.json?query=" + URLEncoder.encode(name, "UTF-8")); 

		URLConnection urlConn = url.openConnection(); // openConnection 해당 요청에 대해서 쓸 수 있는 connection 객체

		urlConn.setRequestProperty("X-Naver-Client-ID", clientID);
		urlConn.setRequestProperty("X-Naver-Client-Secret", clientSecret);

		BufferedReader br = new BufferedReader(new InputStreamReader(urlConn.getInputStream()));

		StringBuilder sb = new StringBuilder();
		String line;
		while ((line = br.readLine()) != null) {
			sb.append(line);
		}
		br.close();
		String result = sb.toString();

		JSONParser parser = new JSONParser();
		JSONObject obj = (JSONObject)parser.parse(result);
		JSONArray parse_item = (JSONArray) obj.get("items");

		JSONObject list;

		ArrayList<Map<String, Object>> arr = new ArrayList<Map<String, Object>>();

		for (int i = 0; i < parse_item.size(); i++) {
			list = (JSONObject) parse_item.get(i);
			
			Object thumbnail = list.get("thumbnail");
			System.out.println(thumbnail.toString());
			if(thumbnail != null) {
				model.addAttribute("thumbnail", thumbnail.toString());
				return;
			}
		}
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
