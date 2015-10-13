<?php

/**
 * Esta clase es para guardar los datos tipo Estudiante
 *
 * @author Guyen Campero <guyencu@gmail.com>
 */
class Estudiante extends Objectbase {

  /** constant to add in the begin of the key to find the date values   */
  const URL                  = "estudiante/";
  /** constant to add in the begin of the key to find the date values   */
  const ARCHIVO_PATH         = "estudiante/";
  /** constant to add in the begin of the key to find the date values   */
  const TITULOHONORIFICO         = "Est.";
  /**
   * Codigo identificador del Objeto Usuario
   * @var INT(11)
   */
  var $usuario_id;

  /**
   * Codigo sis del estudiante
   * @var VARCHAR(100)
   */
  var $codigo_sis;
     /**
  * Cantidad de cambios_leves que tiene este estudiante
  * @var INT(11)
  */
  var $numero_cambio_leve;
  
    /**
  * Cantidad de cambios_total que tiene este estudiante
  * @var INT(11)
  */
  var $numero_cambio_total;

 /**
  * (Objeto simple) Todas las materias en la que esta inscrito este estudiante
  * @var Inscrito|null 
  */
  var $inscrito_objs;
  
   /**
  * (Objeto simple) Todas las notificaciones que tiene este estudiante
  * @var object|null 
  */
  var $notificacion_estudiante_objs;

  /**
   * Constructor del estudiante
   * @param type $id id de la tabla
   * @param type $codigo_sis codigo sis del estudiante
   * @return Estudiante|false
   */
  public function __construct($id = '', $codigo_sis = false) {
    if ($codigo_sis) {
      $sql = "SELECT * FROM " . $this->getTableName() . " WHERE codigo_sis = '$codigo_sis'";
      //echo $sql;
      $result = mysql_query($sql);
      if (!$result)
        return false;
      $row = mysql_fetch_array($result, MYSQL_ASSOC);
      foreach ($this as $key => $value) {
        /**  if the $key refer to an object continue */
        if ($this->isKeyObject($key))
          continue;
        if (isset($row[strtolower($key)]))
          $this->$key = $row[strtolower($key)];
      }
      /** solo para los leidos desde la base de datos */
      $this->datesSTH();
    }
    else
      parent::__construct($id);
  }
  
  /**
   * Save Or Update the data of the estudiante in the data base
   * but if he dont have a proyect we create a new one
   *
   * @param string $table puede recivir el valor de la tabla
   * @param int $father_id_value el id del padre  por ejemplo al grabar los hijos de una compania aca se dara el id de la compania
   * @param string $base  asociado a $father_id_value traera la clase del padre para guardar el dato
   * @return boolean
   * @throws Exception 
   */
  function save($table = false , $father_id_value = false , $base = 'compania') 
  {
    parent::save($table, $father_id_value, $base);
  }

  /**
   * Creamos un proyecto inicial de tal manera que los estudiantes nunca estnen sin proyectos
   * @param INT(11) $dicta_id
   */
  function crearProyectoInicial($dicta_id,$tipo) 
  {
    leerClase('Proyecto');
    if ($tipo == '')
      $tipo = Proyecto::TIPO_PROYECTO;
    $proyecto_inicial = new Proyecto();
    $proyecto_inicial->crearProyectoInicial($this->id,$dicta_id,$tipo);
  }

  /**
   * Crear un estudiante a partir de su codigo sis o verificar que se puede usar un nuevo estudiante
   * 
   * @param string $codigo_sis el codigo_sis
   * @param type $verSiEstaDisponible para solo verificar si es que se puede usar este email
   * @return boolean
   * @throws Exception 
   */
  public function getByCodigoSis($codigo_sis, $verSifueTomado = false) {
    $sql = "select * from " . $this->getTableName() . " where codigo_sis = '$codigo_sis'";
    $result = mysql_query($sql);
    if ($result === false)
      throw new Exception("?" . $this->getTableName() . "&m=Cant getByEmail <br />$sql<br /> " . $this->getTableName() . ' -> ' . mysql_error());

    if ($verSifueTomado) {
      if (mysql_num_rows($result))
        throw new Exception("?codigo_sis&m=Este C&oacute;digo SIS ya esta en Uso.");
      return;
    }

    $estudiante = mysql_fetch_array($result, MYSQL_BOTH);
    self::__construct($estudiante['id']);
    return true;
  }

