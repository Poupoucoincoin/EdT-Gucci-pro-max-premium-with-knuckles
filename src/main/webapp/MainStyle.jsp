<style>



body{
	text-align:center;
	margin: 0px;
}

div {
	padding: 0.5em;
}

div.page-wrapper {
	padding: 0.5em 0.5em 0 0.5em; 
	text-align: left;
	display:grid;
	grid-template-columns: 1fr 4fr;
    grid-template-rows:  1fr minmax(auto, auto);
    row-gap : 10px;
    column-gap : 5px;
    grid-template-areas:
        "header header"
        "form affichage";
}

header{
	grid-area:header;
	text-align: center;
}

div.formulaire{
	display: block;
	grid-area: form;
	text-align: center;
	color: white;
	height: 100%;
	
}

div.affichage{
	grid-area: affichage;
}

h1{
	margin: 0.25em 1em;
}


div.onglet>a {
  color: white;
  padding: 15px 25px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  border-radius: 4px;
  transition-duration: 0.4s;
}

form.cours{
	padding: 1em 1em 0.5em 1em;
	margin: 0 0 0.5em 0;
	border: 5px solid;
	display: block;
}

div.cours{
	font-size : 0.75em;
	padding: 1em 0.2em 0.5em 0.2em;
	margin: 0 0 0.5em 0;
	border: 2px solid;
	display: block;
}

h3{
	margin:0;
	padding: 0 0 0.5em 0;
	display: block;
	text-align: center;
	white-space: pre-line;
}

form.cours>p, div.cours>p {
	line-height: 1.2em;
	margin: 0;
	padding: 0;
	white-space: pre-line;
}

form.cours>p.main, div.cours>p.main {
	text-align: center;
}

form.cours>p.optionel, div.cours>p.optionnel{
	text-align: left;
}



form.cours > div.submit{
	padding: 0;
	margin: 0.5em 0 0 0;
	text-align: center;
}


table.choix_semaine{
	
	width: 100%; 
}

table.choix_semaine p {
	margin : 0;
}

table.choix_semaine a {
  color: white;
  width: 100%;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  border-radius: 4px;
  transition-duration: 0.4s;
}


table.calendrier{
	border-collapse: collapse;
	width: 100%;
	
}

#exam {
	background-color: red;
	border-color: Crimson;
}

#td{
	background-color: LawnGreen;
	border-color: green;
}


#cm{
	background-color: Cyan;
	border-color: DarkCyan;
}

#tp{
	background-color: yellow;
	border-color: Gold;
}

th, td {
	vertical-align: text-top;
	width: 16.5%;
}




</style>