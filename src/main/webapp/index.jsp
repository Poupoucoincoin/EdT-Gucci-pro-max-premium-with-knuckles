<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>New EDT</title>
	<%@ include file="/MainStyle.jsp" %>
</head>
<body>
	
	<div class="page-wrapper">
	
		<%@ include file="/Header.jsp" %>
		
		<div class="formulaire">
		
			<h2>Consulter un cours</h2>
			
			<form action="/new_EDT/EDTManager" method="post">
				<input type="hidden" name="form-type" value="Consult-Cours"/>
				<div>
					<label for="course_name">Intitulé du cours : </label><br/>
					<input type="text" name="course_name" id="course_name"/>
				</div>
				<div>
					<label for="prof_name">Professeur : </label><br/>
					<input type="text" name="prof_name" id="prof_name"/>
				</div>
				<div>
					<label for="date">Date : </label><br/>
					<input type="date" name="date" id="date" value=""/>
				</div>
				<div>
					<label for="salle">Salle : </label><br/>
					<input type="text" name="salle" id="salle" value=""/>
				</div>
				
				<input type="submit" value="chercher"/>
			</form>
		</div>
		
		<div class="affichage">
		
		<% String id_cours="", nom_cours="Sodomie", nom_prof="Le P", salle="S2-0-S6", heure_debut="8h00", heure_fin="17h00", date="01/03/2024", lieu= "Moufia" ; %>
		
			<form class="cours" action="/new_EDT/EDTManager" method="post" >
				<input type="hidden" name="form-type" value="Modif-Cours"/>
				<input type="hidden" name="form-type" value="<%= id_cours %>"/>
				
				<h3><%= nom_cours %></h3>	
				
				<p class="main">Salle : <b> <%= salle %> </b>
				Le <b> <%= date %> </b> de <b> <%= heure_debut %> </b> à <b> <%= heure_fin %> </b> 
				</p>
				<p class="optionel">Professeur : <b> <%= nom_prof %> </b>
				Lieu : <b> <%= lieu %> </b>
				</p>
				
				<div class="submit">
					<input type="submit" value="Modifier" class="submit"/>
				</div>
			</form>
		
		</div>
	
	</div>

</body>
</html>