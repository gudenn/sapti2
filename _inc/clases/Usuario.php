<?php

/**
 * Esta clase es para guardar los datos tipo Usuario
 *
 * @author Guyen Campero <guyencu@gmail.com>
 */
class Usuario  extends Objectbase 
{


  /**
  * Nombre del usuario
  * @var VARCHAR(100)
  */
  var $titulo_honorifico;

  /** si es profecional o no  */
  const PROFECIONAL   = "1";
  const NOPROFECIONAL = "0";

  /** Constantes para el sexo del usuario */
  const MASCULINO   = "M";
  const FEMENINO    = "F";

 /**
  * Nombre del usuario
  * @var VARCHAR(100)
  */
  var $nombre;

 /**
  * Apellido paterno del usuario
  * @var VARCHAR(100)
  */
  var $apellido_paterno;
  
 /**
  * Apellido materno del usuario
  * @var VARCHAR(100)
  */
  var $apellido_materno;

 /**
  * telefono del usuario
  * @var VARCHAR(100)
  */
  var $telefono;

 /**
  * Email del usuario
  * @var VARCHAR(100)
  */
  var $email;

 /**
  * fecha_nacimiento
  * @var DATE(100)
  */
  var $fecha_nacimiento;

 /**
  * Login del usuario
  * @var VARCHAR(45)
  */
  var $login;

 /**
  * Clave del usuario 
  * La clave del usuario minimo 5 digitos
  * @var VARCHAR(45)
  */
  var $clave;

 /**
  * CI del usuario
  * @var VARCHAR(45)
  */
  var $ci;

 /**
  * Sexo del usuario Puede ser M de Masculino o F de Femenino y en el futoro se puede manejas otros datos
  * @var VARCHAR(45)
  */
  var $sexo;

 /**
  * Si el usuario puede ser tutor de algun estudiante
  * @var VARCHAR(45)
  */
  var $puede_ser_tutor;
  
 /**
  * (Arreglo de objetos) El Tutor que esta asignado a este usuario
  * @var object|null 
  */
  var $tutor_objs;
  
 /**
  * (Arreglo de objetos) El Docente que esta asignado a este usuario
  * @var object|null 
  */
  var $docente_objs;
  
 /**
  * (Arreglo de objetos) El Tribunal  que esta asignado a este usuario
  * @var object|null 
  */
  var $tribunal_objs;
  
 /**
  * (Arreglo de objetos) El estudiante que esta asignado a este usuario
  * @var object|null 
  */
  var $estudiante_objs;
  
 /**
  * (Arreglo de objetos) El administrador que esta asignado a este usuario
  * @var object|null 
  */
  var $administrador_objs;
  
 /**
  * (Arreglo de objetos) El consejo que esta asignado a este usuario
  * @var object|null 
  */
  var $consejo_objs;

  /**
   * Save Or Update the data of the object in the data base
   * sobreescritura de la funcion save para poner los nombre y los apellidos con mayusculas
   * @param string $table puede recivir el valor de la tabla
   * @param int $father_id_value el id del padre  por ejemplo al grabar los hijos de una compania aca se dara el id de la compania
   * @param string $base  asociado a $father_id_value traera la clase del padre para guardar el dato
   * @return boolean
   * @throws Exception 
   */
  public function save($table = false, $father_id_value = false, $base = 'compania') {
    // ponemos los nombres y los apellidos con mayuscula
    $this->nombre = ucwords(strtolower($this->nombre));
    $this->apellido_paterno = ucwords(strtolower($this->apellido_paterno));
    $this->apellido_materno = ucwords(strtolower($this->apellido_materno));
    /**
     * Activar Md5() en usuarios
     **/
     if (!$this->id){
       $this->clave = md5($this->clave);
     }
     /**/
    
    parent::save($table, $father_id_value, $base);
  }
  
  function getNombreCompleto($echo = false , $id = false) 
  {
    if ($id){
      $this->__construct($id);
    }
    $nombreCompleto = trim(strtoupper("{$this->titulo_honorifico} {$this->nombre} {$this->apellido_paterno} {$this->apellido_materno}"));
    if ($echo)
    {
      echo $nombreCompleto;
      return true;
    }
    return $nombreCompleto;
  }

