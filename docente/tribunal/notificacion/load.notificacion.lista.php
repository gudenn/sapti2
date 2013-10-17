<?php     
 define ("MODULO", "DOCENTE");
require  '../_start.php';
require '../../../_inc/_configurar.php';
require('../../EditableGrid.php');
if(isset($_GET['doc'])){
$docid=$_GET['doc'];
};
//echo $docid;

// Database connection
$mysqli = mysqli_init();
$mysqli->options(MYSQLI_OPT_CONNECT_TIMEOUT, 5);    
$mysqli->real_connect(DBHOST,DBUSER,BDPASS,BDNAME); 
                    

// create a new EditableGrid object
$grid = new EditableGrid();

$grid->addColumn('id', 'ID', 'integer', NULL, false); 
$grid->addColumn('codigosis', 'Codigo Sis', 'integer', NULL, false); 
$grid->addColumn('nombre', 'Nombres', 'string', NULL, false);  
$grid->addColumn('apellidos', 'Apellidos', 'string', NULL, false);
$grid->addColumn('nombrep', 'Nombre Proyecto', 'string', NULL, false);
$grid->addColumn('action', 'Opciones', 'html', NULL, false);

$result = $mysqli->query('select  t.id , es.codigo_sis as codigosis, u.nombre as nombre, CONCAT (u.apellido_paterno, u.apellido_paterno) as apellidos ,p.nombre as nombrep
from  usuario u, estudiante es, proyecto_estudiante pe, proyecto p,  tribunal t , notificacion_tribunal  nt
where    u.id= es.usuario_id  and es.id=  pe.estudiante_id  and  pe.proyecto_id=p.id  and  p.id =t.proyecto_id
  and  u.estado="AC"  and es.estado="AC" and pe.estado="AC" and p.estado="AC" and t.estado="AC"
  and nt.estado="AC"  and p.es_actual=1 and t.visto="NV" and t.id=nt.tribunal_id  and t.docente_id="'.$docid.'"');
$mysqli->close();


$grid->renderXML($result);

//echo $result[0];
?>