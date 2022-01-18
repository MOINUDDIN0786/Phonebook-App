package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import com.Dao.UserDAO;
import com.Entities.User;
import com.connection.DbConnect;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.annotation.WebServlet;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		String Name=request.getParameter("Name");
		String Email=request.getParameter("Email");
		String Password=request.getParameter("Password");
		User u=new User(Name,Email,Password);
		UserDAO dao=new UserDAO(DbConnect.getConn());
		boolean f=dao.UserRegister(u);
		
		HttpSession session =request.getSession();
		if(Name.equals("") || Email.equals("") || Password.equals(""))
		{
			session.setAttribute("msg", "Please Provide Your Details");
			response.sendRedirect("register.jsp");
		}
		else if(f)
		{
			session.setAttribute("successmsg", "You have Successfully Registered...");
			response.sendRedirect("register.jsp");
			
		}
		else
		{
			session.setAttribute("errormsg", "Something Went Wrong");
			response.sendRedirect("register.jsp");
		}
		}
	}


