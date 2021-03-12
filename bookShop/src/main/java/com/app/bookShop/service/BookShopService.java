package com.app.bookShop.service;

import java.util.List;

import com.app.bookShop.dto.BookDetails;
import com.app.bookShop.dto.CustomerDetail;
import com.app.bookShop.dto.OrderDetails;

public interface BookShopService {

	public boolean addCustomer(CustomerDetail cusObj);
	public CustomerDetail login(CustomerDetail cusObj);
	public List<BookDetails> bookDetailList();
	public void addBookTemp(int newBookNo,int cusId);
	public List<BookDetails> showCart(int cusId);
	public void removeBook(int bookId,int cusId);
	public void orderBook(int cusId);
	public List<OrderDetails> billDetails(int id);
	public CustomerDetail changePassword(CustomerDetail cusObj);
} 
