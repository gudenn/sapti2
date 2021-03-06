<?php
  require_once(dirname(dirname(__FILE__))."/_inc/_sistema.php");
  
  /** Smarty */
  require(DIR_LIB.'/smarty/Smarty.class.php');
  Smarty::muteExpectedErrors();
  if(isUserSession()){
    leerClase('Usuario');
    $usuario=  getSessionUser();
    $nombre=$usuario->getNombreCompleto();
  }
  
  $ERROR  = "";
  $smarty = new Smarty;
  $smarty->template_dir = TEMPLATES_DIR;
  $smarty->compile_dir  = SMARTY_COMPILEDIR;
  $smarty->config_dir   = SMARTY_CONFIGDIR;
  $smarty->cache_dir    = SMARTY_CACHEDIR;

  $smarty->assign("URL",URL);  
  $smarty->assign("URL_CSS",URL_CSS);  
  $smarty->assign("URL_IMG",URL_IMG);  
  $smarty->assign("URL_JS",URL_JS);  
  $smarty->assign("UsuarioSesion",$nombre);   
  
  //$smarty->force_compile = true;
  $smarty->debugging      = false;
  $smarty->caching        = false;
  $smarty->cache_lifetime = 120;
  
  require('menu.left.php');
?>