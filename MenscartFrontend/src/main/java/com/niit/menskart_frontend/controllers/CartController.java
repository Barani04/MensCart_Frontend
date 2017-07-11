package com.niit.menskart_frontend.controllers;

import java.util.List;
import java.util.Random;

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
		Product pro = prodao.getProductId(proId);
		String username = (String) session.getAttribute("username");
		User user = userDAO.getByUserName(username);
		Cart kart = cartdao.getByUserandProduct(username, proId);
		if (pro.getStock() > 0) {
			if (cartdao.itemAlreadyExist(username, proId)) {
				int qty = kart.getQty() + 1;
				kart.setQty(qty);
				kart.setTotal(pro.getPrice() * qty);
				cartdao.saveOrUpdate(kart);
				System.out.println(qty);
			} 
			else {
				
				cart.setEmailId(user.getEmailId());
				cart.setProductId(proId);
				cart.setQty(1);

				cart.setStatus("N");
				cart.setUserName(username);
				
				cart.setEmailId(user.getEmailId());
				cart.setUserId(user.getUserId());
				cart.setProductName(pro.getProductName());
				cart.setPrice(pro.getPrice());
				cart.setTotal(cart.getQty() * cart.getPrice());
				cartdao.save(cart);

				List<Cart> list = cartdao.getCartItems(username);
				model.addAttribute("cartitems", list);

				int grandtotal = 0;

				for (Cart cart : list) {
					grandtotal = grandtotal + (cart.getQty() * cart.getPrice());
				}
				model.addAttribute("grandtotal", grandtotal);

			}
		
		pro.setStock(pro.getStock() - 1);

		prodao.saveOrUpdate(pro);
		}
		model.addAttribute("title", "-myCart");
		return "redirect:myCart";
	}

	@RequestMapping("myCart")
	public String showCart(Model model, HttpSession session) {
		String username = (String) session.getAttribute("username");
		System.out.println(username);

		List<Cart> list = cartdao.getCartItems(username);
		model.addAttribute("cartitems", list);

		int grandtotal = 0;

		for (Cart cart : list) {
			grandtotal = grandtotal + (cart.getQty() * cart.getPrice());
		}
		model.addAttribute("grandtotal", grandtotal);
		model.addAttribute("title", "-myCart");
		return "cart";
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
		cart.setQty(cart.getQty()-1);
		Product pro = prodao.getProductId(cart.getProductId());
		pro.setStock(pro.getStock()+1);
		prodao.saveOrUpdate(pro);
		cartdao.saveOrUpdate(cart);
			
		return "redirect:myCart";
	}
	
	@RequestMapping("increaseQty")
	public String increaseQty(@RequestParam("itemId") int itemId,HttpSession session,Model model){
		Cart cart = cartdao.getByItemId(itemId);
		cart.setQty(cart.getQty()+1);
		Product pro = prodao.getProductId(cart.getProductId());
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
		model.addAttribute("title", "-History");
		model.addAttribute("isUserClickedHistory", true);
		return "user";
	}

}
