<?php

try {
  define("MODULO", "DOCENTE");
  require('../_start.php');
if (!isDocenteSession())
    header("Location: ../login.php");

    /** HEADER */
  $smarty->assign('title','Modificacion de Observaciones');
  $smarty->assign('description','Formulario de Modificacion de Observaciones');
  $smarty->assign('keywords','SAPTI,Observaciones,Registro');

    //CSS
  $CSS[] = URL_CSS . "academic/3_column.css";
  $CSS[] = URL_CSS . "css/multi-select.css";
  $CSS[] = URL_CSS . "css/application.css";

  //$CSS[]  = URL_CSS . "/styleob.css";
  $CSS[] = URL_JS . "/validate/validationEngine.jquery.css";
  $CSS[] = URL_JS . "ui/cafe-theme/jquery-ui-1.10.2.custom.min.css";

  $smarty->assign('CSS', $CSS);

  //JS
  $JS[] = URL_JS . "jquery.min.js";

  //Datepicker UI
  $JS[] = URL_JS . "ui/jquery-ui-1.10.2.custom.min.js";
  $JS[] = URL_JS . "ui/i18n/jquery.ui.datepicker-es.js";
  $JS[] = URL_JS . "jquery.addfield.js";
  $JS[] = URL_JS . "js/jquery.js";
  $JS[] = URL_JS . "js/jquery.multi-select.js";
 
  $smarty->assign('JS', $JS);
  $smarty->assign("ERROR", '');
  //// leer las clases 
  leerClase("Area");
  leerClase("Apoyo");
  leerClase("Usuario");
  leerClase("Docente");
  
  $menuList[]     = array('url'=>URL.Docente::URL,'name'=>'Materias');
  $menuList[] = array('url' => URL . Docente::URL.'configuracion/' . basename(__FILE__), 'name' => 'Tiempo');
  $smarty->assign("menuList", $menuList);

    
     
   if ( isset($_POST['tarea']) && $_POST['tarea'] == 'grabar' )
  {
    $docentes     = getSessionUser();
    $docente_idss =  $docentes->id;
 
    $sqla="select a.id, ap.`id` as idapoyo
from usuario u, docente d ,area a , apoyo ap
where u.id=d.`usuario_id` and d.`id`=ap.`docente_id` and ap.`area_id`=a.id and u.`estado`='AC' and d.`estado`='AC' and u.`id`=".$docente_idss.";";
    $resultad   =  mysql_query($sqla);
   
 
 while ($filass = mysql_fetch_array($resultad)) 
 {
    $apoyo= new Apoyo($filass['idapoyo']);
    $apoyo->delete();
 }
  
     
    $sql="select d.id from usuario u, docente d
    where u.id=d.`usuario_id` and u.`estado`='AC' and d.`estado`='AC' and u.`id`=".$docente_idss.";";
    $resultado   =  mysql_query($sql);
    $iddocente   =  0;
 
 while ($fila = mysql_fetch_array($resultado)) 
 {
    $iddocente=$fila['id'];
 }
  
   
     if (isset($_POST['myselect']))
     foreach ($_POST['myselect'] as $id)
     {
   // echo $id;
          $apoyo = new Apoyo();
                $apoyo->objBuidFromPost();
                $apoyo->estado = Objectbase::STATUS_AC;
                $apoyo->area_id=$id;
                $apoyo->docente_id = getSessionDocente()->id;
                $apoyo->save();
          
     }
     
      if (isset($_POST['horario']))
     foreach ($_POST['horario'] as $ids)
     {
        echo $_POST['dia'];
        echo $ids[0];
        
   
           
     }
 
 }
    
    
  $area = new Area();
  $area_sql = $area->getAll();
  $area_id = array();

  $docente = getSessionDocente();

  if (isset($_POST['tarea']) && $_POST['tarea'] == 'grabar') {
    $apoyo = new Apoyo();
    // borramos 
    $apoyo->borrarMisApoyos($docente->id);
    // guardamos
    if (isset($_POST['myselect']))
    {
      foreach ($_POST['myselect'] as $id) {
        // echo $id;
        $apoyo             = new Apoyo();
        $apoyo->area_id    = $id;
        $apoyo->docente_id = $docente->id;
        $apoyo->estado  = Objectbase::STATUS_AC;
        $apoyo->save();
      }
    }
  }
  // actualizamos el docente
  $docente->getAllObjects();

  $area     = new Area();
  $area_sql = $area->getAll();
  
  //llenamos el select inicial
  $area_id     = array();
  $area_nombre = array();
  while ($area_sql && $rows = mysql_fetch_array($area_sql[0])) {
    $area_id[] = $rows['id'];
    $area_nombre[] = $rows['nombre'];
  }
  $smarty->assign('area_id', $area_id);
  $smarty->assign('area_nombre', $area_nombre);

  
  
  // samos los que tenemos guardados
  $areaselec_id = array();
  foreach ($docente->apoyo_objs as $apoyo) {
    $areaselec_id[] = $apoyo->area_id;
  }
  $smarty->assign('areaselec_id', $areaselec_id);



  $columnacentro = 'docente/configuracion/configuracion.tpl';
  $smarty->assign('columnacentro', $columnacentro);

  //No hay ERROR
  $smarty->assign("ERROR", '');
} catch (Exception $e) {
  $smarty->assign("ERROR", handleError($e));
}

$token = sha1(URL . time());
$_SESSION['register'] = $token;
$smarty->assign('token', $token);

$TEMPLATE_TOSHOW = 'docente/docente.3columnas.tpl';
$smarty->display($TEMPLATE_TOSHOW);
?>
