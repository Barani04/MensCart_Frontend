package com.niit.menskart_frontend.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.niit.menscart_backend.DAO.CartDAO;
import com.niit.menscart_backend.DAO.ShipmentDAO;
import com.niit.menscart_backend.DAO.UserDAO;
import com.niit.menscart_backend.model.Cart;
import com.niit.menscart_backend.model.Shipment;
import com.niit.menscart_backend.model.User;

@Controller
public class ShippingController {
	
	@Autowired
	ShipmentDAO shipdao;
	
	@Autowired
	UserDAO userdao;
	
	@Autowired
	CartDAO cartdao;
	
	@Autowired
	private Cart cart;
	
	@RequestMapping("newAddress")
	public String newAddress(@ModelAttribute Shipment ship,HttpSession session,Model model){
		String username = (String) session.getAttribute("username");
		User user = userdao.getByUserName(username);
		ship.setUserId(user.getUserId());
		
		
		return"viewShipAddress";
	}

}
