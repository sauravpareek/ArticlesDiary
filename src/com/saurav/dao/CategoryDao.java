package com.saurav.dao;

import java.util.List;

import com.saurav.model.Category;

public interface CategoryDao {
	
	public void addCategory(Category cat);
	
	public List<Category> listArticle();	
}
