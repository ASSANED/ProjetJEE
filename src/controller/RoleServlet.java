package controller;

import java.io.IOException;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sn.dao.IRoles;
import sn.entities.Roles;



/**
 * Servlet implementation class RoleServlet
 */
@WebServlet("/Role")
public class RoleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@EJB
	private IRoles rolesdao;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RoleServlet() {
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
				int id = Integer.parseInt(request.getParameter("idR").toString()); 
				switch(action) {
				case "edit":
					Roles r = rolesdao.get(id);
					request.setAttribute("role",r);
					break;
					
				case "delete":
					rolesdao.delete(id);
					break;
					
					
				}
				
			}
			
			
			request.setAttribute("user", request.getSession().getAttribute("user_session"));
			request.setAttribute("roles", rolesdao.getAll());
			request.getRequestDispatcher("view/roles/liste.jsp").forward(request, response);
			
		}else {
			response.sendRedirect("Login");
			
		}
	}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nom = request.getParameter("nom");				
		Roles  r = new Roles();
		r.setNom(nom);			
		if(request.getParameter("id")!=null) {//Pour la modification
			int id = Integer.parseInt(request.getParameter("id").toString());
			r.setId(id);
			rolesdao.update(r);
		}else {//Pour l'ajout à la BD
			rolesdao.add(r);
		}
						
		doGet(request, response);
	}
	}



