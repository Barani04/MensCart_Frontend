package com.niit.menskart_frontend.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.niit.menscart_backend.DAO.RoleDAO;
import com.niit.menscart_backend.DAO.UserDAO;
import com.niit.menscart_backend.model.Role;
import com.niit.menscart_backend.model.User;

@Controller
public class UserController {
	
	@Autowired
	private UserDAO userDAO;
	
	@Autowired
	private Role role;
	
	@Autowired
	private RoleDAO roleDAO;
	
	@RequestMapping("newUser")
	public String newUser(@ModelAttribute User user){
		/*String message;*/
		
		role.setRole("ROLE_USER");
		role.setUserName(user.getUserName());
		role.setContactNo(user.getContactNo());
		role.setEmailId(user.getEmailId());
		user.setEnabled(true);
		
		userDAO.saveOrUpdate(user);
		roleDAO.saveOrUpdate(role);
		
		return "home";
	}
	

}
