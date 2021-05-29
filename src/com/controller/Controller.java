package com.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.beans.LigneCommande;
import com.beans.Travel;
import com.beans.User;
import com.model.DB;

/**
 * Servlet implementation class Controller
 */
@WebServlet("/Controller")
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ArrayList<User> userList = new ArrayList<>();
	ArrayList<Travel> list = new ArrayList<>();
	static ArrayList<String> cartlist = new ArrayList<>();
	HttpSession session;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Controller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String page = request.getParameter("page");
		if(page == null || page.equals("index")) {
			
					//liste des voyages dans le panier
			
			 session = request.getSession();
			 session.setAttribute("cartlist", cartlist);
			
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}else {
			doPost(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String page = request.getParameter("page");
		if(page.equals("login")) {
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
		
		if(page.equals("sign-up")) {
			request.getRequestDispatcher("signup.jsp").forward(request, response);
		}
		
		if(page.equals("confirmer")) {
			request.getRequestDispatcher("confirm.jsp").forward(request, response);
		}
		
		if(page.equals("success")) {
			String email = request.getParameter("email");
			DB db = new DB();
			try {
				db.paiement(email);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			request.getRequestDispatcher("success.jsp").forward(request, response);
		}
		
		if(page.equals("sign-up-form")) {
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String username = request.getParameter("username");
			String password_1 = request.getParameter("password_1");
			String password_2 = request.getParameter("password_2");
			
			if(password_1.equals(password_2)) {
				
				User user = new User();
				user.setEmail(email);
				user.setName(name);
				user.setUsername(username);
				user.setPassword(password_1);
				
				DB db = new DB();
				try {
					db.addUser(user);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				
				request.setAttribute("username", username);
				request.setAttribute("msg", "Félicitations vous êtes maintenant inscrit, connectez-vous!");
				request.getRequestDispatcher("login.jsp").forward(request, response);
				
			}else {
				request.setAttribute("msg", "Les deux mots de passe ne sont pas identiques");
				request.setAttribute("name", name);
				request.setAttribute("email", email);
				request.setAttribute("username", username);
				request.getRequestDispatcher("signup.jsp").forward(request, response);
			}
			
		}
		
		if(page.equals("contact")) {
			request.getRequestDispatcher("contact.jsp").forward(request, response);
		}
		
		if(page.equals("search")) {
			request.getRequestDispatcher("search.jsp").forward(request, response);
		}
		
		if(page.equals("contact1")) {
			String email = request.getParameter("email");
			String msg = request.getParameter("msg");
			
			DB db = new DB();
			try {
				db.contact(email, msg);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
			request.setAttribute("msg", "Message envoyé à l'administrateur !");
			request.getRequestDispatcher("contact.jsp").forward(request, response);
		}
		
		if(page.equals("login-form")) {
			
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			
			DB db = new DB();
			User user = new User();
			boolean status = false;
			try {
				status = db.checkUser(username,password);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			if(status) {
				session = request.getSession();
				session.setAttribute("session", session);
				
				try {
					userList = db.fetchUser();
				} catch (SQLException e) {
					e.printStackTrace();
				}
				session.setAttribute("email", user.fetchemail(userList,username));
				session.setAttribute("name", user.fetchname(userList,username));
				session.setAttribute("username", username);
				request.getRequestDispatcher("index.jsp").forward(request, response);
			}else {
				request.setAttribute("msg", "les données sont incorrectes");
				request.setAttribute("username", username);
				request.getRequestDispatcher("login.jsp").forward(request, response);
			}
			
		}
		if(page.equals("logout")) {
			session = request.getSession();
			session.invalidate();
			
			 session = request.getSession();
			 cartlist.clear();
			 session.setAttribute("cartlist", cartlist);
			 session.setAttribute("list", list);
			
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}
		
		if(page.equals("accom") || page.equals("ind") || page.equals("heberg")) {
			DB db = new DB();
			 try {
				list = db.fetch();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			request.setAttribute("list", list);
			
			if(page.equals("accom"))
				request.getRequestDispatcher("voyageAcc.jsp").forward(request, response);
			if(page.equals("ind"))
				request.getRequestDispatcher("voyageInd.jsp").forward(request, response);
			if(page.equals("theme"))
				request.getRequestDispatcher("voyageTheme.jsp").forward(request, response);
		}
		
		if(page.equals("addtocart")) {
			LigneCommande lc = new LigneCommande();
			
			String id = request.getParameter("id");
			String email = request.getParameter("email");
			String action = request.getParameter("action");
			
			lc.setId_voy(Integer.parseInt(id));
			lc.setEmail(email);
			
			DB db = new DB();
			 try {
				db.addCart(lc);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			if(action.equals("accom"))
				request.getRequestDispatcher("voyageAcc.jsp").forward(request, response);
			if(action.equals("ind"))
				request.getRequestDispatcher("voyageInd.jsp").forward(request, response);
			if(action.equals("result"))
				request.getRequestDispatcher("result.jsp").forward(request, response);
		}
		
		if(page.equals("remove")) {
			String id = request.getParameter("id");
			String email = request.getParameter("email");
			
			LigneCommande lc = new LigneCommande();
			
			lc.setId_voy(Integer.parseInt(id));
			lc.setEmail(email);
			
			DB db = new DB();
			try {
				db.removeCart(lc);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			request.getRequestDispatcher("cart.jsp").forward(request, response);
		}
		
		if(page.equals("showcart")) {
			String email = request.getParameter("email");
			
			session.setAttribute("email", email);
			request.getRequestDispatcher("cart.jsp").forward(request, response);
		}
		
		if(page.equals("search1")) {
			String destination = request.getParameter("destination");
			String type = request.getParameter("type");
			String date = request.getParameter("date");
			String duree = request.getParameter("duree");
			String prix = request.getParameter("prix");

			DB db = new DB();
			Travel travel = new Travel();
			try {
				travel = db.search(destination,type,date,duree,prix);
			} catch (SQLException e) {					
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			request.setAttribute("t",travel);	
			request.getRequestDispatcher("result.jsp").forward(request, response);
			}
		
		if(page.equals("nous")) {	
			request.getRequestDispatcher("nous.jsp").forward(request, response);
		}
		}
	
}


