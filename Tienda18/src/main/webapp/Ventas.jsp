<%@ page language="java"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ventas</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">


</head>

<body>
<jsp:include page="Menu.jsp"></jsp:include>
    <div class="container w-80 mt-3 rounded shadow align-content-center">
        <div class="container">
            <div class="row">
                <div class="col-8">
                    <form class="row g-3">
                        <div class="col-auto">
                            <label for="input_Cedula_Cliente" class="visually-hidden">Cedula Cliente</label>
                            <input type="text" class="form-control" id="cedula_cliente"
                                placeholder="Cedula del Cliente" name="cedula_cliente">
                        </div>
                        <div class="col-auto">
                            <button type="button" class="btn btn-primary mb-3">Consultar</button>
                            <!--Poner mt-4 (margin-top 4 en los botones si se quita la propiedad hidden en la visualizacion)-->
                        </div>
                        <div class="col-auto">
                            <label for="input_Nombre_Cliente" class="visually-hidden">Cliente</label>
                            <input type="text" class="form-control" id="nombre_cliente" placeholder="Nombre Cliente" name="nombre_cliente">
                        </div>
                    </form>
                </div>
                <div class="col-8"><br>
                    <form class="row g-3">
                        <div class="col-auto">
                            <label for="input_Codigo_Producto" class="visually-hidden">Codigo Producto</label>
                            <input type="text" class="form-control" id="codigo_producto" placeholder="Codigo Producto" name="codigo_producto">
                        </div>
                        <div class="col-auto">
                            <button type="button" class="btn btn-primary mb-3">Consultar</button>
                        </div>
                        <div class="col-auto">
                            <label for="input_Nombre_Producto" class="visually-hidden">Nombre Producto</label>
                            <input type="text" class="form-control" id="nombre_producto" placeholder="Nombre Producto" name="nombre_producto">
                        </div>
                        <div class="col-auto">
                            <label for="input_Cantidad_Producto" class="visually-hidden">Cantidad</label>
                            <input type="text" class="form-control" id="candidad_producto" placeholder="Cantidad" name="cantida_producto">
                        </div>
                    </form>
                </div>
                <div class="col-5"><br>
                    <form class="row g-3">
                        <div class="col-8">
                            <label for="input_Cosecutivo_Producto" class="visually-hidden">Consecutivo</label>
                            <input type="text" class="form-control" id="cosecutivo_producto" placeholder="Consecutivo" name="cosecutivo_producto">
                        </div>
                        <div class="col-8">
                            <label for="input_Valor_Producto_1" class="visually-hidden">Valor total producto 1</label>
                            <input type="text" class="form-control" id="valor_total_producto_1"
                                placeholder="Valor Total 1" name="valor_total_producto_1">
                        </div>
                        <div class="col-8">
                            <label for="input_Valor_Producto_2" class="visually-hidden">valor total producto 2</label>
                            <input type="text" class="form-control" id="valor_total_producto_2"
                                placeholder="Valor Total 2" name="valor_total_producto_2">
                        </div>
                        <div class="col-8">
                            <label for="input_Valor_Producto_3" class="visually-hidden">valor total producto 3</label>
                            <input type="text" class="form-control" id="valor_total_producto_3"
                                placeholder="Valor Total 3" name="valor_total_producto_3">
                        </div>
                        <div class="col-auto">
                            <label for="input_Valor_Total_Venta" class="visually-hidden">valor total venta</label>
                            <input type="text" class="form-control" id="valor_total_venta" placeholder="Total Venta" name="valor_total_venta">
                        </div>
                        <div class="col-auto">
                            <label for="input_Total_IVA" class="visually-hidden">valor total IVA</label>
                            <input type="text" class="form-control" id="total_iva" placeholder="Total IVA" name="total_iva">
                        </div>
                        <div class="col-auto">
                            <label for="input_Totalcon_IVA" class="visually-hidden">valor total con IVA</label>
                            <input type="text" class="form-control" id="totalcon_iva" placeholder="Total con IVA" name="totalcon_iva">
                        </div>
                        <div class="col-2">
                            <button type="button" class="btn btn-success mb-3">Confirmar</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

    </div>



    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ"
        crossorigin="anonymous"></script>
</body>

</html>