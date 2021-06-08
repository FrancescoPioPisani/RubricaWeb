package it.rdev.rubrica.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.rdev.rubrica.model.ContactDao;
import it.rdev.rubrica.model.entities.Contact;

public class ManagerControllServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	 public ManagerControllServlet() {
	        super();
	    }

		/**
		 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
		 */
		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			String action = request.getParameter("action");
			String id = request.getParameter("id");
			
			if(id != null && action.equals("delete")) {
				int contatto = Integer.parseInt(id);
				
				Contact toDelete = new Contact();
				toDelete.setId(contatto);
				
				ContactDao.delete(toDelete);
				request.getRequestDispatcher("/CrudOperation").forward(request, response);
			}
			
			if(id != null && action.equals("update")) {
				int contatto = Integer.parseInt(id);
				
				Contact toUpdate = new Contact();
				toUpdate.setId(contatto);
				
				ContactDao.update(toUpdate);
				request.getRequestDispatcher("/CrudOperation").forward(request, response);
			}
			
			if(id != null && action.equals("details")) {
				request.getRequestDispatcher("/CrudOperation").forward(request, response);
			}
		}

		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			doGet(request, response);
		}
		

}
