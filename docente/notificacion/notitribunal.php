<?php
try {
  require('../_start.php');
  if(!isDocenteSession())
    header("Location: login.php"); 
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
    $docente_ids =  $docente->docente_id;
    
     $var->getNotificacionTribunal($docente->id);
    
    echo sizeof($var->getNotificacionTribunal($docente->id));
    
 
    //echo $docente_ids;
    $sql="select  p.id, t.id as idtribunal, d.id as iddocente, u.nombre as nombreusuario, CONCAT (u.apellido_paterno, u.apellido_paterno) as apellidos ,p.nombre as nombreproyecto
        from proyecto p,  `tribunal` t, `docente` d , usuario u
where   p.id=t.proyecto_id and t.docente_id=d.id and d.usuario_id= u.id  and p.estado='AC' and t.estado='AC' and d.estado='AC' and u.estado= 'AC'  and d.id= $docente_ids;";
    $resultado   =  mysql_query($sql);
    $notitribunal_id= array();
 
 while ($fila = mysql_fetch_array($resultado)) 
 {
     $notitribunal_id[]=$fila;
    
 }
 //var_dump($notitribunal_id);
  $smarty->assign('notitribunal_id'     ,$notitribunal_id);
  
  
  
   if ( isset($_POST['tarea']) && $_POST['tarea'] == 'grabar' )
  {  
     echo "Hola elki";
  }
  
  
  $columnacentro = 'docente/notificacion/notitribunal.tpl';
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
