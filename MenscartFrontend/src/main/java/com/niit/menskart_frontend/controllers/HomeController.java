package com.niit.menskart_frontend.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {

	@RequestMapping("/")
	public String home() {
		
		return "home";

	}
	
	@RequestMapping("home")
	public String home(Model model) {
		model.addAttribute("isUserClickedhome", "true");
		
		return "home";
	}

	@RequestMapping("login")
	public String login(Model model) {
		model.addAttribute("isUserClickedlogin", "true");

		return "home";
	}

	@RequestMapping("signup")
	public String signup(Model model) {
		model.addAttribute("isUserClickedsignup", "true");

		return "home";
	}

}
