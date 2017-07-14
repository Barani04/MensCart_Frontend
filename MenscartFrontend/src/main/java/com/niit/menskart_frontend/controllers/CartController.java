package com.niit.menskart_frontend.controllers;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.niit.menscart_backend.DAO.CartDAO;
import com.niit.menscart_backend.DAO.ProductDAO;
import com.niit.menscart_backend.DAO.SupplierDAO;
import com.niit.menscart_backend.DAO.UserDAO;
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
	UserDAO userDAO;

	@RequestMapping("productdescription")
	public String prodes(@RequestParam(value = "proId") int proId, Model model) {
		Product pro = prodao.getProductId(proId);
		Supplier supplier = supdao.getBySupplierId(pro.getSupplierId());
		model.addAttribute("supplier", supplier);
		model.addAttribute("proinfo", pro);
		model.addAttribute("isUserClickedProductDes", "true");
		model.addAttribute("title", "-prodetails");
		return "user";
	}

	@RequestMapping("addToCart")
	public String addToCart(@RequestParam(value = "proId") int proId, HttpSession session, Model model) {
		System.out.println("-------------------------------------------------------------------1");
		Product pro = prodao.getProductId(proId);
		String username = (String) session.getAttribute("username");
		User user = userDAO.getByUserName(username);
		Cart kart = cartdao.getByUserandProduct(username, proId);
		if (pro.getStock() > 0) {
			System.out.println("-------------------------------------------------------------------2");
			Date d1 = new java.sql.Date(new java.util.Date().getTime());
			if (cartdao.itemAlreadyExist(username, proId)) {
				int qty = kart.getQty() + 1;
				kart.setQty(qty);
				kart.setCuDate(d1);
				kart.setTime(new java.sql.Time(d1.getTime()));
				kart.setTotal(pro.getPrice() * qty);
				System.out.println("-------------------------------------------------------------------3");
				cartdao.saveOrUpdate(kart);
				System.out.println(qty);
				System.out.println(username);
				System.out.println("-------------------------------------------------------------------4");
			} 
			else {
				System.out.println("-------------------------------------------------------------------5");
				System.out.println(user.getEmailId());
				cart.setEmailId(user.getEmailId());
				System.out.println(pro.getProductId());
				cart.setProductId(proId);
				System.out.println(1);
				cart.setQty(1);
				cart.setCuDate(d1);
				cart.setTime(new java.sql.Time(d1.getTime()));
				System.out.println("New");
				cart.setStatus("New");
				System.out.println(username);
				cart.setUserName(username);
				System.out.println(user.getUserId());
				cart.setUserId(user.getUserId());
				System.out.println(pro.getProductName());
				cart.setProductName(pro.getProductName());
				System.out.println(pro.getPrice());
				cart.setPrice(pro.getPrice());
				System.out.println(cart.getQty() * cart.getPrice());
				cart.setTotal(cart.getQty() * cart.getPrice());
				System.out.println("-------------------------------------------------------------------6");
				cartdao.save(cart);
				System.out.println("-------------------------------------------------------------------7");
				List<Cart> list = cartdao.getCartItems(username);
				model.addAttribute("cartitems", list);

				int grandtotal = 0;

				for (Cart cart : list) {
					grandtotal = grandtotal + (cart.getQty() * cart.getPrice());
				model.addAttribute("grandtotal", grandtotal);
				}
			}
		pro.setStock(pro.getStock() - 1);

		prodao.saveOrUpdate(pro);
		}
		
		return "redirect:myCart";
	}

	@RequestMapping("myCart")
	public String showCart(Model model, HttpSession session) {
		String username = (String) session.getAttribute("username");
		System.out.println(username);
		int grandtotal = 0;
		List<Cart> list = cartdao.getCartItems(username);
		if(list != null && !list.isEmpty())
		{
			model.addAttribute("cartitems", list);

			

			for (Cart cart : list) {
				grandtotal = grandtotal + (cart.getQty() * cart.getPrice());
			}
			model.addAttribute("grandtotal", grandtotal);
			
			return "cart";
		}
		else
		{
			model.addAttribute("isUserClikedEmptyCart", true);
			return "user";
		}
	}

	@RequestMapping("removeCart")
	public String removeCart(@RequestParam("itemId") int itemId, HttpSession session, Model model) {

		Cart cart = cartdao.getByItemId(itemId);
		Product pro = prodao.getProductId(cart.getProductId());
		
		pro.setStock(pro.getStock()+cart.getQty());
		prodao.saveOrUpdate(pro);
		cartdao.deleteCartItem(cart);
		return "redirect:myCart";
	}
	
	@RequestMapping("decreaseQty")
	public String decreaseQty(@RequestParam("itemId") int itemId,HttpSession session,Model model){
		Cart cart = cartdao.getByItemId(itemId);
		Product pro = prodao.getProductId(cart.getProductId());
		if(cart.getQty()>1){
		Date d1 = new java.sql.Date(new java.util.Date().getTime());
		cart.setQty(cart.getQty()-1);
		cart.setCuDate(d1);
		cart.setTime(new java.sql.Time(d1.getTime()));
		cart.setTotal(pro.getPrice()*cart.getQty());
		pro.setStock(pro.getStock()+1);
		
		}
		else{
			cart.setQty(1);
		}
		
		prodao.saveOrUpdate(pro);
		cartdao.saveOrUpdate(cart);
		return "redirect:myCart";
	}
	
	@RequestMapping("increaseQty")
	public String increaseQty(@RequestParam("itemId") int itemId,HttpSession session,Model model){
		Cart cart = cartdao.getByItemId(itemId);
		Product pro = prodao.getProductId(cart.getProductId());
		cart.setQty(cart.getQty()+1);
		Date d1 = new java.sql.Date(new java.util.Date().getTime());
		cart.setCuDate(d1);
		cart.setTime(new java.sql.Time(d1.getTime()));
		cart.setTotal(pro.getPrice()*cart.getQty());
		pro.setStock(pro.getStock()-1);
		prodao.saveOrUpdate(pro);
		cartdao.saveOrUpdate(cart);
				
		return "redirect:myCart";
	}
	
	@RequestMapping("History")
	public String Ordered(Model model, HttpSession session){
		String username = (String) session.getAttribute("username");
		System.out.println(username);

		List<Cart> list = cartdao.getDispatchItems(username);
		model.addAttribute("cartitems", list);
		//model.addAttribute("title", "-History");
		model.addAttribute("isUserClickedHistory", true);
		return "user";
	}

}
