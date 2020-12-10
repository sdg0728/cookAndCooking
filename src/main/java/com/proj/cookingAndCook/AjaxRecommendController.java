package com.proj.cookingAndCook;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.command.ajax.recommend.FristSearchRecipeAjaxCommand;
import com.command.ajax.recommend.ResearchRecipeAjaxCommand;
import com.command.ajax.userRecipe.AjaxUserRecipeRidCommand;
import com.proj.beans.cookingcls.AjaxRecipeList;
import com.proj.beans.recipe.AjaxRecommendResult;
import com.proj.beans.recipe.RecipeDTO;
import com.proj.beans.userRecipe.AjaxUserRecipeResult;
import com.proj.beans.userRecipe.UserRecipeDTO;
import com.proj.command.cookingcls.RecipeRidCommand;

@RestController
@RequestMapping("/recommend")
public class AjaxRecommendController {

	@RequestMapping(value = "/fristRecipes", method = RequestMethod.POST)
	public AjaxRecommendResult frist(Model model, HttpServletRequest request) {

		String ingre = request.getParameter("ingre");

		String arr[] = null;
		try {

			if (!ingre.equals("")) {

				arr = new String[ingre.split(",").length];

				if (arr.length > 0) {
					for (int i = 0; i < arr.length; i++) {
						arr[i] = ingre.split(",")[i];
					}

					model.addAttribute("arr", arr);
					new FristSearchRecipeAjaxCommand().execute(model);
				}

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return bulidList(model);
	}

	@RequestMapping(value = "/recipes", method = RequestMethod.POST)
	public AjaxRecommendResult reseach(Model model, HttpServletRequest request) {
		String kind = request.getParameter("kind");
		String taste = request.getParameter("taste");
		String ingre = request.getParameter("ingre");

		model.addAttribute("kinds", kind);
		model.addAttribute("tastes", taste);
		model.addAttribute("ingre", ingre);

		new ResearchRecipeAjaxCommand().execute(model);
		return bulidList(model);
	}

	@SuppressWarnings("unchecked")
	public AjaxRecommendResult bulidList(Model model) {
		AjaxRecommendResult result = new AjaxRecommendResult();

		result.setStatus((String) model.getAttribute("status"));
		result.setMessage((String) model.getAttribute("message"));

		List<RecipeDTO> list1 = (List<RecipeDTO>) model.getAttribute("res1");
		List<UserRecipeDTO> list2 = (List<UserRecipeDTO>) model.getAttribute("res2");

		result.setResult1(list1);
		result.setResult2(list2);

		return result;

	}

	@SuppressWarnings("unchecked")
	public AjaxRecipeList buildList(Model model) {
		AjaxRecipeList result = new AjaxRecipeList();

		result.setStatus((String) model.getAttribute("status"));
		result.setMessage((String) model.getAttribute("message"));

		List<com.proj.beans.cookingcls.RecipeDTO> list = (List<com.proj.beans.cookingcls.RecipeDTO>) model
				.getAttribute("list");
		result.setList(list);

		// System.out.println(list.get(2).getName());

		return result;
	}

	@SuppressWarnings("unchecked")
	public AjaxUserRecipeResult bulidList2(Model model) {
		AjaxUserRecipeResult result = new AjaxUserRecipeResult();

		result.setStatus((String) model.getAttribute("status"));
		result.setMessage((String) model.getAttribute("message"));

		List<UserRecipeDTO> list = (List<UserRecipeDTO>) model.getAttribute("list");
		result.setResult(list);

		return result;

	}

	@GetMapping("/view.ajax")
	public AjaxRecipeList viewAjax(int rid, Model model) {
		model.addAttribute("rid", rid);
		new RecipeRidCommand().execute(model);

		return buildList(model);
	}

	@GetMapping("/view2.ajax")
	public AjaxUserRecipeResult viewAjax2(int rid, Model model) {
		model.addAttribute("rid", rid);
		new AjaxUserRecipeRidCommand().execute(model);
		
		
		return bulidList2(model);
	}

}
