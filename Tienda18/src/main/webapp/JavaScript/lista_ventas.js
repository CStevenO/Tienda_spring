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



var ventas = $.ajax({
	type: "GET",
	url: "http://localhost:8080/ventas",
	success: function(data){
		$.each(data, function(x, item){
			lista2 = document.getElementById("Tabla_total_ventas");				
			var tr = document.createElement("tr");
			var column1 = document.createElement("td");
			var total=column1.innerHTML = item.total_venta;
			window.alert(total);		
		    //var suma=(parseFloat(total)+parseFloat(total));
            var suma=+(parseFloat(total));
            window.alert(suma); 
            document.getElementById('total').innerHTML = suma;
			tr.appendChild(column1);
			//lista2.appendChild(tr);
			
		});
	}
});



