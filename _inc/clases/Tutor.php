<?php

class Tutor extends Objectbase
{
  
  const URL                  = "docente/tutor/";
  /** Numero maximo de tutores activos asignados a un estudiante */
  const MAXIMO   = "2";

  
  /**
   * Codigo identificador del Objeto Usuario
   * @var INT(11)
   */
  var $usuario_id;


 /**
  * (Objeto simple) Todos los proyecto_tutor que tiene este tutor
  * @var object|null 
  */
  var $proyecto_tutor_objs;
  
 /**
  * Get usuario de un docente
  * @return boolean|\Usuario
  * retorna los datos de un usuario asociado a un docente
  */
  function getUsuario() {
    if (!isset($this->usuario_id) || !$this->usuario_id)
      return false;
    $usuario = new Usuario($this->usuario_id);
    return $usuario;
  }

  /**
   * Retorna el nombre completo del usuario
   * @param boolean $echo si muestra o solo devuelve
   * @return boolean
   */
  function getNombreCompleto($echo = false) 
  {
    leerClase('Usuario');
    if (!$this->usuario_id)
      return false;
    $usuario = new Usuario($this->usuario_id);
    return $usuario->getNombreCompleto($echo);
  }

  /**
   * Finalizamos la tutoria de un totur a un estudiante
   * @param INT(11) $estudiante_id codigo del estudiante
   */
  function finalizarTutoria($estudiante_id) 
  {
    leerClase('Proyecto');
    leerClase('Estudiante');
    leerClase('Proyecto_tutor');
    $estudiante = new Estudiante($estudiante_id);
    $proyecto   = $estudiante->getProyecto();
    $asignado   = $this->esTutorEnProyecto($proyecto);

    if ( !$asignado )// No se puede asignar porque ya  esta asignado
      return;
    
    $asignado->estado_tutoria = Proyecto_tutor::FINALIZADO;
    $asignado->fecha_final    = date('d/m/Y');
    $asignado->save();
    $this->notificarFinalizacionTutor($estudiante, $proyecto);

  }

  /**
   * Asignamos Tutor a un estudiante
   * @param INT(11) $estudiante_id codigo del estudiante
   */
  function asignarTutoria($estudiante_id) 
  {
    leerClase('Proyecto');
    leerClase('Estudiante');
    leerClase('Proyecto_tutor');
    $estudiante = new Estudiante($estudiante_id);
    $proyecto   = $estudiante->getProyecto();
    if ( $this->esTutorEnProyecto($proyecto) )// No se puede asignar porque ya  esta asignado
      return;
    
    $asignado   = new Proyecto_tutor();
    $asignado->proyecto_id      = $proyecto->id;
    $asignado->tutor_id         = $this->id;
    $asignado->estado_tutoria   = Proyecto_tutor::PENDIENTE;
    $asignado->estado           = Objectbase::STATUS_AC;
    $asignado->fecha_asignacion = date('d/m/Y');
    $asignado->save();
    $this->notificarAsignacionTutor($estudiante, $proyecto,$asignado);
    
  }

  /**
   * Buscamos si es tutor en el Proyecto
   * @param Proyecto $proyecto
   * @return Proyecto_tutor
   */
  function esTutorEnProyecto($proyecto) 
  {
    $this->getAllObjects();
    foreach ($this->proyecto_tutor_objs as $proyecto_tutor) 
    {
      if ($proyecto_tutor->proyecto_id == $proyecto->id)
      {
        if ($proyecto_tutor->estado_tutoria == Proyecto_tutor::PENDIENTE //Es pero esta pendiente
            || $proyecto_tutor->estado_tutoria == Proyecto_tutor::ACEPTADO )//Es y esta activo 
          return $proyecto_tutor;
      }
    }
    return false;
  }
  
  
  /**
   * Notificamos al estudiante y al tutor
   * que se ha hecho una solicitud de asignacion de tutor
   * @param Estudiante $estudiante
   * @param Proyecto $proyecto
   * @param Proyecto_tutor $asignado
   */
  function notificarAsignacionTutor($estudiante,$proyecto,$asignado) 
  {
    leerClase('Notificacion');
    leerClase('Notificacion_tutor');
    $notificacion              = new Notificacion();
    $notificacion->proyecto_id = $proyecto->id;
    $notificacion->tipo        = Notificacion::TIPO_ASIGNACION;
    $notificacion->fecha_envio = date('d/m/Y');
    $notificacion->asunto      = 'Petici&oacute;n de Tutor';
    $notificacion->detalle     = "El estudiante {$estudiante->getNombreCompleto()} solicita que {$this->getNombreCompleto()} sea su tutor para el proyecto {$proyecto->nombre} ";
    $notificacion->prioridad   = 5;
    $notificacion->estado      = Objectbase::STATUS_AC;
    
    $tutores[]     = $this->id;
    //$estudiantes[] = $estudiante->id;
    $usuarios      = array('tutores'=>$tutores/*,'estudiantes'=>$estudiantes*/);
    $notificacion->enviarNotificaion($usuarios,$asignado);
    
  }
  
