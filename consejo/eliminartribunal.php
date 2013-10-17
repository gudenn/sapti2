<?php
try {
  define ("MODULO", "CONSEJO");
    require('_start.php');
   /** HEADER */
  $smarty->assign('title','Proyecto Final');
  $smarty->assign('description','Proyecto Final');
  $smarty->assign('keywords','Proyecto Final');

  //CSS
  $CSS[]  = URL_CSS . "academic/3_column.css";
  $CSS[]  = URL_JS  . "/validate/validationEngine.jquery.css";
  
  $CSS[]  = URL_JS . "ui/cafe-theme/jquery-ui-1.10.2.custom.min.css";
  
  $smarty->assign('CSS',$CSS);

  //JS
  $JS[]  = URL_JS . "jquery.min.js";

  //Datepicker UI
  $JS[]  = URL_JS . "ui/jquery-ui-1.10.2.custom.min.js";
  $JS[]  = URL_JS . "ui/i18n/jquery.ui.datepicker-es.js";

  //Validation
  $JS[]  = URL_JS . "validate/idiomas/jquery.validationEngine-es.js";
  $JS[]  = URL_JS . "validate/jquery.validationEngine.js";

  $smarty->assign('JS',$JS);
  //CREAR UN TIPO   DE DEF
  leerClase('Tribunal');
  leerClase("Proyecto");
  leerClase("Usuario");
  leerClase("Docente");
  leerClase("Estudiante");
  leerClase("Formulario");
  leerClase("Pagination");
  leerClase("Filtro");
  leerClase("Proyecto_estudiante");
  leerClase("Consejo");
  
  $menuList[]     = array('url'=>URL.Consejo::URL,'name'=>'Consejo');
  $menuList[]     = array('url'=>URL . Consejo::URL ,'name'=>'Etitar Tribunales');
  $smarty->assign("menuList", $menuList);
  
  $usuario_id     = array();
  $usuario_nombre = array();
  $sql="SELECT DISTINCT (p.id) , u.nombre ,CONCAT(u.apellido_paterno,u.apellido_materno) as apellidos, es.codigo_sis , p.nombre as nombreproyecto
  FROM proyecto p , usuario u, estudiante es , proyecto_estudiante pe, tribunal t
  WHERE  u.id=es.usuario_id and  es.id=pe.estudiante_id and  pe.proyecto_id=p.id and p.id=t.proyecto_id;";
  $resultado = mysql_query($sql);
  $arraytribunal= array();
 
 while ($fila = mysql_fetch_array($resultado, MYSQL_ASSOC)) 
 {
    $arraytribunal[]=$fila;
 }
 
$smarty->assign('arraytribunal'  , $arraytribunal);
 

  if(isset($_GET['eliminar']) && isset($_GET['tribunaleliminar_id']) && is_numeric($_GET['tribunaleliminar_id']) )
  {
      echo $_GET['tribunaleliminar_id'];
      
  
    $sqlss= "DELETE FROM tribunal WHERE proyecto_id=".$_GET['tribunaleliminar_id'];
   if( mysql_query( $sqlss))
   {
       $proyecto= new Proyecto($_GET['tribunaleliminar_id']);
 
   $proyecto->estado_proyecto=  Proyecto::EST2_BUE;
   $proyecto->save();
   
    
    $estudiante   = new Estudiante($proyectos->getEstudiante()->id);
    $notificacion= new Notificacion();
    $notificacion->objBuidFromPost();
  // $notificacion->enviarNotificaion($usuarios);
    $notificacion->proyecto_id= $proyecto->id; 
    $notificacion->tipo="Notificación";
    $notificacion->fecha_envio= date("j/n/Y");
    $notificacion->asunto= "Ha sido eliminado Tus Tribunales";
    $notificacion->detalle="Asignación de Fechas de Defensa";
    $notificacion->prioridad=5;
    $notificacion->estado = Objectbase::STATUS_AC;

    $noticaciones= array('estudiantes'=>array( $proyecto->getEstudiante()->id));
    $notificacion->enviarNotificaion( $noticaciones);
   
   }
         
      
   
    
    
    
    echo "<script>window.location.href='index.php'</script>";
  }

  $smarty->assign("ERROR", $ERROR);
  

  //No hay ERROR
  $smarty->assign("ERROR",'');
  
} 
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}


  $contenido = 'tribunal/listas.lista.tpl';
  $smarty->assign('contenido',$contenido);


$TEMPLATE_TOSHOW = 'tribunal/tribunal.3columnas.tpl';
$smarty->display($TEMPLATE_TOSHOW);

?>