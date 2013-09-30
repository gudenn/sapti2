<?php     

require_once('../config.php');      
require_once('../EditableGrid.php');

if(isset($_GET['iddicta'])){
$iddicta=$_GET['iddicta'];
};
         
// Database connection
$mysqli = mysqli_init();
$mysqli->options(MYSQLI_OPT_CONNECT_TIMEOUT, 5);
$mysqli->real_connect($config['db_host'],$config['db_user'],$config['db_password'],$config['db_name']); 
                    
// create a new EditableGrid object
$grid = new EditableGrid();

$grid->addColumn('id', 'ID', 'integer', NULL, false); 
$grid->addColumn('asunto', 'Titulo', 'string', NULL, false); 
$grid->addColumn('descripcion', 'Descripcion', 'string', NULL, false);  
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