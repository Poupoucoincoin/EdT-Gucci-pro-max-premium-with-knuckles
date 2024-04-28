package beans;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import org.jdom2.output.*;
import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.input.SAXBuilder;


public class CoursList {
	private List<Cours> courses;
	private int prochain_id;
	
	public static String fichier = "/Users/lunar/eclipse-workspace/new_EDT/data/Cours.xml";
	static Document document;
	static Element racine;
	
	
	public CoursList() {
		courses = new ArrayList<Cours>();

		SAXBuilder sxb = new SAXBuilder();
		try {
			document = sxb.build(new File(fichier));
		} catch(Exception e) {}
		
		racine = document.getRootElement();
		
		// récupération du prochain id
		prochain_id = Integer.parseInt(racine.getChild("PROCHAIN_ID").getText());
				
				
		//Récupération des cours
		
		List<Element> list_courses = racine.getChildren("COURS");
		
		Iterator<Element> i = list_courses.iterator();
		while(i.hasNext()) {
			Element courant = (Element)i.next();
			Cours cours_courant = new Cours();
			cours_courant.set_id(Integer.parseInt(courant.getChild("ID").getText()));
			cours_courant.set_intitule(courant.getChild("INTITULE").getText());
			cours_courant.set_professeur(courant.getChild("PROFESSEUR").getText());
			cours_courant.set_date(courant.getChild("DATE").getText());
			cours_courant.set_heure_debut(courant.getChild("HEURE_DEBUT").getText());
			cours_courant.set_heure_fin(courant.getChild("HEURE_FIN").getText());
			cours_courant.set_salle(courant.getChild("SALLE").getText());
			cours_courant.set_lieu(courant.getChild("LIEU").getText());
			cours_courant.set_type(courant.getChild("TYPE").getText());
			courses.add(cours_courant);
		}
	}
	
	
	public void update_xml() {
		Element root = new Element("COURSES");
		Document doc = new Document(root);
		
		Element p_id = new Element("PROCHAIN_ID").setText(Integer.toString(prochain_id));
		root.addContent(p_id);
		
		Iterator<Cours> i = courses.iterator();
		while(i.hasNext()) {
			Cours courant = (Cours)i.next();
			Element cours = new Element("COURS");
			root.addContent(cours);
			
			Element id = new Element("ID").setText(Integer.toString(courant.get_id()));
			cours.addContent(id);
			Element intitule = new Element("INTITULE").setText(courant.get_intitule());
			cours.addContent(intitule);
			Element prof = new Element("PROFESSEUR").setText(courant.get_professeur());
			cours.addContent(prof);
			Element date = new Element("DATE").setText(courant.get_date());
			cours.addContent(date);
			Element heure_d = new Element("HEURE_DEBUT").setText(courant.get_intitule());
			cours.addContent(heure_d);
			Element heure_f = new Element("HEURE_FIN").setText(courant.get_intitule());
			cours.addContent(heure_f);
			Element salle = new Element("SALLE").setText(courant.get_intitule());
			cours.addContent(salle);
			Element lieu = new Element("LIEU").setText(courant.get_intitule());
			cours.addContent(lieu);
			Element type = new Element("TYPE").setText(courant.get_intitule());
			cours.addContent(type);
		}
		
		//Enregistrement de la base xml
		try {
			XMLOutputter sortie = new XMLOutputter(Format.getPrettyFormat());
			sortie.output(doc, new FileOutputStream(fichier));
		}catch(IOException e) {}
	}
	
	
	public Cours find_cours(int id){
		
		Iterator<Cours> i = courses.iterator();
		while(i.hasNext()) {
			Cours cours = (Cours)i.next();
			if(cours.get_id() == id) {
				return cours;
			}
		}
		return null;
	}
	
		
	public List<Cours> find_cours(String intitule, String prof, String date, String depuis_la_date, String salle){
		List<Cours> result = new ArrayList<Cours>();
		
		if (intitule.equals("") && prof.equals("") && date.equals("") && salle.equals("")) return courses;
		
		Iterator<Cours> i = courses.iterator();
		while(i.hasNext()) {
			boolean b_intitule=false, b_prof=false, b_date=false, b_salle=false;
			Cours courant = i.next();
			
			if(courant.get_intitule().toLowerCase().equals(intitule.toLowerCase()) || intitule.equals("")) b_intitule = true;
			if(courant.get_professeur().toLowerCase().equals(prof.toLowerCase()) || prof.equals("")) b_prof = true;
			if(date.equals("") || _compare_date(courant.get_date().toLowerCase(),date.toLowerCase(), depuis_la_date)) b_date = true;
			if(courant.get_salle().toLowerCase().equals(salle.toLowerCase()) || salle.equals("")) b_salle = true;
			
			if(b_intitule && b_prof && b_date && b_salle) result.add(courant);
		}
		
//		System.out.println("-----TRIAGE------");
//		// Trie de result
//		Collections.sort(result, new Comparator<Cours>() {
//			public int compare(Cours c1, Cours c2) {
//				Date[] d1 = c1.get_date_as_Date();
//				Date[] d2 = c2.get_date_as_Date();
//				
//				System.out.println("-----------");
//				System.out.print(d1[0]);
//				System.out.print(" compare to ");
//				System.out.println(d2[0]);
//				System.out.println(d1[0].compareTo(d2[0]));
//				return d1[0].compareTo(d2[0]);
//			}
//		});
		
		return result;
	}
	
