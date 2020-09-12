package controller;

import java.io.IOException;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sn.dao.IUserLocate;

import sn.entities.User;

/**
 * Servlet implementation class UserServlet
 */
@WebServlet("/User")
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@EJB
	private IUserLocate user_dao;
	
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
if(request.getSession().getAttribute("user_session")!= null) {
			
			if(request.getParameter(("action"))!= null) {
				String action = request.getParameter("action").toString();
				int id = Integer.parseInt(request.getParameter("idU").toString()); 
				switch(action) {
				case "edit":
					User u = user_dao.get(id);
					request.setAttribute("userG",u);
					break;
					
				case "delete":
					user_dao.delete(id);
					break;
					
					
				}
				
			}
			
			
			request.setAttribute("user", request.getSession().getAttribute("user_session"));
			request.setAttribute("users", user_dao.getAll());
			request.getRequestDispatcher("view/utilisateur/liste.jsp").forward(request, response);
			
		}else {
			response.sendRedirect("Login");
			
		}
	}
	
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nom = request.getParameter("nom");
		String prenom = request.getParameter("prenom");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		int etat = Integer.parseInt(request.getParameter("etat").toString());
		String profil = request.getParameter("profil");
		User  u = new User();
		u.setNom(nom);	
		u.setPrenom(prenom);
		u.setEmail(email);
		u.setPassword(password);
		u.setEtat(etat);
		u.setProfil(profil);
		if(request.getParameter("id")!=null) {//Pour la modification
			int id = Integer.parseInt(request.getParameter("id").toString());
			u.setId(id);
			user_dao.update(u);
		}else {//Pour l'ajout à la BD
			user_dao.add(u);
		}
						
		doGet(request, response);

}
}
