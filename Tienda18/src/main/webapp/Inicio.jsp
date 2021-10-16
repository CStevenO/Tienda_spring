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
</head>
<body class="bg_body">
	<%
	int rol;
	if(request.getParameter("rol")==null){
		rol = (int)session.getAttribute("rol");
	}
	else{
		rol = Integer.parseInt(request.getParameter("rol"));
		session.setAttribute("rol", rol);
	}
	if(rol==1){
	%>
	<div class="card">
        <img src="./img/usuario1.png" class="img-centro-vert-hor" alt="...">
        <div class="card-body bg_body">
            <div class="d-grid gap-2 col-6 mx-auto">
                <button type="button" class="btn btn-outline-primary btn-lg" style="margin-right: 400px;" onclick="location.href='./Usuarios.jsp'">Usuarios</button>
            </div>
        </div>
    </div>
          
    <div class="card">
        <img src="./img/clientes1.png" class="img-centro-vert-hor" alt="...">
        <div class="card-body bg_body">
            <div class="d-grid gap-2 col-6 mx-auto">
                <button type="button" class="btn btn-outline-secondary btn-lg" style="margin-left: 400px;" onclick="location.href='./Clientes.jsp'">Clientes</button>
            </div>
        </div>
    </div>
             
    <div class="card">
        <img src="./img/proveedores1.png" class="img-centro-vert-hor" alt="...">
        <div class="card-body bg_body">
            <div class="d-grid gap-2 col-6 mx-auto">
                <button type="button" class="btn btn-outline-success btn-lg" style="margin-right: 400px;" onclick="location.href='./Proveedores.jsp'">Proveedores</button>
            </div>
        </div>
    </div>

    <div class="card">
        <img src="./img/productos1.png" class="img-centro-vert-hor" alt="...">
        <div class="card-body bg_body">
            <div class="d-grid gap-2 col-6 mx-auto" >
                <button type="button" class="btn btn-outline-danger btn-lg" style="margin-left: 400px;" onclick="location.href='./Productos.jsp'">Productos</button>
            </div>
        </div>
    </div>
	<%} %>
    <div class="card">
        <img src="./img/compras1.png" class="img-centro-vert-hor" alt="...">
        <div class="card-body bg_body">
            <div class="d-grid gap-2 col-6 mx-auto" >
                <button type="button" class="btn btn-outline-info btn-lg" style="margin-right: 400px" onclick="location.href='./Ventas.jsp'">Ventas</button>
            </div>
        </div>
    </div>

    <div class="card">
        <img src="./img/reportes1.png" class="img-centro-vert-hor" alt="...">
        <div class=" card-body bg_body">
            <div class="d-grid gap-2 col-6 mx-auto"> 
                <button type="button" class="btn btn-outline-dark btn-lg" style="margin-left: 400px" onclick="location.href='./Reportes.jsp'">Reportes</button>
            </div>
        </div>
    </div>
</body>
</html>