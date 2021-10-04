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
  	<script src="../JavaScript/proveedores.js"></script>
</head>
<body>
	<jsp:include page="Menu.jsp"></jsp:include>
	<form id="from">
		<div class="container pt-3">
	        <div class="mb-3">
	            <label for="texto_NIT" class="form-label">NIT</label>
	            <input type="number" class="form-control"
	                placeholder="Ingrese el Numero de Identificacion Tributaria del proveedor" name="texto_NIT_proveedor" id="nit_proveedor" value="">
	        </div>
	        <div class="mb-3">
	            <label for="texto_proveedor" class="form-label">Nombre Proveedor</label>
	            <input type="text" class="form-control" placeholder="Ingrese el Nombre del proveedor" name="texto_nombre_proveedor" id="nombre_proveedor" value="">
	        </div>
	        <div class="mb-3">
	            <label for="texto_direccion" class="form-label">Direccion</label>
	            <input type="text" class="form-control" placeholder="Ingrese Direccion del proveedor" name="texto_direccion_proveedor" id="direccion_proveedor" value="">
	        </div>
	        <div class="mb-3">
	            <label for="texto_telefono" class="form-label">Telefono</label>
	            <input type="tel" class="form-control" placeholder="Ingrese Telefono del proveedor"name="texto_telefono_proveedor" id="telefono_proveedor" value="">
	        </div>
	        <div class="mb-3">
	            <label for="texto_ciudad" class="form-label">Ciudad</label>
	            <input type="text" class="form-control" placeholder="Ingrese Ciudad del proveedor" name="texto_ciudad_proveedor" id="ciudad_proveedor" value="">
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
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ"
        crossorigin="anonymous"></script>
</body>

</html>