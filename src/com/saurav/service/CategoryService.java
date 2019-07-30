package com.saurav.service;

import java.util.List;

import com.saurav.model.Category;

public interface CategoryService {

	public void addCategory(Category cat);

	public List<Category> listArticle();

}
