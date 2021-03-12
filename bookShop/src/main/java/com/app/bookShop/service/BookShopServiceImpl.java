package com.app.bookShop.service;



import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.bookShop.dao.BookDetailsRepository;
import com.app.bookShop.dao.CustomerDetailsRepositoty;
import com.app.bookShop.dao.OrderDetailsRepositoty;
import com.app.bookShop.dto.BookDetails;
import com.app.bookShop.dto.CustomerDetail;
import com.app.bookShop.dto.OrderDetails;

@Service
public class BookShopServiceImpl implements BookShopService {

	@Autowired
	private BookDetailsRepository bookRepo;
	@Autowired
	private CustomerDetailsRepositoty cusRepo;
	@Autowired
	private OrderDetailsRepositoty orderRepo;
	public double orderAmount = 0.0;
	public int orderQty = 0;
	@Override
	public boolean addCustomer(CustomerDetail cusObj) {
		try {
			cusRepo.save(cusObj);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		
	}

	@Override
	public CustomerDetail login(CustomerDetail cusObj) {
		// TODO Auto-generated method stub
		 Collection<CustomerDetail> cus =  cusRepo.loginCustomer(cusObj.getMobileNumber());
		 if(cus!= null) {
			 for(CustomerDetail c: cus) {
				if(c.getPassword().equals(cusObj.getPassword())) {
					return c;
				}
			 }
		 }
			 return null;
	}

	@Override
	public List<BookDetails> bookDetailList() {
		System.out.println(bookRepo.findAll());
		return bookRepo.findAll();
	}

	@Override
	public void addBookTemp(int newBookNo,int cusId) {
		CustomerDetail cus =cusRepo.findById(cusId).get();
		cus.setBookDetails(listOfBook(newBookNo,"",cus.getBookDetails()));
		cusRepo.save(cus);
	}

	@Override
	public void removeBook(int bookId,int cusId) {
		CustomerDetail cus =cusRepo.findById(cusId).get();
		cus.setBookDetails(listOfBook(bookId,"remove",cus.getBookDetails()));
		cusRepo.save(cus);
	}
	@Override
	public List<BookDetails> showCart(int cusId) {
		return cusRepo.findById(cusId).get().getBookDetails();
	}

	@Override
	public void orderBook(int cusId) {
		// TODO Auto-generated method stub
		CustomerDetail cus =cusRepo.findById(cusId).get();
		OrderDetails order = new OrderDetails();
		order.setOrderDate(new Date());
		order.setBookDetails(listOfBook(0,"",cus.getBookDetails()));
		order.setOrderQty(orderQty);
		order.setOrderAmount(orderAmount);
//		OrderDetails newOrder = orderRepo.save(order);
//		List<OrderDetails> orr = new ArrayList<OrderDetails>();
//		orr.add(or);
		cus.setBookDetails(null);
		cus.setOrderDetails(listOfOrder(cus.getOrderDetails(),orderRepo.save(order)));
		cusRepo.save(cus);
	}

	public List<BookDetails> listOfBook(int num,String type,List<BookDetails> book){
		List<BookDetails> list = new ArrayList<BookDetails>();
		orderAmount = 0.0;
	    orderQty = 0;
		if(num>0 && type.length()==0) {
			list.add(bookRepo.findById(num).get());
		}

		for(BookDetails b:book) {
			if(!(b.getBookId() == num && !(type.length()==0))) {
			list.add(b);
			orderAmount += b.getBookPrice() * b.getBookQty();
			orderQty += b.getBookQty();
			}
		}
		return list;
	}

	@Override
	public List<OrderDetails> billDetails(int id) {
		return listOfOrder(cusRepo.findById(id).get().getOrderDetails(),null);
	}
	
	public List<OrderDetails> listOfOrder(List<OrderDetails> order,OrderDetails newOrder){
		List<OrderDetails> list = new ArrayList<OrderDetails>();
		if(newOrder != null) {
			list.add(newOrder);
		}
		for(OrderDetails o:order) {
			list.add(o);
		}
		return list;
	}

	@Override
	public CustomerDetail changePassword(CustomerDetail cusObj) {
		 Collection<CustomerDetail> cus =  cusRepo.loginCustomer(cusObj.getMobileNumber());
		 if(cus!= null) {
			 for(CustomerDetail c: cus) {
				 System.out.println(cusObj.getPassword());
				 c.setPassword(cusObj.getPassword());
				return  cusRepo.save(c);
			 }
		 }
			 return null;
	}
}
