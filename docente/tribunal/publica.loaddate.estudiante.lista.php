<?php     
     define ("MODULO", "DOCENTE");
require  '_start.php';
require '../../_inc/_configurar.php';
require('../EditableGrid.php');
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
$grid->addColumn('codigosis', 'Codigo Sis', 'string', NULL, false); 
$grid->addColumn('nombre', 'Nombres', 'string', NULL, false);  
$grid->addColumn('apellidos', 'Apellidos', 'string', NULL, false);
$grid->addColumn('nombrep', 'Nombre Proyecto', 'string', NULL, false);
$grid->addColumn('action', 'Opciones', 'html', NULL, false);

$result = $mysqli->query('select DISTINCT (e.id), e.codigo_sis as codigosis, u.nombre as nombre, CONCAT(u.apellido_paterno,u.apellido_materno) apellidos, p.`nombre` as nombrep
            from  usuario u , estudiante e, proyecto_estudiante pe, proyecto p, tribunal  t, docente  d, defensa  de
            where   u.id=e.usuario_id and e.id=pe.estudiante_id and  de.tipo_defensa="DPU" and   de.proyecto_id=p.id and pe.proyecto_id=p.id  and p.estado_proyecto="LD" and p.id=t.proyecto_id and t.docente_id = d.id and d.id="'.$docid.'"');
$mysqli->close();


$grid->renderXML($result);

//echo $result[0];
?>