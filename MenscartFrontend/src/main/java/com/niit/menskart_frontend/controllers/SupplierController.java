package com.niit.menskart_frontend.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.niit.menscart_backend.DAO.SupplierDAO;
import com.niit.menscart_backend.model.Supplier;

@Controller
public class SupplierController {
	
	@Autowired
	SupplierDAO supplierdao;
	
	@RequestMapping("Supplier")
	public String Supplier(Model model){
		List<com.niit.menscart_backend.model.Supplier> supdetail = supplierdao.list();
		model.addAttribute("supdetail", supdetail);
		model.addAttribute("isUserClickedSupplier", true);
		
		return "home";
	}
	
	@RequestMapping("getUpdateSupplier")
	public String getUpdateSupplier(@RequestParam(value = "supId") int supId,Model model){
		
		com.niit.menscart_backend.model.Supplier sup = supplierdao.getBySupplierId(supId);
		List<com.niit.menscart_backend.model.Supplier> supdetail = supplierdao.list();
		
		boolean flag=true;
		model.addAttribute("flag",flag);
		
		model.addAttribute("supdetail", supdetail);
		model.addAttribute("supplier",sup);
		model.addAttribute("BeforeUpdateSup","true");
		
		return "home";
	}
	
	@RequestMapping("deleteSupplier")
	public String deleteSupplier(@RequestParam(value = "supId") int supId, Model model){
		supplierdao.delete(supId);
		
		boolean flag=false;
		model.addAttribute("flag",flag);
		
		return "redirect:Supplier";
		
	}
	
	@RequestMapping("addsupp")
	public String addsupp(@ModelAttribute Supplier supp, Model model )
	{
		supplierdao.saveOrUpdate(supp);
		
		boolean flag=false;
		model.addAttribute("flag",flag);
		
		return "redirect:Supplier";
	}
	
	@RequestMapping("updatesupp")
	public String updateSupp(@RequestParam("supplierId") int supplierId, @RequestParam("supplierName") String supplierName,@RequestParam("contactNo") String contactNo, @RequestParam("address") String address, Model model){
		
		Supplier sup =new Supplier();
		sup.setSupplierId(supplierId);
		sup.setSupplierName(supplierName);
		sup.setContactNo(contactNo);
		sup.setAddress(address);
		
		supplierdao.saveOrUpdate(sup);
		
		List<Supplier> supdetail = supplierdao.list();
		model.addAttribute("supdetail", supdetail);
		
		boolean flag=false;
		model.addAttribute("flag",flag);
		
		return "redirect:Supplier";
	}

}