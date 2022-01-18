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

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//PrintWriter out=response.getWriter();
		HttpSession session=request.getSession();
		String Email=request.getParameter("Email");
		String Password=request.getParameter("Password");
		UserDAO dao=new UserDAO(DbConnect.getConn());
		User u=dao.loginUser(Email, Password);
		if(u!=null)
		{
			session.setAttribute("User", u);
			response.sendRedirect("index.jsp");
		}
		else
		{
			session.setAttribute("invalidmsg", "Invalid Email & Password");
			response.sendRedirect("login.jsp");

		}
	}

}