  /**
   * get user if exist else return 0
   * @param type $login
   * @param type $clave
   * @return object 
   */
  public function issetUser($login, $clave) {
    if ($login == "" || $clave == "")
      return false;
    $activo = Objectbase::STATUS_AC;
    $clave  = md5($clave);
    $sql = "select * , u.id as usuario_id  from " . $this->getTableName('usuario') . " as u   where u.login = '$login' and u.clave = '$clave'  and u.estado = '$activo'  ";
    //echo $sql; 
    $resultado = mysql_query($sql);
    if (!$resultado)
      return false;
    $user = mysql_fetch_object($resultado);
    return $user;
  }

  
  /**
   * Obtiene el permiso de dicho modulo para el administrador
   * @return Permiso
   */
  function getPermiso($codigo_modulo) {
    $grupos = $this->getMisGrupos();
    if (!sizeof($grupos))
      return false;
    //revisamos para todos los grupos si es que alguno tiene permiso
    foreach ($grupos as $grupo) {
      $permiso = $grupo->getPermisoModulo($codigo_modulo); 
      if ($permiso['ver'])
        return $permiso;
    }
    return $permiso;
  }
  
  /**
   * Obtenemos todos los grupos de un usuario
   * @param Grupo $tutor_id
   */
  function getMisGrupos() {

    leerClase('Grupo');
    $activo = Objectbase::STATUS_AC;

    $sql = "select * from " . $this->getTableName('pertenece') . " where usuario_id = '{$this->id}' AND estado = '$activo'";
    //echo $sql;
    $resultado = mysql_query($sql);
    if (!$resultado)
      return false;
    $grupos = array();
    while ($fila = mysql_fetch_array($resultado, MYSQL_ASSOC)) {
      $grupos[] = new Grupo($fila['grupo_id']);
    }
    return $grupos;

  }  

  /**
   * Crear un usario a partir de su login o verificar que se puede usar un login
   * 
   * @param string $login el login
   * @param type $verSiEstaDisponible para solo verificar si es que se puede usar este email
   * @return boolean
   * @throws Exception 
   */
  public function getByLogin ($login, $verSifueTomado = false ) {
    $sql       = "select * from ".$this->getTableName()." where login = '$login'";
    $result = mysql_query($sql);
    if ($result === false)
      throw new Exception("?".$this->getTableName ()."&m=Cant getByEmail <br />$sql<br /> ".$this->getTableName() . ' -> '. mysql_error() );

    if ($verSifueTomado)
    {
      if (mysql_num_rows($result))
        throw new Exception("?login&m=Este login ya fue tomado");
      return;
    }

    $usuario = mysql_fetch_array($result,MYSQL_BOTH);
    self::__construct($usuario['id']);
    return true;
  }

   /**
   * Get tutor  returna el tutor 
   * @return boolean|\Usuario
   * retorna los datos de un usuario asociado a un docente
   */
  function getTutor() 
  {
    leerClase('Tutor');
     $this->getAllObjects();
    //tutor
    foreach ($this->tutor_objs as $tutor)
       return $tutor;
  
  }
  
  
  
  
  /**
   * Obtenemos los nombres y apellidos del usuario de una cadena 
   * @param string $nombreyapellidos cadena con el nombre y los appellidos ejemplo BASTO RODRIGUEZ PEDRO EDUARDO
   * @param string $delimiter un spacio por lo general
   * @return boolean
   */
  function parserNombreApellidos($nombreyapellidos = false,$delimiter = ' ') 
  {
    if (!$nombreyapellidos)
      return false;
    $array = explode($delimiter, $nombreyapellidos);
    switch (count($array)) {
      case 0:
        return false;
        break;
      case 3://BASTO RODRIGUEZ EDUARDO 
        $this->apellido_paterno = $array[0];
        $this->apellido_materno = $array[1];
        $this->nombre    = $array[2];
        break;
      case 4://BASTO RODRIGUEZ PEDRO EDUARDO 
        $this->apellido_paterno = $array[0];
        $this->apellido_materno = $array[1];
        $this->nombre    = $array[2] . ' ' . $array[3];
        break;
      default: //odos los otros casos
        $this->nombre    = $nombreyapellidos;
        break;
    }
    
  }

