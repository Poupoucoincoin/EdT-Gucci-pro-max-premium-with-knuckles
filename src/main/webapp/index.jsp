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
				
				<input type="submit"/>
			</form>
		</div>
		
		<div class="affichage">
		
		
		
		</div>
	
	</div>

</body>
</html>