<?php
try {
  define ("MODULO", "ADMIN-TUTOR");
  require('../_start.php');
  if(!isAdminSession())
    header("Location: ../login.php");  
  
  
  
  leerClase("Tutor");
  leerClase("Usuario");
  leerClase("Semestre");
  leerClase("Formulario");
  leerClase("Pagination");
  leerClase("Filtro");

  leerClase('Estudiante');
  leerClase('Proyecto_tutor');


  $ERROR = '';

  /** HEADER */
  $smarty->assign('title','Gesti&oacute;n de Tutores');
  $smarty->assign('description','Gesti&oacute;n de Tutores');
  $smarty->assign('keywords','Gesti&oacute;n,Tutores');
  /**
   * Menu superior
   */
  $menuList[]     = array('url'=>URL . Administrador::URL , 'name'=>'Administraci&oacute;n');
  $menuList[]     = array('url'=>URL . Administrador::URL . 'tutor/','name'=>'Tutores');
  $menuList[]     = array('url'=>URL . Administrador::URL . 'tutor/'.basename(__FILE__),'name'=>'Gesti&oacute;n de Tutores');
  //CSS
   $CSS[]  = URL_CSS . "academic/tables.css";
 
   $JS[]  = URL_JS . "jquery.min.js";

  //Validation
  $JS[]  = URL_JS . "validate/idiomas/jquery.validationEngine-es.js";
  $JS[]  = URL_JS . "validate/jquery.validationEngine.js";

  //BOX
  $CSS[]  = URL_JS . "box/box.css";
  $JS[]  = URL_JS ."box/jquery.box.js";
  //Datepicker & Tooltips $ Dialogs UI
  $CSS[]  = URL_JS . "ui/cafe-theme/jquery-ui-1.10.2.custom.min.css";
  $JS[]   = URL_JS . "jquery-ui-1.10.3.custom.min.js";
  $JS[]   = URL_JS . "ui/i18n/jquery.ui.datepicker-es.js";
  $smarty->assign('CSS',$CSS);
  $smarty->assign('JS',$JS);
  
  
  $semestre = new Semestre();

  if (isset($_GET['todos']) && $_GET['todos'])
    $_SESSION['estudiante_id'] = '';
  
  //si o si trabajamos aca con un estudiante asi que lo guardaremos en session
  $estudiante_id = false;
  if (isset($_SESSION['estudiante_id']) && is_numeric($_SESSION['estudiante_id']))
    $estudiante_id = $_SESSION['estudiante_id'];
  if (isset($_GET['estudiante_id']) && is_numeric($_GET['estudiante_id']))
  {
    $_SESSION['estudiante_id'] = $_GET['estudiante_id'];
    $estudiante_id             = $_GET['estudiante_id'];
  }
  $estudiante = new Estudiante($estudiante_id);
  $proyecto   = $estudiante->getProyecto();
  
  $smarty->assign('estudiante'     ,$estudiante);
  $smarty->assign('proyecto'       ,($proyecto->id)?$proyecto:false );
  
  //////////////////////////////////////////////////////////////////
  //////////////////////////////////////////////////////////////////
  //////////////////////////////////////////////////////////////////
  $filtro_mis_tutores = false;
  //Buscamos los tutores de un determinado estudiante
  if ($proyecto->id)
  {
    $filtro_mis_tutores = '-1,';
    $proyecto->proyecto_tutor_objs = $proyecto->getThisObjects('proyecto_tutor' , get_class($proyecto));
    $maximo_tutores  =  $semestre->getValor('Maximo Tutores Activos' , Tutor::MAXIMO);
    $total_asignados = 0;
    foreach ($proyecto->proyecto_tutor_objs as $proyecto_tutor)
    {
      // escluimos a los tutores actuales ACEPTADOS o PENDIENTES!!
      if ($proyecto_tutor->estado_tutoria == Proyecto_tutor::ACEPTADO
          || $proyecto_tutor->estado_tutoria == Proyecto_tutor::PENDIENTE )
      {
        $total_asignados ++;
        $filtro_mis_tutores .= $proyecto_tutor->tutor_id.",";
      }
    }
    if ($filtro_mis_tutores)
    {
      $filtro_mis_tutores = rtrim($filtro_mis_tutores, ',');
      $filtro_mis_tutores = " AND tutor.id  IN ($filtro_mis_tutores) ";
    }
    if ($total_asignados < $maximo_tutores)
      $smarty->assign("crear_nuevo"  ,"tutor.asignar.php?estudiante_id={$estudiante->id}");
    $smarty->assign('cabecera_file'  ,'admin/tutor/estudiante.cabecera.tpl');
    
    $smarty->assign('maximo_tutores'  ,$maximo_tutores);
    $smarty->assign('total_asignados' ,$total_asignados);
    
  }

  $smarty->assign('mascara'     ,'admin/listas.mascara.tpl');
  $smarty->assign('lista'       ,'admin/tutor/gestion.lista.tpl');
  
  
  //Filtro
  $filtro     = new Filtro('tutores_asignados',__FILE__);
  $tutor      = new Tutor();
  
  
  
  $tutor->iniciarFiltro($filtro);
  $filtro_sql = $tutor->filtrar($filtro);

  $tutor->usuario_id   = '%';

  if ($proyecto->id)
    $filtro_sql =  $filtro_mis_tutores . $filtro_sql;
  
  
  $o_string   = $tutor->getOrderString($filtro);
  $obj_mysql  = $tutor->getAll('',$o_string,$filtro_sql,TRUE,TRUE);
 

  $objs_pg    = new Pagination($obj_mysql, 'tutores_asignados','',false);


  $smarty->assign("filtros"  ,$filtro);
  $smarty->assign("objs"     ,$objs_pg->objs);
  $smarty->assign("pages"    ,$objs_pg->p_pages);
 $smarty->assign("crear_nuevo"  ,"tutor.registro.php");
 $ERROR = ''; 
if(isset($_SESSION['estado']) && $_SESSION['estado']==1)
{
  
  
  leerClase('Html');
  $html  = new Html();
 
 
    $html = new Html();
      
      $mensaje = array('mensaje'=>'Se grabo correctamente el Tutor','titulo'=>'Registro de Tutor' ,'icono'=> 'tick_48.png');
  
      $ERROR = $html->getMessageBox ($mensaje);
   
   $_SESSION['estado']=0;
$smarty->assign("ERROR",$ERROR);
     
}
  $smarty->assign("URL",URL);  

}
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}

if (isset($_GET['tlista']) && $_GET['tlista']) //recargamos la tabla central
  $smarty->display('admin/listas.lista.tpl'); 
else
  $smarty->display('admin/full-width.tpl');


?>