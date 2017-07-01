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
	
	String page=null;
	
	@Autowired
	UserDAO userdao;
	
	@Autowired
	User user;
	
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
		
		user= userdao.getByUserName(username);
		
		role = roledao.getByUserName(username);
		
		String r = role.getRole();
			System.out.println("hiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii");
		for (GrantedAuthority role : authorities) {
			System.out.println("byeeeeeeeeeeeeeeeeeeeeeeeeeeeeee");
			System.out.println("Role:" + role.getAuthority() + " User Name:" + username);
			System.out.println("888888888888888888888888888888888");
			if (r.equals("ROLE_ADMIN")) 
			{
				System.out.println("8111114546554");
				page = "admin";
			}
			else if(r.equals("ROLE_USER"))  {
				System.out.println("7777777777777777777777777777777");
				page = "user";
			}
			
			else
			{
				System.out.println("888888888888888888888888888");
				System.out.println("Invalid Credidentials");
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
