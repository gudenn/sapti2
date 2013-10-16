<?php
/**
 * Esta clase es para guardar los datos tipo Dicta que relaciona
 * a un docente que dicata una materia en un semestra
 *
 * @author Guyen Campero <guyencu@gmail.com>
 */
class Lugar extends Objectbase 
{
 /**
  * Codigo identificador del Objeto Docente
  * @var INT(11)
  */
  var $nombre;
  /**
  * decripcion del 
  * 
  */
  var $descripcion;
  
  
   public function save($table = false, $father_id_value = false, $base = 'compania') {
    // los nombres de ins con mayusculas
    $this->nombre = strtoupper($this->nombre);
    //para evitar duplicados buscamos que no exista ya este nombre
    if (!$this->id)//si es nuevo
    {
      $otrasConMismoNombre = $this->getByNombre();
      if (sizeof($otrasConMismoNombre) > 0)
      {
        //no grabamos
        self::__construct($otrasConMismoNombre[0]->id);
        return true;
      }
    }
    parent::save($table, $father_id_value, $base);
  }
  
  /**
   * Grabamos rapidamente a partir de los datos 
   * que envian en el formulario
   * @param string $nombre
   */
  function saveFast($nombre) {
    $this->nombre      = $nombre;
    $this->descripcion = $nombre;
    $this->estado      = Objectbase::STATUS_AC;
    $this->validar();
    $this->save();
  }
  
  /**
   * Buscamos todas las instituciones con el nombre igual
   * @param type $nombre nombre de la institucion
   * @return boolean|\Institucion
   */
  function getByNombre($nombre = '') {
    if ('' == $nombre)
      $nombre = $this->nombre;

    $activo = Objectbase::STATUS_AC;
    $sql = "select * from " . $this->getTableName() . " where nombre = '$nombre'  AND estado = '$activo'";
    //echo $sql;
    $resultado = mysql_query($sql);
    if (!$resultado)
      return false;
    $intituciones = array();
    while ($fila = mysql_fetch_array($resultado, MYSQL_ASSOC)) {
      $intituciones[] = new Institucion($fila['id']);
    }
    return $intituciones;
  }
  
  
  /**
   * Validamos que todos los datos enviados sean correctos
   */
  function validar() {
    leerClase('Formulario');
    Formulario::validar('nombre'     , $this->nombre     , 'texto', 'El Nombre');
    Formulario::validar('descripcion', $this->descripcion, 'texto', 'La Descripci&oacute;n');
    
  }
  
   /**
   * Inicia el filtro para el admin
   * @param Filtro $filtro el fitro que se usara en el admin
   */
  function iniciarFiltro(&$filtro) {

    if (isset($_GET['order']))
      $filtro->order($_GET['order']);
    $filtro->nombres[] = 'Nombre';
    $filtro->valores[] = array('input', 'nombre', $filtro->filtro('nombre'));
    $filtro->nombres[] = 'Descripci&oacute;n';
    $filtro->valores[] = array('input', 'descripcion', $filtro->filtro('descripcion'));
  }

  /**
   * Devuelve el order para el SQL
   * @param array $order_array arreglo con las claves para el order
   * @return string
   */
  function getOrderString(&$filtro) {
    $order_array = array();
    $order_array['id']          = " {$this->getTableName()}.id ";
    $order_array['nombre']      = " {$this->getTableName()}.nombre ";
    $order_array['descripcion'] = " {$this->getTableName()}.descripcion ";
    $order_array['estado']      = " {$this->getTableName()}.estado ";
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
    if ($filtro->filtro('nombre'))
      $filtro_sql .= " AND {$this->getTableName()}.nombre like '%{$filtro->filtro('nombre')}%' ";
    if ($filtro->filtro('descripcion'))
      $filtro_sql .= " AND {$this->getTableName()}.descripcion like '%{$filtro->filtro('descripcion')}%' ";
    return $filtro_sql;
  }
  
}
?>