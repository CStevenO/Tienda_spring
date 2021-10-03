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