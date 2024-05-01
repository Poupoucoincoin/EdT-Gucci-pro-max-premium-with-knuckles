package edtmanager;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.File;
import java.io.IOException;
import java.util.Date;

/**
 * Servlet implementation class EDTManager
 */
public class EDTManager extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String current_page; 
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EDTManager() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    
    
	 /* @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)*/
	 
	@SuppressWarnings("deprecation")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		RequestDispatcher dispat;
		
		Date date;
		
		
		switch (request.getParameter("action")){
		case "cours_modified":
			request.setAttribute("alert", "cours_modified");
			dispat = this.getServletContext().getRequestDispatcher("/index.jsp");
			dispat.forward(request, response);
			break;
		case "cours_removed":
			request.setAttribute("alert", "cours_removed");
			dispat = this.getServletContext().getRequestDispatcher("/index.jsp");
			dispat.forward(request, response);
			break;
		case "semaine_precedente":
			date = new Date(Integer.parseInt(request.getParameter("annee")), Integer.parseInt(request.getParameter("mois")), Integer.parseInt(request.getParameter("jour")));
			date.setDate(date.getDate()-7);
			request.setAttribute("date_choisie", date);
			dispat = this.getServletContext().getRequestDispatcher("/ConsultEDT.jsp");
			dispat.forward(request, response);
			break;
		case "semaine_suivante":
			date = new Date(Integer.parseInt(request.getParameter("annee")), Integer.parseInt(request.getParameter("mois")), Integer.parseInt(request.getParameter("jour")));
			date.setDate(date.getDate()+7);
			request.setAttribute("date_choisie", date);
			dispat = this.getServletContext().getRequestDispatcher("/ConsultEDT.jsp");
			dispat.forward(request, response);
			break;
		}
		
	}

	
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		switch(request.getParameter("form-type")) {
		case "Consult-Cours": 
			cherche_cours(request, response, request.getParameter("cours_name"), request.getParameter("prof_name"), request.getParameter("date"), (request.getParameter("jusqua_date")), request.getParameter("salle"));
			break;
		case "Add-Cours":
			ajoute_cours(request, response, request.getParameter("cours_name"), request.getParameter("prof_name"), request.getParameter("date"), request.getParameter("heure_debut"), request.getParameter("heure_fin"), request.getParameter("salle"), request.getParameter("lieu"), request.getParameter("type-cours"));
			break;
		case "Access-Cours":
			access_cours(request, response, Integer.parseInt(request.getParameter("id")));
			break;
		case "Modif-Cours":
			if(((String)request.getParameter("submit_button")).equals("Supprimer")) {
				supprimer_cours(request, response, Integer.parseInt(request.getParameter("id")));
			}else {
				modifier_cours(request, response, Integer.parseInt(request.getParameter("id")), request.getParameter("cours_name"), request.getParameter("prof_name"), request.getParameter("date"), request.getParameter("heure_debut"), request.getParameter("heure_fin"), request.getParameter("salle"), request.getParameter("lieu"), request.getParameter("type-cours"));
			}
			break;
		}
	}
	
	
	// Fonctionnement de l'ajout de cours
	protected void ajoute_cours(HttpServletRequest request, HttpServletResponse response, String nom_cours, String nom_professeur, String date, String heure_debut, String heure_fin, String salle, String lieu, String type) throws ServletException, IOException {
		
		request.setAttribute("a_intitule", nom_cours);
		request.setAttribute("a_prof", nom_professeur);
		request.setAttribute("a_date", date);
		request.setAttribute("a_heure_debut", heure_debut);
		request.setAttribute("a_heure_fin", heure_fin);
		request.setAttribute("a_salle", salle);
		request.setAttribute("a_lieu", lieu);
		request.setAttribute("a_type", type);
		
		if (_manque_informations(nom_cours, nom_professeur, date, heure_debut, heure_fin, salle, lieu, type)) {
			request.setAttribute("Add-Error", "1"); // Erreur de d'information manquante
		} else {
			request.setAttribute("Add-Error", "0"); // Pas d'erreur et toutes les informations sont présente
		}
		
		RequestDispatcher dispat = this.getServletContext().getRequestDispatcher("/AddCours.jsp");
		dispat.forward(request, response);
		

	}

	private boolean _manque_informations(String nom_cours, String nom_professeur, String date, String heure_debut, String heure_fin, String salle, String lieu, String type) {
		if (nom_cours.equals("")) return true;
		if (nom_professeur.equals("")) return true;
		if (date.equals("")) return true;
		if (heure_debut.equals("")) return true;
		if (heure_fin.equals("")) return true;
		if (salle.equals("")) return true;
		if (lieu.equals("")) return true;
		if (type.equals("")) return true;
		
		return false;
	}
	
	
	// Fonctionnement de la recherche de cours
	
	protected void cherche_cours(HttpServletRequest request, HttpServletResponse response, String nom_cours, String nom_professeur, String date, String jusqua_date, String salle) throws ServletException, IOException {
		// TODO Cherche les cours correspondant à la recherche
		
		request.setAttribute("r_intitule", nom_cours);
		request.setAttribute("r_prof", nom_professeur);
		request.setAttribute("r_date", date);
		request.setAttribute("r_jusqua_date", jusqua_date);
		request.setAttribute("r_salle", salle);
		RequestDispatcher dispat = this.getServletContext().getRequestDispatcher("/index.jsp");
		dispat.forward(request, response);
	}
	
	protected void access_cours(HttpServletRequest request, HttpServletResponse response, int id) throws ServletException, IOException{
		request.setAttribute("a_id", Integer.toString(id));
		RequestDispatcher dispat = this.getServletContext().getRequestDispatcher("/ChangeCours.jsp");
		dispat.forward(request, response);
	}
	
	protected void supprimer_cours(HttpServletRequest request, HttpServletResponse response, int id) throws ServletException, IOException{
		request.setAttribute("s_id", Integer.toString(id));
		RequestDispatcher dispat = this.getServletContext().getRequestDispatcher("/ChangeCours.jsp");
		dispat.forward(request, response);
	}
	
	protected void modifier_cours(HttpServletRequest request, HttpServletResponse response, int id, String nom_cours, String nom_professeur, String date, String heure_debut, String heure_fin, String salle, String lieu, String type) throws ServletException, IOException{
		request.setAttribute("m_id", Integer.toString(id));
		request.setAttribute("m_intitule", nom_cours);
		request.setAttribute("m_prof", nom_professeur);
		request.setAttribute("m_date", date);
		request.setAttribute("m_heure_debut", heure_debut);
		request.setAttribute("m_heure_fin", heure_fin);
		request.setAttribute("m_salle", salle);
		request.setAttribute("m_lieu", lieu);
		request.setAttribute("m_type", type);
		
		if (_manque_informations(nom_cours, nom_professeur, date, heure_debut, heure_fin, salle, lieu, type)) {
			request.setAttribute("Add-Error", "1"); // Erreur de d'information manquante
		} else {
			request.setAttribute("Add-Error", "0"); // Pas d'erreur et toutes les informations sont présente
		}
		
		RequestDispatcher dispat = this.getServletContext().getRequestDispatcher("/ChangeCours.jsp");
		dispat.forward(request, response);
	}
	
	
}
