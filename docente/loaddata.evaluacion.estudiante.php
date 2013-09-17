<?php     

require_once('config.php');      
require_once('EditableGrid.php');

if(isset($_GET['eva'])){
$evaid=$_GET['eva'];
};

// Database connection
$mysqli = mysqli_init();
$mysqli->options(MYSQLI_OPT_CONNECT_TIMEOUT, 5);
$mysqli->real_connect($config['db_host'],$config['db_user'],$config['db_password'],$config['db_name']); 
                    
// create a new EditableGrid object
$grid = new EditableGrid();

$grid->addColumn('id', 'ID', 'integer', NULL, false); 
$grid->addColumn('evaluacion_1', 'Evaluacion 1', 'integer');
$grid->addColumn('evaluacion_2', 'Evaluacion 2', 'integer');
$grid->addColumn('evaluacion_3', 'Evaluacion 3', 'integer');
$grid->addColumn('promedio', 'PROMEDIO', 'integer', NULL, false);
$grid->addColumn('rfinal', 'ESTADO', 'string', NULL, false);

$result = $mysqli->query('
SELECT *
FROM evaluacion
WHERE id="'.$evaid.'"');

$mysqli->close();

$grid->renderXML($result);

?>