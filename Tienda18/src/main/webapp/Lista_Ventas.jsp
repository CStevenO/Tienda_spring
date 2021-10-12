<%@ page language="java"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lista de Ventas</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="../JavaScript/lista_ventas.js"></script>
</head>

<body>
<jsp:include page="Menu.jsp"></jsp:include>
    <h2 class="text-center">Total de Ventas por Cliente</h2>
    <table class="table">
        <thead class="table-dark">
            <tr>               
                <th scope="col">Cedula</th>
                <th scope="col">Nombre</th>
                <th scope="col">Valor Total Ventas</th>
            </tr>
        </thead>
        <tbody id= "Tabla_lista_ventas">

        </tbody>
    </table>
    <!--Opcion 2 para mostrar las ventas totales-->
    
    <table class="table">
        <thead class="table-dark">
            <tr>               
                <th scope="col" colspan="4">Total Ventas $</th> 
            </tr>
        </thead>
        <tbody id= "Tabla_total_ventas">
            <tr class="table-primary">
                <td id="total"></td>
            </tr>

        </tbody>
    </table>



    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ"
        crossorigin="anonymous"></script>
</body>

</html>