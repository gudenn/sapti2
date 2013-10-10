<?php
/**
 * Esta clase es para guardar los Semestres
 *
 * @author Guyen Campero <guyencu@gmail.com>
 */
class Semestre extends Objectbase 
{
  /** constant to the status able  */
  const ACTIVO   = "1";
  const INACTIVO = "0";
  
 /**
  * Codigo del semestre
  * @var INT(45)
  */
  var $codigo;

  
 /**
  * Si el semestre es el actual o no
  * @var INT(11)
  */
  var $activo;

 /**
  * Si la posicion del semestre
  * @var INT(11)
  */
  var $valor;  
  
 /**
  * (Arreglo de objetos) Todas las variables para el semestre
  * @var object|null 
  */
  var $configuracion_semestral_objs;

 /**
  * Object return the object with some id
  *
   * 
   * @param INT(11) $id el id del semestre
   * @param BOOL $getactivo si obtenemos el semestre activo o no
   */
  public function __construct($id = '',$getactivo = false)
  {
    if ($id)
      parent::__construct ($id);
    if ($getactivo)
      $this->getActivo ();
    
  }

  /**
   * Guardamos este semestre
   */
  function save($copiar_configuracion = false ,$table = false , $father_id_value = false , $base = 'compania') {
    //sacamos al activo antes d e activar este por siacaso
    if ($copiar_configuracion)
    {
      $activo = new Semestre();
      $activo->getActivo();
      $activo->getAllObjects();
    }
    if ($this->activo)
      $this->activar();
    parent::save($table, $father_id_value, $base);
    if ( !$copiar_configuracion )
      return;
    leerClase('Configuracion_semestral');
    foreach ($activo->configuracion_semestral_objs as $config) 
    {
      $confi_neo = new Configuracion_semestral;
      $confi_neo->nombre      = $config->nombre;
      $confi_neo->valor       = $config->valor;
      $confi_neo->estado      = $config->estado;
      $confi_neo->semestre_id = $this->id;
      $this->configuracion_semestral_objs[] = $confi_neo;
    }
    $this->saveAllSonObjects();
  }
  
  /**
   * Busca el semestre activo o sea el semestre actual
   * @param string $nombre nombre de la variable a buscar
   * @param bool $grabarsinoexiste 
   * @return Configuracion_semestral 
   */
  function getValor($nombre, $valordefecto = '',$grabarsinoexiste = true)
  {
    leerClase('Configuracion_semestral');
    if (!isset($this->id) || !($this->id) )
      $this->getActivo();
    $config              = new Configuracion_semestral();
    $config->semestre_id = $this->id;
    $config->getValor($nombre);
    if ($grabarsinoexiste && (!$config->id))
    {
      $config->semestre_id = $this->id;
      $config->valor       = $valordefecto;
      $config->estado      = Objectbase::STATUS_AC;
      $config->save();
    }
    return $config->valor;
  }

  /**
   * Busca el semestre activo o sea el semestre actual
   */
  function getActivo() 
  {
    $AC     = Objectbase::STATUS_AC;
    $activo = self::ACTIVO;
    $sql    = "SELECT * FROM {$this->getTableName ()} WHERE activo = '{$activo}' and estado = '{$AC}' ";
    $result = mysql_query($sql);
    if (!$result)
      return false;
    
    $array = mysql_fetch_array($result, MYSQL_ASSOC);
    if ($array)
      parent::__construct($array);
  }

  
/**
 * Saca el numero de orden siguiente
 * @return int 
 * @throws Exception 
 */
  public function getOrderValor($where = " estado = 'AC' ")
  {
    $sql = "select MAX(valor) from ".$this->getTableName()." where $where ";
    //echo $sql;
    $resultado = mysql_query($sql);
    $total     = mysql_fetch_array($resultado);

    return ($total[0]*1) + 1; 
  }

  /**
   Activamos este semestre como el semestre actual
   */
  function activar() {
    $inactivo = self::INACTIVO;
    $sql = " UPDATE  `{$this->getTableName()}` SET  `activo` =  '$inactivo' WHERE  1 ";
    //echo $sql;
    $result = mysql_query($sql);
    if (!$result)
      return false;
    $this->activo = self::ACTIVO;
  }
  
  /**
   * Validamos que todos los datos enviados sean correctos
   */
  function validar() {
    leerClase('Formulario');
    Formulario::validar('codigo', $this->codigo, 'texto', 'El Codigo');
    
  }

  /**
   * Inicia el filtro para el admin
   * @param Filtro $filtro el fitro que se usara en el admin
   */
  function iniciarFiltro(&$filtro) {

    if (isset($_GET['order']))
      $filtro->order($_GET['order']);
    $filtro->nombres[] = 'C&oacute;digo';
    $filtro->valores[] = array('input', 'codigo', $filtro->filtro('codigo'));
  }

  /**
   * Devuelve el order para el SQL
   * @param array $order_array arreglo con las claves para el order
   * @return string
   */
  function getOrderString(&$filtro) {
    $order_array = array();
    $order_array['id']     = " {$this->getTableName()}.id ";
    $order_array['codigo'] = " {$this->getTableName()}.codigo ";
    $order_array['activo'] = " {$this->getTableName()}.activo ";
    $order_array['estado'] = " {$this->getTableName()}.estado ";
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
    if ($filtro->filtro('id'))
      $filtro_sql .= " AND {$this->getTableName()}.id like '%{$filtro->filtro('id')}%' ";
    if ($filtro->filtro('codigo'))
      $filtro_sql .= " AND {$this->getTableName()}.codigo like '%{$filtro->filtro('codigo')}%' ";
    if ($filtro->filtro('activo'))
      $filtro_sql .= " AND {$this->getTableName()}.activo like '%{$filtro->filtro('activo')}%' ";
    return $filtro_sql;
  }

}
?>