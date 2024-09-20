package com.ecom.dao;

import com.ecom.model.Category;

import java.util.List;

public interface CategoryDAO {
    void addCategory(Category category);
    List<Category> getAllCategories();
    Category getCategoryById(int id);
    void updateCategory(Category category);
    void deleteCategory(int id);
}
