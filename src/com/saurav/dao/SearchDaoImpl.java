package com.saurav.dao;

import java.util.ArrayList; 
import java.util.List;

import com.saurav.model.Search;


public class SearchDaoImpl implements SearchDao{
	
	@Override
	public List<Search> listArticle(String searchtext, String mode) {
		
		System.out.println("search string:"+searchtext);
		System.out.println("Mode:"+mode);
		
		List<Search> ls = new ArrayList<Search>();
		Search ss;
		
		for(int i=0;i<10;i++){
			ss =  new Search();
			ss.setSearchString("New value_"+i);
			ls.add(ss);
		}
		return ls;
	}
	
	
	
}
