package com.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.beans.Travel;
import com.model.DB;

/**
 * Servlet implementation class AdminController
 */
@WebServlet("/AdminController")
public class AdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String page = request.getParameter("page");
		if(page == null) {
			request.getRequestDispatcher("admin/login.jsp").forward(request, response);;
		}else {
			doPost(request, response);
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String page = request.getParameter("page");
		if(page.equals("admin-login-form")) {
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			
			
			if(username.equals("admin") && password.equals("admin123")) {
				request.getRequestDispatcher("admin/index.jsp").forward(request, response);

			}
			else {
				request.setAttribute("msg", "Les données sont incorrectes");
				request.setAttribute("username", username);
				request.getRequestDispatcher("admin/login.jsp").forward(request, response);

			}
		}
		
		if(page.equals("delete")) {
			String id = request.getParameter("id");
			DB db = new DB();
			try {
				db.deleteTravel(id);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			request.getRequestDispatcher("admin/index.jsp").forward(request, response);

		}
		
		if(page.equals("index")) {
			request.getRequestDispatcher("admin/index.jsp").forward(request, response);
		}
		
		if(page.equals("comm")) {
			request.getRequestDispatcher("admin/commande.jsp").forward(request, response);
		}
		if(page.equals("message")) {
			request.getRequestDispatcher("admin/message.jsp").forward(request, response);
		}
		
		if(page.equals("addTravel")) {
			request.getRequestDispatcher("admin/addTravel.jsp").forward(request, response);
		}
		
		if(page.equals("edit")) {
			String id = request.getParameter("id");
			DB account = new DB();
			Travel t = null;
			try {
				 t = account.fetchTravel(id);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			request.setAttribute("t", t);
			request.getRequestDispatcher("admin/editTravel.jsp").forward(request, response);
		}
		
		if(page.equals("edit_travel")){
			String id = request.getParameter("id");
			String destination = request.getParameter("destination");
			String type = request.getParameter("type");
			String date = request.getParameter("date");
			String duree = request.getParameter("duree");
			String prix = request.getParameter("prix");
			String theme = request.getParameter("theme");
			String heberg = request.getParameter("heberg");
			Travel t = new Travel();
			t.setId(Integer.parseInt(id));
			t.setDestination(destination);
			t.setType(type);
			t.setDate(date);
			t.setDuree(duree);
			t.setPrix(prix);
			t.setTheme(theme);
			t.setHeberg(heberg);
			
			DB account = new DB();
			try {
				account.updateTravel(t);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			request.getRequestDispatcher("admin/index.jsp").forward(request, response);
		}
		
		if(page.equals("add_travel")){
			String destination = request.getParameter("destination");
			String type = request.getParameter("type");
			String date = request.getParameter("date");
			String duree = request.getParameter("duree");
			String prix = request.getParameter("prix");
			String theme = request.getParameter("theme");
			String heberg = request.getParameter("heberg");
			Travel t = new Travel();
			t.setDestination(destination);
			t.setType(type);
			t.setDate(date);
			t.setDuree(duree);
			t.setPrix(prix);
			t.setTheme(theme);
			t.setHeberg(heberg);
			
			DB account = new DB();
			try {
				account.addTravel(t);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			request.getRequestDispatcher("admin/index.jsp").forward(request, response);
		}
		
		if(page.equals("deleteComm")) {
			String id = request.getParameter("id");
			String email = request.getParameter("email");
			DB db = new DB();
			try {
				db.deleteComm(id,email);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			request.getRequestDispatcher("admin/commande.jsp").forward(request, response);

		}
		
		if(page.equals("deleteMsg")) {
			String email = request.getParameter("email");
			DB db = new DB();
			try {
				db.deleteMsg(email);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			request.getRequestDispatcher("admin/message.jsp").forward(request, response);

		}
	}

}