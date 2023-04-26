<?php
$mensaje = "";

$ID = "";


if (isset($_POST['btnAccion']))


    switch ($_POST['btnAccion']) {

        case 'Agregar':

            if (is_numeric(openssl_decrypt($_POST['id'], COD, KEY))) {
                $ID = openssl_decrypt($_POST['id'], COD, KEY);
                $mensaje .= "Ok id correcto " . $ID . "</br>";
            } else {

                $mensaje .= "Upss..id incorrecto" . $ID;
            }
            if (is_string(openssl_decrypt($_POST['nombre'], COD, KEY))) {
                $NOMBRE = openssl_decrypt($_POST['nombre'], COD, KEY);
                $mensaje .= "ok NOMBRE" . $NOMBRE . "</br>";
            } else {
                $mensaje .= "Upps.. algo pasa con el nombre" . "</br>";
                break;
            }

            if (is_numeric(openssl_decrypt($_POST['cantidad'], COD, KEY))) {
                $CANTIDAD = openssl_decrypt($_POST['cantidad'], COD, KEY);
                $mensaje .= "ok CANTIDAD" . $CANTIDAD . "</br>";
            } else {
                $mensaje .= "Upps.. algo pasa con la cantidad" . "</br>";
                break;
            }

            if (is_numeric(openssl_decrypt($_POST['precio'], COD, KEY))) {
                $PRECIO = openssl_decrypt($_POST['precio'], COD, KEY);
                $mensaje .= "ok PRECIO" . $PRECIO . "</br>";
            } else {
                $mensaje .= "Upps.. algo pasa con el precio" . "</br>";
                break;
            }


            if (!isset($_SESSION['CARRITO'])) {
                $producto = array(
                    'ID' => $ID,
                    'NOMBRE' => $NOMBRE,
                    'CANTIDAD' => $CANTIDAD,
                    'PRECIO' => $PRECIO
                );
                $_SESSION['CARRITO'][0] = $producto;

                echo "<script>alert('El producto ya ha sido agregado ') </script>";
            } else {

                $idProductos = array_column($_SESSION['CARRITO'], "ID");
                if (in_array($ID, $idProductos)) {
                    echo "<script>alert('El producto ya ha sido seleccionado ') </script>";
                } else {
                    $NumeroProductos = count($_SESSION['CARRITO']);
                    $producto = array(
                        'ID' => $ID,
                        'NOMBRE' => $NOMBRE,
                        'CANTIDAD' => $CANTIDAD,
                        'PRECIO' => $PRECIO,
                    );

                    $_SESSION['CARRITO'][$NumeroProductos] = $producto;
                    echo "<script>alert('El producto ha sido registrado ');
                     </script>
                    ";
                }
            }
            // $mensaje=print_r($_SESSION,true);

            $mensaje = "Producto agregado al carrito";
            break;
        case "Eliminar":
            if (is_numeric(openssl_decrypt($_POST['id'], COD, KEY))) {
                $ID = openssl_decrypt($_POST['id'], COD, KEY);

                foreach ($_SESSION['CARRITO'] as $indice => $producto) {
                    if ($producto['ID'] == $ID) {
                        unset($_SESSION['CARRITO'][$indice]);
                        echo "<script>alert('Elemento borrado');</script>";
                    }
                }
            } else {

                // $mensaje.="Upss..id incorrecto".$ID;
            }


            break;
    }
