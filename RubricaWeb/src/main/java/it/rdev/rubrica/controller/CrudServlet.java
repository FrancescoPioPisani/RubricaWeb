package it.rdev.rubrica.controller;

import java.io.IOException;
import java.util.Set;
import java.util.TreeSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.rdev.rubrica.model.ContactDao;
import it.rdev.rubrica.model.entities.Contact;
import it.rdev.rubrica.model.entities.Email;
import it.rdev.rubrica.model.entities.Phone;


@WebServlet("/CrudServlet")
public class CrudServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	 public CrudServlet() {
	        super();
	    }

		/**
		 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
		 */
		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			//Resume of request parameters
			String action = request.getParameter("action");
			String id = request.getParameter("id");
			
			if(action.equals("INSERT")) {
				request.setAttribute("action", action);
			}
			
			if(action.equals("new_insert")) {
				//Insert of the values passed from crud-insert form
				Contact toInsert = new Contact();
				toInsert.setName(request.getParameter("new_username"));
				toInsert.setSurname(request.getParameter("new_surname"));
				Set<Email> emails = new TreeSet<>();
				Set<Phone> phones = new TreeSet<>();
				
				//Insert of the first email
				Email email = new Email();
				String e = request.getParameter("new_emails");
				email.setEmail(e);
				emails.add(email);
				
				//Insert of the first phone number
				Phone phone = new Phone();
				String p = request.getParameter("new_phones");
				phone.setPhone(p);
				phones.add(phone);
				
				//Insert of TreeSet into Object contact
				toInsert.setEmails(emails);
				toInsert.setPhones(phones);
				//ContactDao Insert
				ContactDao.insert(toInsert);
				//Set an attribute to take trace in other pages
				request.setAttribute("action", action);
			}
			
			if(id != null && action.equals("delete")) {
				//Cast the String type in an Integer one
				int contatto = Integer.parseInt(id);
				
				//Set a Contact with the passed id used for delete
				Contact toDelete = new Contact();
				toDelete.setId(contatto);
				
				//ContactDao Delete
				ContactDao.delete(toDelete);
			}
		
			if(id != null && action.equals("update")) {
				//Cast the String type in an Integer one
				int contatto = Integer.parseInt(id);
			
				//Set a Contact with the passed id used for update
				Contact toUpdate = (Contact) request.getAttribute("toUpdate");
				
				//ContactDao Update
				ContactDao.update(toUpdate);
				//Set an attribute to take trace in other pages
				request.setAttribute("action", action);
			}
			
			if(id != null && action.equals("details")) {
				//Set an attribute to take trace in other pages
				request.setAttribute("action", action);
			}
			
			
			request.getRequestDispatcher("crud.jsp").forward(request, response);
		}

		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			doGet(request, response);
		}
		

}
