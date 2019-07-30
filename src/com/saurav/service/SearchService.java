package com.saurav.service;

import java.util.List;

import com.saurav.model.Search;

public interface SearchService {
	
	public List<Search> listArticle(String searchtext, String mode);
	
}