  /**
   * get user if exist else return 0
   * @param type $login
   * @param type $clave
   * @return object 
   */
  public function issetEstudiante($login, $clave) {
    if ($login == "" || $clave == "")
      return false;
    $activo = Objectbase::STATUS_AC;
    $sql = "select * , a.id as estudiante_id , u.id as usuario_id  from " . $this->getTableName() . " as a , " . $this->getTableName('usuario') . " as u   where u.login = '$login' and u.clave = '$clave' and a.usuario_id = u.id and u.estado = '$activo' and a.estado = '$activo'  ";
    //echo $sql; 
    $resultado = mysql_query($sql);
    if (!$resultado)
      return false;
    $user = mysql_fetch_object($resultado);
    //grabamos en la tabla pertenece si es que no tiene 
    leerClase('Grupo');
    leerClase('Pertenece');
    $grupo    = new Grupo('', Grupo::GR_ES);
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
   * Obtiene el estado del proyecto actual del estudiante
   */
  function getEstadoProyecto($estudiante_id = false) {
    if ($estudiante_id){
      self::___construct($estudiante_id);
    }
    $proyecto = $this->getProyecto();
    $proyecto->estado_proyecto;
  }

  /**
   * Obtiene el proyecto actual del estudiante
   * @return boolean|Proyecto si no encuentra su proyecto retorna false
   * @todo verificar que el proyecto sea el actual
   */
  function getProyecto() {
    //@TODO revisar
    leerClase('Proyecto');
    $activo = Objectbase::STATUS_AC;
    // $sql = "select p.* from ".$this->getTableName('Proyecto_estudiante')." as pe , ".$this->getTableName('Proyecto')." as p   where pe.estudiante_id = '$this->id' and pe.proyecto_id = p.id and pe.estado = '$activo' and p.estado = '$activo'  ";

    $sql = "select p.* from " . $this->getTableName('Proyecto_estudiante') . " as pe , " . $this->getTableName('Proyecto') . " as p   where pe.estudiante_id = '$this->id' and pe.proyecto_id = p.id and  p.es_actual = '1' and pe.estado = '$activo' and p.estado = '$activo'  ";

    $resultado = mysql_query($sql);
    if (!$resultado)
      return false;
    if (!mysql_num_rows($resultado))
      return new Proyecto();
    $proyecto_array = mysql_fetch_array($resultado);
    $proyecto       = new Proyecto($proyecto_array);
    return $proyecto;
  }
  
  
  
  /**
   * Si un estudiante tiene muchos proyectos pasados o ha hecho muchos cambios 
   * esta variable senialara ($proyecto->es_actual en el proyecto)
   * si es que este proyecto es el proyecto actual del estudiante o no
   * @param type $proyecto_id
   */
  function marcarComoProyectoActual($proyecto_id)
  {
    leerClase('Proyecto');
    $todos_mis_proyectos = "SELECT proyecto_id as id FROM ".$this->getTableName('Proyecto_estudiante')." WHERE `estudiante_id` = '{$this->id}' ";
    $sql = "UPDATE  ".$this->getTableName('Proyecto')." SET  `es_actual` =  '0' WHERE  `id` IN ($todos_mis_proyectos) ";
    $resultado = mysql_query($sql);
    if (!$resultado)
      return false;
    $proyecto = new Proyecto($proyecto_id);
    $proyecto->es_actual = '1';
    $proyecto->save();
  }
  
  /**
   * Devuelve el objeto dicata en el que esta inscrito un estudiante
   * @return Dicta
   */
  function getDicta()
  {
    leerClase('Dicta');
    leerClase('Inscrito');
    $this->getAllObjects();
    // buscamos todas las materias inscritas
    foreach ($this->inscrito_objs as $inscrito) {
      if ($inscrito->estado_inscrito == Inscrito::E_ACTUAL )
        return new Dicta ($inscrito->dicta_id);
    }
    return new Dicta ();
    
  }
  
  /**
   * devuelve el docente de unestudiante
   * 
   */
  
  function  getDocente()
  {
    /**
     * SELECT d.*
FROM   docente d, dicta di, estudiante es, inscrito it
WHERE di.id=it.dicta_id
AND it.estudiante_id=es.id
AND d.id=di.docente_id
and es.id=9
     */
      leerClase('Docente');
    $activo = Objectbase::STATUS_AC;
    // $sql = "select p.* from ".$this->getTableName('Proyecto_estudiante')." as pe , ".$this->getTableName('Proyecto')." as p   where pe.estudiante_id = '$this->id' and pe.proyecto_id = p.id and pe.estado = '$activo' and p.estado = '$activo'  ";

    $sql = "SELECT d.*
FROM   docente d, dicta di, estudiante es, inscrito it
WHERE di.id=it.dicta_id
AND it.estudiante_id=es.id
AND d.id=di.docente_id
and es.id='$this->id'";

    $resultado = mysql_query($sql);
    if (!$resultado)
      return false;
    if (!mysql_num_rows($resultado))
      return new Docente();
    $docente_array = mysql_fetch_array($resultado);
    $docente      = new Docente( $docente_array);
    return $docente;
    
    
    
    

  }

  /**
   * Get usuario de un estudiante
   * @return boolean|\Usuario
   * retorna los datos de un usuario asociado a un estudiante
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
   * Validamos al usuario ya sea para actualizar o para crear uno nuevo
   * @param type $es_nuevo
   */
  function validar($es_nuevo = true) {
    leerClase('Formulario');
    Formulario::validar('codigo_sis', $this->codigo_sis, 'numero', 'El C&oacute;digo SIS');
    if ($es_nuevo) // nuevo
      $this->getByCodigoSis($this->codigo_sis, true);
  }

  /**
   * Inicia el filtro para el admin
   * @param Filtro $filtro el fitro que se usara en el admin
   */
  function iniciarFiltro(&$filtro) {

    if (isset($_GET['order']))
      $filtro->order($_GET['order']);
    $usuario = new Usuario();
    $usuario->iniciarFiltro($filtro);
    $filtro->nombres[] = 'C&oacute;digo Sis';
    $filtro->valores[] = array('input', 'codigo_sis', $filtro->filtro('nombre'));
  }

  /**
   * Devuelve el order para el SQL
   * @param array $order_array arreglo con las claves para el order
   * @return string
   */
  function getOrderString(&$filtro) {
    $order_array = array();
    $order_array['codigo_sis'] = " {$this->getTableName()}.codigo_sis ";

    $order_array['id']               = " {$this->getTableName('Usuario')}.id ";
    $order_array['nombre']           = " {$this->getTableName('Usuario')}.nombre ";
    $order_array['apellido_paterno'] = " {$this->getTableName('Usuario')}.apellido_paterno ";
    $order_array['apellido_materno'] = " {$this->getTableName('Usuario')}.apellido_materno ";
    $order_array['login']            = " {$this->getTableName('Usuario')}.login ";
    $order_array['email']            = " {$this->getTableName('Usuario')}.email ";
    $order_array['estado']           = " {$this->getTableName('Usuario')}.estado ";
    return $filtro->getOrderString($order_array);
  }

  /**
   * Filtramos para la busqueda usando un objeto Filtro
   * @param Filtro $filtro el objeto filtro
   * @return boolean
   */
  public function filtrar(&$filtro) {
    parent::filtrar($filtro);
    $filtro_sql = '';
    if ($filtro->filtro('email'))
      $filtro_sql .= " AND {$this->getTableName('usuario')}.email like '%{$filtro->filtro('email')}%' ";
    if ($filtro->filtro('login'))
      $filtro_sql .= " AND {$this->getTableName('usuario')}.login like '%{$filtro->filtro('login')}%' ";
    if ($filtro->filtro('nombre'))
      $filtro_sql .= " AND {$this->getTableName('usuario')}.nombre like '%{$filtro->filtro('nombre')}%' ";
    if ($filtro->filtro('apellido_paterno'))
      $filtro_sql .= " AND {$this->getTableName('usuario')}.apellido_paterno like '%{$filtro->filtro('apellido_paterno')}%' ";
    if ($filtro->filtro('apellido_materno'))
      $filtro_sql .= " AND {$this->getTableName('usuario')}.apellido_materno like '%{$filtro->filtro('apellido_materno')}%' ";
    return $filtro_sql;
  }

  function grabarCorrecion($file = 'file') {
    if (is_uploaded_file($_FILES[$file]['tmp_name'])) {
      
      $proyecto    = $this->getProyecto();
      if (!$proyecto || !isset($proyecto->id))
        return false;
      
      $archivo_path = Proyecto::ARCHIVO_PATH;
      $proyecto_id  = Proyecto::ARCHIVO_PREFOLDER.$proyecto->id;
      $correciones  = Proyecto::ARCHIVO_CORRECIONES;
      
      //echo PATH . $archivo_path;
      if (!file_exists(PATH . $archivo_path))
        mkdir (PATH . $archivo_path);
      if (!file_exists(PATH . $archivo_path . $proyecto_id))
        mkdir (PATH .  $archivo_path . $proyecto_id);
      if (!file_exists(PATH . $archivo_path . $proyecto_id . $correciones))
        mkdir (PATH . $archivo_path . $proyecto_id . "$correciones/");
      
      
      $nombreDirectorio = PATH . $archivo_path . $proyecto_id . "$correciones/";
      //echo "$nombreDirectorio";
      $nombreFichero = $_FILES[$file]['name'];
      $nombreCompleto = $nombreDirectorio . $nombreFichero;
      if (file_exists($nombreCompleto)) {
        $idUnico = time();
        $nombreFichero = $idUnico . "-" . $nombreFichero;
      }
      move_uploaded_file($_FILES[$file]['tmp_name'], $nombreDirectorio . $nombreFichero);
      return true;
    }
    else
      return false;
  }


  /**
   * Grabamos el avance que realizo el estudiante en proyecto
   * @return boolean|\Avance
   */
  function grabarAvance($avance_escpecifico= true) 
  {
    $proyecto    = $this->getProyecto();
    if (!$proyecto || !isset($proyecto->id))
      return false;
    $avance = new Avance();
    $avance->objBuidFromPost();
    if ( get_magic_quotes_gpc() )
      $avance->descripcion = htmlspecialchars( stripslashes((string)$avance->descripcion) );
    else
      $avance->descripcion = htmlspecialchars( (string)$avance->descripcion);

    $proyecto->getAllObjects();
    //verificamos si hay avance en los objetivos especificos
    $i=0;
    foreach ($proyecto->objetivo_especifico_objs as $especifico) {
      if ( $especifico->id && isset($_POST['objetivo_avance_'.$especifico->id])){
        $avance_especifico = new Avance_objetivo_especifico($avance_escpecifico[$i]->id);
        $avance_especifico->porcentaje_avance = isset($_POST['porcentaje_avance_'.$especifico->id])?$_POST['porcentaje_avance_'.$especifico->id]:0;
        $avance_especifico->objetivo_especifico_id = $especifico->id;
        $avance_especifico->estado_avance          = Avance_objetivo_especifico::E1_CREADO;
        $avance_especifico->estado                 = Objectbase::STATUS_AC;
        $avance->avance_objetivo_especifico_objs[] = $avance_especifico;
        $i++;
      }
    }

    $avance->proyecto_id  = $proyecto->id;
    $avance->fecha_avance = date('d/m/Y');
    $avance->estado       = Objectbase::STATUS_AC;
    if ( isset($_POST['revision_id']) && is_numeric($_POST['revision_id']) )
    {
      $this->grabarRespuestaRevision($_POST['revision_id']);
    }
    $avance->estado_avance = Avance::E1_CREADO;
    $avance->save();
    $avance->saveAllSonObjects(TRUE);

    $this->notificarAvance($proyecto,$avance->id);
    return $avance;
  }

  /**
   * Notificamos a todos los involucrados en el proyecto acerca del avance del proyecto
   * @param Proyecto $proyecto
   */
  function notificarAvance($proyecto,$id_mensaje) 
  {
    leerClase('Notificacion');
    $notificacion              = new Notificacion();
    $notificacion->proyecto_id = $proyecto->id;
    $notificacion->tipo        = Notificacion::TIPO_MENSAJE;
    $notificacion->fecha_envio = date('d/m/Y');
    $notificacion->asunto      = "Avance: {$this->getNombreCompleto()}";
    $notificacion->detalle     = "El estudiante {$this->getNombreCompleto()} realizó un avance en su proyecto {$proyecto->nombre}, en la fecha {$notificacion->fecha_envio} ;SPT;".$id_mensaje;
    $notificacion->prioridad   = 3;
    $notificacion->estado      = Objectbase::STATUS_AC;
    
    $notificacion->notificarTodos();
  }
  
  /**
   * Inscribimos a un estudiante a una materia a travez de dicta! y el semestre
   * @param INT(11) $semestre_id
   * @param INT(11) $dicta_id
   */
  function inscribirEstudianteDicta($semestre_id,$dicta_id) {
      leerClase('Inscrito');
      $inscrito = new Inscrito();
      $inscrito->estado_inscrito = Inscrito::E_ACTUAL;
      $inscrito->inscribirEstudiante($this->id,$semestre_id,$dicta_id);    
  }
    /**
   * Borramos a un estudiante a una materia a travez de dicta! y el semestre
   * @param INT(11) $semestre_id
   * @param INT(11) $dicta_id
   */
  function borrarEstudianteDicta($id_ins) {
      leerClase('Inscrito');
      $inscrito = new Inscrito($id_ins);
      $inscrito->borrarEstudiante();    
  }
  
  function grabarRespuestaRevision($revision_id) 
  {
    leerClase('Revision');
    leerClase('Observacion');
    $revision = new Revision($revision_id);
    $revision->getAllObjects();
    foreach ($revision->observacion_objs as $observacion) 
    {
      if ( isset($_POST['observacion_id_' . $observacion->id]) && trim($_POST['observacion_id_' . $observacion->id]) != '' )
      {
        $observacion->respuesta = $_POST['observacion_id_' . $observacion->id];
        if ( get_magic_quotes_gpc() )
          $observacion->respuesta   = htmlspecialchars( stripslashes((string)$observacion->respuesta) );
        else
          $observacion->respuesta   = htmlspecialchars( (string)$observacion->respuesta);
        $observacion->estado_observacion = Observacion::E2_CORREGIDO;
        $observacion->save();
      }
    }
    $revision->estado_revision  = Revision::E3_RESPONDIDO;
    $revision->fecha_correccion = date('d/m/Y');
    $revision->save();
    return true;
  }

}

