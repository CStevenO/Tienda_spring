<%@ page language="java"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lista de Usuarios</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="./JavaScript/lista_usuarios.js"></script>
</head>

<body>
<jsp:include page="Menu.jsp"></jsp:include>
    <h2 class="text-center">Lista de Usuarios</h2>
    <table class="table">
        <thead class="table-dark"> 
            <tr>                
                <th scope="col">Cedula</th>
                <th scope="col">Nombre</th>
                <th scope="col">Correo Électronico</th>
                <th scope="col">Usuario</th>
                <th scope="col">Password</th>
                
            </tr>
        </thead>
        <tbody id= "Tabla_lista_usuarios">

        </tbody>
    </table>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ"
            crossorigin="anonymous"></script>
</body>

</html>