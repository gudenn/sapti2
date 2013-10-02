<?php
try {
  require('../_start.php');
  if(!isAdminSession())
    header("Location: ../login.php");
  
  leerClase("Dicta");
  leerClase("Docente");
  leerClase("Materia");
  leerClase("Semestre");

  /** HEADER */
  $smarty->assign('title','Proyecto Final');
  $smarty->assign('description','Proyecto Final');
  $smarty->assign('keywords','Proyecto Final');

  $CSS[]  = URL_CSS . "academic/3_column.css";
  $CSS[]  = URL_CSS . "editablegrid.css";
  $CSS[]  = URL_JS  . "/validate/validationEngine.jquery.css";
  $smarty->assign('CSS',$CSS);

  //JS
  $JS[]  = URL_JS . "jquery.min.js";
  $JS[]  = URL_JS . "tablaeditable/editablegrid-2.0.1.js";
  $JS[]  = URL_JS . "tablaeditable/tabla.configuracion.dicta.js";

  //Validation
  $JS[]  = URL_JS . "validate/idiomas/jquery.validationEngine-es.js";
  $JS[]  = URL_JS . "validate/jquery.validationEngine.js";
  $smarty->assign('JS',$JS);

  $menuList[]     = array('url'=>URL.Docente::URL,'name'=>'Docente');
  $menuList[]     = array('url'=>URL.Docente::URL.basename(__FILE__),'name'=>'Tiempo');
  $smarty->assign("menuList", $menuList);  
  
  $semestre=new Semestre();
  $semestre->getActivo();

  ////////////CARGANDO COMBOBOX///////////
  $sqlmateria="SELECT *
    FROM materia
    WHERE materia.estado='AC'
    ";
 $resultadomateria = mysql_query($sqlmateria);
    $materia_values[] = '';
    $materia_output[] = '- Seleccione Materia -';
 while ($filamateria = mysql_fetch_array($resultadomateria, MYSQL_ASSOC)){
    $materia_values[] = $filamateria['id'];
    $materia_output[] = $filamateria['nombre'];
 }

  $sqldoc="SELECT dc.id as id, CONCAT(us.apellido_paterno, us.apellido_materno, us.nombre) as nombre
FROM usuario us, docente dc
WHERE us.id=dc.usuario_id
AND us.estado='AC'
AND dc.estado='AC'
    ";
 $resultadodoc = mysql_query($sqldoc);
    $docentes_values[] = '';
    $docentes_output[] = '- Seleccione Docente -';
 while ($filadoc = mysql_fetch_array($resultadodoc, MYSQL_ASSOC)){
    $docentes_values[] = $filadoc['id'];
    $docentes_output[] = $filadoc['nombre'];
 }
 
   $sqltabla="SELECT di.id as id, se.codigo as semestre, CONCAT(us.apellido_paterno, us.apellido_materno, us.nombre) as nombre, ma.nombre as materia, di.codigo_grupo as grupo
FROM dicta di, docente dc, usuario us, materia ma, semestre se
WHERE di.docente_id=dc.id
AND dc.usuario_id=us.id
AND di.materia_id=ma.id
AND di.semestre_id=se.id
AND se.activo=1
ORDER BY ma.nombre, di.codigo_grupo
    ";
 $resultadotabla = mysql_query($sqltabla);
 while ($filatabla = mysql_fetch_array($resultadotabla, MYSQL_ASSOC)){
    $tabladicta[]= $filatabla;
 }
 
    $smarty->assign('semestre'  , $semestre);
    $smarty->assign('tabladicta'  , $tabladicta);
    $smarty->assign('docentes_values'  , $docentes_values);
    $smarty->assign('docentes_output'  , $docentes_output);
    $smarty->assign('docentes_selected'  , '');
    $smarty->assign('materia_values'  , $materia_values);
    $smarty->assign('materia_output'  , $materia_output);
    $smarty->assign('materia_selected'  , '');    
          
  //No hay ERROR
  $smarty->assign("ERROR",'');
  
} 
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}

$token                = sha1(URL . time());
$_SESSION['register'] = $token;
$smarty->assign('token',$token);

$TEMPLATE_TOSHOW = 'admin/dicta/configuracion.dicta.tpl';
$smarty->display($TEMPLATE_TOSHOW);

?>




