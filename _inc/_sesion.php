<?php
  global $SYSTEM_NAME,$SESSION_TIME;
  $SYSTEM_NAME  = 'PROYECTOFINAL';
  $SESSION_TIME = 60*60; //

 /**
  * Inicia la session, el codigo del grupo que puede ser
  * Codigos de los grupos
  *
  * GR_AD = 'SUPER-ADMIN';
  * GR_ES = 'ESTUDIANTES';
  * GR_DO = 'DOCENTES';
  * GR_TU = 'TUTORES';
  * GR_TR = 'TRIBUNALES';
  * GR_CO = 'CONSEJOS';
  * GR_AU = 'AUTORIDADES';
  * 
  * @global string $SYSTEM_NAME el nombre del sistema
  * @global string $SESSION_TIME el tiempo de la session
  * @param string $login el nombre de usuario
  * @param string $passwd la clave de acceso
  * @param string $grupo_codigo el codigo del grupo
  * @return boolean
  */
function initSession($login, $passwd) {
  global $SYSTEM_NAME,$SESSION_TIME;
  leerClase("Usuario");
  $user = new Usuario();
  $user = $user->issetUser($login, $passwd);
  if ($user) {
    $user = new Usuario($user->id);
    $user->getAllObjects();
    saveObject($user, "$SYSTEM_NAME-USER");
    setcookie("$SYSTEM_NAME-USER", $login, time() + $SESSION_TIME, '/');
    return true;
  }
  else
    return false;
}

/**
 * Pregunta si hay session
 */
function isUserSession($grupo_codigo = false) {
  global $SYSTEM_NAME,$SESSION_TIME;
  if(!isset($_SESSION))
    session_start();
  
  if ($grupo_codigo && !getSessionEsTipo($grupo_codigo))
  {
    //closeSession();
    return 0;
  }

  if (!isset($_COOKIE["$SYSTEM_NAME-USER"]) )
  {
    //exit("CERRANDO CESSION desde aca");
    //closeSession();
    return 0;
  }
                 
  // renovamos en tiempo de la session pq hay actividad del usuario
  $login = $_COOKIE["$SYSTEM_NAME-USER"];
  setcookie("$SYSTEM_NAME-USER", $login, time() + $SESSION_TIME, '/');

  return isset($_SESSION["$SYSTEM_NAME-USER"]) ? 1 : 0;
}


/**
 * Lee el objeto incompleto de la session
 * @return Usuario El usuario de la session
 */
function getSessionUser() {
  global $SYSTEM_NAME;
  if (isset($_COOKIE["$SYSTEM_NAME-USER"])) {
    return loadObject("$SYSTEM_NAME-USER");
  }
  else {
    return 0;
  }
}

/**
 * obtenemos si es session de cierto tipo
 * @param String $grupo_codigo
 * @param Usuario|FALSE $usuario_aux
 * @return boolean
 */
function getSessionEsTipo($grupo_codigo,$usuario_aux = false) {
    leerClase("Usuario");
    if (!$usuario_aux)
      $usuario_aux = getSessionUser();
    $usuario   = new Usuario($usuario_aux->id);
    return $usuario->perteneceGrupo($grupo_codigo);
}

/**
 * Guarda el objeto en la session
 */
function saveObject($object, $name) {
  $_SESSION[$name] = serialize($object);
}

/**
 * Lee cualquier objeto
 */
function loadObject($name) {
  if (!isset($_SESSION[$name])) return "EMPTY";
  return unserialize($_SESSION[$name]);
}

/**
 * cierra la session
 * @global type $SESSION_TIME
 */
function closeSession() {
  global $SYSTEM_NAME,$SESSION_TIME;
  if(isset($_SESSION)) {
    setcookie("$SYSTEM_NAME-USER", "" , 1 - ($SESSION_TIME * 2), '/');
    unset($_SESSION["$SYSTEM_NAME-USER"]);
  }
}

 /**
 * obtiene el ip
 */
function getIP() {
  if (getenv("HTTP_X_FORWARDED_FOR"))
    return getenv("HTTP_X_FORWARDED_FOR");
  return getenv("REMOTE_ADDR");
}
/**
 * FUNCIONES ELIMINADAS
 */

/**
 * Verifica si tenemos una session activa del Administrador
 */
function isAdminSession() {
  leerClase('Grupo');
  return isUserSession(Grupo::GR_AD);
}

/**
 * Verifica si tenemos una session activa de Estudiante
 */
function isEstudianteSession() {
  leerClase('Grupo');
  return isUserSession(Grupo::GR_ES);
}

/**
 * Verifica si tenemos una session activa de Consejo
 */
function isConsejoSession() {
  leerClase('Grupo');
  return isUserSession(Grupo::GR_CO);
}

/**
 * Verifica si tenemos una session activa de Docente
 */
function isDocenteSession() {
  leerClase('Grupo');
  return isUserSession(Grupo::GR_DO);
}

/**
 * Verifica si tenemos una session activa de Docente
 */
function isTutorSession() {
  leerClase('Grupo');
  return isUserSession(Grupo::GR_TU);
}

 /**
  * Obtiene el Admin de la session
  * @return Administrator
  */
  function getSessionAdmin() 
  {
    $usuario_aux    = getSessionUser();
    if (isset($usuario_aux->administrador_objs[0]))
      return $usuario_aux->administrador_objs[0];
    return false;
  }

 /**
  * Obtiene el Estudiante de la session
  * @return Estudiante
  */
  function getSessionEstudiante() 
  {
    $usuario_aux    = getSessionUser();
    if (isset($usuario_aux->estudiante_objs[0]))
      return $usuario_aux->estudiante_objs[0];
    return false;
  }

 /**
  * Obtiene el Docente de la session
  * @return Docente
  */
  function getSessionDocente() 
  {
    $usuario_aux    = getSessionUser();
    if (isset($usuario_aux->docente_objs[0]))
      return $usuario_aux->docente_objs[0];
    return false;
  }

 /**
  * Obtiene el Docente de la session
  * @return Docente
  */
  function getSessionTutor() 
  {
    $usuario_aux    = getSessionUser();
    if (isset($usuario_aux->tutor_objs[0]))
      return $usuario_aux->tutor_objs[0];
    return false;
  }

?>