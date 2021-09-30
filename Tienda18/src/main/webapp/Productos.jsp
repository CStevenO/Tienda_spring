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
	    <form>
	        <div class="mb-3">
	            <label for="archivo" class="form-label">Ingrese archivo de productos</label>
	                <input class="form-control" type="file" id="archivo" name="archivo" placeholder="" accept='.csv' onchange='openFile(event)' required>
	                <script>
		                var openFile = function(event) {
		                  var input = event.target;
		
		                  var reader = new FileReader();
		                  reader.onload = function(){
		                    var text = reader.result;
		                    sessionStorage.setItem('archi', text);
		                  };
		                  reader.readAsText(input.files[0]);
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
				function isNumber(n) { return /^-?[\d.]+(?:e-?\d+)?$/.test(n); } 
				function csvJSON(csv){
				  var lines=csv.split("\r\n");
				  var result = [];
				  var headers=lines[0].split(";");
				  for(var i=1;i<lines.length;i++){
					  var obj = {};
					  var currentline=lines[i].split(";");
					  for(var j=0;j<headers.length;j++){
						  if(headers[j]==="nit_proveedor"){
							  var ob = {};
							  ob[headers[j]] = parseInt(currentline[j]);
							  obj[headers[j]] = ob;
						  }
						  else{
							  if(isNumber(currentline[j])){
								  obj[headers[j]] = parseInt(currentline[j], 10);
							  }
							  else{
								  obj[headers[j]] = currentline[j];
							  }
						  } 
					  }
					  result.push(obj);
				  }
				  return JSON.stringify(result);
				}	
			//CREAR usuario
			  $("#cargar").click(function(){
			        var request = $.ajax({
			            url: "http://localhost:8080/productos",
			            method: "delete",
			            dataType: "text",
			            contentType:'application/json'
			        });
			        request.done(function(respuesta) {
			            if(respuesta === "Productos Eliminados"){
			            	var data = sessionStorage.getItem('archi');
							var datos = csvJSON(data);
							var request1 = $.ajax({
					            url: "http://localhost:8080/productos",
					            method: "post",
					            data: datos,
					            dataType: "json",
					            contentType:'application/json'
					        });
							request1.done(function(respuesta) {
					            if(respuesta === null){
					            	$('.toast').toast('show');
					            	$("#strong").text("Error");
					            	$("#small").text("Error al cargar");
					            	$("#toast_body").text("No se pudieron cargar los productos.");	
					            }
					            else{
					            	$('.toast').toast('show');
					            	$("#strong").text("Exito");
					            	$("#small").text("Exito al cargar");
					            	$("#toast_body").text("los productos fueron cargados exitosamente.");		            	
					            }
					        });
					        request1.fail(function(jqXHR, textStatus) {
					            alert("Hubo un error: " + textStatus);
					        }); 
			            }
			            else{
			            	$('.toast').toast('show');
			            	$("#strong").text("Error");
			            	$("#small").text("Error al cargar");
			            	$("#toast_body").text("No se pudieron eliminar los productos.");		            	
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