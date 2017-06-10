<?php
    // Almacenamos los datos que ha introducido el usuario en el formulario como variables:
    $email = $_POST['email'];
    $password = $_POST['password'];

    // Abrimos la base de datos y guardamos la conexión (no la base de datos entera) en una variable:
    // ('servidor, 'usuario', 'contraseña', 'nombre de la base de datos')
    $db = @mysqli_connect('localhost', 'root', '', 'biblioteca');
    // Establecemos el cotejamiento como el de la base de datos para que muestre correctamente
    // los caracteres acentuados:
    @mysqli_set_charset($db, 'utf8');
    // Utilizamos el carácter @ para no mostrar las alertas generadas por las funciones en caso de error.

    // Consulta para buscar a un usuario en la tabla users de la base de datos.
    $sql_comprobar_usuario = "SELECT * FROM usuarios WHERE email = '$email'";
    $query_comprobar_usuario = mysqli_query($db, $sql_comprobar_usuario);

    // Comprobamos si efectivamente el usuario existe en la base de datos:
    if ($query_comprobar_usuario != null) {
        // Comprobamos que la contraseña devuelta por la consulta corresponde con la introducida
        // por el usuario en el login:
        $usuario= mysqli_fetch_object($query_comprobar_usuario);

        if (password_verify($password, $usuario->password)) {
            // Iniciamos la sesión:
            session_start();
            $_SESSION['login'] = true;
            $_SESSION['email'] = $email;

            // La función header nos redirige a la página de inicio:
            header('Location: ../index.html');
        }
        else {
            // En caso de error, se devuelve un error de tipo error_login.
            header('Location: ../index.html?error=error_login');
        }
    }
    else {
        header('Location: ../index.php?error=error_login');
    }

    // Cerramos la conexión por seguridad:
    @mysqli_close($db);
?>
