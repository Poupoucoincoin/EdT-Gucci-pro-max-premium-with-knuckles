package beans;

import java.util.Date;

public class Cours {
	
	private int id;
	private String intitule, professeur, lieu, type, date, heure_debut, heure_fin, salle;
	
	public void set_intitule(String val) {
		intitule = val;
	} public String get_intitule() {
		return intitule;
	}
	public void set_professeur(String val) {
		professeur = val;
	} public String get_professeur() {
		return professeur;
	}
	public void set_lieu(String val) {
		lieu = val;
	} public String get_lieu() {
		return lieu;
	}
	public void set_type(String val) {
		type = val;
	} public String get_type() {
		return type;
	}
	public void set_date(String val) {
		date = val;
	} public String get_date() {
		return date;
	}public String affiche_date() {
		return date.substring(8, 10) + "/" + date.substring(5, 7) + "/"+ date.substring(0, 4);
	}
	public void set_heure_debut(String val) {
		heure_debut = val;
	} public String get_heure_debut() {
		return heure_debut;
	}public String affiche_heure_debut() {
		return heure_debut.substring(0, 2) + "h" + heure_debut.substring(3, 5);
	}
	public void set_heure_fin(String val) {
		heure_fin = val;
	} public String get_heure_fin() {
		return heure_fin;
	}public String affiche_heure_fin() {
		return heure_fin.substring(0, 2) + "h" + heure_fin.substring(3, 5);
	}
	public void set_salle(String val) {
		salle = val;
	} public String get_salle() {
		return salle;
	}
	public void set_id(int val) {
		id = val;
	} public int get_id() {
		return id;
	}
	@SuppressWarnings("deprecation")
	public Date[] get_date_as_Date() {
		Date d1 = new Date(Integer.parseInt(date.substring(0, 3)), Integer.parseInt(date.substring(5, 7)), Integer.parseInt(date.substring(8, 10)), Integer.parseInt(heure_debut.substring(0, 2)), Integer.parseInt(heure_debut.substring(3, 5)));
		Date d2 = new Date(Integer.parseInt(date.substring(0, 3)), Integer.parseInt(date.substring(5, 7)), Integer.parseInt(date.substring(8, 10)), Integer.parseInt(heure_fin.substring(0, 2)), Integer.parseInt(heure_fin.substring(3, 5)));
		
		Date[] date_array = {d1, d2};
		return date_array;
	}

}
