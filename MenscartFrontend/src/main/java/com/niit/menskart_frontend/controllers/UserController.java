package com.niit.menskart_frontend.controllers;

import java.util.Collection;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.niit.menscart_backend.DAO.RoleDAO;
import com.niit.menscart_backend.DAO.UserDAO;
import com.niit.menscart_backend.model.Role;
import com.niit.menscart_backend.model.User;

@Controller
public class UserController {

	String page;
	
	@Autowired
	UserDAO userdao;
	
	@Autowired
	RoleDAO roledao;
	
	@Autowired
	Role role;

	@RequestMapping("/login_success")
	public String loginSuccess(HttpSession session) {
		System.out.println("---Login Successful---");
		String username = SecurityContextHolder.getContext().getAuthentication().getName();

		session.setAttribute("username", username);

		Collection<GrantedAuthority> authorities = (Collection<GrantedAuthority>) SecurityContextHolder.getContext()
				.getAuthentication().getAuthorities();

		for (GrantedAuthority role : authorities) {
			System.out.println("Role:" + role.getAuthority() + " User Name:" + username);

			if (role.equals("ROLE_ADMIN")) {
				page = "admin";
			} else {
				page = "user";
			}
		}

		return page;
	}

	@RequestMapping("newUser")
	public String signUp(@ModelAttribute User user, Model model) {
		
		user.setEnabled(true);
		role.setRole("ROLE_USER");
		role.setUserName(user.getUserName());
		role.setContactNo(user.getContactNo());
		role.setEmailId(user.getEmailId());
		user.setEnabled(true);
		
		user.setRole(role);
		role.setUser(user);
		
		
		userdao.saveOrUpdate(user);
		roledao.saveOrUpdate(role);
		return "login";

	}
}
