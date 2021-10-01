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
</head>

<body>
<jsp:include page="Menu.jsp"></jsp:include>
    <h2 class="text-center">Total de Ventas por Cliente</h2>
    <table class="table">
        <thead class="table-dark">
            <tr>
                <th scope="col">#</th>
                <th scope="col">Cedula</th>
                <th scope="col">Nombre</th>
                <th scope="col">Valor Total Ventas</th>
            </tr>
        </thead>
        <tbody>
            <tr class="table-primary">
                <th scope="row">1</th>
                <td>10235648</td>
                <td>Mariana Torres</td>
                <td>60</td>
            </tr>
            <tr>
                <th scope="row">2</th>
                <td>899895</td>
                <td>Fernando Alvarez</td>
                <td>45</td>
            </tr>
            <tr class="table-primary">
                <th scope="row">3</th>
                <td>1233566</td>
                <td>Juan David Acosta</td>
                <td>30</td>
            </tr>
            <!--Opcion 1 para mostras las ventas totales-->
            <tr class="text-black">
                <th scope="row"></th>
                <td ></td>
                <td colspan="1">Total Ventas $</td>
                <td>50</td>
            </tr>
        </tbody>
    </table>
    <!--Opcion 2 para mostrar las ventas totales-->
    <table class="table">
        <thead class="table-dark">
            <th scope="col" colspan="4">Total Ventas $</th> 
        </thead>
        <tbody>
            <tr class="table-primary">
                <td>500</td>
            </tr>
        </tbody>
    </table>


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ"
        crossorigin="anonymous"></script>
</body>

</html>