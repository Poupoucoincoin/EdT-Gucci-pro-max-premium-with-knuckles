<style>



body{
	text-align:center;
	margin: 0px;
}

div {
	padding: 0.5em;
}

div.page-wrapper {
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
	background-color: #04AA6D;
	text-align: center;
	color: white;
	height: 72vh;
	
}

div.affichage{
	grid-area: affichage;
}

h1{
	margin: 0.25em 1em;
}


a {
  background-color: #04AA6D; /* Green */
  border: 2px solid #04AA6D;
  color: white;
  padding: 15px 25px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  border-radius: 4px;
  transition-duration: 0.4s;
}

a:hover {
  background-color: white;
  color: black;
  border: 2px solid #04AA6D;
}

form.cours{
	padding: 1em 1em 0.5em 1em;
	border: 1px solid #000000;
	display: block;
}

form.cours>h3{
	margin:0;
	padding: 0 0 0.5em 0;
	display: block;
	text-align: center;
	white-space: pre-line;
}

form.cours>p {
	line-height: 1.2em;
	margin: 0;
	padding: 0;
	white-space: pre-line;
}

form.cours>p.main {
	text-align: center;
}

form.cours>p.optionel{
	text-align: left;
}



form.cours > div.submit{
	padding: 0;
	margin: 0.5em 0 0 0;
	text-align: center;
}

form.exam{
	background-color: red;
}

form.td{
	background-color: green;
}

form.cm{
	background-color: blue;
}

</style>