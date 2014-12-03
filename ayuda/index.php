<?php
try {
  require('../_start.php');

  /** HEADER */
  $smarty->assign('title','Proyecto Final - Ayuda');
  $smarty->assign('description','Proyecto Final');
  $smarty->assign('keywords','Proyecto Final');

  //CSS
  $CSS[] = URL_CSS . "ayuda.css";
  $JS[]  = URL_JS . "jquery.min.js";
  $smarty->assign('CSS',$CSS);
  $smarty->assign('JS',$JS);

  leerClase('Helpdesk');
  leerClase('Modulo');
  leerClase('Administrador');

  $helpdesk = new Helpdesk();
  if ( isset($_GET['codigo']) )
    $helpdesk->getByCodigo ($_GET['codigo']);
  if (isset($_GET['compilar'])){
    echo "<pre>";
      print_r($helpdesk);
    echo "</pre>";
    $helpdesk->rectificarnombredearchivo();
  }

  $strdir = ltrim(dirname($helpdesk->directorio),'/');
  $busca    = array('configuracion'       ,'notificacion');
  $remplaza = array('configuraci&oacute;n','notificaci&oacute;n');
  $strdir   = str_replace($busca, $remplaza, $strdir);

  $directorio = explode('/' , $strdir);
  //quitamos el primer elemento
  array_shift($directorio);
  $smarty->assign('topnav'   ,  $directorio);
  $smarty->assign('helpdesk' , $helpdesk);
  
          
  //obtenemos el grupo del usuario actual
  // Si 
  $tieneAccesoHelpdesk = false;
  if(isUserSession())
  {
    leerClase('Usuario');
    $usuario = getSessionUser();
    $grupos  = $usuario->getMisGrupos();
    $smarty->assign('misGrupos'   , $grupos);
    foreach ($grupos as $grupo) 
    {
      $permiso = $grupo->tieneAccesoHelpdesk($helpdesk->modulo_id);
      if ($permiso->ver)
      {
        $tieneAccesoHelpdesk = true;
      }
    }
  }
  
  if (isset($_POST['buscar']) && isUserSession()) {
    $busqueda  = $_POST['buscar'];
    //@TODO $busqueda validar
    $helpdesks = $helpdesk->buscarAyudaParaUsuario($busqueda,$grupos);
    $template  = TEMPLATES_DIR."helpdesk/presentar.tpl";
    $smarty->assign('busqueda'    , $busqueda);
    $smarty->assign('helpdesks'   , $helpdesks);
  }
  else {
    //Editamos el tema online
    if ( $helpdesk->puedeEditar() )
      $smarty->assign('URLEDITAR' , URL.Administrador::URL.Helpdesk::URL."helpdesk.registro.php?helpdesk_id=".$helpdesk->id);
    // Incluimos el indice
    $indice   = TEMPLATES_DIR."helpdesk/indice.tpl";
    $smarty->assign('indice' , $indice);

    $template = TEMPLATES_DIR."helpdesk/archivo/{$helpdesk->codigo}.tpl";
    if (!file_exists($template) || !($helpdesk->codigo) )
      $template = TEMPLATES_DIR."helpdesk/archivo/defecto.tpl";
    
    //modulo vista para todos
    $modulo_visita = new Modulo('','VISITA');
    if (!$tieneAccesoHelpdesk && $helpdesk->codigo && $helpdesk->modulo_id != $modulo_visita->id)
      $template = TEMPLATES_DIR."helpdesk/archivo/denegado.tpl";
  }
  
  $smarty->assign('template' , $template);

  //No hay ERROR
  $smarty->assign("ERROR",'');
  
} 
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}

$TEMPLATE_TOSHOW = 'helpdesk/full-width.tpl';
$smarty->display($TEMPLATE_TOSHOW);

?>