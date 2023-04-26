<?php
include_once 'Views/template-principal/header.php';

include 'carrito.php';
include 'Config/App/Conexion.php';

?>
<?php
if ($_POST) {

    $total = 0;
    $SID = session_id();
    $Correo = $_POST['email'];

    foreach ($_SESSION['CARRITO'] as $indice => $producto) {

        $total = $total + ($producto['PRECIO'] * $producto['CANTIDAD']);
    }
    //CAMBIAR ESOS DATOS DE LA BASE DE DATOS SE CREO TABLA PARA ENSAYAR
    $sentencia = $pdo->prepare("INSERT INTO `tbl_ventas` 
                            (`ID`, `ClaveTransaccion`, `PaypalDatos`, `Fecha`, `Correo`, `Total`, `Status`) 
      VALUES (NULL,:ClaveTransaccion, '', NOW(),:Correo,:Total, 'pendiente');");

    $sentencia->bindParam(":ClaveTransaccion", $SID);
    $sentencia->bindParam(":Correo", $Correo);
    $sentencia->bindParam(":Total", $total);
    $sentencia->execute();
    $idVenta = $pdo->lastInsertId();

    foreach ($_SESSION['CARRITO'] as $indice => $producto) {
        include 'global/conexion.php';
        $sentencia = $pdo->prepare("INSERT INTO 
        `tbldetalleventa` (`ID`, `IDVENTA`, `IDPRODUCTO`, `PRECIOUNITARIO`, `CANTIDAD`, `DESCARGADO`) 
        VALUES (NULL,:IDVENTA,:IDPRODUCTO, :PRECIOUNITARIO,:CANTIDAD, '0');");

        $sentencia->bindParam(":IDVENTA", $idVenta);
        $sentencia->bindParam(":IDPRODUCTO", $producto['ID']);
        $sentencia->bindParam(":PRECIOUNITARIO", $producto['PRECIO']);
        $sentencia->bindParam(":CANTIDAD", $producto['CANTIDAD']);
        $sentencia->execute();
    }

    // echo "<h3>".$total."</h3>";
}
?>

<div class="jumbotron text-center">
    <h1 class="display-4">¡FINAL!</h1>
    <hr class="my-4">
    <p class="lead"> Estas a punto de pagar la cantidad de:
    <h4>$<?php echo number_format($total, 2); ?></h4>
    </p>

    <p>los productos podran ser enviados apenas se realice el pago</p>
</div>