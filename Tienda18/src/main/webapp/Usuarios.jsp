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
	            <button class="btn btn-primary" type="button" name="boton_consultar_usuario" id="consultar">Consultar</button>
	            <button class="btn btn-success" type="button" name="boton_crear_usuario" id="crear">Crear</button>
	            <button class="btn btn-info" type="button" name="boton_actualizar_usuario" id="actualizar">Actualizar</button>
	            <button class="btn btn-danger" type="button" name="boton_borrar_usuario" id="borrar">Borrar</button>
	        </div>
	    </div>
   </form>
   	<div align='center'>
		<div class="toast">
	    	<div class="toast-header">
	      		<strong class="mr-auto text-primary" id="strong"></strong>
	      		<small class="text-muted" id="small"></small>
	    	</div>
	    	<div class="toast-body" id="toast_body"></div>
	  	</div>
	</div>
   

<script>
	$(document).ready(function(){
		function crearActualizar(strong,small){
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
		            if(respuesta === null){
		            	$('.toast').toast('show');
		            	$("#strong").text(strong);
		            	$("#small").text("Error al "+small);
		            	$("#toast_body").text("Usuario no se pudo "+ small +".");
		            }
		            else{
		            	$('.toast').toast('show');
		            	$("#strong").text(strong);
		            	$("#small").text("Exito al "+strong);
		            	$("#toast_body").text("Usuario se "+small+" exitosamente.");		            	
		            }
		        });
				  //en caso de que el requerimiento falle
		        request.fail(function(jqXHR, textStatus) {
		            alert("Hubo un error: " + textStatus);
		        });  
		  }
				
		//CREAR usuario
		  $("#crear").click(function(){
			  crearActualizar("Crear","crea"); 
		  });
		//ACTUALIZAR usuario
		  $("#actualizar").click(function(){
	  			crearActualizar("Actualizar","actualiza");
	  		});
		
		//CONSULTAR	por Id
		  $("#consultar").click(function(){
	        var request = $.ajax({
	            url: "http://localhost:8080/usuarios/" + $("#texto_cedula").val() ,
	            method: "get",
	            dataType: "json",
	            contentType:'application/json'
	        });
	        request.done(function(respuesta) {
	        	console.log(respuesta);
	            if(respuesta === null){
	            	$('.toast').toast('show');
	            	$("#strong").text("Consultar");
	            	$("#small").text("Error al consultar");
	            	$("#toast_body").text("Usuario no existe.");
	            }
	            else{
	            	$("#texto_cedula").val(respuesta.cedula_usuario);
	            	$("#texto_correo").val(respuesta.email_usuario);
	            	$("#texto_nombre").val(respuesta.nombre_usuario);
	            	$("#password").val(respuesta.password);
	            	$("#texto_usuario").val(respuesta.usuario);
	            }
	        });
	        request.fail(function(jqXHR, textStatus) {
	            alert("Hubo un error: " + textStatus);
	        });
		  });
			    
		  //BORRAR usuario
	   	  $("#borrar").click(function(){
			    var request = $.ajax({
				            url: "http://localhost:8080/usuarios/"+ $("#texto_cedula").val() ,
				            method: "delete",
				            dataType: "text",
				            contentType:'application/json'
	    		});
			    request.done(function(respuesta) {
		        	if(respuesta==="Error Eliminado Usuario"){
		        		$('.toast').toast('show');
		            	$("#strong").text("Borrar");
		            	$("#small").text("Error al borrar");
		            	$("#toast_body").text("Cliente no se pudo borrar.");
		        	}
		        	else{
			        	$('.toast').toast('show');
		            	$("#strong").text("Borrar");
		            	$("#small").text("Exito al borrar");
		            	$("#toast_body").text("Usuario se borró exitosamente.");
			        }
			    });
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