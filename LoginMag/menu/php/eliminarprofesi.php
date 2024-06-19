<?php
$host = 'localhost';
$bd = 'dbmag';
$user = 'postgres';
$pass = 'Postgresql';

// Conectar a la base de datos
$conn = pg_connect("host=$host dbname=$bd user=$user password=$pass");

// Verificar la conexión
if (!$conn) {
    die("Error de conexión: " . pg_last_error());
}

// Manejar la solicitud de eliminación de clientes
if ($_SERVER['REQUEST_METHOD'] === 'DELETE') {
    // Obtener el ID del profesional a eliminar
    $profesionalId = $_GET['id'];

    // Query para eliminar el profesional
    $query = "DELETE FROM profesionales WHERE id = $profesionalId";

    // Ejecutar la consulta
    $result = pg_query($conn, $query);

    // Verificar si la consulta se ejecutó correctamente
    if ($result) {
        // Enviar respuesta de éxito
        http_response_code(200); // OK
        echo json_encode(array("message" => "profesional eliminado correctamente."));
    } else {
        // Enviar respuesta de error
        http_response_code(500); // Error interno del servidor
        echo json_encode(array("message" => "Error al eliminar el profesional"));
    }

    // Cerrar la conexión
    pg_close($conn);

    // Finalizar el script
    exit();
}