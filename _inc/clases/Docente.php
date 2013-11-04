<?php
/**
 * Esta clase es para guardar los datos tipo Docente
 *
 * @author Guyen Campero <guyencu@gmail.com>
 */
class Docente extends Objectbase{
  /** constant to add in the begin of the key to find the date values   */
  const URL                  = "docente/";
  /** constant to add in the begin of the key to find the date values   */
  const ARCHIVO_PATH         = "docente/proyecto-final";
 /**
  * Codigo identificador del Objeto Usuario
  * @var INT(11)
  */
  var $usuario_id;
  
    /**
   * Codigo sis del docente
   * @var VARCHAR(100)
   */
  var $codigo_sis;

 /**
  * (Objeto simple) Todas las materias que dicta este docente
  * @var object|null 
  */
  var $dicta_objs;

 /**
  * (Objeto simple) Todas las areas en que apoya este docente
  * @var Apoyo|null 
  */
  var $apoyo_objs;
   /**
  * Numero de Horas asignadas
  * @var INT(11)
  */
  var $numero_horas;
   /**
  * Configuracion area docente
  * @var BOOLEAN
  */
  var $configuracion_area;
   /**
  * configuracion horario docente
  * @var BOOLEAN
  */
  var $configuracion_horario;
    /**
   * Constructor del Docente
   * @param type $id id de la tabla
   * @param type $codigo_sis codigo sis del estudiante
   * @return docente|false
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
   * Validamos al usuario ya sea para actualizar o para crear uno nuevo
   * @param type $es_nuevo
   */
  function validar($es_nuevo = true) {
    leerClase('Formulario');
    Formulario::validar('codigo_sis', $this->codigo_sis, 'texto', 'El Codigo SIS');
    if ($es_nuevo) // nuevo
      $this->getByCodigoSis($this->codigo_sis, true);
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
        throw new Exception("?codigo_sis&m=Este Codigo SIS ya esta en Uso.");
      return;
    }

    $docente = mysql_fetch_array($result, MYSQL_BOTH);
    self::__construct($docente['id']);
    return true;
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
   * funcion para Iniciar los Horarios de  un docente
   */
  function iniciarHorario() {
    $sql = "DELETE FROM {$this->getTableName('Horario_docente')} WHERE docente_id = '{$this->id}' ";
    mysql_query($sql);
  }
    /**
   * get user if exist else return 0
   * @param type $login
   * @param type $clave
   * @return object 
   */
  public function issetDocente($login, $clave) {
    if ($login == "" || $clave == "")
      return false;
    $activo = Objectbase::STATUS_AC;
    $sql = "select * , a.id as docente_id , u.id as usuario_id   from " . $this->getTableName() . " as a , " . $this->getTableName('usuario') . " as u   where u.login = '$login' and u.clave = '$clave' and a.usuario_id = u.id and u.estado = '$activo' and a.estado = '$activo'  ";
    //echo $sql; 
    $resultado = mysql_query($sql);
    if (!$resultado)
      return false;
    $user = mysql_fetch_object($resultado);
    //grabamos en la tabla pertenece si es que no tiene 
    leerClase('Grupo');
    leerClase('Pertenece');
    $grupo    = new Grupo('', Grupo::GR_DO);
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
  
  
  
  function iniciarFiltro(&$filtro) {

    if (isset($_GET['order']))
      $filtro->order($_GET['order']);
    $usuario = new Usuario();
    $usuario->iniciarFiltro($filtro);
    $filtro->nombres[] = 'C&oacute;digo Sis';
    $filtro->valores[] = array('input', 'codigo_sis', $filtro->filtro('nombre'));
  }
  
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
   * Get usuario de un docente
   * @TODO hay que arreglar esta funcion
   * @return boolean|\Usuario
   * retorna los datos de un usuario asociado a un docente
   */
  function getDicta() {

    //@TODO revisar
    //  leerClase('Proyecto_area');
    leerClase('Dicta');
    $dictas= array();
    $activo = Objectbase::STATUS_AC;
    $sql = "select d.* from " . $this->getTableName('Dicta') . " as d ,where d.docente_id = '$this->id'  and d.estado = '$activo'  ";
    $resultado = mysql_query($sql);
    if (!$resultado)
      return false;
    while ($fila = mysql_fetch_array($resultado, MYSQL_ASSOC)) 
         { 
        $dictas[] =new Dicta($fila);
          }
       return $dictas;
  
  }
  /**
   * 
   * @param type $var
   * @return boolean
   * retorna el peso dado un dia
   */
  function  getDiaPeso($var)
  {
     //@TODO revisar
    //leerClase('Horario_doc');
    leerClase('Dia');
    leerClase('Turno');
    $activo = Objectbase::STATUS_AC;
    /**
     * select  DISTINCT (d.id), t.peso  as pesos
from  horario_doc hd ,dia d, turno  t
where  hd.dia_id=d.id and hd.turno_id=t.id  and hd.docente_id=1 and d.id=1;
     */
    // $sql = "select p.* from ".$this->getTableName('Proyecto_estudiante')." as pe , ".$this->getTableName('Proyecto')." as p   where pe.estudiante_id = '$this->id' and pe.proyecto_id = p.id and pe.estado = '$activo' and p.estado = '$activo'  ";

    $contador=0;
    $sql = "select DISTINCT (d.id), t.peso  as pesos from ".$this->getTableName('Horario_doc')." as hd , " . $this->getTableName('Dia') . " as d,".$this->getTableName('Turno')."as t   where hd.dia_id=d.id  and hd.turno_id=t.id and hd.docente_id='$this->id' and and d.id='$var' and hd.estado = '$activo' and d.estado = '$activo' and t.estado = '$activo'  ";
    $resultado = mysql_query($sql);
    if (!$resultado)
      return false;
    while ($fila = mysql_fetch_array($resultado, MYSQL_ASSOC)) 
         { 
        $contador =$contador+$fila['pesos'];
          }
       return $contador;
   
  }
  
  /**
   * 
   * @
   */
  
    function  getDias()
  {
     //@TODO revisar
    leerClase('Horario_doc');
    leerClase('Dia');
    leerClase('Turno');
    $activo = Objectbase::STATUS_AC;
    /**
     *select  DISTINCT (d.`id`) as iddia
                               from  horario_doc hd, dia  d , turno t
                               where  hd.`dia_id`=d.`id` and hd.`turno_id`=t.`id` and hd.`docente_id`=1;                                                                                                                                                       hd.`dia_id`=d.`id` and hd.`turno_id`=t.`id` and hd.`docente_id`=1;
     */
    $dias=array();
    $sql = "DISTINCT (d.id) as iddia from  horario_doc hd, dia  d , turno t where hd.dia_id=d.id and hd.turno_id=t.id and hd.docente_id=1";
    $resultado = mysql_query($sql);
    var_dump($resultado);
     if (!$resultado)
      return false;
    while ($fila = mysql_fetch_array($resultado, MYSQL_ASSOC)) 
         { 
        $dias[]=new Area($fila['iddia']);
          }
       return $dias;  
  }
    function getDictaverifica($iddicta) {
    $res=FALSE;
    leerClase('Dicta');
    $activo = Objectbase::STATUS_AC;
    $sql = "select d.* from " . $this->getTableName('Dicta') . " as d where d.docente_id = '$this->id'  and d.estado = '$activo'  and d.id='$iddicta'"; 
    $resultado = mysql_query($sql);
    if (mysql_num_rows($resultado)>0)
      $res=TRUE;

      return $res;
  }
  
  
  
}
?>