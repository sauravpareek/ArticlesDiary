package com.saurav.controller;
				
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.saurav.model.Login;
					
@Controller			
public class LoginController {
				
	@Autowired(required=false)
	private SessionFactory sessionFactory;
    			
	@RequestMapping(value = "/login1", method = RequestMethod.GET)
	public ModelAndView init(Model model) {
		return new ModelAndView("/login1");
	}			
					
	@RequestMapping(method = RequestMethod.POST)
    public ModelAndView validateUsr(@RequestParam("email")String email, @RequestParam("password")String password,Model model,HttpSession session1) throws Exception {
        
		if(email.equals("sauravpareek02@gmail.com")&&password.equals("Sauravpareek02@"))
		{
			session1.setAttribute("email", email);	
			return new ModelAndView("listArticle");
		}
		session1.setAttribute("email", email);
		
		Session session=sessionFactory.openSession();
		Transaction trans=null;
		try
		{
		trans=session.beginTransaction();
		
		Criteria criteria =session.createCriteria(Login.class);
		criteria.add(Restrictions.eq("email", email));
		Login login=(Login)criteria.uniqueResult();
		
		if(login!=null)
		{
			if(login.getPassword().equals(password))
			{
				return new ModelAndView("index");
			}
		}
		trans.commit();
		}
		catch(HibernateException e)
		{
		e.printStackTrace();
		session.getTransaction().rollback();
		}
		model.addAttribute("error","Invalid Credentials");
		return new ModelAndView("/login1");
	}
	
	@RequestMapping("/logout")
	public ModelAndView logout(HttpServletRequest request)
	{
		HttpSession session=request.getSession();
		String email=(String)session.getAttribute("email");
		if(email!=null)
		{
			ModelAndView modelandview=new ModelAndView("/logout");
			modelandview.addObject("msg",email);
			session.invalidate();
			return modelandview;
		}
		else
		{
			return new ModelAndView("redirect:/");
		}
	}
	/*@RequestMapping("/forgotpassword")
	public String forgotPass( )
	{
		final String fromEmail = "sauravpareek02@gmail.com"; //requires valid gmail id
		final String password = "abcdef02051997@"; // correct password for gmail id
		final String toEmail = ""; // can be any email id 
		
		System.out.println("SSLEmail Start");
		Properties props = new Properties();
		props.put("mail.smtp.host", "smtp.gmail.com"); //SMTP Host
		props.put("mail.smtp.socketFactory.port", "465"); //SSL Port
		props.put("mail.smtp.socketFactory.class",
				"javax.net.ssl.SSLSocketFactory"); //SSL Factory Class
		props.put("mail.smtp.auth", "true"); //Enabling SMTP Authentication
		props.put("mail.smtp.port", "465"); //SMTP Port
		
		Authenticator auth = new Authenticator() {
			//override the getPasswordAuthentication method
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(fromEmail, password);
			}
		};
		
		Session session = Session.getDefaultInstance(props, auth);
		System.out.println("Session created");
	        EmailUtil.sendEmail(session, toEmail,"SSLEmail Testing Subject", "SSLEmail Testing Body");

	        EmailUtil.sendAttachmentEmail(session, toEmail,"SSLEmail Testing Subject with Attachment", "SSLEmail Testing Body with Attachment");

	        EmailUtil.sendImageEmail(session, toEmail,"SSLEmail Testing Subject with Image", "SSLEmail Testing Body with Image");

	}
*/
	}
	
	