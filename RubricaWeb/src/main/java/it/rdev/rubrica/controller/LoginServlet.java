package it.rdev.rubrica.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import it.rdev.rubrica.dto.User;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<User> users = new ArrayList<>();
		users.add(new User().setPassword("pass01").setUsername("user01"));
		users.add(new User().setPassword("pass02").setUsername("user02"));
		users.add(new User().setPassword("pass03").setUsername("user03"));
		users.add(new User().setPassword("pass04").setUsername("user04"));
		
		
		request.setAttribute("users", users);
		
		User user = new User()
				.setPassword(request.getParameter("password"))
				.setUsername(request.getParameter("username"));
		
		users.add(user);
		
		if(user.getUsername() != null && user.getPassword() != null) {
			HttpSession session = request.getSession();
			session.setAttribute("user", user);
		}
		if (user.getUsername().equals("admin") && user.getPassword().equals("admin")) {
			HttpSession session = request.getSession();
			session.setAttribute("admin", user);
		}
		
		String action = request.getParameter("action");
		if(action != null && action.equals("logout") ) {
			HttpSession session = request.getSession();
			session.invalidate();
		}
		
		request.getRequestDispatcher("home.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
