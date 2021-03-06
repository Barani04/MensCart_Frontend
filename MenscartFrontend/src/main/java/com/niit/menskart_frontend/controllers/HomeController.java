package com.niit.menskart_frontend.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.niit.menscart_backend.DAO.ProductDAO;
import com.niit.menscart_backend.model.Product;

@Controller
public class HomeController {

	@Autowired
	ProductDAO prodao;
	
	@RequestMapping("/")
	public String home(Model model) {
		
		List<Product> prodetail = prodao.list();
		model.addAttribute("prodetail", prodetail);
		return "home";

	}
	
	@RequestMapping("home")
	public String showhome(Model model) {
		List<Product> prodetail = prodao.list();
		model.addAttribute("prodetail", prodetail);
		model.addAttribute("isUserClickedhome", "true");
		model.addAttribute("title", "-home");
		
		return "home";
	}
	
	@RequestMapping("About")
	public String About(Model model) {
		model.addAttribute("isUserClickedAbout", "true");
		model.addAttribute("title", "-About Us");
		return "home";
	}
	
	@RequestMapping("Contact")
	public String Contact(Model model) {
		model.addAttribute("isUserClickedContact", "true");
		model.addAttribute("title", "-Contact Us");
		return "home";
	}

	@RequestMapping("login")
	public String login(@RequestParam(value = "error", required = false) String error, 
			@RequestParam(value = "logout", required = false) String logout, Model model) {
		
		if(error != null) {
			model.addAttribute("error", "Username or Password Incorrect");
			}
		
		if(logout != null) {
			model.addAttribute("logout", "Logged out Successfully");
			}
		model.addAttribute("isUserClickedlogin", "true");
		model.addAttribute("title", "-Log In");
		return "home";
	}

	@RequestMapping("signup")
	public String signup(Model model) {
		model.addAttribute("isUserClickedsignup", "true");
		model.addAttribute("title", "-Sign Up");
		return "home";
	}
	
	@RequestMapping("admin")
	public String adminPage(Model model){
		
		model.addAttribute("adminLoggedIn", "true");
		return "admin";
	}

}
