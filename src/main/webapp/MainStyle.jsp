<style>



body{
	text-align:center;
	margin: 0px;
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
	grid-area: form;
	background-color: #04AA6D;
	text-align: center;
	color: white;
}

div.affichage{
	
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
</style>