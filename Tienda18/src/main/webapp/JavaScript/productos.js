var usuarios = $.ajax({
	type: "GET",
	url: "./productos",
	success: function(data){
		$.each(data, function(i, item){
			lista = document.getElementById("myTable");				
			var tr = document.createElement("tr");
			var columna1 = document.createElement("td");
			columna1.innerHTML = item.codigo_producto;
			var columna2 = document.createElement("td");
			columna2.innerHTML = item.iva_compra;
			var columna3 = document.createElement("td");
			columna3.innerHTML = item.nombre_producto;
			var columna4 = document.createElement("td");
			columna4.innerHTML = item.precio_compra;
			var columna5 = document.createElement("td");
			columna5.innerHTML = item.precio_venta;
			var columna6 = document.createElement("td");
			columna6.innerHTML = item.nit_proveedor.nit_proveedor;
			tr.appendChild(columna1);
			tr.appendChild(columna2);
			tr.appendChild(columna3);
			tr.appendChild(columna4);
			tr.appendChild(columna5);
			tr.appendChild(columna6);
			lista.appendChild(tr);
		});
	}
});
	



$(document).ready(function(){
	  $("#cargar").click(function(){
		  var form = new FormData();
		  form.append("file", $("#archivo")[0].files[0]);
			var request = $.ajax({
	            url: "./productos",
	            method: "post",
	            data: form,
	            dataType: "json",
	            contentType: false,
	            processData: false,
	            mimeType: "multipart/form-data"
	        });
			request.done(function(respuesta) {
	            if(respuesta.message ==="Carga del archivo exitosa"){
	            	sessionStorage.setItem('exito', true);
	            	window.location.href= "./Productos.jsp?img=productos1";
	            }
	            else{
	            	$('.toast').toast('show');
	            	$("#strong").text("Error");
	            	$("#small").text("Error al cargar");
	            	$("#toast_body").text("No se pudieron cargar los productos.");        	
	            }
			});
			request.fail(function(textStatus) {
				$('.toast').toast('show');
	        	$("#strong").text("Error");
	        	$("#small").text("Error al cargar");
	        	$("#toast_body").text(textStatus.responseJSON.message);
	        });  
	  	});
	  if(sessionStorage.getItem('exito')){
		  	$('.toast').toast('show');
	    	$("#strong").text("Exito");
	    	$("#small").text("Exito al cargar");
	    	$("#toast_body").text("los productos fueron cargados exitosamente.");
	    	sessionStorage.removeItem('exito');
	  }
});

