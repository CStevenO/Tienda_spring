var ventas = $.ajax({
	type: "GET",
	url: "http://localhost:8080/ventas",
	success: function(data){
		$.each(data, function(i, item){
			lista = document.getElementById("Tabla_lista_ventas");				
			var tr = document.createElement("tr");		
			var columna1 = document.createElement("td");
			columna1.innerHTML = item.cliente.cedula_cliente;
			var columna2 = document.createElement("td");
			columna2.innerHTML = item.cliente.nombre_cliente;
			var columna3 = document.createElement("td");
			columna3.innerHTML = item.total_venta;
			tr.appendChild(columna1);
			tr.appendChild(columna2);
			tr.appendChild(columna3);
			lista.appendChild(tr);
					
		});
	}
});



var venta = $.ajax({
	type: "GET",
	url: "http://localhost:8080/ventas",
	success: function(data){
			var tr = document.createElement("tr");
			var column1 = document.createElement("td");	
			lista2 = document.getElementById("Tabla_total_ventas");	
			var suma=0;
		$.each(data, function(x, item){						
             suma+=(parseFloat(item.total_venta));             			
		});
		  document.getElementById('total').innerHTML = suma;
		  tr.appendChild(column1);
		  lista2.appendChild(tr);
	}
});




