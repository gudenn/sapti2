<?php     

require_once('config.php');      
require_once('EditableGrid.php');

if(isset($_GET['revid'])){
$obser2=$_GET['revid'];
};

// Database connection
$mysqli = mysqli_init();
$mysqli->options(MYSQLI_OPT_CONNECT_TIMEOUT, 5);
$mysqli->real_connect($config['db_host'],$config['db_user'],$config['db_password'],$config['db_name']); 
                    
// create a new EditableGrid object
$grid = new EditableGrid();

$grid->addColumn('id', 'ID', 'integer', NULL, false); 
$grid->addColumn('observacion', 'Observacion', 'string');
$grid->addColumn('action', 'Borrar', 'html', NULL, false);

$result = $mysqli->query('
SELECT ob.id AS id, ob.observacion AS observacion
FROM observacion ob
WHERE revision_id="'.$obser2.'"');

$mysqli->close();

$grid->renderXML($result);

?>