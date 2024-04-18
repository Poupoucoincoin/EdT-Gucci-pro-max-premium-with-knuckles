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

	<div>

		<%@ include file="/Header.jsp" %>
		
		<div>
		
			<h2>Ajouter un cours</h2>
			
			<form action="/new_EDT/AddCours" method="post">
				<input type="hidden" name="form-type" value="Add-Cours"/>
				<div>
					<label for="course_name">Intitulé du cours : </label>
					<input type="text" name="course_name" id="course_name"/>
				</div>
				<div>
					<label for="prof_name">Professeur : </label>
					<input type="text" name="prof_name" id="prof_name"/>
				</div>
				<div>
					<label for="date">Date : </label>
					<input type="date" name="date" id="date"/>
				</div>
				<div>
					<label for="heure_debut">heure de début : </label>
					<input type="time" name="heure_debut" id="heure_debut"/>
				</div>
				<div>
					<label for="heure_fin">heure de fin : </label>
					<input type="time" name="heure_fin" id="heure_fin"/>
				</div>
				<div>
					<label for="salle">Salle : </label>
					<input type="text" name="salle" id="salle" value=""/>
				</div>
				
				<input type="submit" value="Ajouter"/>
			</form>
		</div>
		
		<div class="affichage">
		
		</div>
	
	</div>

</body>
</html>