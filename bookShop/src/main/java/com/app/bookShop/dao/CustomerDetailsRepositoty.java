package com.app.bookShop.dao;

import java.util.Collection;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.app.bookShop.dto.CustomerDetail;

public interface CustomerDetailsRepositoty extends JpaRepository<CustomerDetail, Integer> {

	@Query("FROM CustomerDetail WHERE mobileNumber = :mobNum")
	Collection<CustomerDetail> loginCustomer(@Param("mobNum") long num);

}
