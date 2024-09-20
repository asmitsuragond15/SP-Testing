package com.ecom.dao;

import com.ecom.model.Product;

import java.util.List;

public interface ProductDAO {
    void addProduct(Product product);
    Product getProductById(Integer id);
    List<Product> getAllProducts();
    void updateProduct(Product product);
    void deleteProduct(Integer id);
    List<Product> getActiveProducts(String category);
}
