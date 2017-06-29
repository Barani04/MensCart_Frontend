package com.niit.menskart_frontend.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.niit.menscart_backend.DAO.UserDAO;
import com.niit.menscart_backend.model.User;

@Controller
public class SignUpController {
	
	@Autowired
	UserDAO userdao;

	@RequestMapping("newUser")
	public String signUp(@ModelAttribute User user,Model model){
		userdao.saveOrUpdate(user);
		
		return "redirect:user";
		
	}
	
	

}
