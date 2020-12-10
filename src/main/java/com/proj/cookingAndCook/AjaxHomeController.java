package com.proj.cookingAndCook;

import java.util.List;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.command.ajax.recipe.AjaxRecipeRidCommand;
import com.command.ajax.userRecipe.AjaxUserRecipeRidCommand;
import com.proj.beans.cookingcls.AjaxRecipeList;
import com.proj.beans.userRecipe.AjaxUserRecipeResult;
import com.proj.beans.userRecipe.UserRecipeDTO;
import com.proj.command.cookingcls.RecipeRidCommand;

@RestController
public class AjaxHomeController {

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
		new AjaxRecipeRidCommand().execute(model);

		return buildList(model);
	}

	@GetMapping("/view2.ajax")
	public AjaxUserRecipeResult viewAjax2(int rid, Model model) {
		model.addAttribute("rid", rid);
		new AjaxUserRecipeRidCommand().execute(model);

		return bulidList2(model);
	}

}
