<?php 
require('../_start.php');
// aquí ordenaremos los semestres con ajax

// array con el nuevo orden de nuestros registros
$articulos_ordenados 	= $_POST['articulo'];

$pos = 1;
foreach ($articulos_ordenados as $key) {
	
	// actualizamos el campo Valor
	$query = "UPDATE semestre SET valor = " . $pos . " WHERE id = " . $key;
	mysql_query($query);
	
	$pos++;
}

echo "Los Semestres se ordenaron con exito";
?>