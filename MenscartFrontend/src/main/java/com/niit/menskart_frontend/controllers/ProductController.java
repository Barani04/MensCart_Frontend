package com.niit.menskart_frontend.controllers;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.niit.menscart_backend.DAO.CategoryDAO;
import com.niit.menscart_backend.DAO.ProductDAO;
import com.niit.menscart_backend.DAO.SupplierDAO;
import com.niit.menscart_backend.model.Category;
import com.niit.menscart_backend.model.Product;
import com.niit.menscart_backend.model.Supplier;

@Controller
public class ProductController {

	@Autowired
	ProductDAO prodao;

	@Autowired
	CategoryDAO categoryDAO;

	@Autowired
	SupplierDAO supplierdao;

	@RequestMapping("Product")
	public String showProduct(Model model) {

		List<Category> catdetail = categoryDAO.list();
		List<Supplier> supdetail = supplierdao.list();
		List<Product> prodetail = prodao.list();
		model.addAttribute("prodetail", prodetail);
		model.addAttribute("supdetail", supdetail);
		model.addAttribute("catdetail", catdetail);
		model.addAttribute("isUserClickedProduct", "true");

		return "home";
	}

	@RequestMapping("getUpdatePro")
	public String getUpdatePro(@RequestParam(value = "proId") int proId, Model model) {

		Product product = prodao.getProductId(proId);
		List<Category> catdetail = categoryDAO.list();
		List<Supplier> supdetail = supplierdao.list();
		List<Product> prodetail = prodao.list();

		boolean flag = true;
		model.addAttribute("flag", flag);

		model.addAttribute("prodetail", prodetail);
		model.addAttribute("product", product);
		model.addAttribute("supdetail", supdetail);
		model.addAttribute("catdetail", catdetail);
		model.addAttribute("BeforeUpdate", "true");
		return "home";
	}

	@RequestMapping("addpro")
	public String addPro(@ModelAttribute Product pro, Model model, @RequestParam("pimage") MultipartFile filedet) {

		prodao.saveOrUpdate(pro);

		System.out.println("-------Image Insert Start--------");

		String path = "E://project1/menscart/MenscartFrontend/src/main/webapp/WEB-INF/resources/images/";

		String fileinfo = path + pro.getProductId() + ".jpg";

		File f = new File(fileinfo);

		if (!filedet.isEmpty()) {
			try {
				byte buff[] = filedet.getBytes();
				FileOutputStream fos = new FileOutputStream(f);
				BufferedOutputStream bs = new BufferedOutputStream(fos);
				bs.write(buff);
				bs.close();
				fos.close();
			} catch (Exception e) {
				System.out.println("Exception Arised");
			}
		} else {
			System.out.println("---File Uploding Problem---");
		}

		System.out.println("-------Image insert Success------");

		boolean flag = false;
		model.addAttribute("flag", flag);

		return "redirect:Product";
	}

	@RequestMapping("updatepro")
	public String updatePro(@ModelAttribute Product pro, Model model) {

		

		prodao.saveOrUpdate(pro);

		List<Product> prodetail = prodao.list();
		model.addAttribute("prodetail", prodetail);

		boolean flag = false;
		model.addAttribute("flag", flag);

		return "redirect:Product";
	}

	@RequestMapping("deleteProduct")
	public String deleteProduct(@RequestParam(value = "proId") int proId, Model model) {
		prodao.delete(proId);

		boolean flag = false;
		model.addAttribute("flag", flag);

		return "redirect:Product";

	}

}
