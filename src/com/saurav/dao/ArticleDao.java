package com.saurav.dao;

import java.util.List;

import com.saurav.model.Article;
import com.saurav.model.Login;

public interface ArticleDao {
	
	public void addArticle(Article article);

	public List<Article> listArticle();
	
	public Article getArticle(int id);
	
	public void deleteArticle(Article article);
	
	public void addUser(Login user);
	
}
