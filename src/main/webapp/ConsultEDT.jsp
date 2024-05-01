<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:useBean id="cours_list" class="beans.CoursList" scope="application"/>
   	<%@ page import="beans.CoursList, beans.Cours, java.util.Date, java.util.List" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%


	// Sélection de la couleur aléatoire
	String[] color_list = {"#04AA6D", "DarkGoldenRod", "DarkRed", "DarkCyan", "DarkViolet", "Fuchsia", "Maroon"};
	String background_color = color_list[(int)(Math.floor(Math.random() *(color_list.length - 0) + 0))];
	
	
	// Sélection de la semaine à afficher
	
	Date date_choisie = (Date)request.getAttribute("date_choisie");
	Date date_du_jour = new Date();
	List<Cours> cours_lundi, cours_mardi, cours_mercredi, cours_jeudi, cours_vendredi, cours_samedi;
	
	if(date_choisie == null){
		date_du_jour.setDate(date_du_jour.getDate() - (date_du_jour.getDay()-1)%7);
	}else{
		date_du_jour.setTime(date_choisie.getTime());
	}
	cours_lundi = cours_list.give_week(date_du_jour, 1);
	cours_mardi = cours_list.give_week(date_du_jour, 2);
	cours_mercredi = cours_list.give_week(date_du_jour, 3);
	cours_jeudi = cours_list.give_week(date_du_jour, 4);
	cours_vendredi = cours_list.give_week(date_du_jour, 5);
	cours_samedi = cours_list.give_week(date_du_jour, 6);
	
	
	String string_date_lundi = String.format("%02d", date_du_jour.getDate()) + "/" + String.format("%02d", date_du_jour.getMonth()) + "/" + Integer.toString(date_du_jour.getYear()+1900) ;
	Date date_samedi = new Date(date_du_jour.getTime());
	date_samedi.setDate(date_samedi.getDate()+5);
	String string_date_samedi = String.format("%02d", date_samedi.getDate()) + "/" + String.format("%02d", date_samedi.getMonth()) + "/" + Integer.toString(date_samedi.getYear()+1900) ;
	
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>New EDT</title>
	<%@ include file="/MainStyle.jsp" %>
	<style>
	
	div.onglet>a{
		background-color: <%= background_color%>;
  		border: 2px solid <%= background_color%>;
	}
	
	table.choix_semaine a:hover {
	  background-color: white;
	  color: black;
	  border: 2px solid <%= background_color%>;
	}
	
	table.choix_semaine a{
		background-color: <%= background_color%>;
  		border: 2px solid <%= background_color%>;
	}
	
	div.onglet>a:hover {
	  background-color: white;
	  color: black;
	  border: 2px solid <%= background_color%>;
	}
	
	table.calendrier, table.calendrier td, table.calendrier th{
	border: 2px solid <%= background_color%>;	
	}
	</style>
</head>
<body>

	<%@ include file="/Header.jsp" %>
	
	<h2>Consulter l'EDT</h2>
	
	<div class="affichage">
		
		<table class="choix_semaine">
			<tr>
				<th><a href="/new_EDT/EDTManager?action=semaine_precedente&jour=<%= date_du_jour.getDate() %>&mois=<%= date_du_jour.getMonth() %>&annee=<%= date_du_jour.getYear() %>">semaine précédente</a></th>
				<th><p>Du <%= string_date_lundi %> à <%= string_date_samedi %></p></th>
				<th><a href="/new_EDT/EDTManager?action=semaine_suivante&jour=<%= date_du_jour.getDate() %>&mois=<%= date_du_jour.getMonth() %>&annee=<%= date_du_jour.getYear() %>">semaine suivante</a></th>
			</tr>
		</table>
				
		<table class="calendrier">
			<tr class="jour">
				<th>Lundi</th>
				<th>Mardi</th>
				<th>Mercredi</th>
				<th>Jeudi</th>
				<th>Vendredi</th>
				<th>Samedi</th>
			</tr>
			<tr>
			<%
				String[] semaine = {"lundi","mardi","mercredi", "jeudi", "vendredi", "samedi"};
				for(String tr_id : semaine){
			%>
				<td id="<%= tr_id %>">
				<% 
				List<Cours> cours_a_afficher;
				switch(tr_id){
				case "lundi":
					cours_a_afficher = cours_lundi;
					break;
				case "mardi":
					cours_a_afficher = cours_mardi;
					break;
				case "mercredi":
					cours_a_afficher = cours_mercredi;
					break;
				case "jeudi":
					cours_a_afficher = cours_jeudi;
					break;
				case "vendredi":
					cours_a_afficher = cours_vendredi;
					break;
				case "samedi":
					cours_a_afficher = cours_samedi;
					break;
				default:
					cours_a_afficher = null;
				}
				
				for(Cours cours : cours_a_afficher) {%>
				
					<div class="cours" id="<%= cours.get_type() %>">
						<h3><%= cours.get_intitule() %></h3>	
										
						<p class="main"><b><%= cours.get_professeur() %></b>
						<b><%= cours.get_salle() %> </b>
						De <b><%= cours.get_heure_debut() %></b> à <b> <%= cours.get_heure_fin() %> </b> 
						</p>
					</div>
					
					<% } %>
				</td>
			<%} %>
			</tr>
		</table>
	
	</div>
	

</body>
</html>