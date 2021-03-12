package com.app.bookShop.dto;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.Data;
import lombok.EqualsAndHashCode.Exclude;

@Entity
@Table
public class CustomerDetail {
	
	@Id
	@GeneratedValue
    private int cusId;
    @Column
	private String cusName;
    @Column
	private String password;
    @Column(unique = true)
    private long mobileNumber;
    @Column
	private String address;
        
	@OneToMany(cascade = CascadeType.ALL)
	@JoinColumn(name = "cus_fk",referencedColumnName = "cusId")
	private List<BookDetails> bookDetails;
	@OneToMany(cascade = CascadeType.ALL)
	@JoinColumn(name = "cus_fk",referencedColumnName = "cusId")
	private List<OrderDetails> orderDetails;
	public CustomerDetail(String cusName, String password, long mobileNumber, String address,
			List<BookDetails> bookDetails, List<OrderDetails> orderDetails) {
		super();
		this.cusName = cusName;
		this.password = password;
		this.mobileNumber = mobileNumber;
		this.address = address;
		this.bookDetails = bookDetails;
		this.orderDetails = orderDetails;
	}
	public int getCusId() {
		return cusId;
	}
	public void setCusId(int cusId) {
		this.cusId = cusId;
	}
	public String getCusName() {
		return cusName;
	}
	public void setCusName(String cusName) {
		this.cusName = cusName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public long getMobileNumber() {
		return mobileNumber;
	}
	public void setMobileNumber(long mobileNumber) {
		this.mobileNumber = mobileNumber;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public List<BookDetails> getBookDetails() {
		return bookDetails;
	}
	public void setBookDetails(List<BookDetails> bookDetails) {
		this.bookDetails = bookDetails;
	}
	public List<OrderDetails> getOrderDetails() {
		return orderDetails;
	}
	public void setOrderDetails(List<OrderDetails> orderDetails) {
		this.orderDetails = orderDetails;
	}
	@Override
	public String toString() {
		return "CustomerDetail [cusId=" + cusId + ", cusName=" + cusName + ", password=" + password + ", mobileNumber="
				+ mobileNumber + ", address=" + address + ", bookDetails=" + bookDetails + ", orderDetails="
				+ orderDetails + "]";
	}
	public CustomerDetail() {
		super();
	}
	
	
	
	
}
