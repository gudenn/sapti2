<?php     
try {
       define ("MODULO", "DOCENTE");
require  '../_start.php';
include '../../_inc/_configurar.php';    
require_once('../EditableGrid.php');
 


if(isset($_GET['doc'])){
$docid=$_GET['doc'];
};

//echo $docid;
$mysqli = mysqli_init();
$mysqli->options(MYSQLI_OPT_CONNECT_TIMEOUT, 5);    
$mysqli->real_connect(DBHOST,DBUSER,BDPASS,BDNAME); 
             
 leerClase("Usuario");
 leerClase("Docente");
 $docente= getSessionDocente();
 $docenteid=$docente->id;
 
  //echo $docid;
// create a new EditableGrid object
$grid = new EditableGrid();

$grid->addColumn('id', 'ID', 'integer', NULL, false); 
$grid->addColumn('codigosis', 'Codigo Sis', 'string', NULL, false); 
$grid->addColumn('nombre', 'Nombres', 'string', NULL, false);  
$grid->addColumn('apellidos', 'Apellidos', 'string', NULL, false);
$grid->addColumn('nombrep', 'Nombre Proyecto', 'string', NULL, false);
$grid->addColumn('action', 'Opciones', 'html', NULL, false);



$result = $mysqli->query('select DISTINCT (e.id) as id, e.codigo_sis as codigosis, u.nombre as nombre, CONCAT(u.apellido_paterno,u.apellido_materno) apellidos, p.nombre as nombrep
from  usuario u , estudiante e, proyecto_estudiante pe, proyecto p, proyecto_tutor pt , tutor  t, docente d
where   u.id=e.usuario_id and e.id=pe.estudiante_id and  p.`tipo_proyecto`="PE" and pe.proyecto_id=p.id and p.`id`=pt.`proyecto_id` and t.`id`= pt.`proyecto_id` and t.`usuario_id`=d.`usuario_id` and d.`id`="'.$docid.'"');
$mysqli->close();


$grid->renderXML($result);
  
} catch (Exception $exc) {
   $smarty->assign("ERROR", handleError($e));
  
}


//echo $result[0];
?>