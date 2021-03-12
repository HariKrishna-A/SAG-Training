package com.app.bookShop.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.app.bookShop.dto.BookDetails;
import com.app.bookShop.dto.CustomerDetail;
import com.app.bookShop.dto.OrderDetails;
import com.app.bookShop.service.BookShopService;

@Controller
public class BookShopController {

	@Autowired
	private BookShopService service;
	public int userId=0;
	@RequestMapping("/")
	public String cusRegister(Model model) {

		CustomerDetail cusObj = new CustomerDetail();
		model.addAttribute("user", cusObj);
		return "register";
	}

	@RequestMapping("/addUser")
	public String insertUser(@ModelAttribute CustomerDetail cusObj,HttpSession session) {
		System.out.println(cusObj);
		if (service.addCustomer(cusObj)) {
			System.out.println("inserted successfully");
			session.setAttribute("register", "done");
			return "redirect:/login";
		} else {
			System.out.println("Try again.");
			session.setAttribute("register", "not");
			return "register";
		}
	}
	@RequestMapping("/login")
	public String login(@ModelAttribute("user") CustomerDetail cusObj) {
			
			return "login";
	
	}
	@RequestMapping("/loginUser")
	public String loginUser(@ModelAttribute("user") CustomerDetail cusObj,HttpSession session) {

		CustomerDetail cusDetails = service.login(cusObj);
		if (cusDetails != null) {
			session.setAttribute("userId", cusDetails.getCusId());
			userId = cusDetails.getCusId();
			System.out.println(userId);
			return "redirect:/listBooks";
		} else {
			userId = 0;
			session.setAttribute("userExist", "no");
			System.out.println("try again to login");
			return "login";
		}
	}
	@RequestMapping("/changePass")
	public String change(@ModelAttribute("user") CustomerDetail cusObj) {
			
			return "changePass";
	
	}
	@RequestMapping("/changePassw")
	public String changePass(@ModelAttribute("user") CustomerDetail cusObj,HttpSession session) {

		CustomerDetail cusDetails = service.changePassword(cusObj);
		if (cusDetails != null) {
			userId = 0;
			session.setAttribute("pass", "done");
			return "redirect:/login";
		}
		else {
		session.setAttribute("pass","not");
		return "redirect:/changePassw";
		}
	}
	@RequestMapping("/listBooks")
	public String listAllBooks(Model model,HttpSession session) {
		System.out.println(model);
		if(userId != 0) {
		List<BookDetails> allBooks = service.bookDetailList();

		model.addAttribute("books", allBooks);

		System.out.println("login successfully");

		return "listBooks";
		}
		else {
			session.setAttribute("userExist", "first");
			return "redirect:/login";
		}
	}

	@RequestMapping("/addCart")
	public String addToCart(@RequestParam("id") int book_id) {

		service.addBookTemp(book_id,userId);

		return "redirect:/cart";
		
	}

	@RequestMapping("/removeCart")
	public String removeFrmCart(@RequestParam("id") int book_id) {
		service.removeBook(book_id,userId);
		return "redirect:/cart";
	}

	@RequestMapping("/order")
	public String order(@RequestParam("id") int book_id) {
		service.orderBook(userId);
		return "redirect:/billDetails";
	}
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		if(userId !=0) {
		userId = 0;
		session.setAttribute("userExist", "logout");
		return "redirect:/login";
		}
		else {
		session.setAttribute("userExist", "first");
		return "redirect:/login";
		}
	}

	@RequestMapping("/cart")
	public String showCart(Model model,HttpSession session) {
		if(userId != 0) {

			List<BookDetails> list = service.showCart(userId);
			if(list.size() == 0) {
				session.setAttribute("cart", "nocart");
			}
			model.addAttribute("cartList", list);
			return "cart";		
//		System.out.println(service.billDetails(userId));
		}
		else {
			session.setAttribute("userExist", "first");
			return "redirect:/login";
		}
	}

	@RequestMapping("/billDetails")
	public String billDetails(Model model,HttpSession session) {
		if(userId != 0) {

		List<OrderDetails> list = service.billDetails(userId);
		if(list.size() == 0) {
			session.setAttribute("bill", "nobill");
		}
		model.addAttribute("orders", list);
		return "billDetails";
		}
		else {
			session.setAttribute("userExist", "first");
			return "redirect:/login";
		}
	}
}
