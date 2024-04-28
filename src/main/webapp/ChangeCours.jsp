<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:useBean id="cours_list" class="beans.CoursList" scope="application"/>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	int a_id;	
	
	if ((String)request.getAttribute("a_id") == null){
		a_id = Integer.parseInt((String)request.getAttribute("a_id"));
		%>
		<c:set var="cours" value="${ cours_list.find_cours(a_id) }" scope="request" />
		<%
	}

%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>New EDT</title>
	<%@ include file="/MainStyle.jsp" %>
</head>
<body>
	
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
					<select name="type-cours" value="<c:out value="${ cours.get_type() }"/>">
						<option value="cm">Cours magistral</option>
						<option value="td">Travail dirigé</option>
						<option value="exam">Examen</option>
					</select>		
				</div>
				
				<input type="submit" name="submit_button" value="Modifier"/>
				<input type="submit" name="submit_button" value="Supprimer"/>
			</form>
		</div>
	
	</div>
	
	
	
	
	

</body>
</html>