<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<link href="EstilosInicio.css" rel="stylesheet" type="text/css">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Menu</title>
    <script type="text/javascript">
    	var usuario = sessionStorage.getItem('usuario');
    	if(usuario == null){
    		window.location.href = "./Index.html";
    	}
    </script>
</head>
<body class="bg_body">
	<%
	int rol=0;
	if(request.getParameter("rol")==null){
		try{
			rol = (int)session.getAttribute("rol");
		}
		catch(Exception e){
			response.sendRedirect("./Index.html");	
		}
	}
	else{
		try{
			rol = Integer.parseInt(request.getParameter("rol"));
			session.setAttribute("rol", rol);
		}
		catch(Exception e){
			response.sendRedirect("./Index.html");	
		}
	}
	if(rol==1){
	%>
	<div class="card">
        <img src="./img/usuario1.png" class="img-centro-vert-hor" alt="...">
        <div class="card-body bg_body">
            <div class="d-grid gap-2 col-6 mx-auto">
                <button type="button" class="btn btn-outline-primary btn-lg" style="margin-right: 400px;" onclick="location.href='./Usuarios.jsp?img=usuario1'">Usuarios</button>
            </div>
        </div>
    </div>
          
    <div class="card">
        <img src="./img/clientes1.png" class="img-centro-vert-hor" alt="...">
        <div class="card-body bg_body">
            <div class="d-grid gap-2 col-6 mx-auto">
                <button type="button" class="btn btn-outline-secondary btn-lg" style="margin-left: 400px;" onclick="location.href='./Clientes.jsp?img=clientes1'">Clientes</button>
            </div>
        </div>
    </div>
             
    <div class="card">
        <img src="./img/proveedores1.png" class="img-centro-vert-hor" alt="...">
        <div class="card-body bg_body">
            <div class="d-grid gap-2 col-6 mx-auto">
                <button type="button" class="btn btn-outline-success btn-lg" style="margin-right: 400px;" onclick="location.href='./Proveedores.jsp?img=proveedores1'">Proveedores</button>
            </div>
        </div>
    </div>

    <div class="card">
        <img src="./img/productos1.png" class="img-centro-vert-hor" alt="...">
        <div class="card-body bg_body">
            <div class="d-grid gap-2 col-6 mx-auto" >
                <button type="button" class="btn btn-outline-danger btn-lg" style="margin-left: 400px;" onclick="location.href='./Productos.jsp?img=productos1'">Productos</button>
            </div>
        </div>
    </div>
	<%} %>
    <div class="card">
        <img src="./img/compras1.png" class="img-centro-vert-hor" alt="...">
        <div class="card-body bg_body">
            <div class="d-grid gap-2 col-6 mx-auto" >
                <button type="button" class="btn btn-outline-info btn-lg" style="margin-right: 400px" onclick="location.href='./Ventas.jsp?img=compras1'">Ventas</button>
            </div>
        </div>
    </div>

    <div class="card">
        <img src="./img/reportes1.png" class="img-centro-vert-hor" alt="...">
        <div class=" card-body bg_body">
            <div class="d-grid gap-2 col-6 mx-auto"> 
                <button type="button" class="btn btn-outline-dark btn-lg" style="margin-left: 400px" onclick="location.href='./Reportes.jsp?img=reportes1'">Reportes</button>
            </div>
        </div>
    </div>
</body>
</html>