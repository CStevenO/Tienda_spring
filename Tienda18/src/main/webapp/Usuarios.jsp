<%@ page language="java"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Usuarios</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body>
<jsp:include page="Menu.jsp"></jsp:include>

	<form method="post" accept-charset="utf-8">
	    <div class="container pt-3">
	        <div class="mb-3">
	            <label for="texto_cedula" class="form-label">Cedula</label>
	            <input type="number" class="form-control" id="texto_cedula"
	                placeholder="Ingrese numero de documento de identidad" name="texto_cedula_usuario" value="" required>
	        </div>        
	        <div class="mb-3">
	            <label for="texto_nombre" class="form-label">Nombre Completo</label>
	            <input type="text" class="form-control" id="texto_nombre" placeholder="Ingrese Nombres y apellidos" name="texto_nombre_usuario"
	            	value="">
	        </div>
	        <div class="mb-3">
	            <label for="texto_correo" class="form-label">Correo Electronico</label>
	            <input type="email" class="form-control" id="texto_correo" placeholder="Ingrese Correo Electronico" name="texto_correo_usuario"
	            	value="">
	        </div>
	        <div class="mb-3">
	            <label for="texto_usuario" class="form-label">Usuario</label>
	            <input type="text" class="form-control" id="texto_usuario" placeholder="Ingrese Usuario" name="texto_usuario"
	            	value="">
	        </div>
	        <div class="mb-3">
	            <label for="texto_contra" class="form-label">Contraseña</label>
	            <input type="password" class="form-control" id="password" placeholder="Ingrese Constraseña" name="texto_contra_usuario">
	        </div>
	
	        <div class="d-grid gap-3 d-md-block">
	            <button class="btn btn-primary" type="button" name="boton_consultar_usuario" id="consultar_usuario">Consultar</button>
	            <button class="btn btn-success" type="submit" name="boton_crear_usuario" id="crear_usuario">Crear</button>
	            <button class="btn btn-info" type="submit" name="boton_actualizar_usuario" id="actualizar_usuario">Actualizar</button>
	            <button class="btn btn-danger" type="submit" name="boton_borrar_usuario" id="borrar_usuario">Borrar</button>
	        </div>
	    </div>
   </form>
   
   <script type="text/javascript">
	$(document).ready(function(){
		
		//CREAR
		
		// evento de darle clic al boton con id="inicio"
		  $("#crear_usuario").click(function(){
			  // los parametros que se enviaran a la API (JSON)
	        var datos = JSON.stringify({
	          	cedula_usuario: $("#texto_cedula").val(),
	          	email_usuario: $("#texto_correo").val(),
	        	nombre_usuario: $("#texto_nombre").val(),
	        	password: $("#password").val(),
	        	usuario: $("#texto_usuario").val(),
	        	rol: {"rol":2}
	        });
			  //el request con toda la informacion del lugar que se consultará
	        var request = $.ajax({
	            url: "http://localhost:8080/usuarios",
	            method: "post",
	            data: datos,
	            dataType: "json",
	            contentType:'application/json'
	        });
			  //esta es la respuesta obtenida de la API
	        request.done(function(respuesta) {
	            if(respuesta.cedula_usuario === 0){
	            	$('.toast').toast('show');
	            }
	            else{
	            	$("#texto_cedula").val(respuesta.cedula_usuario);
	            	$("#texto_correo").val(respuesta.email_usuario);
	            	$("#texto_nombre").val(respuesta.nombre_usuario);
	            	$("#password").val(respuesta.password);
	            	$("#texto_usuario").val(respuesta.usuario);           	
	            }
	        });
			  //en caso de que el requerimiento falle
	        request.fail(function(jqXHR, textStatus) {
	            alert("Hubo un error: " + textStatus);
	        });
		  });
		
		// CONSULTAR por Id	
		// evento de darle clic al boton con id="inicio"
		  $("#consultar_usuario").click(function(){
			  
			  //el request con toda la informacion del lugar que se consultará
	        var request = $.ajax({
	            url: "http://localhost:8080/usuarios/"+ $("#texto_cedula").val(),
	            method: "get", 
	            //data: datos,
	            dataType: "json",
	            contentType:'application/json'
	        });
			  //esta es la respuesta obtenida de la API
	        request.done(function(respuesta) {
	            if(respuesta.cedula_usuario === 0){
	            	$('.toast').toast('show');
	            }
	            else{
	            	//window.location.href = "../Inicio.jsp?rol="+respuesta.rol.rol;
	            	$("#texto_cedula").val(respuesta.cedula_usuario);
	            	$("#texto_correo").val(respuesta.email_usuario);
	            	$("#texto_nombre").val(respuesta.nombre_usuario);
	            	$("#password").val(respuesta.password);
	            	$("#texto_usuario").val(respuesta.usuario);  	
	            }
	        });
			  //en caso de que el requerimiento falle
	        request.fail(function(jqXHR, textStatus) {
	            alert("Hubo un error: " + textStatus);
	        });
		  });
		  
		});
	</script>


		
		
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ"
        crossorigin="anonymous"></script>
</body>
</body>
</html>