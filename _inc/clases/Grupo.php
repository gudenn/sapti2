<?php
/**
* @author          Guyen Campero<guyencu@gmail.com>
* @version         0.13.07.17
*/
class Grupo extends Objectbase
{
  /** Constante para indicar cual es el grupo del superadministrador del sistema  */
  const SUPERADMINGRUOP  = "1";
  
  /**
   * Codigos de los grupos
   */
  const GR_AD = 'SUPER-ADMIN';
  const GR_ES = 'ESTUDIANTES';
  const GR_DO = 'DOCENTES';
  const GR_TU = 'TUTORES';
  const GR_TR = 'TRIBUNALES';
  const GR_CO = 'CONSEJOS';
  const GR_AU = 'AUTORIDADES';
  
 /**
  * Nombre del grupo
  * @var VARCHAR(40) 
  */
  var $codigo;

 /**
  * nombre de la Ciudad
  * @var VARCHAR(150) 
  */
  var $descripcion;

 /**
  * (Objeto simple) Todos los permisos que tiene
  * @var object|null 
  */
  var $permiso_objs;

  public function __construct($id = '',$codigo = '') {
    if ($codigo != '')
    {
      $activo = Objectbase::STATUS_AC;

      $sql = "select * from " . $this->getTableName() . " where codigo = '$codigo' AND estado = '$activo'";
      //echo $sql;
      $resultado = mysql_query($sql);
      if (!$resultado)
        return;
      $fila = mysql_fetch_array($resultado, MYSQL_ASSOC);
        $id = $fila['id'];
    }
    parent::__construct($id);
  }
  
  /**
   * Obtenemos todos los grupos
   * @param type $tutor_id
   */
  function getGrupos() {

    $activo = Objectbase::STATUS_AC;

    $sql = "select * from " . $this->getTableName() . " where estado = '$activo'";
    //echo $sql;
    $resultado = mysql_query($sql);
    if (!$resultado)
      return false;
    $grupos = array();
    while ($fila = mysql_fetch_array($resultado, MYSQL_ASSOC)) {
      $grupos[] = new Grupo($fila['id']);
    }
    return $grupos;

  }

  /**
   * Mostramos el icono correspondiente al grupo
   * 
   * @param string(2) $id
   * @return icon
   */
  function getIcon($width = '25px') 
  {
    $file = "grupos/grupo_{$this->id}.png";
    if (file_exists(PATH_IMG."icons/$file"))
      return icono("grupos/grupo_{$this->id}.png", $this->descripcion, $width);;
    return icono("grupos/grupo_0.png", $this->descripcion, $width);;
  }
  
  
  /**
   * obtiene los permisos por modulo para los temas de ayuda
   * si tienes permiso de ver el modulo tienes permiso de ver 
   * el tema de ayuda, SIMPLE!!
   * @param type $codigo_modulo codigo del modulo
   * @return Permiso
   */
  function tieneAccesoHelpdesk($helpdesk_modulo_id)
  {
    leerClase('Permiso');
    $permiso = new Permiso('',false,$this->id,$helpdesk_modulo_id);
    return $permiso;     // solo usaremos los permisos de visita!!
  }
  
  /**
   * obtiene los permisos por modulo
   * @param type $codigo_modulo codigo del modulo
   * @return Permiso
   */
  function getPermisoModulo($codigo_modulo)
  {
    leerClase('Modulo');
    leerClase('Permiso');
    $modulo  = new Modulo('',$codigo_modulo);
    $permiso = new Permiso('',$modulo->id,$this->id);
    if ($permiso->id)
    {
      $resp['ver']      = $permiso->ver;
      $resp['crear']    = $permiso->crear;
      $resp['editar']   = $permiso->editar;
      $resp['eliminar'] = $permiso->eliminar;
    }
    else // no hay permisos
    {
      $resp['ver']      = 0;
      $resp['crear']    = 0;
      $resp['editar']   = 0;
      $resp['eliminar'] = 0;
    }
    return $resp;    
  }
  
  /**
   * Creamos todos los permisos para todos los Temas de ayuda HELPdesk
   */
  function verificaTodosAccesosHelpdesk()
  {
    leerClase('Helpdesk');
    leerClase('Permiso');
    $helpdesk    = new Helpdesk(false,false);
    $helpmodulos = $helpdesk->getAll();
    $ayudas      = array();
    while (isset($helpmodulos[0]) && $helpmodulos[0] && $row = mysql_fetch_array($helpmodulos[0]))
      $ayudas[] = new Helpdesk($row);

    $grupos       = new Grupo();
    $mysql_grupos = $grupos->getAll();
    
    while (isset($mysql_grupos[0]) && $mysql_grupos[0] && $row = mysql_fetch_array($mysql_grupos[0]))
    {
      $grupo_x = new Grupo($row);
      foreach ($ayudas as $helpdesk)
      {
        $permiso = new Permiso('','',$grupo_x->id,$helpdesk->id);
        if (!isset($permiso->id) || !$permiso->id)
          $helpdesk->iniciarPermisos($grupo_x->id);
      }      
    }
  }

  /**
   * Creamos todos los permisos para todos los modulos que no tengan permisos
   */
  function verificaTodosPermisos  ()
  {
    leerClase('Modulo');
    leerClase('Permiso');
    $modulos       = new Modulo();
    $mysql_modulos = $modulos->getAll();
    $modulos_x     = array();
    while (isset($mysql_modulos[0]) && $mysql_modulos[0] && $row = mysql_fetch_array($mysql_modulos[0]))
      $modulos_x[] = new Modulo($row);

    $grupos       = new Grupo();
    $mysql_grupos =  $grupos->getAll();
    
    while (isset($mysql_grupos[0]) && $mysql_grupos[0] && $row = mysql_fetch_array($mysql_grupos[0]))
    {
      $grupo_x = new Grupo($row);
      foreach ($modulos_x as $modulo_x)
      {
        $permiso = new Permiso('',$modulo_x->id,$grupo_x->id);
        if (!isset($permiso->id) || !$permiso->id)
          $modulo_x->iniciarPermisos($grupo_x->id);
      }      
    }
  }

  /**
   * Validamos que todos los datos enviados sean correctos
   */
  function validar() {
    leerClase('Formulario');
    Formulario::validar('codigo',      $this->codigo, 'texto', 'El C&oacute;digo');
    Formulario::validar('descripcion', $this->descripcion, 'texto', 'La Descripci&oacute;n');
    
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
        array(''      ,'AC'         ,'NC'           ,'DE'        ),
        array('Todos' ,'Activo'     ,'No Activo'    ,'Eliminado' ));
    $filtro->nombres[] = 'C&oacute;digo';
    $filtro->valores[] = array ('input' ,'codigo',$filtro->filtro('codigo'));
    $filtro->nombres[] = 'Descripci&oacute;n';
    $filtro->valores[] = array ('input' ,'descripcion',$filtro->filtro('descripcion'));
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
    $order_array['nombre']              = " {$this->getTableName ()}.codigo ";
    $order_array['apellidos']           = " {$this->getTableName ()}.descripcion ";
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
    return $filtro_sql;
  }
} 
