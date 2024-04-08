<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>New EDT</title>
	<link rel="stylesheet" type="text/css" media="screen" href="./style/main.css"/>
</head>
<body>
	
	<%@ include file="/Header.jsp" %>
	
	<h2>Consulter un cours</h2>
	
	<form action="/new_EDT/ConsultCours" method="post">
		<div>
			<label for="course_name">Intitulé du cours : </label>
			<input type="text" name="course_name" id="course_name"/>
		</div>
		<div>
			<label for="prof_name">Professeur : </label>
			<input type="text" name="prof_name" id="prof_name"/>
		</div>
		
		<input type="submit"/>
	</form>
	

</body>
</html>