  /**
   * vemos si un usuario pertenece a un grupo dado
   * @param INT(11) $grupo_id   Codigo identificador del grupo
   * @param INT(11) $usuario_id Codigo identificador del usuario
   * @return \Pertenece
   */
  function perteneceGrupo($codigo_grupo,$usuario_id ='') {
    if (!$usuario_id)
      $usuario_id = $this->id;

    $activo = Objectbase::STATUS_AC;
    $sql    = " SELECT pe.* FROM {$this->getTableName ('Grupo')} as gp , {$this->getTableName ('Pertenece')} as pe WHERE pe.grupo_id = gp.id AND gp.codigo = '{$codigo_grupo}' AND pe.usuario_id = '{$usuario_id}' AND gp.estado = '$activo' AND pe.estado = '$activo'  ";
    //echo $sql;
    $result = mysql_query($sql);
    if (mysql_num_rows($result))
    {
      leerClase('Pertenece');
      $pertenece_aux = mysql_fetch_array($result,MYSQLI_ASSOC);
      $pertenece = new Pertenece($pertenece_aux);
      return $pertenece;
    }
    return false;
  }

  /**
   * Asignamos a un usario a un grupo dado
   * @param INT(11) $grupo_id   Codigo identificador del grupo
   * @param INT(11) $usuario_id Codigo identificador del usuario o el actual
   * @return boolean
   */
  function asignarGrupo($codigo_grupo,$usuario_id ='') {
    if (!$usuario_id)
      $usuario_id = $this->id;

    if (!$this->perteneceGrupo($codigo_grupo,$usuario_id))
    {
      leerClase('grupo');
      leerClase('Pertenece');
      $grupo     = new Grupo('', $codigo_grupo);
      $pertenece = new Pertenece();
      $pertenece->grupo_id   = $grupo->id;
      $pertenece->usuario_id = $usuario_id;
      $pertenece->estado     = Objectbase::STATUS_AC;
      $pertenece->save();
    }
    return true;
  }

  /**
   * Quitar a un usario a un grupo dado
   * @param INT(11) $grupo_id   Codigo identificador del grupo
   * @param INT(11) $usuario_id Codigo identificador del usuario o el actual
   * @return boolean
   */
  function quitarGrupo($codigo_grupo,$usuario_id ='') {
    if (!$usuario_id)
      $usuario_id = $this->id;

    leerClase('Pertenece');
    $pertenece = $this->perteneceGrupo($codigo_grupo,$usuario_id);
    
    if ($pertenece)
      $pertenece->delete();
    return true;
  }

  /**
   * Esta funcion creara un objeto si se asigna un usuario a ceirto grupo 
   * como por ejemplo si se asigna un usuario al grupo de consejo
   * se creara un objeto consejo asociado a este usuario
   * @param Grupo $grupo
   */
  function crearObjetoxParaGrupo($grupo) 
  {
    leerClase('Grupo');
    $this->getAllObjects();
    switch ($grupo->codigo) {
      case Grupo::GR_AD: // creamos un administrador
        leerClase('Administrador');
        if ( !sizeof($this->administrador_objs))
        {
          $administrador = new Administrador();
          $administrador->usuario_id = $this->id;
          $administrador->estado     = Objectbase::STATUS_AC;
          $administrador->save();
        }
        break;
      case Grupo::GR_CO: // creamos un Consejo
        leerClase('Consejo');
        if ( !sizeof($this->consejo_objs))
        {
          $consejo = new Consejo();
          $consejo->usuario_id   = $this->id;
          $consejo->fecha_inicio = date('j/n/Y');
          $consejo->fecha_fin    = date('j/n').'/'.(date('Y')+1);
          $consejo->activo       = 1;
          $consejo->estado       = Objectbase::STATUS_AC;
          $consejo->save();
        }
        break;
      case Grupo::GR_DO: // creamos un Docente
        leerClase('Docente');
        if ( !sizeof($this->docente_objs))
        {
          $docente = new Docente();
          $docente->usuario_id   = $this->id;
          $docente->estado       = Objectbase::STATUS_AC;
          $docente->save();
        }
        break;
      case Grupo::GR_ES: // creamos un Estudiante
        leerClase('Estudiante');
        if ( !sizeof($this->estudiante_objs))
        {
          $estudiante = new Estudiante();
          $estudiante->usuario_id   = $this->id;
          $estudiante->estado       = Objectbase::STATUS_AC;
          $estudiante->save();
        }
        break;
      case Grupo::GR_TU: // creamos un Tutor
        leerClase('Tutor');
        if ( !sizeof($this->tutor_objs))
        {
          $tutor = new Tutor();
          $tutor->usuario_id   = $this->id;
          $tutor->estado       = Objectbase::STATUS_AC;
          $tutor->save();
        }
        break;
      default:
        break;
    }
  }

  
  /**
   * Validamos al usuario ya sea para actualizar o para crear uno nuevo
   * @param type $es_nuevo
   */
  function validar($es_nuevo = true) {
    leerClase('Formulario');
    Formulario::validar('ci'                ,$this->ci                 ,'texto','El CI');
    Formulario::validar('nombre'            ,$this->nombre             ,'texto','El Nombre');
    Formulario::validar('apellido_materno'  ,$this->apellido_materno   ,'texto','Apellido Materno',TRUE);
    Formulario::validar('apellido_paterno'  ,$this->apellido_paterno   ,'texto','Apellido Paterno',TRUE);
    Formulario::validar('login'             ,$this->login              ,'texto','El Login');
    Formulario::validar('telefono'          ,$this->telefono           ,'texto','El Tel&eacute;fono',TRUE);
    if ( $es_nuevo ) // nuevo
    {
      $this->getByLogin($this->login,true);
      Formulario::validarPassword('clave',$this->clave, isset($_POST['clave2'])?$_POST['clave2']:false ,TRUE);
    }
    elseif ( isset($_POST['clave1']) && isset($_POST['clave2']) && isset($_POST['clave3']) && trim($_POST['clave1'])!='' && trim($_POST['clave2'])!='' && trim($_POST['clave3'])!='' )
    {
      Formulario::validarCambioPassword('cambiar',$this->clave,$_POST['clave1'],$_POST['clave2'],$_POST['clave3'],true,'texto','La Clave de acceso',FALSE);
      // activamos el md5 en el sistema
      $this->clave = md5($_POST['clave2']);
    }
    Formulario::validar_fecha('fecha_nacimiento',$this->fecha_nacimiento,TRUE);
  }
  
  

