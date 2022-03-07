package com.ecommerce.app.dao.impl;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.ecommerce.app.dao.ProductDao;
import com.ecommerce.app.entity.Product;

@Repository
public class ProductDaoImpl implements ProductDao {

	static List<Product> productsList = new ArrayList<>();
	
	public ProductDaoImpl() {
		Product product1 = new Product();
		product1.setProductId(1);
		product1.setProductName("MAC OS");
		product1.setProductCategory("Computers");
		product1.setProductPrice(25000.0);
		product1.setProductQuantity(100.0);
		
		Product product2 = new Product();
		product2.setProductId(2);
		product2.setProductName("LENOVO");
		product2.setProductCategory("Computers");
		product2.setProductPrice(25000.00);
		product2.setProductQuantity(120.0);
		
		Product product3 = new Product();
		product3.setProductId(3);
		product3.setProductName("SAMSUNG");
		product3.setProductCategory("Phones");
		product3.setProductPrice(8000.0);
		product3.setProductQuantity(112.0);
		
		
		productsList.add(product1);
		productsList.add(product2);
		productsList.add(product3);
	}
	
	@Override
	public List<Product> getProducts() {
		return productsList;
	}

	@Override
	public List<Product> getProductsByName(String productName) {
		
		for(Product product : productsList) {
			if(product.getProductName().equals(productName)) {
				return Arrays.asList(product);
			}
		}
		return null; 
	}
}
