package com.niit.menskart_frontend.controllers;

import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
		List<Shipment> shipdetail = shipdao.list();
		model.addAttribute("shipdetail", shipdetail);
		model.addAttribute("isUserClickedAdd", true);
		return"user";
	}
	
	@RequestMapping("getUpdateAdd")
	public String getUpdateAdd(@RequestParam(value="shipmentId") int shipmentId,HttpSession session,Model model)
	{
		Shipment ship = shipdao.getByShipmentId(shipmentId);
		List<Shipment> shipdetail = shipdao.list();
		
		boolean flag = true;
		model.addAttribute("flag", flag);
		
		model.addAttribute("shipdetail", shipdetail);
		return "home";
	}
	@RequestMapping("updateAdd")
	public String updateAdd(@ModelAttribute Shipment ship,HttpSession session,Model model){
		String username = (String) session.getAttribute("username");
		User user = userdao.getByUserName(username);
		boolean flag = false;
		model.addAttribute("flag", flag);
		shipdao.saveOrUpdate(ship);
		int id=user.getUserId();
		List<Shipment> shipdetail = shipdao.getByUserId(id);
		model.addAttribute("shipdetail", shipdetail);
		return"redirect:viewShipAddress";
	}	
	
	@RequestMapping("proceed")
	public String proceed(@ModelAttribute Shipment ship,HttpSession session,Model model){
		String username = (String) session.getAttribute("username");
		User user = userdao.getByUserName(username);
		int id=user.getUserId();
		List<Shipment> shipdetail = shipdao.getByUserId(id);
		model.addAttribute("shipdetail", shipdetail);
		model.addAttribute("isUserClickedViewShipAddress", true);
		return"user";
	}
	
	@RequestMapping("addAddress")
	public String addAddress(@ModelAttribute Shipment ship,HttpSession session,Model model){
		String username = (String) session.getAttribute("username");
		User user = userdao.getByUserName(username);
		ship.setUserId(user.getUserId());
		ship.setEmailId(user.getEmailId());
		shipdao.saveOrUpdate(ship);
		boolean flag = false;
		model.addAttribute("flag", flag);
		int id=user.getUserId();
		List<Shipment> shipdetail = shipdao.getByUserId(id);
		model.addAttribute("shipdetail", shipdetail);
		model.addAttribute("isUserClickedViewShipAddress", true);
		return"user";
	}
	
	@RequestMapping("add")
	public String add(Model model){
				
		model.addAttribute("isUserClickedAdd", true);
		return"user";
	}
	@RequestMapping("pay")
	public String pay(@RequestParam("shipmentId") int shipmentId,HttpSession session,Model model){
		String username = (String) session.getAttribute("username");
		Random random = new Random();
		int id =1000+random.nextInt(999);
		cart.setCartId(id);
			List<Cart> kart = cartdao.getCartItems(username);
			for (Cart k : kart) {
				k.setCartId(id); 
				k.setShipmentId(shipmentId);
				cartdao.saveOrUpdate(k);
			}
			
		return "user";
				
		
	}
}
