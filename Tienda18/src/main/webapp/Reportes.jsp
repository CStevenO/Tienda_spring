<%@ page language="java"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reportes</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
</head>

<body>
<jsp:include page="Menu.jsp"></jsp:include>

    <div class="container-fluid w-100 mt-auto rounded">

        <div class="d-grid gap-4 col-8 mx-auto mt-5">
            <a href="../Lista_Usuarios.jsp"   class="btn btn-outline-primary btn-lg" type="button" id="boton_lista_usuarios" name="boton_lista_usuarios">Listado de Usuarios</a>
            <a href="../Lista_Clientes.jsp" class="btn btn-outline-info btn-lg"    type="button" id="boton_lista_cliente" name="boton_lista_cliente">Listado de Clientes</a>
            <a href="../Lista_Ventas.jsp" class="btn btn-outline-success btn-lg" type="button" id="boton_ventas_cliente" name="boton_ventas_cliente">Ventas por Cliente</a>
        </div>
    </div>



        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ"
            crossorigin="anonymous"></script>
</body>

</html>