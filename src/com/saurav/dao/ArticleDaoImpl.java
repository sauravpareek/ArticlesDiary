package com.saurav.dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.saurav.model.Article;
import com.saurav.model.Login;

@Repository("articleDao")
public class ArticleDaoImpl implements ArticleDao {

	@Autowired(required=false)
	private SessionFactory sessionFactory;
	
	public void addArticle(Article article) {
		sessionFactory.getCurrentSession().saveOrUpdate(article);
	}

	@SuppressWarnings("unchecked")
	public List<Article> listArticle() {
		return (List<Article>) sessionFactory.getCurrentSession().createCriteria(Article.class).list();
	}

	public Article getArticle(int id) {
		return (Article) sessionFactory.getCurrentSession().get(Article.class, id);
	}

	public void deleteArticle(Article article) {		
		sessionFactory.getCurrentSession().createQuery("DELETE FROM Article WHERE id = "+article.getId()).executeUpdate();
	}

	public void addUser(Login user)
	{
		sessionFactory.getCurrentSession().saveOrUpdate(user);
	}
		

}
