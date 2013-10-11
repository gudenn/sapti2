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

      /**
   * Menu superior
   */
  $menuList[]     = array('url'=>URL.Docente::URL,'name'=>'Materias');
  $smarty->assign("menuList", $menuList);

  $docente = getSessionDocente();
  //var_dump($docente);
  //$docente     = new Docente($docente_aux->docente_id); //esto ya no es necesario
  $usuario     = $docente->getUsuario();
  
    $materias = "SELECT DISTINCT ma.id as idmat, ma.nombre as nombre
FROM dicta di, semestre se, materia ma
WHERE di.materia_id=ma.id
AND di.semestre_id=se.id
AND se.activo=1
AND di.docente_id=".$docente->id."
ORDER BY ma.nombre";
  $mate = mysql_query($materias);
        while ($row = mysql_fetch_array($mate, MYSQL_ASSOC)) {
       $materiassemestre[] = $row;
 }
  $docmaterias = "SELECT di.id as iddicta, ma.id as idmat, ma.nombre as materia, di.codigo_grupo as grupo
FROM dicta di, semestre se, materia ma
WHERE di.materia_id=ma.id
AND di.semestre_id=se.id
AND se.activo=1
AND di.docente_id=".$docente->id."
ORDER BY ma.id";
  $resultmate = mysql_query($docmaterias);

  while ($row2 = mysql_fetch_array($resultmate, MYSQL_ASSOC)) {
       $docmateriassemestre[] = $row2;
 }

  /**
   * Menu central
   */
  //----------------------------------//
    if(mysql_num_rows($resultmate)>0){
  leerClase('Menu');
  $varsession=1;
  foreach ($materiassemestre as $value) 
   {
        $menu = new Menu($value['nombre']);
        for($i=0; $i < count($docmateriassemestre);$i++ )
        {
            if($value['idmat']==$docmateriassemestre[$i]['idmat']&&$docmateriassemestre[$i]['materia']=='Proyecto Final'){
                  $link = Docente::URL."index.proyecto-final.php?iddicta=".$docmateriassemestre[$i]['iddicta']."";
                  $menu->agregarItem('Gesti&oacute;n de Estudiantes Codigo:'.$docmateriassemestre[$i]['grupo'].'','Gesti&oacute;n de Estudiantes Inscritos en la Materia Proyecto Final.','docente/correccion.png',$link);
                  $_SESSION['iddictaproyectofinal'] = $docmateriassemestre[$i]['iddicta'];
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
  //----------------------------------//
  
  $smarty->assign("menus", $menus);
  
  $smarty->assign("docente", $docente);
  $smarty->assign("usuario", $usuario);
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