package beans;

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
	}
	public void set_heure_debut(String val) {
		heure_debut = val;
	} public String get_heure_debut() {
		return heure_debut;
	}
	public void set_heure_fin(String val) {
		heure_fin = val;
	} public String get_heure_fin() {
		return heure_fin;
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

}
