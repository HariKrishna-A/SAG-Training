package com.app.bookShop.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.app.bookShop.dto.BookDetails;

public interface BookDetailsRepository extends JpaRepository<BookDetails, Integer> {

}
