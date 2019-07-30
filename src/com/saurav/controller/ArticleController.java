package com.saurav.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ibm.icu.text.SimpleDateFormat;
import com.saurav.bean.ArticleBean;
import com.saurav.bean.CategoryBean;
import com.saurav.model.Article;
import com.saurav.model.Category;
import com.saurav.model.Login;
import com.saurav.service.ArticleService;
import com.saurav.service.CategoryService;

@Controller
public class ArticleController {
	
	String text;
	String mode;
	
	ArticleBean articlebeanforhtml;
	
	@Autowired(required=false)
	private ArticleService articleService;
	@Autowired(required=false)
	private CategoryService catservice;
	

	
	@RequestMapping(value = "/save", method = {RequestMethod.POST,RequestMethod.GET})
	public ModelAndView saveArticle(Model model,@ModelAttribute("command") ArticleBean articleBean, BindingResult result,HttpSession session) {
		
		
		String email=(String)session.getAttribute("email");
		if(email!=null)
		{
		ModelAndView modelandview = new ModelAndView("addArticle");				
		if (validateArticleBean(articleBean)) {	
			Article article = prepareModel(articleBean);
			articleService.addArticle(article);
			/*modelandview.addObject("msg", "Your Article has been successfully added.");*/
			modelandview = new ModelAndView("redirect:/add.html");
			return modelandview;
		}else{
			modelandview.addObject("article", new Article());
			modelandview.addObject("error","Either of the field is Empty");
			return modelandview;
		}
		}
			return new ModelAndView("/InvalidSession");
	}
	
	private boolean validateArticleBean(ArticleBean articleBean) {
		Boolean validate = false;
		if (articleBean.getTitle() != null && articleBean.getTitle().length() > 0
				&& articleBean.getArticletext() != null && articleBean.getArticletext().length() > 0) {
			validate = true;
		}
		return validate;
	}

	@RequestMapping(value = "/newlogin" , method= {RequestMethod.POST,RequestMethod.GET})
	public String addUser(HttpServletRequest request,Model model,@RequestParam("email1") String email,@RequestParam("passwd") String password,HttpSession session)
	{	
		session.setAttribute("email", email);
		
		Login login=new Login();
		login.setEmail(email);
		login.setPassword(password);
		articleService.addUser(login);
		model.addAttribute("newuser"," You have Successfully created Your Account !!");
		return "index";
	}
	
	@RequestMapping(value="/adminLogin",method = RequestMethod.POST)
	public ModelAndView adminLogin(@RequestParam("admin") String admin,@RequestParam("password")String password,Model model) {
		
		if(admin.equals("saurav")&&password.equals("saurav123"))
		{
		return new ModelAndView("listArticle");
			} else {
				return new ModelAndView("redirect:/login");
			}
		} 																
																	
	
	@RequestMapping(value = "/insert", method = {RequestMethod.GET,RequestMethod.POST})		
	public ModelAndView insertArticle(Model model,@ModelAttribute("command") 
	ArticleBean articleBean,CategoryBean catbean,  BindingResult result,HttpSession session) {
		
		String  email=(String)session.getAttribute("email");
		if(email!=null)
		{
		ModelAndView modelview=null;
		modelview = new ModelAndView("addArticle");
		modelview.addObject("cats",prepareCat(catservice.listArticle()));		
		modelview.addObject("article", new Article());					
		return modelview;
		}
		return new ModelAndView("/InvalidSession");
	}
	
