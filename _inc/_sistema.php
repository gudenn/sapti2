<?php

/**
 * Sistema "Proyecto Final"
 * @version 1.0.2013.04.03
 * @date 03/04/2013
 */
// Begin the session
session_start();

require("_configurar.php"); // Configuracion del sistema
require("_sesion.php");     // Sessiones del sistema
leerClase('Exceptions');    // Manejo de ecepciones y errores
leerClase('Objectbase');    // Componente ecencial de todos los  objetos
leerClase('Helpdesk');      // Ayuda presente en todo el sistema
global $help;

if (isset($_GET['salir']) || isset($_POST['salir'])) {
  closeSession();
  header("Location: index.php");
  exit();
}
/**
 * PRobablemente DEPRECATED FUNCTION!!!
 */
if (isset($_GET['saliradmin']) || isset($_POST['saliradmin'])) {
  closeAdminSession();
  header("Location: index.php");
  exit();
}
if (isset($_GET['salirestudiante']) || isset($_POST['salirestudiante'])) {
  closeEstudianteSession();
  header("Location: index.php");
  exit();
}
if (isset($_GET['salirtutor']) || isset($_POST['salirtutor'])) {
  closeTutorSession();
  header("Location: index.php");
  exit();
}
if (isset($_GET['salirdocente']) || isset($_POST['salirdocente'])) {
  closeDocenteSession();
  header("Location: index.php");
  exit();
}
/**
 * FIN
 */
if (isset($_GET['salirconsejo']) || isset($_POST['salirconsejo'])) {
  closeConsejoSession();
  header("Location: index.php");
  exit();
}
conectar_db();
mysql_query('SET NAMES \'utf8\'');


/**
 * Permisos del Sistema
 */
verpermisos();

/**
 * @TODO ver permisos 
 * @global type $USUARIO
 */
function verpermisos() {
  if (isUserSession()) 
  {
    leerClase('Usuario');
    $usario = getSessionUser();
    if (defined("MODULO"))
      $_SESSION["MODULO"] = MODULO;
    else
      $_SESSION["MODULO"] = 'VISITA';
    if (!isset($_SESSION['PERMISOS']))
      $_SESSION['PERMISOS'] = array();
    if (TRUE || !isset($_SESSION['PERMISOS'][$_SESSION["MODULO"]]))
      $_SESSION['PERMISOS'][$_SESSION["MODULO"]] = $usario->getPermiso($_SESSION["MODULO"]);
    if ($_SESSION["MODULO"] == 'VISITA')
    {
      return;
      //echo ('ES VISITA');
    }
    if (!$_SESSION['PERMISOS'][$_SESSION["MODULO"]]['ver'])
    {
      leerClase('Grupo');
      leerClase('Usuario');
      leerClase('Administrador');
      $usuario = getSessionUser();
      if ($usuario->perteneceGrupo(Grupo::GR_AD))
        return;
      //closeSession();
      header("Location: ".URL."?notienepermiso");
    }
    
  }
}

/**
 * Destroza todos los permimsos almacenados en la session
 */
function destroyPermisos() {
  $_SESSION['PERMISOS'] = array();
  unset($_SESSION['PERMISOS']);
}

/**
 * funcion para leer las clases
 *
 * @param <string> $clase
 * @return <bool>
 */
function leerClase($clase) {
  if (class_exists($clase))
    return true; // clase ya leida
  if (file_exists(DIR_CLASES . "/$clase.php"))
    require_once(DIR_CLASES . "/$clase.php");
  else {
    if (ENDESARROLLO) {
      echo PATH;
      echo "<br />";
      echo DIR_CLASES;
      echo "<br />";
    }
    exit("EL SISTEMA ESTA MAL CONFIGURADO * $clase " . DIR_CLASES);
  }
  return true;
}

/**
 * Implementamos una funcion que auto cargue las Clases
 * por alguna razon no esta funcionando con la Clase Html
 * @param String $clase
 * @author Guyen Campero <guyencu@gmail.com>
 *
 * Esta creando conflictos con los reportes de excel
  function __autoload($clase) {
    try {
      leerClase($clase);
    } catch (Exception $exc) {
      if (ENDESARROLLO){
        echo $exc->getTraceAsString();
      }
      else {
        exit('Revise la configuracion del SISTEMA');
      }
    }
  }
  */

/**
 * Inicia una conexion a la DB
 *
 * @global Conexion_db $CONEXION_DB
 * @return bool
 */
function conectar_db() {
  try {
    global $CONEXION_DB;
    if (!is_object($CONEXION_DB)) {
      leerClase("Conexion_db");
      $CONEXION_DB = New Conexion_db();
    }
    if (!isset($CONEXION_DB->enlace) || !$CONEXION_DB->enlace)
      $CONEXION_DB->conectar();
    return true;
  } catch (Exception $e) {
    $mensaje = $e->getMessage();
    echo $mensaje;
    exit;
  }
}

/**
 * Apache funcion de ayuda para el rewrite_mod
 * 
 * @param <type> $url
 * @return <variables>
 */
