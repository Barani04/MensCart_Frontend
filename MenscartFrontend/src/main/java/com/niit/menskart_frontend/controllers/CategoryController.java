package com.niit.menskart_frontend.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.niit.menscart_backend.DAO.CategoryDAO;
import com.niit.menscart_backend.model.Category;

@Controller
public class CategoryController {
	
	@Autowired
	CategoryDAO categoryDAO;
	
	@RequestMapping("Category")
	public String showCategory(Model model){
		
		List<Category> catdetail = categoryDAO.list();
		model.addAttribute("catdetail", catdetail);
		model.addAttribute("isUserClickedCategory", "true");
		model.addAttribute("title", "Category");
		
		return"admin";
	}
	
	@RequestMapping("getUpdateCat")
	public String getUpdateCat(@RequestParam(value = "catId") int catId, Model model){
		
		Category cat = categoryDAO.getByCategoryId(catId);
		List<Category> catdetail = categoryDAO.list();
		
		boolean flag=true;
		model.addAttribute("flag",flag);
		
		model.addAttribute("catdetail", catdetail);
		model.addAttribute("category", cat);
		model.addAttribute("Before", "true");
		
		return "admin";
	}
	
	@RequestMapping("updatecat")
	public String updateCat(@RequestParam("categoryId") int categoryId, @RequestParam("categoryName") String categoryName, @RequestParam("description") String description,Model model){
		
		Category cat = new Category();
		cat.setCategoryId(categoryId);
		cat.setCategoryName(categoryName);
		cat.setDescription(description);
		
		categoryDAO.saveOrUpdate(cat);
		
		List<Category> catdetail = categoryDAO.list();
		model.addAttribute("catdetail", catdetail);
		
		boolean flag=false;
		model.addAttribute("flag",flag);
		
		return "redirect:Category";
	}
	@RequestMapping("deleteCategory")
	public String deleteCategory(@RequestParam(value = "catId") int catId, Model model){
		categoryDAO.delete(catId);
		return "redirect:Category";
		
	}
	
	@RequestMapping("addcat")
	public String add(@ModelAttribute Category cat, Model m)
	{
		categoryDAO.saveOrUpdate(cat);
		
		return "redirect:Category";
	}
	
}
