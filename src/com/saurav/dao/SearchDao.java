package com.saurav.dao;

import java.util.List;

import com.saurav.model.Search;

public interface SearchDao {
	
	public List<Search> listArticle(String searchtext, String mode);
	
	
}
