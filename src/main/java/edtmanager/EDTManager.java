package edtmanager;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet implementation class EDTManager
 */
public class EDTManager extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EDTManager() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		switch(request.getParameter("form-type")) {
		case "Consult-Cours": 
			cherche_cours(request.getParameter("course_name"), request.getParameter("prof_name"), request.getParameter("date"), request.getParameter("salle"));
			break;
		case "Add-Cours":
			ajoute_cours(request.getParameter("course_name"), request.getParameter("prof_name"), request.getParameter("date"), request.getParameter("heure_debut"), request.getParameter("heure_fin"), request.getParameter("salle"));
			break;
		}
	}
	
	
	// Fonctionnement de l'ajout de cours
	
	protected void ajoute_cours(String nom_cours, String nom_professeur, String date, String heure_debut, String heure_fin, String salle) {
		
		return;
	}

	
	
	// Fonctionnement de la recherche de cours
	
	protected void cherche_cours(String nom_cour, String nom_professeur, String date, String salle) {
		// TODO Cherche les cours correspondant à la recherche
		
		return;
	}
	
	
	
}
