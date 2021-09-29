<%@ page language="java"%>
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Proveedores</title>
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
	            <label for="texto_NIT" class="form-label">NIT</label>
	            <input type="number" class="form-control"
	                placeholder="Ingrese el Numero de Identificacion Tributaria del proveedor" name="texto_NIT_proveedor" id="nit_proveedor" required>
	        </div>
	        <div class="mb-3">
	            <label for="texto_proveedor" class="form-label">Nombre Proveedor</label>
	            <input type="text" class="form-control" placeholder="Ingrese el Nombre del proveedor" name="texto_nombre_proveedor" id="nombre_proveedor">
	        </div>
	        <div class="mb-3">
	            <label for="texto_direccion" class="form-label">Direccion</label>
	            <input type="text" class="form-control" placeholder="Ingrese Direccion del proveedor" name="texto_direccion_proveedor" id="direccion_proveedor">
	        </div>
	        <div class="mb-3">
	            <label for="texto_telefono" class="form-label">Telefono</label>
	            <input type="tel" class="form-control" placeholder="Ingrese Telefono del proveedor"name="texto_telefono_proveedor" id="telefono_proveedor">
	        </div>
	        <div class="mb-3">
	            <label for="texto_ciudad" class="form-label">Ciudad</label>
	            <input type="text" class="form-control" placeholder="Ingrese Ciudad del proveedor" name="texto_ciudad_proveedor" id="ciudad_proveedor">
	        </div>
	
	        <div class="d-grid gap-3 d-md-block">
	            <button class="btn btn-primary" type="button" name="boton_consultar_proveedor" id="consultar">Consultar</button>
	            <button class="btn btn-success" type="button" name="boton_crear_proveedor" id="crear">Crear</button>
	            <button class="btn btn-info" type="button" name="boton_actualizar_proveedor" id="actualizar">Actualizar</button>
	            <button class="btn btn-danger" type="button" name="boton_borrar_proveedor" id="borrar">Borrar</button>
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
    			var datos = JSON.stringify({
		          	"nit_proveedor": parseInt($("#nit_proveedor").val(),10),
		        	"nombre_proveedor": $("#nombre_proveedor").val(),
		        	"direccion_proveedor": $("#direccion_proveedor").val(),
		        	"telefono_proveedor": $("#telefono_proveedor").val(),
		        	"ciudad_proveedor": $("#ciudad_proveedor").val()
		        });
		        var request = $.ajax({
		            url: "http://localhost:8080/proveedores", 
		            method: "post", 
		            data: datos,
		            dataType: "json",
		            contentType:'application/json'
		        });
		        request.done(function(respuesta) {
		        	if(respuesta===null){
		        		$('.toast').toast('show');
		            	$("#strong").text(strong);
		            	$("#small").text("Error al "+small);
		            	$("#toast_body").text("Proveedor no se pudo "+ small +".");
		        	}
			        else{
			        	$('.toast').toast('show');
		            	$("#strong").text(strong);
		            	$("#small").text("Exito al "+small);
		            	$("#toast_body").text("Proveedor se "+small+" exitosamente.");
			        }
		        });
		        request.fail(function(jqXHR, textStatus) {
		            alert("Hubo un error: " + textStatus);
		        });
    		}
    		//CONSULTAR
	  		$("#consultar").click(function(){
		        var request = $.ajax({
		            url: "http://localhost:8080/proveedores/" + $("#nit_proveedor").val(), 
		            method: "get", 
		            dataType: "json",
		            contentType:'application/json'
		        });
		        request.done(function(respuesta) {
		        	if(respuesta===null){
		        		$('.toast').toast('show');
		            	$("#strong").text("Consultar");
		            	$("#small").text("Error al consultar");
		            	$("#toast_body").text("Proveedor no existe.");
		        	}
			        else{
		            	$("#nombre_proveedor").val(respuesta.nombre_proveedor);
		            	$("#direccion_proveedor").val(respuesta.direccion_proveedor);
		            	$("#telefono_proveedor").val(respuesta.telefono_proveedor);
		            	$("#ciudad_proveedor").val(respuesta.ciudad_proveedor);
			        }
		        });
		        request.fail(function(jqXHR, textStatus) {
		            alert("Hubo un error: " + textStatus);
		        });
		 	});
	  		//CREAR
	  		$("#crear").click(function(){
	  			crearActualizar("Crear","crear");
			  });
	  		$("#actualizar").click(function(){
	  			crearActualizar("Actualizar","actualizar");
	  		});
	  		$("#borrar").click(function(){
		        var request = $.ajax({
		            url: "http://localhost:8080/proveedores/" + $("#nit_proveedor").val(), 
		            method: "delete", 
		            dataType: "text",
		            contentType:'application/json'
		        });
		        request.done(function(respuesta) {
		        	if(respuesta==="Error Eliminado Proveedor"){
		        		$('.toast').toast('show');
		            	$("#strong").text("Borrar");
		            	$("#small").text("Error al borrar");
		            	$("#toast_body").text("Proveedor no se pudo borrar.");
		        	}
			        else{
			        	$('.toast').toast('show');
		            	$("#strong").text("Borrar");
		            	$("#small").text("Exito al borrar");
		            	$("#toast_body").text("Proveedor se borró exitosamente.");
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