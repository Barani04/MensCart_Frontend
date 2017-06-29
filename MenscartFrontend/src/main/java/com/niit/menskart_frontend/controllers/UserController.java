package com.niit.menskart_frontend.controllers;

import java.util.Collection;

import javax.servlet.http.HttpSession;

/*import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;*/
import org.springframework.stereotype.Controller;
/*import org.springframework.web.bind.annotation.RequestMapping;*/

@Controller
public class UserController {
	
	String page;
	
	/*@RequestMapping("/login_success")
	public String loginSuccess(HttpSession session)
	{
		System.out.println("---Login Successful---");
		String username = SecurityContextHolder.getContext().getAuthentication().getName();
		
		session.setAttribute("username", username);
		
		Collection<GrantedAuthority> authorities = (Collection<GrantedAuthority>) SecurityContextHolder.getContext().getAuthentication().getAuthorities();
		
		for(GrantedAuthority role:authorities)
		{
			System.out.println("Role:"+role.getAuthority()+" User Name:"+username);
			
			if(role.equals("ROLE_ADMIN"))
			{
				page = "admin";
			}
			else
			{
				page="user";
			}
		}
		
		return page;
	}*/
}
