<?php
  ////////////////////////////////////////////////////////
  // Autor: Guyen Campero (guyencu@gmail.com)
  // Fecha: 12/04/2013
  // Fichero de configuracion para la conexcion de la DB y del sistema
  // SAPTI
  ////////////////////////////////////////////////////////

  $SYSTEM_NAME  = 'SAPTI';
  $SESSION_TIME = 60*60;

  //Sistema en desarrollo (localhost)
if ('localhost' == $_SERVER['HTTP_HOST'])
  define('ENDESARROLLO', true);
else
  define('ENDESARROLLO', false);

  ////////////////////////////////////////////////////////
  // Reporte de errores en el sistema
  // Deshabilitar todo reporte de errores
  // error_reporting(0);
  // Errores de ejecucion simples
  // error_reporting(E_ERROR | E_WARNING | E_PARSE);
  ////////////////////////////////////////////////////////

  define('DEBUGMODE', false);

  ////////////////////////////////////////////////////////
  // Directorios
  ////////////////////////////////////////////////////////
  define ("MKDIRMMODE"   , '0755'); //PERMISOS para crear directorios
  define ("PATH"         , getBasePath()); //RUTA

  // SITE: SE MODIFICAN ARCHIVOS
  define ("DIR_CLASES"   , PATH."/_inc/clases");   //OBJETOS
  define ("DIR_SMARTY"   , PATH."/_inc/_smarty/"); //TEMPLATES
  define ("DIR_MAILTPL"  , PATH."/_inc/mail.tpl/"); // TEMPLATES DE MAIL


  if (ENDESARROLLO)
  {
    //INC: DONDE NO SE MODIFICAN ARCHIVOS
    define ("DIR_LIB"        , dirname( PATH )."/sapti.inc/libs");
    define ("DIR_SMARTY_INC" , dirname( PATH )."/sapti.inc/_smarty/");
  }
  else
  {
    //INC: DONDE NO SE MODIFICAN ARCHIVOS
    define ("DIR_LIB"        , dirname( PATH )."/beta.proyecto.inc/libs");
    define ("DIR_SMARTY_INC" , dirname( PATH )."/beta.proyecto.inc/_smarty/");
  }
  
  //URL - 1 nivel de este archivo
  define ("URL"        , getBaseUrl()); // sapti.carga.com 

  define ("URL_JS"     , URL."js/");
  define ("URL_CSS"    , URL."css/");
  define ("URL_IMG"    , URL."images/");

  define ("PATH_IMG"   , PATH."images/");

  ////////////////////////////////////////////////////////
  // Smarty
  ////////////////////////////////////////////////////////
  //DESARROLLO
  define('TEMPLATES_DIR'    , DIR_SMARTY       . 'templates/');  

  //DE COMPLIACION Y CACHE NO EDITABLES
  define('SMARTY_COMPILEDIR', DIR_SMARTY_INC   . 'templates_c/');
  define('SMARTY_CONFIGDIR' , DIR_SMARTY_INC   . 'configs/');
  define('SMARTY_CACHEDIR'  , DIR_SMARTY_INC   . 'cache/');
  
  ////////////////////////////////////////////////////////
  //CONFIGURACION DE TEMAS DE AYUDAS
  ////////////////////////////////////////////////////////
  
  define('HELP_INSTALED_DIR'  , basename(PATH));
  
  ////////////////////////////////////////////////////////
  //EMAIL PRINCIPAL PARA EL SISTEMA
  ////////////////////////////////////////////////////////


  //El Email con el cual el sistema enviara emails
  define('EMAIL_SISTEMA_EMAIL'               , 'sapti@umss.edu.bo');
  define('EMAIL_SISTEMA_NOMBRE'              , 'Sistema SAPTI');
  //Mostramos el email en pantalla por motivos solo de testing
  define('IMPRIMIR_EMAIL_EN_PANTALLA'  , TRUE); 
  
  
  ////////////////////////////////////////////////////////
  //BD->MySQL
  ////////////////////////////////////////////////////////
  if (ENDESARROLLO)
  {
    //error_reporting(E_ERROR | E_WARNING | E_PARSE);
    if (DEBUGMODE){
      error_reporting(E_ALL);
      //error_reporting(E_ERROR | E_PARSE);  
      ini_set('display_errors','On');
    }else {
      error_reporting(0);  
      ini_set('display_errors','Off');
    }

    define ("DBHOST"        , "localhost");
    define ("BDNAME"        , "sapti");
    define ("DBUSER"        , "sapti");
    define ("BDPASS"        , "sapti");
  }
  // SERVER
  else
  {
    //@TODO quitar errores en el servidor en vivo
    //error_reporting(E_ERROR | E_WARNING | E_PARSE);  
    error_reporting(0);
    ini_set('display_errors','Off');
    define ("DBHOST"        , "localhost");
    define ("DBUSER"        , "rodolfo_sapti");
    define ("BDNAME"        , "rodolfo_sapti");
    define ("BDPASS"        , "DMUG*kb5RBDv");
  }
