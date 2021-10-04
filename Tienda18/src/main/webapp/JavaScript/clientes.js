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
		if($("#texto_cedula").val()===""){
				$('.toast').toast('show');
            	$("#strong").text("Vacios");
            	$("#small").text("Espacios vacios");
            	$("#toast_body").text("Por favor llene cedula");
		}else{
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
		}

	  });
	
	//CREAR
	  $("#crear").click(function(){
			if($("#texto_cedula").val()==="" || $("#texto_nombre").val()==="" || $("#texto_direccion").val()==="" || $("#texto_telefono").val()==="" || $("#texto_correo").val()===""){
					$('.toast').toast('show');
		        	$("#strong").text("Vacios");
		        	$("#small").text("Espacios vacios");
		        	$("#toast_body").text("Por favor no deje espacios vacios");	
			}else{
				crearActualizar("Crear","crea"); 
			}  
	  });
	//ACTUALIZAR
	  $("#actualizar").click(function(){
			if($("#texto_cedula").val()==="" || $("#texto_nombre").val()==="" || $("#texto_direccion").val()==="" || $("#texto_telefono").val()==="" || $("#texto_correo").val()===""){
					$('.toast').toast('show');
		        	$("#strong").text("Vacios");
		        	$("#small").text("Espacios vacios");
		        	$("#toast_body").text("Por favor no deje espacios vacios");	
			}else{
				crearActualizar("Actualizar","actualiza");
			}	
  		});
    
	  //BORRAR
   	  $("#borrar").click(function(){
			if($("#texto_cedula").val()===""){
					$('.toast').toast('show');
	            	$("#strong").text("Vacios");
	            	$("#small").text("Espacios vacios");
	            	$("#toast_body").text("Por favor llene cedula");
			}else{
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
			            	$("#toast_body").text("Cliente se borra exitosamente.");
				        }
				    });
				    request.fail(function(jqXHR, textStatus) {
			            alert("Hubo un error: " + textStatus);
			        });
			}
   		});
		function bordesTodos(){
			  	$('#texto_cedula').css('border-color', 'red'); 
	   			$('#texto_nombre').css('border-color', 'red');
	   			$('#texto_direccion').css('border-color', 'red'); 
	   			$('#texto_telefono').css('border-color', 'red');
	   			$('#texto_correo').css('border-color', 'red');
	  	}
		function resetTodos(){
			  $('#texto_cedula').css('border-color', ''); 
 				$('#texto_nombre').css('border-color', '');
 				$('#texto_direccion').css('border-color', ''); 
	   			$('#texto_telefono').css('border-color', '');
	   			$('#texto_correo').css('border-color', '');
 		}
		
		$('#consultar').hover(function() { 
	   			$('#texto_cedula').css('border-color', 'red'); 
	   			}, function() { // on mouseout, reset the background colour 
	   				$('#texto_cedula').css('border-color', ''); 
		}); 
	   	$('#crear').hover(function() { 
	   			 bordesTodos();
	   			}, function() { // on mouseout, reset the background colour 
	   				 resetTodos();
		}); 
	   	$('#actualizar').hover(function() { 
	   			 bordesTodos();
	   			}, function() { // on mouseout, reset the background colour 
	   				 resetTodos();
		}); 
	   	$('#borrar').hover(function() { 
	   			$('#texto_cedula').css('border-color', 'red'); 
	   			}, function() { // on mouseout, reset the background colour 
	   				$('#texto_cedula').css('border-color', ''); 
		});
		
	
	});
	
	