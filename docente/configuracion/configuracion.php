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
  
  $menuList[]     = array('url'=>URL.Docente::URL,'name'=>'Asignaturas >');
  $menuList[] = array('url' => URL . Docente::URL.'configuracion/' . basename(__FILE__), 'name' => '&Aacute;reas');
  $smarty->assign("menuList", $menuList);
$idapoyo='';
     if(isset($_GET['action']) && $_GET['action']='eliminar' && isset($_GET['idapoyo']) && is_numeric($_GET['idapoyo']))
     {
         $apo= new Apoyo($_GET['idapoyo']);
         $apo->delete();
     }
  if(isset($_GET['id_apoyo']) & is_numeric($_GET['id_apoyo']))
    {
        $idapoyo=$_GET['id_apoyo'];
    }
    $apoyo = new Apoyo($idapoyo);
     

  $docente = getSessionDocente();
    $docentes     = getSessionUser();
    $docente_idss =  $docentes->id;
  if (isset($_POST['tarea']) && $_POST['tarea'] == 'grabar' && isset($_POST['token']) && $_SESSION['register'] == $_POST['token']) {
    
    
    $apoyo->objBuidFromPost();
    $apoyo->estado=  Objectbase::STATUS_AC;
    $apoyo->docente_id=$docente ->id;
    $apoyo->save();
  }
 
  $area     = new Area();
  $area_sql = $area->getAll();
  
  //llenamos el select inicial
  $area_id     = array();
  $area_nombre = array();
   $area_id []    ='';
  $area_nombre[] = '----Seleccione el &Aacute;rea -----';
  while ($area_sql && $rows = mysql_fetch_array($area_sql[0])) {
    $area_id[] = $rows['id'];
    $area_nombre[] = $rows['nombre'];
  }
  $smarty->assign('area_id', $area_id);
  $smarty->assign('area_nombre', $area_nombre);

  
  
   $sqlr='SELECT a.*
FROM apoyo a
WHERE a.docente_id='.$docente ->id;
 $resultado = mysql_query($sqlr);
 $arraytribunal= array();
$contado=1;
 while ($fila = mysql_fetch_array($resultado, MYSQL_ASSOC)) 
   { 
     $apoyo= new Apoyo($fila["id"]);
        
        $lista_areas=array();
        $lista_areas[] =   $contado;
        $lista_areas[] =  $apoyo->getArea()->nombre;
        $lista_areas[] =  $apoyo->getSubArea()->nombre;
        $lista_areas[] =  $apoyo->id;
            
  $arraytribunal[]= $lista_areas;
  $contado++;
 }
 $smarty->assign('apoyo'  , $apoyo);
  $smarty->assign('listadocentes'  , $arraytribunal);

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
