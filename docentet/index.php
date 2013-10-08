<?php
try {
  require('_start.php');
  if(!isDocenteSession())
    header("Location: login.php");  

  /** HEADER */
  $smarty->assign('title','Proyecto Final');
  $smarty->assign('description','Proyecto Final');
  $smarty->assign('keywords','Proyecto Final');

  //CSS
  $CSS[]  = URL_CSS . "academic/3_column.css";
  $CSS[]  = URL_JS  . "/validate/validationEngine.jquery.css";
  
   // Agregan el css
  $CSS[]  = URL_JS . "calendar/css/eventCalendar.css";
  $CSS[]  = URL_JS . "calendar/css/eventCalendar_theme.css";
  $CSS[]  = URL_CSS . "dashboard.css";
  $CSS[]  = URL_CSS . "acordion.css";

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
  leerClase('Consejo');
  leerClase('Tutor');
  

      /**
   * Menu superior
   */
  $menuList[]     = array('url'=>URL.Tutor::URL,'name'=>'Tudor');
  $smarty->assign("menuList", $menuList);

  leerClase('Menu');
  leerClase('Tutor');
  $menu = new Menu('Lista de Estudiantes');
  $link = Tutor::URL."estudiante.lista.php";
  $menu->agregarItem('Gesti&oacute;n de Asignac&oacute;n','Registro y modificacion de tribunales','basicset/user4.png',$link);
  $link = Consejo::URL."";
  $menu->agregarItem('Reportes de Docentes','Reportes correspondientes a los Docentes','basicset/graph.png',$link);
  $menus[] = $menu;
  
 $smarty->assign("menus", $menus);
  
  $docente_aux = getSessionDocente();
  $docente     = new Docente($docente_aux->docente_id);
  $usuario     = $docente->getUsuario();
  
  $docmaterias = "SELECT di.id as iddicta, ma.id as idmat, ma.nombre as materia, di.codigo_grupo as grupo
FROM dicta di, semestre se, materia ma
WHERE di.materia_id=ma.id
AND di.semestre_id=se.id
AND se.activo=1
AND di.docente_id=".$docente_aux->docente_id."
ORDER BY ma.id";
  $resultmate = mysql_query($docmaterias);
  while ($row2 = mysql_fetch_array($resultmate, MYSQL_ASSOC))
 {
       $docmateriassemestre[] = $row2;
 }

  $smarty->assign("docmateriassemestre", $docmateriassemestre);
  $smarty->assign("docente", $docente);
  $smarty->assign("usuario", $usuario);
  $smarty->assign("ERROR", $ERROR);
  /*
  $smarty->assign("columnacentro", 'docente/index.centro.tpl');
  $columnaderecha = 'docente/columna.right.calendario.eventos.tpl';
  $smarty->assign('columnaderecha',$columnaderecha);
  //No hay ERROR
   * 
   */
  $smarty->assign("ERROR",'');
  
} 
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}

$TEMPLATE_TOSHOW = 'docente_tutor/2columnas.tpl';
$smarty->display($TEMPLATE_TOSHOW);

?>