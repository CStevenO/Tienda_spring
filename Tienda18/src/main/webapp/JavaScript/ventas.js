$(document).ready(function(){
	var usuario = sessionStorage.getItem('usuario');
	var cliente=0;
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
			con--;
			$("#codigo_producto"+con).val("");
			$("#nombre_producto"+con).val("");				
			$("#cantidad_producto"+con).val("");
			$("#valor_total_producto"+con).val("");
			$("[id^='Consultar']").unbind();			//los unbind() sirven para borrar los eventos que tengan
			$("[id^='cantidad_producto']").unbind();
			inicializar();
			resaltar();
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
							if($("#cantidad_producto"+elem).val()==="" || $("#cantidad_producto"+elem).val()==0){
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
						cambiosRealizados();
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
				var elem = this.id.substring(17);
				var elem2 = elem;
				if(elem===""){
					elem=1;
					elem2 = "";
				}
				if($("#cantidad_producto"+elem2).val()==="" || $("#cantidad_producto"+elem2).val()==0){
					$("#cantidad_producto"+elem2).val(1);
					$("#valor_total_producto"+elem2).val(productos[parseInt(elem-1)].precio_venta);		
				}
				else{
					$("#valor_total_producto"+elem2).val(productos[parseInt(elem-1)].precio_venta*$("#cantidad_producto"+elem2).val());
				}
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
				}
				if(productos[i]!==0){
					total_productos += parseInt(productos[i].precio_venta*$("#cantidad_producto"+identi).val());
					total_iva += parseInt(productos[i].precio_venta*$("#cantidad_producto"+identi).val())*productos[i].iva_compra/100;
				}
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
					cliente = respuesta;
	            }
	        });
	        request.fail(function(jqXHR, textStatus) {
	            alert("Hubo un error: " + textStatus);
	        });
		 	
	  });
		
		$("#confirmar").click(function(){
			if(productos!=0 && cliente!=0){
				var datos = JSON.stringify({
			    	"iva_venta": parseFloat($("#total_iva").val()),
					"total_venta": parseFloat($("#totalcon_iva").val()),
					"valor_venta": parseFloat($("#valor_total_venta").val()),
					"cliente": {"cedula_cliente": cliente.cedula_cliente},
					"usuario": {"cedula_usuario": parseInt(usuario)}
			    });
				var request = $.ajax({
		            url: "http://localhost:8080/ventas",
		            method: "post",
					data: datos,
		            dataType: "json",
		            contentType:'application/json'
		        });
		        
		        request.done(function(respuesta) {
		            if(respuesta === null){
		            	$('.toast').toast('show');
		            	$("#strong").text("Crear");
		            	$("#small").text("Error al crear");
		            	$("#toast_body").text("No se pudo crear la venta.");
		            }
		            else{
		            	let detalle = [];
						var obj = {};
						var identi = "";
						for(var i=0;i<$("[id^='cantidad_producto']").length;i++){
							if($("[id^='cantidad_producto']").length!==1){
								identi = (i+1).toString();
							}
							if(productos[i]!==0){
								obj = {
									"cantidad_producto": parseInt($("#cantidad_producto"+identi).val()),
									"valor_iva": parseFloat((productos[i].iva_compra/100)*productos[i].precio_venta*$("#cantidad_producto"+identi).val()),
									"valor_total": parseFloat((productos[i].iva_compra/100)*productos[i].precio_venta*$("#cantidad_producto"+identi).val() + productos[i].precio_venta*$("#cantidad_producto"+identi).val()),
									"valor_venta": parseFloat(productos[i].precio_venta),
									"producto": {"codigo_producto": parseInt(productos[i].codigo_producto)},
									"venta": {"codigo_venta": parseInt(respuesta.codigo_venta)}
								};
								detalle.push(obj);
							}
						}
						var datos = JSON.stringify(detalle);
						var request = $.ajax({
				            url: "http://localhost:8080/DetalleVentas/Todos",
				            method: "post",
							data: datos,
				            dataType: "json",
				            contentType:'application/json'
				        });
						 request.done(function(respuesta) {
				            if(respuesta === null){
				            	$('.toast').toast('show');
				            	$("#strong").text("Crear");
				            	$("#small").text("Error al crear");
				            	$("#toast_body").text("No se pudo crear el detalle venta.");
				            }
				            else{
								sessionStorage.setItem('conf', true);
								window.location.href = "../Ventas.jsp";
				            }
						});
						request.fail(function(jqXHR, textStatus) {
		            		alert("Hubo un error D: " + textStatus);
	        			});	
					}
		        });
		        request.fail(function(jqXHR, textStatus) {
		            alert("Hubo un error V: " + textStatus);
		        });
		 	}
			else{
				$('.toast').toast('show');
	        	$("#strong").text("Vacios");
	        	$("#small").text("Error hay vacios");
	        	$("#toast_body").text("Por favor agregue productos, sus cantidades y/o agregue un cliente");
			}
	  });	    
		if(sessionStorage.getItem('conf')){
			$('.toast').toast('show');
        	$("#strong").text("Crear");
        	$("#small").text("Error al crear");
        	$("#toast_body").text("La venta se realizo exitosamente");
			sessionStorage.removeItem('conf');
		}

		  function bordesTodos(){
			  $('#cedula_cliente').css('border-color', 'red'); 
	   			$("[id^='codigo_producto']").css('border-color', 'red');
	   			$("[id^='cantidad_producto']").css('border-color', 'red'); 
	   			
		  }
		  function resetTodos(){
			  $('#texto_cedula').css('border-color', ''); 
 				$('#cedula_cliente').css('border-color', '');
 				$("[id^='codigo_producto']").css('border-color', ''); 
	   			$("[id^='cantidad_producto']").css('border-color', '');
	   			
		  }
			$('#confirmar').hover(function() { 
	   			 bordesTodos();
	   			}, function() { // on mouseout, reset the background colour 
	   				 resetTodos();
	   			}); 
			//consultar cliente
	   		$('#consultar').hover(function() { 
	   			$('#cedula_cliente').css('border-color', 'red'); 
	   			}, function() { // on mouseout, reset the background colour 
	   				$('#cedula_cliente').css('border-color', ''); 
	   			}); 
			//Consultar producto
			resaltar();
			function resaltar(){
				$("[id^='Consultar']").hover(function() { 
					var elem = this.id.substring(9);
		   			$('#codigo_producto'+elem).css('border-color', 'red'); 
		   			}, function() { // on mouseout, reset the background colour 
		   				$("[id^='codigo_producto']").css('border-color', ''); 
		   			}); 
			}
			
		});