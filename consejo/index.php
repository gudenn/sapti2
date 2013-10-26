<?php
try {
 define ("MODULO", "CONSEJO");
  
  
    require('_start.php');
    if(!isConsejoSession())
    header("Location: login.php"); 
     $smarty->assign('title','Proyecto Final');
     $smarty->assign('description','Proyecto Final');
     $smarty->assign('keywords','Proyecto Final');

  //CSS
     $CSS[]  = URL_CSS . "dashboard.css";
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
  
              leerClase('Consejo');
              leerClase('Menu');
              leerClase('Tribunal');
              leerClase('Administrador');
              leerClase('Estudiante');
              leerClase('Notificacion');

  
    /**
   * Menu superior
   */
  $menuList[]     = array('url'=>URL. Consejo::URL,'name'=>'Consejo');
  $smarty->assign("menuList", $menuList);
  
    /**
   * Menu central
   */
  //----------------------------------//

  $menu = new Menu('Asignaci&oacute;n de Tribunales');
  $link = Consejo::URL."registro.php";
  $menu->agregarItem('Asignac&oacute;n  De Tribunales','Se Asigna  Tribunales a Un Estudiante','tribunal.png',$link);
  $menus[] = $menu;
  
  $menu = new Menu('Asignaci&oacute;n De Fechas  De Defensa');
  $link = Consejo::URL."listadefensa.php";
  $menu->agregarItem('Gesti&oacute;n de Asignac&oacute;n de Fechas de Defensa','Registro de Fechas de Defensa','defensa.png',$link);
   $menus[] = $menu;
 
  $menu = new Menu('Tribunales no Aceptados');
  $link = Consejo::URL."tribunales.rechazados.php";
  $menu->agregarItem('Gesti&oacute;n de Asignac&oacute;n','Registro y modificaci&oacute;n de Tribunales','denegar.png',$link);
   $menus[] = $menu;
  
   $notificacion= new Notificacion();
    echo sizeof($notificacion->getNotificacionConsejo(2));
    
     
     $menu = new Menu('Reportes');
     $link = Consejo::URL."reporte.php";
     $menu->agregarItem('Reportes','','basicset/graph.png',$link);
     $menus[] = $menu;
  
  
  
 $smarty->assign("menus", $menus);

  $smarty->assign('JS',$JS);
  $smarty->assign("ERROR", $ERROR);
  

  //No hay ERROR
  $smarty->assign("ERROR",'');
  
} 
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}
$TEMPLATE_TOSHOW = 'tribunal/2columnas.tpl';
$smarty->display($TEMPLATE_TOSHOW);

?>