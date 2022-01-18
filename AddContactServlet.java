package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import com.Dao.ContactDAO;
import com.Entities.Contact;
import com.connection.DbConnect;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;



@WebServlet("/AddContactServlet")
public class AddContactServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		HttpSession session=request.getSession();
		
       String name=request.getParameter("Name");
       String email=request.getParameter("Email");
       String phno=request.getParameter("Mobile");
       String about=request.getParameter("About");
       int userid=Integer.parseInt(request.getParameter("Userid"));
       
       Contact c1=new Contact(name,email,phno,about,userid);
       ContactDAO  dao=new ContactDAO(DbConnect.getConn());
       boolean f1=dao.saveContact(c1);
       if(name.equals("") || email.equals("") || phno.equals("") || about.equals(""))
       {
    	   session.setAttribute("msg1","Please Provide all details");
    	   response.sendRedirect("addContact.jsp");
       }
       
       
       else if(f1) {
    	   session.setAttribute("success1msg", "Contact Details save Successfully");
    	   response.sendRedirect("addContact.jsp");
       }
       else
       {
    	   session.setAttribute("error1msg", "Something Wrong on Server");
    	   response.sendRedirect("addContact.jsp");
       }
	}

}