function getVariables($url) {
  //quitamos la barra del final
  $url = preg_replace('/\/$/', '', $url);

  //separamos las partes de la url y las contamos
  $partes = explode('/', $url);
  $cantPartes = count($partes);

  $variables = array();
  for ($c = 0; $c < $cantPartes; $c = $c + 2) {
    //Acumulamos los pares de valores(para nosotros variables) en el arreglo
    $nombre = limpiar($partes[$c]);
    $valor = (isset($partes[$c + 1])) ? limpiar($partes[$c + 1]) : 0;
    $variables[$nombre] = $valor;
  }

  return $variables;
}

/**
 * Genera la URL base para un proyecto 
 * @return string URL
 */
function getBaseUrl() {
  $url_aux = '';
  if ('localhost' == $_SERVER['HTTP_HOST']) { //se usa el primer directorio en localhost
    $url_aux = ltrim($_SERVER['REQUEST_URI'], '/');
    $url_aux = explode('/', $url_aux);
    $url_aux = isset($url_aux[0]) ? $url_aux[0] : '';
    $url_aux = ('' == $url_aux ) ? '' : $url_aux . '/';
    //$url_aux   = '';
  }

  $protocol = strtolower(substr($_SERVER["SERVER_PROTOCOL"], 0, 5)) == 'https://' ? 'https://' : 'http://';
  $host = rtrim($_SERVER['HTTP_HOST'], '/');
  return $protocol . $host . '/' . $url_aux;
}

/**
 * Genera el Path base para un proyecto * esta bajo analisis, no es nesesario
 * @return string PATH
 */
function getBasePath() {
  $url_aux = '';
  if ('localhost' == $_SERVER['HTTP_HOST']) { //se usa el primer directorio en localhost
    $url_aux = ltrim($_SERVER['REQUEST_URI'], '/');
    $url_aux = explode('/', $url_aux);
    $url_aux = isset($url_aux[0]) ? $url_aux[0] : '';
    $url_aux = ('' == $url_aux ) ? '' : $url_aux . '/';
  }

  $path = rtrim($_SERVER['DOCUMENT_ROOT'], '/');
  return $path . '/' . $url_aux;
}

// Substring without losing word meaning and
// tiny words (length 3 by default) are included on the result.
// "..." is added if result do not reach original string length

function cortar($str, $length = 25, $end = '&#8230;') {
  if (strlen($str) < $length)
    return $str;
  return substr($str, 0, $length) . $end;
}

//Clean the inside of the tags
function clean_inside_tags($txt, $tags) {

  preg_match_all("/<([^>]+)>/i", $tags, $allTags, PREG_PATTERN_ORDER);

  foreach ($allTags[1] as $tag) {
    $txt = preg_replace("/<" . $tag . "[^>]*>/i", "<" . $tag . ">", $txt);
  }

  return $txt;
}

/**
 * Imprime un icono de la carpeta icon en imagenes
 * @param string $file  nombre del archivo del icono
 * @param string $alt  texto alternativo
 * @param string $width ancho del icono
 * @param string $height alto del icono (por defecto lleva el mismo valor del ancho)
 * @param string $extra estilo o clases o cuaquier cosa
 * @param boolean $echo si se muestra o no
 * @return string
 */
function icono($file, $title, $width = '24px', $height = false, $extra = false, $alt = false, $echo = false) {
  if (!$alt)
    $alt = $title;
  if (!$height)
    $height = $width;
  $URL = URL_IMG . "icons/$file";
  $img = <<<____IMG
      <img src="$URL" width="$width" height="$height" alt="$alt"  title="$title" $extra />
____IMG;
  if ($echo)
    echo $img;
  else
    return $img;
  return;
}

/**
 * getHelp function hat helps to handle the helpdesk
 */
function getHelp($ancla = '') {
  global $help;
  if (!is_object($help) || get_class($help) != 'Helpdesk') {
    $MODULO = 'VISITA';
    if (defined('MODULO') )
      $MODULO = MODULO;
    $help = new Helpdesk('',$MODULO,1);
    $help->getAllObjects();
  }
  $help->getHelp($ancla);
}

/**
 * mostraremos las los toolstips para las ayudas
 * codigo optimizado para no leer cada vez las ayudas
 */
function getHelpTip($codigo) {
  global $help;
  if (!is_object($help) || get_class($help) != 'Helpdesk') {
    $help = new Helpdesk();
    $help->getAllObjects();
  }
  $help->getTooltip(strtolower($codigo));
}

/**
 * Cerrar tags abiertos
 * @param string $html
 * @return string 
 */
function close_dangling_tags($html) {
  #put all opened tags into an array
  preg_match_all("#<([a-z]+)( .*)?(?!/)>#iU", $html, $result);
  $openedtags = $result[1];

  #put all closed tags into an array
  preg_match_all("#</([a-z]+)>#iU", $html, $result);
  $closedtags = $result[1];
  $len_opened = count($openedtags);
  # all tags are closed
  if (count($closedtags) == $len_opened) {
    return $html;
  }

  $openedtags = array_reverse($openedtags);
  # close tags
  for ($i = 0; $i < $len_opened; $i++) {
    if (!in_array($openedtags[$i], $closedtags)) {
      $html .= '</' . $openedtags[$i] . '>';
    } else {
      unset($closedtags[array_search($openedtags[$i], $closedtags)]);
    }
  }
  return $html;
}