<%@ page language="java"%>
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Productos</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
   	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
   	<script src="./JavaScript/productos.js"></script>

</head>

<body>
<jsp:include page="Menu.jsp"></jsp:include>
<%try{
	int rol = (int)session.getAttribute("rol");
	if(rol!=1){
		%>
		<script>window.location.href = "./SinPermiso.jsp?img=productos1";
		</script>
		<%
	}
}
catch(Exception e){
	
}
%>
	<div align='center'>
		<div class="toast">
	    	<div class="toast-header">
	      		<strong class="mr-auto text-primary" id="strong"></strong>
	      		<small class="text-muted" id="small"></small>
	    	</div>
	    	<div class="toast-body" id="toast_body"></div>
	  	</div>
	</div>
    <container pt-3>
	    <form enctype="multipart/form-data">
	        <div class="mb-3">
	            <label for="archivo" class="form-label">Ingrese archivo de productos</label>
	                <input class="form-control" type="file" id="archivo" name="file" placeholder="" accept='.csv' required>
	        </div>
	        <div class="d-grid gap-3 d-md-block">
	            <button class="btn btn-primary btn-lg" type="button" name="boton_cargar_archivo_productos" id="cargar">Cargar</button>
	        </div>
        </form>
    </container>
    <h2 class="text-center">Lista de Productos</h2>
    <table class="table">
        <thead class="table-dark"> 
            <tr>
                <th scope="col" >Código</th>
                <th scope="col">Iva Compra</th>
                <th scope="col">Producto</th>
                <th scope="col">Precio Compra</th>
                <th scope="col">Precio Venta</th>
                <th scope="col">NIT Proveedor</th>
            </tr>
        </thead>
        <tbody id = "myTable">
        
        </tbody>
    </table>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ"
        crossorigin="anonymous"></script>
</body>

</html>