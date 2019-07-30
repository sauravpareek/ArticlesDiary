package com.saurav.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.saurav.dao.ArticleDao;
import com.saurav.model.Article;
import com.saurav.model.Login;


@Service("articleService")
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
public class ArticleServiceImpl implements ArticleService {

	@Autowired(required=false)
	private ArticleDao articleDao;
	
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public void addArticle(Article article) {						
		articleDao.addArticle(article);
	}
	
	public List<Article> listArticle() {
		return articleDao.listArticle();
	}

	public Article getArticle(int id) {
		return articleDao.getArticle(id);
	}
	
	public void deleteArticle(Article article) {
		articleDao.deleteArticle(article);
	}

	public void addUser(Login user)
	{
		articleDao.addUser(user);
	}
	
}
