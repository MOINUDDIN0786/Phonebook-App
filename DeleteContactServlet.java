package com.servlet;

import java.io.IOException;

import com.Dao.ContactDAO;
import com.connection.DbConnect;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.annotation.WebServlet;

@WebServlet("/DeleteContactServlet")

public class DeleteContactServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		 int cid=Integer.parseInt(request.getParameter("cid"));
		 
		 ContactDAO dao=new ContactDAO(DbConnect.getConn());
		 boolean f=dao.deleteContactById(cid);
		 HttpSession session=request.getSession();
		 if(f)
		 {
			 session.setAttribute("delsucmsg", "Contact Delete Successfully..");
			 response.sendRedirect("viewContact.jsp");
		 }
		 else
		 {
			 session.setAttribute("delermsg", "Something wrong on Server..");
			 response.sendRedirect("viewContact.jsp?cid="+cid);
		 }
	}

}
