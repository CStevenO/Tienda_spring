$(document).ready(function(){
	var cloneCount = 2;
	  $("#mas").click(function(){
		    $('#id').clone().attr('id', 'id'+ cloneCount++).insertAfter('[id^=id]:last').appendTo('#productosX');
			$('#productosX').find('div').each(function(){
			    $(this).find('div').each(function(){
					$(this).find('input').each(function(){
					    alert($(this).attr("name"));
					  });
				});
			});
	  });
	//ACTUALIZAR usuario
	  $("#actualizar").click(function(){
		  if($("#texto_cedula").val()==="" || $("#texto_nombre").val()==="" || $("#texto_correo").val()==="" || $("#texto_usuario").val()==="" || $("#password").val()===""){
			  	$('.toast').toast('show');
	        	$("#strong").text("Vacios");
	        	$("#small").text("Espacios vacios");
	        	$("#toast_body").text("Por favor no deje espacios vacios");
		  }else{
	  				crearActualizar("Actualizar","actualiza");
			  }
	  		});
		
		//CONSULTAR	por Id
		  $("#consultar").click(function(){
			  if($("#texto_cedula").val()===""){
				  $('.toast').toast('show');
	            	$("#strong").text("Vacios");
	            	$("#small").text("Espacios vacios");
	            	$("#toast_body").text("Por favor llene cedula");
			  }else{
			        var request = $.ajax({
			            url: "http://localhost:8080/usuarios/" + $("#texto_cedula").val(),
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
			            	$("#toast_body").text("Usuario no existe.");
			            }
			            else{
			            	$("#texto_cedula").val(respuesta.cedula_usuario);
			            	$("#texto_correo").val(respuesta.email_usuario);
			            	$("#texto_nombre").val(respuesta.nombre_usuario);
			            	$("#password").val(respuesta.password);
			            	$("#texto_usuario").val(respuesta.usuario);
			            }
			        });
			        request.fail(function(jqXHR, textStatus) {
			            alert("Hubo un error: " + textStatus);
			        });
			 	}
		  });
			    
		  //BORRAR usuario
	   	  $("#borrar").click(function(){
	   		if($("#texto_cedula").val()===""){
				  $('.toast').toast('show');
	            	$("#strong").text("Vacios");
	            	$("#small").text("Espacios vacios");
	            	$("#toast_body").text("Por favor llene cedula");
			  }else{
				    var request = $.ajax({
					            url: "http://localhost:8080/usuarios/"+ $("#texto_cedula").val(),
					            method: "delete",
					            dataType: "text",
					            contentType:'application/json'
		    		});
				    request.done(function(respuesta) {
			        	if(respuesta==="Error Eliminado Usuario"){
			        		$('.toast').toast('show');
			            	$("#strong").text("Borrar");
			            	$("#small").text("Error al borrar");
			            	$("#toast_body").text("Cliente no se pudo borrar.");
			        	}
			        	else{
				        	$('.toast').toast('show');
			            	$("#strong").text("Borrar");
			            	$("#small").text("Exito al borrar");
			            	$("#toast_body").text("Usuario se borró exitosamente.");
				        }
				    });
				    request.fail(function(jqXHR, textStatus) {
			            alert("Hubo un error: " + textStatus);
			        });
			  	}
	   		});	 
/*
		  function bordesTodos(){
			  $('#texto_cedula').css('border-color', 'red'); 
	   			$('#texto_nombre').css('border-color', 'red');
	   			$('#texto_correo').css('border-color', 'red'); 
	   			$('#texto_usuario').css('border-color', 'red');
	   			$('#password').css('border-color', 'red');
		  }
		  function resetTodos(){
			  $('#texto_cedula').css('border-color', ''); 
 				$('#texto_nombre').css('border-color', '');
 				$('#texto_correo').css('border-color', ''); 
	   			$('#texto_usuario').css('border-color', '');
	   			$('#password').css('border-color', '');
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
	*/
		});