var usuarios = $.ajax({
	type: "GET",
	url: "http://localhost:8080/Tienda18/usuarios/listar_usuarios",
	success: function(data){
		$.each(data, function(i, item){
			lista = document.getElementById("Tabla_lista_usuarios");				
			var tr = document.createElement("tr");
			var columna1 = document.createElement("td");
			columna1.innerHTML = item.cedula_usuario;
			var columna2 = document.createElement("td");
			columna2.innerHTML = item.nombre_usuario;
			var columna3 = document.createElement("td");
			columna3.innerHTML = item.email_usuario;
			var columna4 = document.createElement("td");
			columna4.innerHTML = item.usuario;
			var columna5 = document.createElement("td");
			columna5.innerHTML = item.password;
			//var columna6 = document.createElement("td");
			//columna6.innerHTML = item.rol.rol;
			tr.appendChild(columna1);
			tr.appendChild(columna2);
			tr.appendChild(columna3);
			tr.appendChild(columna4);
			tr.appendChild(columna5);
			//tr.appendChild(columna6);
			lista.appendChild(tr);
		});
	}
});