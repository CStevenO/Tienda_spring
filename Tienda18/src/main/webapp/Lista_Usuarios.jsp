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
</head>

<body>
<jsp:include page="Menu.jsp"></jsp:include>
    <h2 class="text-center">Lista de Usuarios</h2>
    <table class="table">
        <thead class="table-dark"> 
            <tr>
                <th scope="col" >#</th>
                <th scope="col">Cedula</th>
                <th scope="col">Nombre</th>
                <th scope="col">Correo Électronico</th>
                <th scope="col">Usuario</th>
                <th scope="col">Password</th>
            </tr>
        </thead>
        <tbody>
            <tr class="table-primary">
                <th scope="row">1</th>
                <td>Mark</td>
                <td>122233</td>
                <td>Mark@correo.com</td>
                <td>Mrk12</td>
                <td>@12589</td>
            </tr>
            <tr>
                <th scope="row">2</th>
                <td>Jacob</td>
                <td>12566</td>
                <td>Jacob@correo.com</td>
                <td>Jac89</td>
                <td>K145J</td>
            </tr>
            <tr class="table-primary">
                <th scope="row">3</th>
                <td>Larry</td>
                <td>799522</td>
                <td>Larry12@correo.com</td>
                <td>Lar45A</td>
                <td>LaRs78</td>
            </tr>
        </tbody>
    </table>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ"
            crossorigin="anonymous"></script>
</body>

</html>