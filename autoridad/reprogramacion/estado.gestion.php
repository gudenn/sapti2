<?php
try {
  define ("MODULO", "REPROGRAMACION-GESTION");
  require('../_start.php');
  if(!isAdminSession())
    header("Location: ../login.php");  

  leerClase("Semestre");
  leerClase("Formulario");
  leerClase("Pagination");
  leerClase("Filtro");


  $ERROR = '';

  /** HEADER */
  $smarty->assign('title','Gestion de Estado');
  $smarty->assign('description','Pagina de gestion de Estados');
  $smarty->assign('keywords','Gestion,estados');
  leerClase('Administrador');
  leerClase('Estudiante');
  leerClase('Proyecto');
  leerClase('Usuario');
  leerClase('Vigencia');
  leerClase('Semestre');
  /**
   * Menu superior
   */
  $menuList[]     = array('url'=>URL . Administrador::URL , 'name'=>'Administrador');
  $menuList[]     = array('url'=>URL . Administrador::URL . 'reprogramacion/','name'=>'Reprogramaci&oacute;n');
  $menuList[]     = array('url'=>URL . Administrador::URL . 'reprogramacion/'.basename(__FILE__),'name'=>'Gesti&oacute;n de Reprogramaci&oacute;n');
  $smarty->assign("menuList", $menuList);

  //CSS
  $CSS[]  = URL_CSS . "academic/tables.css";
  //$CSS[]  = URL_CSS . "pg.css";
  $smarty->assign('CSS',$CSS);

  //JS
  $JS[]  = URL_JS . "jquery.min.js";
  $smarty->assign('JS',$JS);
  
  $id_es=$_GET['id_post'];
  $estudiante=new Estudiante($id_es);
  
  $proyecto=$estudiante->getProyecto();
  $proyecto->nombre;
  $v=$proyecto->getVigencia();
  $vigencia= new Vigencia($v[0]->id);
  
  $smarty->assign('proyecto'     ,$proyecto);
  $smarty->assign('vigencia'     ,$vigencia);
  $smarty->assign('estudiante'     ,$estudiante);

  
  //////////////////////////////////////////////////////////////////
  //////////////////////////////////////////////////////////////////
  //////////////////////////////////////////////////////////////////

 
 

  if (isset($_GET['postergar'])&$vigencia->estado_vigencia!='PO' )
  {
     $fechafin=$v[0]->fecha_fin;
     $actual=date("d/m/Y", strtotime("$fechafin +1 year"));
     $vigencia->fecha_fin=$actual;
     $vigencia->estado_vigencia='PO';
     $vigencia->save();
  }
  

       if (isset($_GET['prorroga'])&$vigencia->estado_vigencia!='PR' )
  { 
     $fechafin=$v[0]->fecha_fin;
     $vigencia->fecha_fin=  date("d/m/Y",strtotime("$fechafin +6 month") );
     $vigencia->estado_vigencia='PR';
     $vigencia->save();
 }
     $smarty->assign('mascara'     ,'admin/listas.mascara.tpl');
     $smarty->assign('lista'       ,'admin/estado/lista.tpl');

 



  //No hay ERROR
    $smarty->assign("ERROR",'');
    $smarty->assign("URL",URL);  

}
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}

if (isset($_GET['tlista']) && $_GET['tlista']) //recargamos la tabla central
  $smarty->display('admin/listas.lista.tpl'); 
else
  $smarty->display('admin/full-width_1.tpl');


?>