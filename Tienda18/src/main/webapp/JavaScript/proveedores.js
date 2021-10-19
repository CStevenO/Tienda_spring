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
            url: "./proveedores", 
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
            	$("#small").text("Exito al "+strong);
            	$("#toast_body").text("Proveedor se "+small+" exitosamente.");
	        }
        });
        request.fail(function(jqXHR, textStatus) {
            alert("Hubo un error: " + textStatus);
        });
	}
	//CONSULTAR
	$("#consultar").click(function(){
		if($("#nit_proveedor").val()===""){
				$('.toast').toast('show');
            	$("#strong").text("Vacios");
            	$("#small").text("Espacios vacios");
            	$("#toast_body").text("Por favor ingrese NIT");
		}else{
	        var request = $.ajax({
	            url: "./proveedores/" + $("#nit_proveedor").val(), 
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
		}

 	});
	//CREAR
	$("#crear").click(function(){
		if($("#nit_proveedor").val()==="" || $("#nombre_proveedor").val()==="" || $("#direccion_proveedor").val()==="" || $("#telefono_proveedor").val()==="" || $("#ciudad_proveedor").val()===""){
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
		if($("#nit_proveedor").val()==="" || $("#nombre_proveedor").val()==="" || $("#direccion_proveedor").val()==="" || $("#telefono_proveedor").val()==="" || $("#ciudad_proveedor").val()===""){
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
		if($("#nit_proveedor").val()===""){
					$('.toast').toast('show');
	            	$("#strong").text("Vacios");
	            	$("#small").text("Espacios vacios");
	            	$("#toast_body").text("Por favor ingrese el NIT");
		}else{
	        var request = $.ajax({
	            url: "./proveedores/" + $("#nit_proveedor").val(), 
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
	            	$("#toast_body").text("Proveedor se borra exitosamente.");
		        }
        	});
	        request.fail(function(jqXHR, textStatus) {
	            alert("Hubo un error: " + textStatus);
        	});
			
		}
 	});
	function bordesTodos(){
			  	$('#nit_proveedor').css('border-color', 'red'); 
	   			$('#nombre_proveedor').css('border-color', 'red');
	   			$('#direccion_proveedor').css('border-color', 'red'); 
	   			$('#telefono_proveedor').css('border-color', 'red');
	   			$('#ciudad_proveedor').css('border-color', 'red');
	}
	function resetTodos(){
			  	$('#nit_proveedor').css('border-color', ''); 
	   			$('#nombre_proveedor').css('border-color', '');
	   			$('#direccion_proveedor').css('border-color', ''); 
	   			$('#telefono_proveedor').css('border-color', '');
	   			$('#ciudad_proveedor').css('border-color', '');
	}
	
	$('#consultar').hover(function() { 
	   			$('#nit_proveedor').css('border-color', 'red'); 
	   			}, function() { // on mouseout, reset the background colour 
	   				$('#nit_proveedor').css('border-color', ''); 
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
	   			$('#nit_proveedor').css('border-color', 'red'); 
	   			}, function() { // on mouseout, reset the background colour 
	   				$('#nit_proveedor').css('border-color', ''); 
		});
	
  
});