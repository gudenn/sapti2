<?php     
define ("MODULO", "DOCENTE");
require  '../_start.php';
include '../../_inc/_configurar.php';      
require_once('../EditableGrid.php');

if(isset($_GET['iddicta'])){
$iddicta=$_GET['iddicta'];
};
         
// Database connection
$mysqli = mysqli_init();
$mysqli->options(MYSQLI_OPT_CONNECT_TIMEOUT, 5);
$mysqli->real_connect(DBHOST,DBUSER,BDPASS,BDNAME);
                    
// create a new EditableGrid object
$grid = new EditableGrid();

$grid->addColumn('id', 'ID', 'integer', NULL, false); 
$grid->addColumn('asunto', 'Titulo', 'string', NULL, false); 
$grid->addColumn('descripcion', 'Descripción', 'string', NULL, false);  
$grid->addColumn('fecha_evento', 'Fecha', 'string', NULL, false);
$grid->addColumn('action', 'Opciones', 'html', NULL, false);

$result = $mysqli->query('
SELECT *
FROM evento ev
WHERE ev.dicta_id='.$iddicta.'
ORDER BY ev.fecha_evento ASC
');
$mysqli->close();

$grid->renderXML($result);

?>