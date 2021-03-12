package com.app.bookShop.dto;

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.Data;
import lombok.ToString.Exclude;

@Entity
@Table
public class OrderDetails {

	@Id
	@GeneratedValue
	private int orderId;
	@Column
	private Date orderDate;
	@Column
	private int orderQty;
	@Column
	private double orderAmount;
	
	@OneToMany(cascade = CascadeType.ALL)
	@JoinColumn(name = "order_fk",referencedColumnName = "orderId")
	private List<BookDetails> bookDetails;

	public int getOrderId() {
		return orderId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	public double getOrderQty() {
		return orderQty;
	}

	public void setOrderQty(int orderQty) {
		this.orderQty = orderQty;
	}

	public double getOrderAmount() {
		return orderAmount;
	}

	public void setOrderAmount(double orderAmount) {
		this.orderAmount = orderAmount;
	}

	public List<BookDetails> getBookDetails() {
		return bookDetails;
	}

	public void setBookDetails(List<BookDetails> bookDetails) {
		this.bookDetails = bookDetails;
	}

	@Override
	public String toString() {
		return "OrderDetails [orderId=" + orderId + ", orderDate=" + orderDate + ", orderQty=" + orderQty
				+ ", orderAmount=" + orderAmount + ", bookDetails=" + bookDetails + "]";
	}

	public OrderDetails(Date orderDate, int orderQty, double orderAmount, List<BookDetails> bookDetails) {
		super();
		this.orderDate = orderDate;
		this.orderQty = orderQty;
		this.orderAmount = orderAmount;
		this.bookDetails = bookDetails;
	}

	public OrderDetails() {
		super();
	}
	
}
