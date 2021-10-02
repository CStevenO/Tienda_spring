<%@ page language="java"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Productos</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
   	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>

<body>
<jsp:include page="Menu.jsp"></jsp:include>
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
    
    <script>
	var usuarios = $.ajax({
		type: "GET",
		url: "http://localhost:8080/productos",
		success: function(data){
			$.each(data, function(i, item){
				lista = document.getElementById("myTable");
				var tr = document.createElement("tr");
				var columna1 = document.createElement("td");
				columna1.innerHTML = item.codigo_producto;
				var columna2 = document.createElement("td");
				columna2.innerHTML = item.iva_compra;
				var columna3 = document.createElement("td");
				columna3.innerHTML = item.nit_proveedor.nit_proveedor;
				var columna4 = document.createElement("td");
				columna4.innerHTML = item.nombre_producto;
				var columna5 = document.createElement("td");
				columna5.innerHTML = item.precio_compra;
				var columna6 = document.createElement("td");
				columna6.innerHTML = item.precio_venta;
				var columna7 = document.createElement("td");
				columna7.innerHTML = "<button class='btn btn-danger' type='button' name='"+item.codigo_producto+"' id='borrar'>Borrar</button>" ;

				
				tr.appendChild(columna1);
				tr.appendChild(columna2);
				tr.appendChild(columna3);
				tr.appendChild(columna4);
				tr.appendChild(columna5);
				tr.appendChild(columna6);
				tr.appendChild(columna7);
				lista.appendChild(tr);
				
			});
		}
	})


</script>
    
    <h2 class="text-center">Lista de Productos</h2>
    <table class="table">
        <thead class="table-dark"> 
            <tr>
                <th scope="col" >Código</th>
                <th scope="col">Iva Compra</th>
                <th scope="col">NIT Proveedor</th>
                <th scope="col">Producto</th>
                <th scope="col">Precio Compra</th>
                <th scope="col">Precio Venta</th>
                <th scope="col">Eliminar</th>
            </tr>
        </thead>
        <tbody id = "myTable">
        
        </tbody>
    </table>
    
    
    
	<script type="text/javascript">
		$(document).ready(function(){
			//CREAR usuario
			  $("#cargar").click(function(){
				  var form = new FormData();
				  form.append("file", $("#archivo")[0].files[0]);
					var request1 = $.ajax({
			            url: "http://localhost:8080/productos",
			            method: "post",
			            data: form,
			            dataType: "json",
			            contentType: false,
			            processData: false,
			            mimeType: "multipart/form-data"
			        });
					request1.done(function(respuesta) {
			            if(respuesta.message ==="Carga del archivo exitosa"){
			            	$('.toast').toast('show');
			            	$("#strong").text("Exito");
			            	$("#small").text("Exito al cargar");
			            	$("#toast_body").text("los productos fueron cargados exitosamente.");	
			            }
			            else{
			            	$('.toast').toast('show');
			            	$("#strong").text("Error");
			            	$("#small").text("Error al cargar");
			            	$("#toast_body").text("No se pudieron cargar los productos.");        	
			            }
					});
			  });
			  $("#borrar").click(function(){
				    var request = $.ajax({
					            url: "http://localhost:8080/productos/"+ this.getAttribute("name"),
					            method: "delete",
					            dataType: "text",
					            contentType:'application/json'
		    		});
				    request.done(function(respuesta) {
			        	if(respuesta==="Error Eliminando Producto"){
			        		$('.toast').toast('show');
			            	$("#strong").text("Borrar");
			            	$("#small").text("Error al borrar");
			            	$("#toast_body").text("Producto no se pudo borrar.");
			        	}
			        	else{
				        	$('.toast').toast('show');
			            	$("#strong").text("Borrar");
			            	$("#small").text("Exito al borrar");
			            	$("#toast_body").text("Producto se borró exitosamente.");
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