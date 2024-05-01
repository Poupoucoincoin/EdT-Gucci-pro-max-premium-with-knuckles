<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Random" %>
<jsp:useBean id="cours_list" class="beans.CoursList" scope="application"/>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%	
	
	String alert_type = (String)request.getAttribute("alert"); 
	String alert = "";

	if ((String)request.getAttribute("alert") != null){
		
		cours_list.update_xml();
		switch (alert_type){
		case "cours_modified":
			alert = "alert('Cours Modifié');";
			break;
		case "cours_removed":
			alert="alert('Cours supprimer');";
			break;
		}
	}
	
	
	// sélection de la couleur aléatoire
	String[] color_list = {"#04AA6D", "DarkGoldenRod", "DarkRed", "DarkCyan", "DarkViolet", "Fuchsia", "Maroon"};
	String background_color = color_list[(int)(Math.floor(Math.random() *(color_list.length - 0) + 0))];
	String style_background_color = "style=\"background-color: " + background_color + ";\"";

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
	
	div.onglet>a:hover {
	  background-color: white;
	  color: black;
	  border: 2px solid <%= background_color%>;
	}
	</style>
	
</head>
<body onload="<%= alert %>">

	<div class="page-wrapper">
	
		<%@ include file="/Header.jsp" %>
		
		<div class="formulaire" <%= style_background_color %>>
		
			<h2>Consulter un cours</h2>
			
			<form action="/new_EDT/EDTManager" method="post">
				<input type="hidden" name="form-type" value="Consult-Cours"/>
				<div>
					<label for="cours_name">Intitulé du cours : </label><br/>
					<input type="text" name="cours_name" id="cours_name" value=""/>
				</div>
				<div>
					<label for="prof_name">Professeur : </label><br/>
					<input type="text" name="prof_name" id="prof_name" value=""/>
				</div>
				<div>
					<label for="date">De : </label><br/>
					<input type="date" name="date" id="date" value=""/><br/>
					<label for="jusqua_date">Jusqu'à : </label><br/>
					<input type="date" name="jusqua_date" id="jusqua_date" value=""/><br/>
				</div>
				<div>
					<label for="salle">Salle : </label><br/>
					<input type="text" name="salle" id="salle" value=""/>
				</div>
				
				<input type="submit" value="chercher"/>
			</form>
		</div>
		
		<div class="affichage">
		
		<% 
			String r_intitule = (String)request.getAttribute("r_intitule");
			String r_prof = (String)request.getAttribute("r_prof");
			String r_date = (String)request.getAttribute("r_date");
			String r_jusqua_date = (String)request.getAttribute("r_jusqua_date");
			String r_salle = (String)request.getAttribute("r_salle");
			
			
			if(r_intitule == null) r_intitule = "";
			if(r_prof == null) r_prof = "";
			if(r_date == null) r_date = "";
			if(r_salle == null) r_salle = "";
			if(r_jusqua_date == null) r_jusqua_date = "";
		
		%>
		
		
		<c:forEach var="cours" items="${cours_list.find_cours(r_intitule, r_prof, r_date, r_jusqua_date, r_salle) }">
		
			<form class="cours" id="<c:out value="${cours.get_type()}" />" action="/new_EDT/EDTManager" method="post" >
				<input type="hidden" name="form-type" value="Access-Cours"/>
				<input type="hidden" name="id" value="<c:out value="${ cours.get_id()}" />"/>
				
				<h3><c:out value="${cours.get_intitule()}" /></h3>	
				
				<p class="main">Salle : <b> <c:out value="${cours.get_salle() }" /> </b>
				Le <b> <c:out value="${cours.affiche_date() }" /> </b> de <b> <c:out value="${cours.get_heure_debut()}" /> </b> à <b> <c:out value="${cours.get_heure_fin()}" /> </b> 
				</p>
				<p class="optionel">Professeur : <b> <c:out value="${cours.get_professeur()}" /> </b>
				Lieu : <b> <c:out value="${cours.get_lieu()}" /> </b>
				</p>
				
				<div class="submit">
					<input type="submit" value="Modifier" class="submit"/>
				</div>
			</form>
		
		</c:forEach>
		
		
		
		
		
		
		
		
		 
		</div>
	
	</div>

</body>
</html>