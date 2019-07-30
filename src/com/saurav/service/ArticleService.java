package com.saurav.service;

import java.util.List;

import com.saurav.model.Article;
import com.saurav.model.Login;


public interface ArticleService {
	
	public void addArticle(Article article);

	public List<Article> listArticle();
	
	public Article getArticle(int id);
	
	public void deleteArticle(Article article);
	
	public void addUser(Login user);
	
}
