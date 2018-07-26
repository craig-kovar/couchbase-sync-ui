package com.cb.demo.service;

import com.cb.demo.model.Customer;
import com.cb.demo.model.Product;

import java.net.URISyntaxException;
import java.util.List;

public interface ProductService {

  List<Product> getProductRecommendation() throws URISyntaxException;

  List<Customer> fetchCustomersForProducts(String searchText) throws URISyntaxException;
}
