<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Clientes</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
        
   	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</head>

<body>
<jsp:include page="Menu.jsp"></jsp:include>


<form id="from">
    <div class="container pt-3">
        <div class="mb-3">
            <label for="texto_cedula" class="form-label">Cedula</label>
            <input type="number" class="form-control" id="texto_cedula"
                placeholder="Ingrese numero de documento de identidad" name="texto_cedula_cliente"  required>
        </div>
        <div class="mb-3">
            <label for="texto_nombre" class="form-label">Nombre Completo</label>
            <input type="text" class="form-control" id="texto_nombre" placeholder="Ingrese Nombres y apellidos del cliente" name="texto_nombre_cliente">
        </div>
        <div class="mb-3">
            <label for="texto_direccion" class="form-label">Direccion</label>
            <input type="text" class="form-control" id="texto_direccion" placeholder="Ingrese Direccion del cliente" name="texto_direccion_cliente">
        </div>
        <div class="mb-3">
            <label for="texto_telefono" class="form-label">Telefono</label>
            <input type="tel" class="form-control" id="texto_telefono" placeholder="Ingrese Telefono del cliente" name="texto_telefono_cliente">
        </div>
        <div class="mb-3">
            <label for="texto_correo" class="form-label">Corrreo Electronico</label>
            <input type="email" class="form-control" id="texto_correo" placeholder="Ingrese Correo Electronico del cliente" name="texto_correo_cliente">
        </div>

        <div class="d-grid gap-3 d-md-block">
            <button class="btn btn-primary" type="button" name="boton_consultar_cliente" id = "consultar">Consultar</button>
            <button class="btn btn-success" type="button" name="boton_crear_cliente" id = "crear">Crear</button>
            <button class="btn btn-info" type="button" name="boton_actualizar_cliente" id = "actualizar">Actualizar</button>
            <button class="btn btn-danger" type="button" name="boton_borrar_cliente" id = "borrar">Borrar</button>
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
		          	cedula_cliente: $("#texto_cedula").val(),
		          	direccion_cliente:$("#texto_direccion").val(),
		          	email_cliente: $("#texto_correo").val(),
		          	nombre_cliente: $("#texto_nombre").val(),
		          	telefono_cliente: $("#texto_telefono").val()
		        });
				  //el request con toda la informacion del lugar que se consultará
		        var request = $.ajax({
		            url: "http://localhost:8080/clientes",
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
		            	$("#toast_body").text("Cliente no se pudo "+ small +".");
		            }
		            else{
		            	$('.toast').toast('show');
		            	$("#strong").text(strong);
		            	$("#small").text("Exito al "+strong);
		            	$("#toast_body").text("Cliente se "+small+" exitosamente.");		            	
		            }
		        });
				  //en caso de que el requerimiento falle
		        request.fail(function(jqXHR, textStatus) {
		            alert("Hubo un error: " + textStatus);
		        });  
		  }
		
			
		//CONSULTAR	por Id
		  $("#consultar").click(function(){
	        var request = $.ajax({
	            url: "http://localhost:8080/clientes/" + $("#texto_cedula").val() ,
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
	            	$("#toast_body").text("Cliente no existe.");
	            }
	            else{
	            	$("#texto_cedula").val(respuesta.cedula_cliente);
	            	$("#texto_nombre").val(respuesta.nombre_cliente);
	            	$("#texto_direccion").val(respuesta.direccion_cliente);
	            	$("#texto_telefono").val(respuesta.telefono_cliente);
	            	$("#texto_correo").val(respuesta.email_cliente);
	            }
	        });
	        request.fail(function(jqXHR, textStatus) {
	            alert("Hubo un error: " + textStatus);
	        });
		  });
		
		//CREAR
		  $("#crear").click(function(){
			  crearActualizar("Crear","crea"); 
		  });
		  $("#actualizar").click(function(){
	  			crearActualizar("Actualizar","actualiza");
	  		});
	    
		  //BORRAR
	   	  $("#borrar").click(function(){
			    var request = $.ajax({
				            url: "http://localhost:8080/clientes/"+ $("#texto_cedula").val() ,
				            method: "delete",
				            dataType: "text",
				            contentType:'application/json'
	    		});
			    request.done(function(respuesta) {
		        	if(respuesta==="Error Eliminado Cliente"){
		        		$('.toast').toast('show');
		            	$("#strong").text("Borrar");
		            	$("#small").text("Error al borrar");
		            	$("#toast_body").text("Cliente no se pudo borrar.");
		        	}
		        	else{
			        	$('.toast').toast('show');
		            	$("#strong").text("Borrar");
		            	$("#small").text("Exito al borrar");
		            	$("#toast_body").text("Cliente se borró exitosamente.");
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

</html>