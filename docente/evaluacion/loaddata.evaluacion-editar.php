<?php     
define ("MODULO", "DOCENTE");
require  '../_start.php';
include '../../_inc/_configurar.php';      
require_once('../EditableGrid.php');


if(isset($_GET['iddicta'])){
$iddicta=$_GET['iddicta'];
};
         
//Database connection
$mysqli = mysqli_init();
$mysqli->options(MYSQLI_OPT_CONNECT_TIMEOUT, 5);

$mysqli->real_connect(DBHOST,DBUSER,BDPASS,BDNAME);                     

$mysqli->real_connect(DBHOST,DBUSER,BDPASS,BDNAME);

$grid = new EditableGrid();

$grid->addColumn('id', 'ID', 'integer', NULL, false); 
$grid->addColumn('codigo', 'Codigo SIS', 'string', NULL, false);
$grid->addColumn('nombre', 'Nombres', 'string', NULL, false);  
$grid->addColumn('apellidos', 'Apellidos', 'string', NULL, false);
$grid->addColumn('nombrep', 'Nombre Proyecto', 'string', NULL, false);
$grid->addColumn('evaluacion_1', 'EVA 1', 'integer');
$grid->addColumn('evaluacion_2', 'EVA 2', 'integer');
$grid->addColumn('evaluacion_3', 'EVA 3', 'integer');
$grid->addColumn('pro', 'PROM', 'integer', NULL, false);
$grid->addColumn('apro', 'Aprobacion', 'string', NULL, false);
$grid->addColumn('action', 'Historial', 'html', NULL, false);

$result = $mysqli->query('
SELECT ev.id as id, es.codigo_sis as codigo, us.nombre as nombre, CONCAT(us.apellido_paterno,us.apellido_materno) as apellidos, pr.nombre as nombrep, pr.id as id_pr, ev.evaluacion_1, ev.evaluacion_2, ev.evaluacion_3, ev.promedio as pro, ev.rfinal as apro
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