	@RequestMapping(value = "/add", method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView addList(@ModelAttribute("command") ArticleBean articleBean, BindingResult result,HttpSession session) {		
		String email=(String)session.getAttribute("email");
		if(email!=null)
		{
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("articles", prepareListofBean(articleService.listArticle()));
		return new ModelAndView("listArticle2", model);
		}
		return new ModelAndView("InvalidSession");
		}
	
	@RequestMapping(value = "/add1", method = RequestMethod.GET)
	public ModelAndView addList1(@ModelAttribute("command") ArticleBean articleBean, BindingResult result,HttpSession session) {		
		String email=(String)session.getAttribute("email");
		if(email!=null)
		{
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("articles", prepareListofBean(articleService.listArticle()));
		return new ModelAndView("listArticle", model);
		}
		return new ModelAndView("redirect/InvalidSession");
	}
	
	
	@RequestMapping(value = "/htmlview", method = RequestMethod.GET)
	public ModelAndView getHtmlView(@ModelAttribute("command") ArticleBean articleBean, BindingResult result,HttpSession session) {
	
		String email=(String)session.getAttribute("email");
		if(email!=null)
		{
		ModelAndView mv = new ModelAndView("htmlview");		
		mv.addObject("article",articlebeanforhtml);		
		return mv;
	}
		return new ModelAndView("InvalidSession");
		}

	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public ModelAndView editEmployee(@ModelAttribute("command") ArticleBean articleBean, BindingResult result,HttpSession session) {		
		String email=(String)session.getAttribute("email");
		if(email!=null)
		{
		articleService.deleteArticle(prepareModel(articleBean, articleBean.getId()));
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("article", null);
		model.put("articles", prepareListofBean(articleService.listArticle()));
		//relateservice.deleteRelateArticle(articleBean.getId());
		return new ModelAndView("listArticle", model);
		}
		return new ModelAndView("InvalidSession");
		}

	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public ModelAndView deleteArticle(@ModelAttribute("command") ArticleBean articleBean, BindingResult result,HttpSession session) {
		String email=(String)session.getAttribute("email");
		if(email!=null)
		{
		Map<String, Object> model = new HashMap<String, Object>();
		ArticleBean articlebean = prepareArticleBean(articleService.getArticle(articleBean.getId()));
		model.put("article", articlebean);		
		model.put("cats",prepareCat(catservice.listArticle()));		
		model.put("articles", prepareListofBean(articleService.listArticle()));

		return new ModelAndView("addArticle", model);
	}
		return new ModelAndView("InvalidSession");
		}

	@RequestMapping(value = "/view", method = RequestMethod.GET)
	public ModelAndView viewArticle(@ModelAttribute("command") ArticleBean articleBean, BindingResult result,HttpSession session) {
		String email=(String)session.getAttribute("email");
		if(email!=null)
		{
		Map<String, Object> model = new HashMap<String, Object>();
		ArticleBean articlebean = prepareArticleBean(articleService.getArticle(articleBean.getId()));
		//object duplicate for html view
		 articlebeanforhtml = articlebean; 
		model.put("article", articlebean);
		
		List<ArticleBean> articleBeanList = prepareListofBean(articleService.listArticle()); 
		model.put("articles", articleBeanList);		
		return new ModelAndView("view", model);
	}
		return new ModelAndView("InvalidSession");
		}
	
	
	@RequestMapping(value = "/setting", method = RequestMethod.GET)
	public ModelAndView viewSetting(@ModelAttribute("command") CategoryBean categoryBean, BindingResult result,HttpSession session) {
		String email=(String)session.getAttribute("email");
		if(email!=null)
		{
		ModelAndView mdview = new ModelAndView("setting");		
		mdview.addObject("cats", prepareCat(catservice.listArticle()));		
		return mdview;
		}
		return new ModelAndView("InvalidSession");
	}
	
	@RequestMapping(value="/search" ,method=RequestMethod.GET)
	public ModelAndView getSearch(@ModelAttribute("command") ArticleBean articlebean, BindingResult result,HttpSession session) {					
		
		String email=(String)session.getAttribute("email");
		if(email!=null)
		{
		ModelAndView mdview = new ModelAndView("search");		
		if(mode!=null && !mode.equals("--Select--") ){
			
			List<ArticleBean> articleList = prepareListofBean(articleService.listArticle());
			List<ArticleBean> sortlistedarticleList = articleSearch(articleList,text,mode);						
			mdview.addObject("articles", sortlistedarticleList);	
			text=null;
			mode=null;
		}	
		return mdview;
		}
		return new ModelAndView("InvalidSession");
	}	
	
	
	private List<ArticleBean> articleSearch(List<ArticleBean> articleList, String searchtext, String mode) {
		List<ArticleBean> articlelist = null;
		if(searchtext!=null && searchtext.length()>0){
			 articlelist = new ArrayList<ArticleBean>();
			 
			//Search in title			 
			if ("title".equalsIgnoreCase(mode)) {
				for (ArticleBean bean : articleList) {															
					if(StringUtils.containsIgnoreCase(bean.getTitle(), searchtext.trim())){						
						articlelist.add(bean);
					}
					
				}
			}
			//Search in article 
			if ("Article".equalsIgnoreCase(mode)) {
				for (ArticleBean bean : articleList) {
					if(StringUtils.containsIgnoreCase(bean.getArticletext(), searchtext.trim())){						
						articlelist.add(bean);
					}
					
				}
			}			
			//Search in article or title
			if ("both".equalsIgnoreCase(mode)) {
				for (ArticleBean bean : articleList) {
					if(StringUtils.containsIgnoreCase(bean.getArticletext(), searchtext.trim())||StringUtils.containsIgnoreCase(bean.getTitle(), searchtext.trim())){						
						articlelist.add(bean);
					}
					
				}
			}
			
			//Search by category
			if ("category".equalsIgnoreCase(mode)) {
				for (ArticleBean bean : articleList) {
					if(StringUtils.containsIgnoreCase(bean.getCatname(), searchtext.trim())){						
						articlelist.add(bean);
					}
					
				}
			}
		}
		
		return articlelist;
	}

	@RequestMapping(value="/searchlist" ,method=RequestMethod.POST)	
		public ModelAndView getList(@RequestParam("searchtext")String text,@RequestParam("mode")String mode,HttpSession session) {		
		
		String email=(String)session.getAttribute("email");
		if(email!=null)
		{
		ModelAndView mdview = new ModelAndView("redirect:/search.html");		
		this.text = text;
		this.mode=  mode;		
		return mdview;
		}
		return new ModelAndView("/InvalidSession");
	}
	
	
	@RequestMapping(value = "/savecat", method = {RequestMethod.POST,RequestMethod.GET})
	public ModelAndView saveCategory(@ModelAttribute("command") CategoryBean categoryBean, BindingResult result,HttpSession session) {
		String email=(String)session.getAttribute("email");
		if(email!=null)
		{
				
		ModelAndView mdview = new ModelAndView("setting");
		//validation for null values 
		if(categoryBean.getName()!=null && categoryBean.getName().trim().length()>0){
			Category cat = populateCat(categoryBean);
			catservice.addCategory(cat);	
		}		
		mdview.addObject("cats", prepareCat(catservice.listArticle()));		
		return mdview;
		}
		return new ModelAndView("/InvalidSession");
		}
	
	private Category populateCat(CategoryBean categoryBean) {
		Category cat = new Category();
		cat.setId(categoryBean.getId());
		cat.setName(categoryBean.getName());
		return cat;
	}

	private List<CategoryBean> prepareCat(List<Category> listArticle) {
		List<CategoryBean> catbean = new ArrayList<CategoryBean>();
		CategoryBean cbean = null;
		for(Category cat: listArticle){
			cbean = new CategoryBean();
			cbean.setId(cat.getId());
			cbean.setName(cat.getName());
			catbean.add(cbean);
		}
		return catbean;
	}

		private Article prepareModel(ArticleBean articleBean) {
		Article article = new Article();
		article.setId(articleBean.getId());
		article.setTitle(articleBean.getTitle());
		article.setDate(getDate());
		article.setArticletext(articleBean.getArticletext());
		article.setCatname(articleBean.getCatname());
		return article;
	}

	private Article prepareModel(ArticleBean articleBean, Integer id) {
		Article article = new Article();
		article.setId(id);
		article.setTitle(articleBean.getTitle());
		article.setDate(new Date());
		article.setArticletext(articleBean.getArticletext());
		article.setCatname(articleBean.getCatname());
		return article;
	}

	private List<ArticleBean> prepareListofBean(List<Article> articles) {
		List<ArticleBean> beans = null;
		if (articles != null && !articles.isEmpty()) {
			beans = new ArrayList<ArticleBean>();
			ArticleBean bean = null;
			for (Article article : articles) {
				bean = new ArticleBean();
				bean.setId(article.getId());
				bean.setTitle(article.getTitle());
				bean.setDate(article.getDate());
				bean.setCatname(article.getCatname());
				bean.setArticletext(article.getArticletext());
				beans.add(bean);
			}
		}
		return beans;
	}

	private Date getDate() {
			SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yy");	
		return new Date();
	}

	
	private ArticleBean prepareArticleBean(Article article) {
		ArticleBean bean = new ArticleBean();
		bean.setId(article.getId());
		bean.setTitle(article.getTitle());
		bean.setDate(article.getDate());
		bean.setArticletext(article.getArticletext());
		bean.setCatname(article.getCatname());
		return bean;
	}
}
