package com.niit.menskart_frontend.controllers;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
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
		String username = (String) session.getAttribute("username");
		User user = userdao.getByUserName(username);
		int id=user.getUserId();
		List<Shipment> shipdetail = shipdao.getByUserId(id);
		boolean flag = true;
		model.addAttribute("flag", flag);
		
		model.addAttribute("shipdetail", shipdetail);
		model.addAttribute("ship", ship);
		model.addAttribute("isUserClickedAdd", true);
		model.addAttribute("BeforeUpdate", "true");
		return "user";
	}
	@RequestMapping("updateAdd")
	public String updateAdd(@ModelAttribute Shipment ship,HttpSession session,Model model){
		
		String username = (String) session.getAttribute("username");
		User user = userdao.getByUserName(username);
		int id=user.getUserId();
		System.out.println(ship.getShipmentId());
		ship.setUserId(user.getUserId());
		ship.setEmailId(user.getEmailId());
		shipdao.saveOrUpdate(ship);	
		List<Shipment> shipdetail = shipdao.getByUserId(id);
		model.addAttribute("shipdetail", shipdetail);
		model.addAttribute("isUserClickedViewShipAddress", true);
		return"user";
	}	
	
	@RequestMapping("proceed")
	public String proceed(@ModelAttribute Shipment ship,HttpSession session,Model model){
		String username = (String) session.getAttribute("username");
		User user = userdao.getByUserName(username);
		int id=user.getUserId();
		if(cartdao.getByUserName(username)==false){
			
			return "redirect:myCart";
		}
		else{
				List<Shipment> shipdetail = shipdao.getByUserId(id);
				model.addAttribute("shipdetail", shipdetail);
				model.addAttribute("isUserClickedViewShipAddress", true);
				model.addAttribute("title", "-ShippingAddress");
				return"user";
			}
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
		 
		
		
			List<Cart> kart = cartdao.getCartItems(username);
			Date date= kart.get(0).getCuDate();
			for (Cart k : kart) {
				int cid=k.getCartId();
				if(cid>0){
					
					k.setCartId(cid);
				}
				else{
						k.setCartId(id); 
				}
				k.setShipmentId(shipmentId);
				
				cartdao.saveOrUpdate(k);
			}
			int subtotal = 0;
			int deliver= 50;
			for (Cart c: kart) {
				subtotal = subtotal + (c.getQty() * c.getPrice());
			}
			if(subtotal>=1000)
			{
				deliver = 0;
			}
			int rid = kart.get(0).getCartId();
			model.addAttribute("rid", rid);
			model.addAttribute("subtotal", subtotal);
			model.addAttribute("deliver", deliver);
			Shipment ship = shipdao.getByShipmentId(shipmentId);
			List<Shipment> shipdetail = shipdao.getByUserId(id);
			model.addAttribute("shipdetail", shipdetail);
			model.addAttribute("ship", ship);
			model.addAttribute("kart", kart);
			model.addAttribute("date", date);
			model.addAttribute("isUserClickedDeliver", true);
		return "user";			
		
	}
	@RequestMapping("deleteAdd")
	public String deleteAdd(@RequestParam(value="shipmentId") int shipmentId,HttpSession session,Model model){
		shipdao.delete(shipmentId);
		String username = (String) session.getAttribute("username");
		User user = userdao.getByUserName(username);
		int id=user.getUserId();
		List<Shipment> shipdetail = shipdao.getByUserId(id);
		model.addAttribute("shipdetail", shipdetail);
		model.addAttribute("isUserClickedViewShipAddress", true);		
		return "user";
	}
	
	@RequestMapping("ThankYou")
	public String thankYou(HttpSession session,Model model){
		String pattern = "dd-MM-yyyy";
		SimpleDateFormat sdf = new SimpleDateFormat(pattern);
		String username = (String) session.getAttribute("username");
		List<Cart> kart = cartdao.getCartItems(username);
		Random random = new Random();
		int day = 2+ random.nextInt(6);
		Calendar cal = Calendar.getInstance();
		Date date= kart.get(0).getCuDate();
		cal.setTime(date);
		
		cal.add(Calendar.DATE,day);		
		for (Cart k : kart) { 
			k.setStatus("Dispatched");
			k.setdDate(cal.getTime());
			cartdao.saveOrUpdate(k);
		}
		String delDate = sdf.format(kart.get(0).getdDate());
		model.addAttribute("delDate",delDate);
		model.addAttribute("isUserClickedThankYou", true);
		return"user";
	}
	@RequestMapping("payment")
	public String payment(@RequestParam("shipmentId") int shipmentId,HttpSession session,Model model){
		String username = (String) session.getAttribute("username");
		int subtotal =0;
		int id=0;
		List<Cart> kart = cartdao.getCartItems(username);
		
		for (Cart c: kart) {
			subtotal = subtotal + (c.getQty() * c.getPrice());
			id = c.getCartId();
		}
		model.addAttribute("id", id);
		model.addAttribute("subtotal", subtotal);
		model.addAttribute("isUserClickedPayment", true);
		return"user";
	}
	
	
}
