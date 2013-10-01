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
$grid->addColumn('nombre', 'Nombres', 'string', NULL, false);  
$grid->addColumn('apellidos', 'Apellidos', 'string', NULL, false);
$grid->addColumn('nombrep', 'Nombre Proyecto', 'string', NULL, false);
$grid->addColumn('evaluacion_1', 'Evaluacion 1', 'integer');
$grid->addColumn('evaluacion_2', 'Evaluacion 2', 'integer');
$grid->addColumn('evaluacion_3', 'Evaluacion 3', 'integer');
$grid->addColumn('promedio', 'Promedio', 'integer', NULL, false);
$grid->addColumn('rfinal', 'Aprobacion', 'string', NULL, false);

$result = $mysqli->query('
SELECT ev.id as id, us.nombre as nombre, CONCAT(us.apellido_paterno,us.apellido_materno) as apellidos, pr.nombre as nombrep, pr.id as id_pr, ev.evaluacion_1, ev.evaluacion_2, ev.evaluacion_3, ev.promedio as pro, ev.rfinal as apro
FROM dicta di, estudiante es, usuario us, inscrito it, proyecto pr, proyecto_estudiante pe, evaluacion ev
WHERE di.id=it.dicta_id
AND it.estudiante_id=es.id
AND es.usuario_id=us.id
AND pe.estudiante_id=es.id
AND pe.proyecto_id=pr.id
AND it.evaluacion_id=ev.id
AND di.id="'.$iddicta.'"
');
$mysqli->close();

$grid->renderXML($result);

?>