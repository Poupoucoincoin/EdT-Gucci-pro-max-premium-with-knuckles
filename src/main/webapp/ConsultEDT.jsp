<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:useBean id="cours_list" class="beans.CoursList" scope="application"/>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>New EDT</title>
	<%@ include file="/MainStyle.jsp" %>
</head>
<body>

	<%@ include file="/Header.jsp" %>
	
	
	
	<h2>Consulter l'EDT</h2>
	
	<div class="affichage">
		
		<% String val = "true"; %>
	
		<c:forEach var="cours" items="${cours_list.find_cours('', '', '', val, '') }">
		
			<form class="cours" id="<c:out value="${cours.get_type()}" />" action="/new_EDT/EDTManager" method="post" >
				<input type="hidden" name="form-type" value="Modif-Cours"/>
				<input type="hidden" name="form-type" value="<c:out value="${ cours.get_id()}" />"/>
				
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
	

</body>
</html>