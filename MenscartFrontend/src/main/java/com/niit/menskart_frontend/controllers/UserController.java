package com.niit.menskart_frontend.controllers;

import java.util.Collection;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.niit.menscart_backend.DAO.ProductDAO;
import com.niit.menscart_backend.DAO.RoleDAO;
import com.niit.menscart_backend.DAO.ShipmentDAO;
import com.niit.menscart_backend.DAO.UserDAO;
import com.niit.menscart_backend.model.Product;
import com.niit.menscart_backend.model.Role;
import com.niit.menscart_backend.model.Shipment;
import com.niit.menscart_backend.model.User;

@Controller
public class UserController {

	String page = null;

	@Autowired
	UserDAO userdao;

	@Autowired
	User user;

	@Autowired
	ProductDAO prodao;
	@Autowired
	RoleDAO roledao;

	@Autowired
	Role role;
	@Autowired
	ShipmentDAO shipDAO;
	boolean loggedIn = true;

	@RequestMapping("/login_success")
	public String loginSuccess(HttpSession session, Model model) {
		System.out.println("---Login Successful---");
		String username = SecurityContextHolder.getContext().getAuthentication().getName();

		session.setAttribute("username", username);

		System.out.println(username);
		@SuppressWarnings("unchecked")
		Collection<GrantedAuthority> authorities = (Collection<GrantedAuthority>) SecurityContextHolder.getContext()
				.getAuthentication().getAuthorities();

		role = roledao.getByUserName(username);

		for (GrantedAuthority role : authorities) {
			System.out.println("Role:" + role.getAuthority() + " User Name:" + username);
			if (role.getAuthority().equals("ROLE_ADMIN")) {

				session.setAttribute("adminLoggedIn", loggedIn);
				page = "admin";

			} else {
				session.setAttribute("userLoggedIn", loggedIn);
				List<Product> prodetail = prodao.list();
				model.addAttribute("prodetail", prodetail);
				page = "user";
			}
		}

		return page;
	}

	@RequestMapping("newUser")
	public String signUp(@ModelAttribute User user, @ModelAttribute Shipment shipment,Model model) {

		String message;

		if (userdao.isAllReadyRegister(user.getUserName(), true)) {
			message = "Your user name is Alread registered you have to login";
			model.addAttribute("message", message);
			model.addAttribute("isUserClickedsignup", "true");
			model.addAttribute("title", "-Sign Up");
			return "home";

		} else {
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
			
			shipment.setUserId(user.getUserId());
			shipDAO.saveOrUpdate(shipment);
			message = "You have Successfully Registered";
			model.addAttribute("message", message);
			model.addAttribute("isUserClickedlogin", "true");
			model.addAttribute("title", "-Log In");
			return "home";
		}
		
	}

}