  /**
   * Notificamos al estudiante y al tutor
   * que se ha finalizado la tutoria de un docente
   * @param Estudiante $estudiante
   * @param Proyecto $proyecto
   */
  function notificarFinalizacionTutor($estudiante,$proyecto) 
  {
    leerClase('Notificacion');
    leerClase('Notificacion_tutor');
    $notificacion              = new Notificacion();
    $notificacion->proyecto_id = $proyecto->id;
    $notificacion->tipo        = Notificacion::TIPO_MENSAJE;
    $notificacion->fecha_envio = date('d/m/Y');
    $notificacion->asunto      = 'Finalizacion de Tutoria';
    $notificacion->detalle     = "El estudiante {$estudiante->getNombreCompleto()} agradece a {$this->getNombreCompleto()} toda su colaboraci&ocaute;n en el proyecto {$proyecto->nombre} y da por concluida su tutoria";
    $notificacion->prioridad   = 3;
    $notificacion->estado      = Objectbase::STATUS_AC;
    
    $tutores[]     = $this->id;
    $estudiantes[] = $estudiante->id;
    $usuarios      = array('tutores'=>$tutores,'estudiantes'=>$estudiantes);
    $notificacion->enviarNotificaion($usuarios);
    
  }
  
  /**
   * buscamos el tutor por el login y la clave
   * @param type $login
   * @param type $clave
   * @return object
   */
  public function issetTutor($login, $clave) {
    if ($login == "" || $clave == "") {
        return false;
    }
    $activo = Objectbase::STATUS_AC;
    $sql = "select * , a.id as tutor_id , u.id as usuario_id  from ".$this->getTableName()." as a , ".$this->getTableName('usuario')." as u   where u.login = '$login' and u.clave = '$clave' and a.usuario_id = u.id and u.estado = '$activo' and a.estado = '$activo'  ";
    //echo $sql;
    $resultado = mysql_query($sql);
    if (!$resultado) {
        return false;
    }
    $user = mysql_fetch_object($resultado);
    //grabamos en la tabla pertenece si es que no tiene 
    leerClase('Grupo');
    leerClase('Pertenece');
    $grupo    = new Grupo('', Grupo::GR_TU);
    if ($grupo->id && isset($user->usuario_id) && $user->usuario_id )
    {
      $pertenece = new Pertenece('',$grupo->id,$user->usuario_id );
      if (!$pertenece->id)
      {
        $pertenece->usuario_id = $user->usuario_id;
        $pertenece->grupo_id   = $grupo->id;
        $pertenece->estado     = Objectbase::STATUS_AC;
        $pertenece->save();
      }
    }
    return $user;
  }

  
  /**
   * Validamos al usuario ya sea para actualizar o para crear uno nuevo
   * @param type $es_nuevo
   */
  function validar($es_nuevo = true) {
    leerClase('Formulario');
    Formulario::validar('ci'                ,$this->ci          ,'texto','El CI');
    Formulario::validar('nombre'            ,$this->nombre      ,'texto','El Nombre');
    Formulario::validar('apellidos'         ,$this->apellidos   ,'texto','Los Apellidos',TRUE);
    Formulario::validar('login'             ,$this->login      ,'texto','El Login');
    if ( $es_nuevo ) // nuevo
    {
      $this->getByLogin($this->login,true);
      Formulario::validarPassword('clave',$this->clave, isset($_POST['clave2'])?$_POST['clave2']:false ,TRUE);
    }
    else
    {
      $pas1 = isset($_POST['password1'])?$_POST['password1']:false;
      $pas2 = isset($_POST['password2'])?$_POST['password2']:false;
      $pas3 = isset($_POST['password3'])?$_POST['password3']:false;
      Formulario::validarCambioPassword('password',$this->clave,$pas1,$pas2,$pas3,true,'texto','La Clave de acceso',FALSE);
      $this->password = $pas2;
    }
    Formulario::validar_fecha('fecha_cumple',$this->fecha_cumple,TRUE);
  }
  
  

  /**
   * Inicia el filtro para el admin
   * @param Filtro $filtro el fitro que se usara en el admin
   */
  function iniciarFiltro(&$filtro) 
  {
    
    if (isset($_GET['order']))
      $filtro->order($_GET['order']);

    $filtro->nombres[] = 'Estado';
    $filtro->valores[] = array ('select','estado'  ,$filtro->filtro('estado'),
        array(''      ,'AC'         ,'NC'           ,'IN'          ,'DE'        ),
        array('Todos' ,'Confirmados','No Confirmado','Desctivado'  ,'Eliminado' ));
    $filtro->nombres[] = 'Nombre';
    $filtro->valores[] = array ('input' ,'nombre',$filtro->filtro('nombre'));
    $filtro->nombres[] = 'Apellidos';
    $filtro->valores[] = array ('input' ,'apellidos',$filtro->filtro('apellidos'));
    $filtro->nombres[] = 'Login';
    $filtro->valores[] = array ('input' ,'login',$filtro->filtro('login'));
    $filtro->nombres[] = 'Email';
    $filtro->valores[] = array ('input' ,'email',$filtro->filtro('email'));
  }

  /**
   * Devuelve el order para el SQL
   * @param array $order_array arreglo con las claves para el order
   * @return string
   */
  function getOrderString(&$filtro) 
  {
    $order_array                        = array();
    $order_array['id']                  = " {$this->getTableName ()}.id ";
    $order_array['nombre']              = " {$this->getTableName ('Usuario')}.nombre ";
    $order_array['apellidos']           = " {$this->getTableName ('Usuario')}.apellidos ";
    $order_array['login']               = " {$this->getTableName ('Usuario')}.login ";
    $order_array['email']               = " {$this->getTableName ('Usuario')}.email ";
    $order_array['estado']              = " {$this->getTableName ('Usuario')}.estado ";
    return $filtro->getOrderString($order_array);
  }

  /**
   * Filtramos para la busqueda usando un objeto Filtro
   * @param Filtro $filtro el objeto filtro
   * @return boolean
   */
  public function filtrar(&$filtro)
  {
    parent::filtrar($filtro);
    $filtro_sql = '';
    return $filtro_sql;
  }

}
