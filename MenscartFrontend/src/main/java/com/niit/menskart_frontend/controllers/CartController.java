package com.niit.menskart_frontend.controllers;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.niit.menscart_backend.DAO.CartDAO;
import com.niit.menscart_backend.DAO.ProductDAO;
import com.niit.menscart_backend.DAO.SupplierDAO;
import com.niit.menscart_backend.model.Cart;
import com.niit.menscart_backend.model.Product;
import com.niit.menscart_backend.model.Supplier;
import com.niit.menscart_backend.model.User;


@Controller
public class CartController {

	@Autowired
	ProductDAO prodao;
	
	@Autowired
	CartDAO cartdao;

	@Autowired
	Cart cart;
	@Autowired
	SupplierDAO supdao;
	
	@Autowired
	User user;

	@RequestMapping("productdescription")
	public String prodes(@RequestParam(value="proId") int proId,Model model){
		String message;
		Product pro = prodao.getProductId(proId);
		if(pro.getStock() > 0){
			message = "Available";
		}else{
			message = "Out of Stock";
		}
		Supplier supplier = supdao.getBySupplierId(pro.getSupplierId());
		model.addAttribute("supplier", supplier);
		model.addAttribute("message", message);
		model.addAttribute("proinfo", pro);
		model.addAttribute("isUserClickedProductDes", "true");
		model.addAttribute("title", "prodetails");
		return "home";
	}
	/*@RequestMapping(value="productdescription/{productId}")
	public String prodes(@PathVariable("productId") int productId,Model model){
		Product pro =prodao.getProductId(productId);
		Supplier supplier = supdao.getBySupplierId(pro.getSupplierId());
		model.addAttribute("supplier", supplier);
		model.addAttribute("proinfo", pro);
		
		return"productdescription";
	}*/
	
	@RequestMapping("addToCart")
	public String addToCart(@RequestParam(value="proId") int proId,HttpSession session,@RequestParam("quantity") int quantity,Model model){
		System.out.println(proId);
		System.out.println("------------------------------");
		System.out.println(quantity);
		String username = (String) session.getAttribute("username");
		System.out.println(username);
		cart.setCartId(1001);
		cart.setProductId(proId);
		cart.setQty(quantity);
		
		cart.setStatus("N");
		cart.setUserName(username);
		
		Product pro=prodao.getProductId(proId);
		cart.setEmailId(user.getEmailId());
		
		cart.setProductName(pro.getProductName());
		cart.setPrice(pro.getPrice());
		
		cartdao.saveOrUpdate(cart);
		
		return"cart";
	}
}
