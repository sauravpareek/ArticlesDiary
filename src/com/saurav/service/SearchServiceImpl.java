package com.saurav.service;

import java.util.List;

import com.saurav.dao.SearchDao;
import com.saurav.model.Search;

public class SearchServiceImpl implements SearchService{

	private SearchDao searchdao;
	
	@Override
	public List<Search> listArticle(String searchtext, String mode) {
		
		return searchdao.listArticle("searchtext", "mode");
	}
	
	
	
	
}
