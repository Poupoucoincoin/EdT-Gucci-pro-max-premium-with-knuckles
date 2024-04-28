<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:useBean id="cours_list" class="beans.CoursList" scope="application"/>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	int a_id;	
	
	// Test fait à l'acces de la page
	if ((String)request.getAttribute("a_id") != null){
		a_id = Integer.parseInt((String)request.getAttribute("a_id"));
		%>
		<c:set var="cours" value="${ cours_list.find_cours(a_id) }" scope="request" />
		<%
	}
	
	
	// Modification du cours
	int err, m_id;
	String cours_name="", prof_name="", salle="", date="", heure_debut="", heure_fin="", lieu="", type="";
	String alert = "", redirect = "";
	
	if((String)request.getAttribute("Add-Error") != null){
		err = Integer.parseInt((String)request.getAttribute("Add-Error"));
		
		m_id = Integer.parseInt((String)request.getAttribute("m_id"));
		cours_name = (String)request.getAttribute("m_intitule");
		prof_name = (String)request.getAttribute("m_prof");
		salle = (String)request.getAttribute("m_salle");
		date = (String)request.getAttribute("m_date");
		heure_debut = (String)request.getAttribute("m_heure_debut");
		heure_fin = (String)request.getAttribute("m_heure_fin");
		lieu = (String)request.getAttribute("m_lieu");
		type = (String)request.getAttribute("m_type");
		
		if (err == 1){
			
			alert = "alert('Des informations sont manquantes');";
			
		} else if (err == 0){
			
			if (cours_list.est_ajoutable(date, heure_debut, heure_fin)){
				cours_list.modifier_cours(m_id, cours_name, prof_name, date, heure_debut, heure_fin, salle, lieu, type);
				
				redirect = "<meta http-equiv=\"refresh\" content=\"0; url='/new_EDT/EDTManager?action=cours_modified'\" />";
			} else{
				alert = "alert('La plage horaire indiquer empiète sur un autre cours');";
			}
			
		}
	}
	
	// Suppression du cours
	
	int s_id;
	
	if ((String)request.getAttribute("s_id") != null){
		s_id = Integer.parseInt((String)request.getAttribute("s_id"));
		
		cours_list.suppimer_cours(s_id);
		redirect = "<meta http-equiv=\"refresh\" content=\"0; url='/new_EDT/EDTManager?action=cours_removed'\" />";
	}

%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>New EDT</title>
	<%= redirect %>
	<%@ include file="/MainStyle.jsp" %>
</head>
<body onload="<%= alert %>">
	
	<div>
		<%@ include file="/Header.jsp" %>
		
		<div>
			
			<h2>Modifier un cours</h2>
			
			<form action="/new_EDT/EDTManager" method="post">
				<input type="hidden" name="form-type" value="Modif-Cours"/>
				<input type="hidden" name="id" value="<c:out value="${ cours.get_id()}" />"/>
				<div>
					<label for="cours_name">Intitulé du cours : </label><br/>
					<input type="text" name="cours_name" id="cours_name" value="<c:out value="${ cours.get_intitule() }"/>"/>
				</div>
				<div>
					<label for="prof_name">Professeur : </label><br/>
					<input type="text" name="prof_name" id="prof_name" value="<c:out value="${ cours.get_professeur() }"/>"/>
				</div>
				<div>
					<label for="date">Date : </label><br/>
					<input type="date" name="date" id="date" value="<c:out value="${ cours.get_date() }"/>"/>
				</div>
				<div>
					<label for="heure_debut">Heure de début : </label><br/>
					<input type="time" name="heure_debut" id="heure_debut" value="<c:out value="${ cours.get_heure_debut() }"/>"/>
				</div>
				<div>
					<label for="heure_fin">Heure de fin : </label><br/>
					<input type="time" name="heure_fin" id="heure_fin" value="<c:out value="${ cours.get_heure_fin() }"/>"/>
				</div>
				<div>
					<label for="salle">Salle : </label><br/>
					<input type="text" name="salle" id="salle" value="<c:out value="${ cours.get_salle() }"/>"/>
				</div>
				<div>
					<label for="lieu">Lieu : </label><br/>
					<input type="text" name="lieu" id="lieu" value="<c:out value="${ cours.get_lieu() }"/>"/>
				</div>
				<div>
					<label>Type de cours :</label><br/>
					<select name="type-cours">
						<option value="cm" <c:if test="${ cours.get_type().equals('cm') }"> selected</c:if>>Cours magistral</option>
						<option value="td" <c:if test="${ cours.get_type().equals('td') }"> selected</c:if>>Travail dirigé</option>
						<option value="exam" <c:if test="${ cours.get_type().equals('exam') }"> selected</c:if> >Examen</option>
					</select>		
				</div>
				
				<div>
					<input type="submit" name="submit_button" value="Modifier"/>
					<input type="submit" name="submit_button" value="Supprimer"/>
				</div>
			</form>
		</div>
	
	</div>
	
	
	
	
	

</body>
</html>