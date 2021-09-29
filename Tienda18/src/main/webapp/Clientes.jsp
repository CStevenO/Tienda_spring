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


<form method="post">
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
            <button class="btn btn-success" type="submit" name="boton_crear_cliente" id = "crear">Crear</button>
            <button class="btn btn-info" type="submit" name="boton_actualizar_cliente" id = "actualizar">Actualizar</button>
            <button class="btn btn-danger" type="submit" name="boton_borrar_cliente" id = "borrar">Borrar</button>
        </div>
    </div>
</form>
<pre id="arrPrint"></pre>
<script type="text/javascript">
	$(document).ready(function(){
		
			
		//CREAR
		// evento de darle clic al boton con id="inicio"
		  $("#crear").click(function(){
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
	            if(respuesta.cedula_cliente === 0){
	            	$('.toast').toast('show');
	            }
	            else{
	            	$("#texto_cedula").val(respuesta.cedula_cliente);
	            	$("#texto_nombre").val(respuesta.nombre_cliente);
	            	$("#texto_direccion").val(respuesta.direccion_cliente);
	            	$("#texto_telefono").val(respuesta.telefono_cliente);
	            	$("#texto_correo").val(respuesta.email_cliente);
	            }
	        });
			  //en caso de que el requerimiento falle
	        request.fail(function(jqXHR, textStatus) {
	            alert("Hubo un error: " + textStatus);
	        });
		  });
			
		//CONSULTAR	por Id
		// evento de darle clic al boton con id="inicio"
		  $("#consultar").click(function(){
			  
			  //el request con toda la informacion del lugar que se consultará
	        var request = $.ajax({
	            url: "http://localhost:8080/clientes/" + $("#texto_cedula").val() ,
	            method: "get",
	            dataType: "json",
	            contentType:'application/json'
	        });
			  //esta es la respuesta obtenida de la API
	        request.done(function(respuesta) {
	        	console.log(respuesta);
	            if(respuesta.cedula_cliente === 0){
	            }
	            else{
	            	$("#texto_cedula").val(respuesta.cedula_cliente);
	            	$("#texto_nombre").val(respuesta.nombre_cliente);
	            	$("#texto_direccion").val(respuesta.direccion_cliente);
	            	$("#texto_telefono").val(respuesta.telefono_cliente);
	            	$("#texto_correo").val(respuesta.email_cliente);
	            }
	        });
			  //en caso de que el requerimiento falle
	        request.fail(function(jqXHR, textStatus) {
	            alert("Hubo un error: " + textStatus);
	        });
		  });	
		 
		});
	 
	  
	</script>
	
	
		<%
		if(request.getAttribute("confirmacion")!=null){
			boolean confirmacion = (boolean)request.getAttribute("confirmacion");
			if(confirmacion){
				%>
				<div align='center'>
					<div class="toast">
				    	<div class="toast-header">
				      		<strong class="mr-auto text-primary">Ingresar</strong>
				      		<small class="text-muted">Base de datos</small>
				    	</div>
				    	<div class="toast-body">
				      		El Cliente ha sido ingresado exitosamente.
				    	</div>
				  	</div>
				  	<script>
						$(document).ready(function(){
						  $('.toast').toast('show');
						});
				 	</script>
			 	</div>
			  <% 
			}
			else{
				%>
				<div align='center'>
					<div class="toast">
					    <div class="toast-header">
					      <strong class="mr-auto text-primary">Ingresar</strong>
					      <small class="text-muted">Base de datos</small>
					    </div>
					    <div class="toast-body">
					      El Cliente no ha sido ingresado.
					    </div>
					  </div>
					  <script>
						$(document).ready(function(){
						  $('.toast').toast('show');
						});
				 	  </script>
			 	  </div>
			  <% 
			}
		}
		if(request.getAttribute("borrar")!=null){
			boolean borro = (boolean)request.getAttribute("borrar");
			if(borro){
				%>
				<div align='center'>
					<div class="toast">
					    <div class="toast-header">
					      	<strong class="mr-auto text-primary">Borrar</strong>
					      	<small class="text-muted">Base de datos</small>
					    </div>
					    <div class="toast-body">
					      	El Cliente ha sido borrado exitosamente.
					    </div>
					  </div>
					  <script>
							$(document).ready(function(){
						 	 $('.toast').toast('show');
							});
				 	  </script>
		 	 	</div>
			  <% 
			}
			else{
				%>
				<div align='center'>
					<div class="toast">
					    <div class="toast-header">
					      	<strong class="mr-auto text-primary">Borrar</strong>
					      	<small class="text-muted">Base de datos</small>
					    </div>
					    <div class="toast-body">
					      	El Cliente no ha sido borrado.
					    </div>
					  </div>
					  <script>
							$(document).ready(function(){
						 	 $('.toast').toast('show');
							});
				 	  </script>
			 	 </div>
			 	 
			  <% 
			}
		}
		if(request.getAttribute("actualizar")!=null){
			boolean actualizo = (boolean)request.getAttribute("actualizar");
			if(actualizo){
		%>
		<div align='center'>
					<div class="toast">
					    <div class="toast-header">
					      	<strong class="mr-auto text-primary">Actualizar</strong>
					      	<small class="text-muted">Base de datos</small>
					    </div>
					    <div class="toast-body">
					      	El Cliente ha sido actualizado exitosamente.
					    </div>
					  </div>
					  <script>
							$(document).ready(function(){
						 	 $('.toast').toast('show');
							});
				 	  </script>
		 	 	</div>
		
		<%
			}
			else{
		%>
		<div align='center'>
					<div class="toast">
					    <div class="toast-header">
					      	<strong class="mr-auto text-primary">Actualizar</strong>
					      	<small class="text-muted">Base de datos</small>
					    </div>
					    <div class="toast-body">
					      	El Cliente no ha sido actualizado.
					    </div>
					  </div>
					  <script>
							$(document).ready(function(){
						 	 $('.toast').toast('show');
							});
				 	  </script>
			 	 </div>
	 	 <%
			}
		}
		if(request.getAttribute("error")!=null){
			String error = (String)request.getAttribute("error");
		%>
		<div align='center'>
					<div class="toast">
					    <div class="toast-header">
					      	<strong class="mr-auto text-primary">Error</strong>
					      	<small class="text-muted">Base de datos</small>
					    </div>
					    <div class="toast-body">
					      	<%=error %>
					    </div>
					  </div>
					  <script>
							$(document).ready(function(){
						 	 $('.toast').toast('show');
							});
				 	  </script>
		 	 	</div>
 	 	<% 
		}
		if(request.getAttribute("vacios")!=null){
			String error = (String)request.getAttribute("vacios");
		%>
		<div align='center'>
					<div class="toast">
					    <div class="toast-header">
					      	<strong class="mr-auto text-primary">Error</strong>
					      	<small class="text-muted">Base de datos</small>
					    </div>
					    <div class="toast-body">
					      	<%=error %>
					    </div>
					  </div>
					  <script>
							$(document).ready(function(){
						 	 $('.toast').toast('show');
							});
				 	  </script>
		 	 	</div>
 	 	<% 
		}
 	 	%>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ"
        crossorigin="anonymous"></script>
</body>

</html>