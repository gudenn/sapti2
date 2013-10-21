<?php     
define ("MODULO", "CONSEJO");

require  '_start.php';
include '../_inc/_configurar.php';      
require_once('../docente/EditableGrid.php');
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

$result = $mysqli->query('select   DISTINCT(p.id)  as id ,u.nombre , CONCAT(u.apellido_paterno , u.apellido_materno) apellidos, p.nombre as nombrep
from  usuario  u,  estudiante e  , proyecto_estudiante  pe , proyecto  p , tribunal t
where    u.id= e.usuario_id  and e.id= pe.estudiante_id  and pe.proyecto_id= p.id
 and t.accion="RE" and p.id= t.proyecto_id');

$mysqli->close();

$grid->renderXML($result);

?>