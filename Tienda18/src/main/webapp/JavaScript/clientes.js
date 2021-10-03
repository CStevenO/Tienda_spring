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