  /**
   * Inicia el filtro para el admin
   * @param Filtro $filtro el fitro que se usara en el admin
   */
  function iniciarFiltro(&$filtro) 
  {
    
    if (isset($_GET['order']))
      $filtro->order($_GET['order']);

    /*
    $filtro->nombres[] = 'Estado';
    $filtro->valores[] = array ('select','estado'  ,$filtro->filtro('estado'),
        array(''      ,'AC'         ,'NC'           ,'IN'          ,'DE'        ),
        array('Todos' ,'Confirmados','No Confirmado','Desctivado'  ,'Eliminado' ));
     */
    $filtro->nombres[] = 'Nombre';
    $filtro->valores[] = array ('input' ,'nombre',$filtro->filtro('nombre'));
    $filtro->nombres[] = 'Ap. Paterno';
    $filtro->valores[] = array ('input' ,'apellido_paterno',$filtro->filtro('apellido_paterno'));
    
    $filtro->nombres[] = 'Ap. Materno';
    $filtro->valores[] = array ('input' ,'apellido_materno',$filtro->filtro('apellido_materno'));
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
    $order_array['nombre']              = " {$this->getTableName ()}.nombre ";
    $order_array['apellido_paterno']    = " {$this->getTableName ()}.apellido_paterno";
    $order_array['apellido_materno']    = " {$this->getTableName ()}.apellido_materno";
    $order_array['login']               = " {$this->getTableName ()}.login ";
    $order_array['email']               = " {$this->getTableName ()}.email ";
    $order_array['estado']              = " {$this->getTableName ()}.estado ";
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
    /*
    if ($filtro->filtro('email'))
      $filtro_sql .= " AND {$this->getTableName('')}.email like '%{$filtro->filtro('email')}%' ";
    if ($filtro->filtro('login'))
      $filtro_sql .= " AND {$this->getTableName('')}.login like '%{$filtro->filtro('login')}%' ";
    if ($filtro->filtro('nombre'))
      $filtro_sql .= " AND {$this->getTableName('')}.nombre like '%{$filtro->filtro('nombre')}%' ";
    if ($filtro->filtro('apellido_paterno'))
      $filtro_sql .= " AND {$this->getTableName('')}.apellido_paterno like '%{$filtro->filtro('apellido_paterno')}%' ";
    if ($filtro->filtro('apellido_materno'))
      $filtro_sql .= " AND {$this->getTableName('')}.apellido_materno like '%{$filtro->filtro('apellido_materno')}%' ";
      */
    return $filtro_sql;
  }

    
}
