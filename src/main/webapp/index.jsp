<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="cours_list" class="beans.CoursList" scope="application"/>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	int s_id;
	String alert = "";

	if ((String)request.getAttribute("s_id") != null){
		s_id = Integer.parseInt((String)request.getAttribute("s_id"));
		
		alert="alert('Cours supprimer');";
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
	
	<div class="page-wrapper">
	
		<%@ include file="/Header.jsp" %>
		
		<div class="formulaire">
		
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
					<label for="date">Date : </label><br/>
					<input type="date" name="date" id="date" value=""/><br/>
					<input type="radio" name="depuis_date" id ="depuis_date" value="true" checked="checked"/>
					<label for="depuis_date">Depuis</label><br/>
					<input type="radio" name="depuis_date" id ="uniq_date" value="false"/>
					<label for="uniq_date">Uniquement</label>
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
			String p_intitule = (String)request.getAttribute("p_intitule");
			String p_prof = (String)request.getAttribute("p_prof");
			String p_date = (String)request.getAttribute("p_date");
			String p_salle = (String)request.getAttribute("p_salle");
			String p_depuis_date = (String)request.getAttribute("p_depuis_date");
			
			if(p_intitule == null) p_intitule="";
			if(p_prof == null) p_prof="";
			if(p_date == null) p_date="";
			if(p_salle == null) p_salle="";
			if(p_depuis_date == null) p_depuis_date = "true";
			
		
		%>
		
		
		<c:forEach var="cours" items="${cours_list.find_cours(p_intitule, p_prof, p_date, p_depuis_date, p_salle) }">
		
			<form class="cours" id="<c:out value="${cours.get_type()}" />" action="/new_EDT/EDTManager" method="post" >
				<input type="hidden" name="form-type" value="Access-Cours"/>
				<input type="hidden" name="id" value="<c:out value="${ cours.get_id()}" />"/>
				
				<h3><c:out value="${cours.get_intitule()}" /></h3>	
				
				<p class="main">Salle : <b> <c:out value="${cours.get_salle() }" /> </b>
				Le <b> <c:out value="${cours.get_date() }" /> </b> de <b> <c:out value="${cours.get_heure_debut()}" /> </b> à <b> <c:out value="${cours.get_heure_fin()}" /> </b> 
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