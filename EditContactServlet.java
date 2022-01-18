package com.servlet;

import java.io.IOException;

import com.Dao.ContactDAO;
import com.Entities.Contact;
import com.connection.DbConnect;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.annotation.WebServlet;
@WebServlet("/EditContactServlet")
public class EditContactServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int cid=Integer.parseInt(request.getParameter("cid"));
		 String name=request.getParameter("Name");
	       String email=request.getParameter("Email");
	       String phno=request.getParameter("Mobile");
	       String about=request.getParameter("About");
	      HttpSession session=request.getSession();
	       Contact c=new Contact();
	       c.setId(cid);
	       c.setName(name);
	       c.setEmail(email);
	       c.setPhno(phno);
	       c.setAbout(about);
	       
	       
	       ContactDAO dao = new ContactDAO(DbConnect.getConn());
	      boolean f= dao.updateContact(c);
	      
	     
	      if(f) {
	    	   session.setAttribute("success2msg", "Your Contact Updated");
	    	   response.sendRedirect("viewContact.jsp");
	       }
	       else
	       {
	    	   session.setAttribute("error2msg", "Something Wrong on Server");
	    	   response.sendRedirect("editContact.jsp?cid="+cid);
	       }
	   
	}

	
	
}
