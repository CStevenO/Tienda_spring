$(document).ready(function(){
	
	function GenConsec(){
		var consec = 1;
		var request = $.ajax({
		            url: "http://localhost:8080/ventas",
		            method: "get",
		            dataType: "json",
		            contentType:'application/json'
		});
        request.done(function(respuesta) {
			console.log(respuesta);
		    if(respuesta.length === 0){
		    	consec = 1;
				$("#cosecutivo_producto").val(consec);
		    }
		    else{
				for(cod of respuesta){
					valCod = cod.codigo_venta;
				}
				consec += valCod;
				$("#cosecutivo_producto").val(consec);
		    }
		});
	}
	window.onload=GenConsec();
	
	var cloneCount = 2;
	  $("#mas").click(function(){
		    $('#id').clone().attr('id', 'id'+ cloneCount++).insertAfter('[id^=id]:last').appendTo('#productosX');
			var con = 1;
			$('#productosX').find('.row').each(function(){
			    $(this).find('div').each(function(){
					$(this).find('input, button').each(function(){
						$(this).removeAttr("id");
						$(this).attr("id",$(this).attr("name")+con);
					  });
				});
				con++;
			});
			$("[id^='Consultar']").unbind();			//los unbind() sirven para borrar los eventos que tengan
			$("[id^='cantidad_producto']").unbind();
			inicializar();
			perderFoco();
			productos.push(0);
	  });
		let productos = [0];
		inicializar();
		function inicializar(){
			$("[id^='Consultar']").click(function(){
				var elem="";
				if(this.id !== "Consultar"){
					var elem = this.id.substring(9);
				}
				if($("#codigo_producto"+elem).val() !== ""){
					var request = $.ajax({
			            url: "http://localhost:8080/productos/" + $("#codigo_producto"+elem).val(),
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
			            	$("#toast_body").text("Producto no existe.");
			            }
			            else{
			            	$("#nombre_producto"+elem).val(respuesta.nombre_producto);
							if($("#cantidad_producto"+elem).val()===""){
								$("#cantidad_producto"+elem).val(1);
								$("#valor_total_producto"+elem).val(respuesta.precio_venta);		
							}
							else{
								$("#valor_total_producto"+elem).val(respuesta.precio_venta*$("#cantidad_producto"+elem).val());
							}
							if(elem===""){
								productos[0] = respuesta;
							}
							else{
								productos[elem-1] = respuesta;
							}
			            }
			        });
			        request.fail(function(jqXHR, textStatus) {
			            alert("Hubo un error: " + textStatus);
		       		 });
				}
				else{
					$('.toast').toast('show');
	            	$("#strong").text("Consultar");
	            	$("#small").text("Error al consultar");
	            	$("#toast_body").text("Codigo de producto vacio");
				}
			});
		}
		//Perder el foco lo pienso usar para actualizar los espacios cuando la cantidad cambie
		perderFoco();
		function perderFoco(){
			$("[id^='cantidad_producto']").blur(function(){
				cambiosRealizados();
			});
		}
		//Actualizar campos cuando exista algun cambio en cantidad
		function cambiosRealizados(){
			var total_productos=0;
			var total_iva=0;
			var total=0;
			var identi = "";
			for(var i=0;i<$("[id^='cantidad_producto']").length;i++){
				if($("[id^='cantidad_producto']").length!==1){
					identi = (i+1).toString();
					alert(identi);
				}
				total_productos += productos[i].precio_venta*$("#cantidad_producto"+identi).val();
				total_iva += productos[i].precio_venta*$("#cantidad_producto"+identi).val()*productos[i].iva_compra/100;
			}
			total = total_productos + total_iva;
			$("#valor_total_venta").val(total_productos);
			$("#total_iva").val(total_iva);
			$("#totalcon_iva").val(total);
		}
		
		//CONSULTAR cliente	por Id
	  $("#consultar").click(function(){
			var request = $.ajax({
	            url: "http://localhost:8080/clientes/" + $("#cedula_cliente").val(),
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
	            	$("#cedula_cliente").val(respuesta.cedula_cliente);
	            	$("#nombre_cliente").val(respuesta.nombre_cliente);	
	            }
	        });
	        request.fail(function(jqXHR, textStatus) {
	            alert("Hubo un error: " + textStatus);
	        });
		 	
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