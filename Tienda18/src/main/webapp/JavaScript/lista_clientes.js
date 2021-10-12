var clientes = $.ajax({
	type: "GET",
	url: "http://localhost:8080/clientes",
	success: function(data){
		$.each(data, function(i, item){
			lista = document.getElementById("Tabla_lista_clientes");				
			var tr = document.createElement("tr");
			var columna1 = document.createElement("td");
			columna1.innerHTML = item.cedula_cliente;
			var columna2 = document.createElement("td");
			columna2.innerHTML = item.nombre_cliente;
			var columna3 = document.createElement("td");
			columna3.innerHTML = item.email_cliente;
			var columna4 = document.createElement("td");
			columna4.innerHTML = item.direccion_cliente;
			var columna5 = document.createElement("td");
			columna5.innerHTML = item.telefono_cliente;
			tr.appendChild(columna1);
			tr.appendChild(columna2);
			tr.appendChild(columna3);
			tr.appendChild(columna4);
			tr.appendChild(columna5);
			lista.appendChild(tr);
		});
	}
});