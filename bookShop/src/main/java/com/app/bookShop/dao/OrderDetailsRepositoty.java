package com.app.bookShop.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import com.app.bookShop.dto.OrderDetails;

public interface OrderDetailsRepositoty extends JpaRepository<OrderDetails, Integer> {

}
