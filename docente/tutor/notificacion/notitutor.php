<?php
try {
    define ("MODULO", "DOCENTE");
  require('../../_start.php');
  if(!isDocenteSession() && !isTutorSession() )
    header("Location: ../../login.php"); 
  global $PAISBOX;
    /** HEADER */
  $smarty->assign('title','Modificacion de Observaciones');
  $smarty->assign('description','Formulario de Modificacion de Observaciones');
  $smarty->assign('keywords','SAPTI,Observaciones,Registro');

  //CSS
  $CSS[]  = URL_CSS . "academic/3_column.css";
  //$CSS[]  = URL_CSS . "/styleob.css";
  $CSS[]  = URL_JS  . "/validate/validationEngine.jquery.css";
  $CSS[]  = URL_JS . "ui/cafe-theme/jquery-ui-1.10.2.custom.min.css";
 
  $smarty->assign('CSS',$CSS);

  //JS
  $JS[]  = URL_JS . "jquery.1.9.1.js";

  //Datepicker UI
  $JS[]  = URL_JS . "ui/jquery-ui-1.10.2.custom.min.js";
  $JS[]  = URL_JS . "ui/i18n/jquery.ui.datepicker-es.js";
  $JS[]  = URL_JS . "jquery.addfield.js";

  
  
  $smarty->assign('JS',$JS);
  $smarty->assign("ERROR", '');
 //// leer las clases 
    leerClase("Area");
    leerClase("Apoyo");
    leerClase("Usuario");
    leerClase("Docente");
     leerClase("Notificacion");
     $var= new Notificacion();
  
 

    $docente     =  getSessionDocente();
    $docente_ids =  $docente->id;
    // el usuario en sesion
      $usuarioensesion=  getSessionUser();
    
    
    $sql="select p.id, pt.id as idproyectotutor, u.nombre, p.nombre  as nombreproyecto
from   usuario  u,  estudiante  e ,proyecto_estudiante  pe ,  proyecto p , proyecto_tutor pt , tutor  t
where  u.id=e.usuario_id  and e.id=pe.estudiante_id  and pe.proyecto_id=p.id
and p.id=pt.proyecto_id and pt.tutor_id=t.id  and pt.estado_tutoria='PE'  and t.usuario_id= $usuarioensesion->id;";
    $resultado   =  mysql_query($sql);
    $tutorlista= array();
 
 while ($fila = mysql_fetch_array($resultado)) 
 {
    $tutorlista[]=$fila;
    
 }
 //var_dump($notitribunal_id);
 $smarty->assign('usuario'     ,$usuarioensesion);
  $smarty->assign('tutorlista'     ,$tutorlista);
  
  
  
   if ( isset($_POST['tarea']) && $_POST['tarea'] == 'grabar' )
  {  
     echo "Hola elki";
  }
  
  
  $columnacentro = 'docente/tutor/notificacion/notitribunal.tpl';
  $smarty->assign('columnacentro',$columnacentro);

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

$TEMPLATE_TOSHOW = 'docente/docente.3columnas.tpl';
$smarty->display($TEMPLATE_TOSHOW);

?>
