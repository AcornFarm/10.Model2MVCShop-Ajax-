package com.model2.mvc.web.product;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.web.bind.annotation.RestController;

import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.product.ProductService;



//==> 회원관리 Controller
@RestController
@RequestMapping("/product/*")
public class ProductRestController {
	
	///Field
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	//setter Method 구현 않음
		
	public ProductRestController(){
		System.out.println(this.getClass());
	}
	
	@RequestMapping(value="json/getProduct/{prodNo}", method=RequestMethod.GET)
	public Product getProduct( @PathVariable int prodNo ) throws Exception {
		
		System.out.println("/product/json/getProduct/{prodNo} : GET");
		
		return productService.getProduct(prodNo);
		
	}
	
	@RequestMapping(value="json/getProduct", method=RequestMethod.POST)
	public Product getProduct( @RequestBody Product product) throws Exception {
		
		System.out.println("/product/json/getProduct : POST");
		
		return productService.getProduct(product.getProdNo());
		
	}
	
	
	
	
//	@RequestMapping(value="getProduct", method=RequestMethod.POST)
//	public String getProduct( @RequestParam("prodNo") int prodNo, Model model, HttpServletRequest request, HttpServletResponse response ) throws Exception {
//		
//		System.out.println("getProduct : POST");
//		//Business Logic
//		Product product = productService.getProduct(prodNo);
//		// Model 과 View 연결
//		model.addAttribute("pvo", product);
//		
//		
//		return  "forward:/product/getProduct.jsp";
//	}
//	
//	@RequestMapping(value="updateProduct", method=RequestMethod.GET)
//	public String updateProductView( @RequestParam("prodNo") int prodNo , Model model ) throws Exception{
//
//		System.out.println("updateProduct : GET");
//		//Business Logic
//		Product product = productService.getProduct(prodNo);
//		// Model 과 View 연결
//		model.addAttribute("pvo", product);
//		
//		return "forward:/product/updateProductView.jsp";
//	}
//	
//	@RequestMapping(value="updateProduct", method=RequestMethod.POST)
//	public String updateUser( @ModelAttribute("pvo") Product product , Model model , HttpSession session) throws Exception{
//
//		System.out.println("updateProduct : POST");
//		//Business Logic
//		productService.updateProduct(product);
//		
//		return "forward:/product/getProduct.jsp";
//	}
//	
//	
	
}