	@SuppressWarnings("deprecation")
	private boolean _compare_date(String d_xml, String d_formulaire, String depuis_la_date) {
		Date date_xml = new Date(Integer.parseInt(d_xml.substring(0, 3)), Integer.parseInt(d_xml.substring(5, 7)), Integer.parseInt(d_xml.substring(8, 10)));
		Date date_formulaire = new Date(Integer.parseInt(d_formulaire.substring(0, 3)), Integer.parseInt(d_formulaire.substring(5, 7)), Integer.parseInt(d_formulaire.substring(8, 10)));
		
		if(depuis_la_date.equals("true")) {
			return date_xml.after(date_formulaire) || date_formulaire.equals(date_xml);
		}else {
			return date_formulaire.equals(date_xml);
		}
	}
	
	@SuppressWarnings("deprecation")
	public boolean est_ajoutable(String date, String h_d, String h_f) {
		List<Cours> cours_du_jour = this.find_cours("", "", date, "false", "");
		if (cours_du_jour.size() == 0) return true;
		
		Date horaire_debut = new Date(Integer.parseInt(date.substring(0, 3)), Integer.parseInt(date.substring(5, 7)), Integer.parseInt(date.substring(8, 10)), Integer.parseInt(h_d.substring(0, 2)), Integer.parseInt(h_d.substring(3, 5)));
		Date horaire_fin = new Date(Integer.parseInt(date.substring(0, 3)), Integer.parseInt(date.substring(5, 7)), Integer.parseInt(date.substring(8, 10)), Integer.parseInt(h_f.substring(0, 2)), Integer.parseInt(h_f.substring(3, 5)));
		
		
		Iterator<Cours> i = cours_du_jour.iterator();
		while(i.hasNext()) {
			Cours cours_courant = i.next();
			Date[] date_courante = cours_courant.get_date_as_Date();
			
			if(horaire_debut.after(date_courante[0]) && horaire_debut.before(date_courante[1])) return false;
			if(horaire_fin.after(date_courante[0]) && horaire_fin.before(date_courante[1])) return false;
			
		}
		
		return true;
	}
	
	public void ajouter_cours(String intitule, String prof, String date,String h_d, String h_f, String salle , String lieu, String type) {
		Cours cours = new Cours();
		
		cours.set_id(prochain_id);		
		cours.set_intitule(intitule);
		cours.set_professeur(prof);
		cours.set_date(date);
		cours.set_heure_debut(h_d);
		cours.set_heure_fin(h_f);
		cours.set_salle(salle);
		cours.set_lieu(lieu);
		cours.set_type(type);
		
		courses.add(cours);
		prochain_id++;
	}
	
	public void modifier_cours(int id, String intitule, String prof, String date,String h_d, String h_f, String salle , String lieu, String type) {
		Cours cours = find_cours(id);
			
		cours.set_intitule(intitule);
		cours.set_professeur(prof);
		cours.set_date(date);
		cours.set_heure_debut(h_d);
		cours.set_heure_fin(h_f);
		cours.set_salle(salle);
		cours.set_lieu(lieu);
		cours.set_type(type);
	}
	
	public void suppimer_cours(int id) {
		courses.remove(find_cours(id));
	}
	
//	public void trie_cours(List<Cours> liste){
//
//		Collections.sort(liste, new Comparator<Cours>() {
//			public int compare(Cours c1, Cours c2) {
//				Date[] d1 = c1.get_date_as_Date();
//				Date[] d2 = c2.get_date_as_Date();
//				
//				return d1[0].compareTo(d2[0]);
//			}
//		});
//		
//
//	}
	

}
