<?php     
define ("MODULO", "CONSEJO");

require  '_start.php';
include '../_inc/_configurar.php';      
require_once('../docente/EditableGrid.php');
  // if(!isConsejoSession())
 // header("Location: login.php");       
// Database connection
$mysqli = mysqli_init();
$mysqli->options(MYSQLI_OPT_CONNECT_TIMEOUT, 5);
$mysqli->real_connect(DBHOST,DBUSER,BDPASS,BDNAME); 
                    
// create a new EditableGrid object
$grid = new EditableGrid();

$grid->addColumn('id', 'ID', 'integer', NULL, false); 
$grid->addColumn('codigosis', 'Codigo Sis', 'string', NULL, false); 
$grid->addColumn('nombre', 'Nombres', 'string', NULL, false);  
$grid->addColumn('apellidos', 'Apellidos', 'string', NULL, false);
$grid->addColumn('nombrep', 'Nombre Proyecto', 'string', NULL, false);
$grid->addColumn('action', 'Opciones', 'html', NULL, false);

$result = $mysqli->query('
SELECT DISTINCT (es.id) as id ,es.codigo_sis as codigosis , u.nombre ,CONCAT(u.apellido_paterno,"  ",u.apellido_materno) as apellidos, p.nombre as nombrep
FROM  usuario u, estudiante es , proyecto_estudiante pe, proyecto p
WHERE  u.id=es.usuario_id and  es.id=pe.estudiante_id and  pe.proyecto_id=p.id 
and p.estado_proyecto="VB" and p.tipo_proyecto="PR"
and u.estado="AC" and es.estado="AC" and pe.estado="AC"  and p.estado="AC"
and p.es_actual=1');

$mysqli->close();

$grid->renderXML($result);

?>