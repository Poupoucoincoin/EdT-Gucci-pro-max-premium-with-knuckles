<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:useBean id="cours_list" class="beans.CoursList" scope="application"/>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% 
	int err;
	String cours_name="", prof_name="", salle="", date="", heure_debut="", heure_fin="", lieu="", type="";
	String alert = "";
	
	if((String)request.getAttribute("Add-Error") != null){
		err = Integer.parseInt((String)request.getAttribute("Add-Error"));
		
		cours_name = (String)request.getAttribute("a_intitule");
		prof_name = (String)request.getAttribute("a_prof");
		salle = (String)request.getAttribute("a_salle");
		date = (String)request.getAttribute("a_date");
		heure_debut = (String)request.getAttribute("a_heure_debut");
		heure_fin = (String)request.getAttribute("a_heure_fin");
		lieu = (String)request.getAttribute("a_lieu");
		type = (String)request.getAttribute("a_type");
		
		if (err == 1){
			
			alert = "alert('Des informations sont manquantes');";
			
		} else if (err == 0){
			
			if (cours_list.est_ajoutable(date, heure_debut, heure_fin)){
				cours_list.ajouter_cours(cours_name, prof_name, date, heure_debut, heure_fin, salle, lieu, type);
				alert = "alert('Cours ajouté');";
				cours_name = "";
				prof_name = "";
				salle = "";
				date = "";
				heure_debut = "";
				heure_fin = "";
				lieu = "";
				type = "";
			} else{
				alert = "alert('La plage horaire indiquer empiète sur un autre cours');";
			}
			
		}
	}

%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>New EDT</title>
	<%@ include file="/MainStyle.jsp" %>
</head>
<body onload="<%= alert %>">

	<div>

		<%@ include file="/Header.jsp" %>
		
		<div>
		
			<h2>Ajouter un cours</h2>
						
			
			<form action="/new_EDT/EDTManager" method="post">
				<input type="hidden" name="form-type" value="Add-Cours"/>
				<div>
					<label for="cours_name">Intitulé du cours : </label><br/>
					<input type="text" name="cours_name" id="cours_name" value="<c:out value="${ cours_name }" />"/>
				</div>
				<div>
					<label for="prof_name">Professeur : </label><br/>
					<input type="text" name="prof_name" id="prof_name" value="<c:out value="${ prof_name }" />"/>
				</div>
				<div>
					<label for="date">Date : </label><br/>
					<input type="date" name="date" id="date" value="<c:out value="${ date }" />"/>
				</div>
				<div>
					<label for="heure_debut">Heure de début : </label><br/>
					<input type="time" name="heure_debut" id="heure_debut" value="<c:out value="${ heure_debut}" />"/>
				</div>
				<div>
					<label for="heure_fin">Heure de fin : </label><br/>
					<input type="time" name="heure_fin" id="heure_fin" value="<c:out value="${ heure_fin }" />"/>
				</div>
				<div>
					<label for="salle">Salle : </label><br/>
					<input type="text" name="salle" id="salle" value="<c:out value="${ salle }" />"/>
				</div>
				<div>
					<label for="lieu">Lieu : </label><br/>
					<input type="text" name="lieu" id="lieu" value="<c:out value="${ lieu }" />"/>
				</div>
				<div>
					<label>Type de cours :</label><br/>
					<select name="type-cours">
						<option value=""></option>
						<option value="cm">Cours magistral</option>
						<option value="td">Travail dirigé</option>
						<option value="exam">Examen</option>
					</select>		
				</div>
				
				<input type="submit" value="Ajouter"/>
			</form>
		</div>
	
	</div>

</body>
</html>