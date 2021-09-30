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

    <container pt-3>
	    <form enctype="multipart/form-data">
	        <div class="mb-3">
	            <label for="archivo" class="form-label">Ingrese archivo de productos</label>
	                <input class="form-control" type="file" id="archivo" name="file" placeholder="" accept='.csv' required>
	                <script>
		                var openFile = function(event) {
		                  var input = event.target;
		                  sessionStorage.setItem('archi', input.files[0]);
		                  
		                };
		              </script>
	        </div>
	
	        <div class="d-grid gap-3 d-md-block">
	            <button class="btn btn-primary btn-lg" type="button" name="boton_cargar_archivo_productos" id="cargar">Cargar</button>
	        </div>
        </form>
    </container>
    
    <div align='center'>
		<div class="toast">
	    	<div class="toast-header">
	      		<strong class="mr-auto text-primary" id="strong"></strong>
	      		<small class="text-muted" id="small"></small>
	    	</div>
	    	<div class="toast-body" id="toast_body"></div>
	  	</div>
	</div>
    
	<script type="text/javascript">
		$(document).ready(function(){
			//CREAR usuario
			  $("#cargar").click(function(){
				  var form = new FormData();
				  var data = sessionStorage.getItem('archi');
				  form.append("file", data);
				  var formData = new FormData();
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
			
			});
	</script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ"
        crossorigin="anonymous"></script>
</body>

</html>