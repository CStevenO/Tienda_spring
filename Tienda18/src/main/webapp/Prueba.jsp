<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body>
<script type="text/javascript">
	$(document).ready(function(){
	  $("#botton").click(function(){
	    $.get("http://localhost:8080/usuarios/1026",
	    function(data,status){
	      alert("Data: " + data.email_usuario + "\nStatus: " + status);
	    });
	  });
	});
	</script>
	<button type="submit" class="btn btn-primary" name="boton_ingreso" id="botton">Iniciar sesion</button>
</body>
</html>