package com.cb.demo.service;

import com.cb.demo.model.Customer;
import com.cb.demo.model.Product;
import com.cb.demo.model.vo.CardsVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import java.net.URI;
import java.net.URISyntaxException;
import java.util.ArrayList;
import java.util.List;

@Service
public class ProductServiceImpl implements ProductService {

  @Autowired private RestTemplate restTemplate;

  @Value("${products.api.url}")
  private String productApiUrl;

  @Value("${customer.api.url}")
  private String customerApiUrl;

  @Override
  public List<Product> getProductRecommendation() throws URISyntaxException {
    URI url = new URI(productApiUrl);

    String email = null;
    Authentication auth = SecurityContextHolder.getContext().getAuthentication();
    email = auth.getName();

    CardsVO cardsVO = new CardsVO();
    cardsVO.setEmail(email);

    HttpHeaders headers = new HttpHeaders();
    headers.setContentType(MediaType.APPLICATION_JSON);

    List<Product> products =
        restTemplate
            .exchange(url, HttpMethod.POST, new HttpEntity<Object>(cardsVO, headers), List.class)
            .getBody();

    return products;
  }

  @Override
  public List<Customer> fetchCustomersForProducts(String searchText) throws URISyntaxException {
    URI url = new URI(customerApiUrl);

    CardsVO cardsVO = new CardsVO();
    cardsVO.setSearchText(searchText);

    HttpHeaders headers = new HttpHeaders();
    headers.setContentType(MediaType.APPLICATION_JSON);

    List<Customer> customers =
        restTemplate
            .exchange(url, HttpMethod.POST, new HttpEntity<Object>(cardsVO, headers), List.class)
            .getBody();

    return customers;
  }

  public List<Product> getStubProducts() {
    List<Product> products = new ArrayList<>();

    Product product = new Product();
    product.setName("COUCHBASE MOBILE");
    product.setDescription("Take amazing digital experiences to the edge.");
    product.setImage("cb-mobile.jpg");
    product.setUrl("https://www.couchbase.com/products/mobile");

    Product product1 = new Product();
    product1.setName("COUCHBASE CLOUD");
    product1.setDescription("Geo-distributed database architected for any cloud.");
    product1.setImage("cb-cloud.jpg");
    product1.setUrl("https://www.couchbase.com/products/cloud");

    products.add(product);
    products.add(product1);

    return products;
  }
}
