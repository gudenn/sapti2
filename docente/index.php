<?php
try {
  define ("MODULO", "DOCENTE");
  require('_start.php');
  if(!isDocenteSession())
    header("Location: login.php");  

  /** HEADER */
  $smarty->assign('title','Proyecto Final');
  $smarty->assign('description','Menu de Materias Asignadas');
  $smarty->assign('keywords','Proyecto Final');

  //CSS
  $CSS[]  = URL_CSS . "academic/3_column.css";
    $CSS[]  = URL_JS  . "/validate/validationEngine.jquery.css";
  
   // Agregan el css
  $CSS[]  = URL_JS . "calendar/css/eventCalendar.css";
  $CSS[]  = URL_JS . "calendar/css/eventCalendar_theme.css";
  $CSS[]  = URL_CSS . "dashboard.css";
  //$CSS[]  = URL_CSS . "acordion.css";

// Agregan el js
  //JS
  $JS[]  = URL_JS . "jquery.min.js";
  $JS[]  = URL_JS . "calendar/js/jquery.eventCalendar.js";
  $smarty->assign('CSS',$CSS);
  $smarty->assign('JS',$JS);

  //CREAR UN DOCENTE
  leerClase('Usuario');
  leerClase('Docente');
  leerClase('Semestre');
   leerClase('Notificacion');

      /**
   * Menu superior
   */
  $menuList[]     = array('url'=>URL.Docente::URL,'name'=>'Materias');
  $smarty->assign("menuList", $menuList);

  $docente = getSessionDocente();
      /**
   * Menu central
   */

  //----------------------------------//
    if(mysql_num_rows($resultmate)>0)
      {
  
  foreach ($materiassemestre as $value) 
   {
        $menu = new Menu($value['nombre']);
        for($i=0; $i < count($docmateriassemestre);$i++ )
        {
            if($value['idmat']==$docmateriassemestre[$i]['idmat']&&$docmateriassemestre[$i]['materia']=='Proyecto Final'){
                  $link = Docente::URL."index.proyecto-final.php?iddicta=".$docmateriassemestre[$i]['iddicta']."";
                  $menu->agregarItem('Gesti&oacute;n de Estudiantes Codigo:'.$docmateriassemestre[$i]['grupo'].'','Gesti&oacute;n de Estudiantes Inscritos en la Materia Proyecto Final.','docente/correccion.png',$link);
            }elseif ($value['idmat']==$docmateriassemestre[$i]['idmat']&&$docmateriassemestre[$i]['materia']=='Perfil') {
                        $link = Docente::URL."index.proyecto-final.php?iddicta=".$docmateriassemestre[$i]['iddicta']."";
                        $menu->agregarItem('Gesti&oacute;n de Estudiantes Codigo:'.$docmateriassemestre[$i]['grupo'].'','Gesti&oacute;n de Estudiantes Inscritos en la Materia de Perfil.','docente/correccion.png',$link);
            }
         };
         $menus[] = $menu;
  };
      }  else {
  $columnacentro = 'docente/mensajedisculpa.tpl';
  $smarty->assign('columnacentro',$columnacentro);
  }
  
  $notificacion = new Notificacion();
  $menu = new Menu('Tutor');
  $link = Docente::URL."tutor/index.php";
  $menu->agregarItem('Notificaiones','Notificaciones para el Proyecto Final','docente/notificacion.png',$link,0,  sizeof($notificacion->getNotificacionTribunal(3)));
  $menus[] = $menu;
  
  $menu = new Menu('Tribunal');
  $link = Docente::URL."tribunal/index.php";
  $menu->agregarItem('Notificaiones','Notificaciones para el Proyecto Final','docente/notificacion.png',$link,0,  sizeof($notificacion->getNotificacionTribunal(3)));
  $menus[] = $menu;
  
  $menu = new Menu('Tiempo');
  $link = Docente::URL."configuracion/disponibilidad.php";
  $menu->agregarItem('Disponibilidad','Disponibilidad De Tiempo','docente/notificacion.png',$link,0,  sizeof($notificacion->getNotificacionTribunal(3)));
  $menus[] = $menu;
  
  $menu = new Menu('Agregar Areas');
  $link = Docente::URL."configuracion/configuracion.php";
  $menu->agregarItem('Configuracion','Agregar Areas De Disponibilidad','docente/notificacion.png',$link,0,  sizeof($notificacion->getNotificacionTribunal(3)));
  $menus[] = $menu;
   
   // Notificaiones 
  leerClase('Usuario');
  leerClase('Notificacion');
  $usuario      = getSessionUser();
  $notificacion = new Notificacion();

   $menu = new Menu('Notificaiones y Mensajes');
   $link = Docente::URL."notificacion/";
   $menu->agregarItem('Notificaiones','Gesti&oacute;n de notificaiones','basicset/message-archived.png',$link,0,  sizeof($notificacion->getNotificacionTribunal(3)));
   $link = Docente::URL."notificacion/notificacion.gestion.php?estado_notificacion=SV";
   $counter = $notificacion->getTodasNotificaciones($usuario->id, '', '', ' AND estado_notificacion="SV" ');
   $menu->agregarItem('Notificaciones Pendientes','Todas las notificaciones no leidas','basicset/message-not-read.png',$link,$counter[1]);
   $menus[] = $menu;
  
  
  
  //----------------------------------//

  leerClase('Menu');
  $menu = new Menu('');
  $menus = $menu->getDocenteIndex($docente);
  $smarty->assign("menus", $menus);
  
  $smarty->assign("docente", $docente);
  $smarty->assign("ERROR", $ERROR);
  
  //No hay ERROR
  $smarty->assign("ERROR",'');
  
} 
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}

$TEMPLATE_TOSHOW = 'docente/2columnas.tpl';
$smarty->display($TEMPLATE_TOSHOW);

?>