<?php

class Tooltip extends Objectbase 
{
  /** Constante para indicar el estado de la ayuda  */
  const EST01_RECIEN  = "RC";
  const EST01_CLONAD  = "CL";
  const EST02_APROBA  = "AP";
 /**
  * Codigo identificador del Objeto Helpdesk
  * @var INT(11)
  */
  var $helpdesk_id;

 /**
  * titulo del Tooltip
  * @var INT(45)
  */
  var $titulo;

 /**
  * Codigo del Tooltip
  * @var INT(45)
  */
  var $codigo;
  
 /**
  * Descripcion del Tooltip
  * @var INT(45)
  */
  var $descripcion;

 /**
  * El estado de este tooltip de ayuda
  * @var VARCHAR(2) 
  */
  var $estado_tooltip;

 /**
  * Si se muestra el tool tip o no
  * @var INT 
  */
  var $mostrar;

   /**
   * Constructor del tooltip
   * @param type $id id de la tabla
   * @param type $codigo codigo del Tooltip
   * @return Tooltip|false
   */
  public function __construct($id = '', $codigo = false) {
    if ($codigo) {
      $aprobado = self::EST02_APROBA;
      $sql      = "SELECT * FROM " . $this->getTableName() . " WHERE codigo = '$codigo' and estado_tooltip = '{$aprobado}' ";
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
  
  function clonarPorCodigo($codigo) {
    $cloname = new Tooltip('', $codigo);
    if ($cloname->id)
    {
      $this->titulo         = $cloname->titulo;
      $this->descripcion    = $cloname->descripcion;
      $this->estado_tooltip = Tooltip::EST01_CLONAD;
      $this->mostrar        = 1;
      $this->estado         = Objectbase::STATUS_AC;
    }
    else
    {
      $this->titulo         = $codigo;
      $this->descripcion    = $codigo;
      $this->estado_tooltip = Tooltip::EST01_RECIEN;
      $this->mostrar        = 1;
      $this->estado         = Objectbase::STATUS_AC;
    }
  }
  
  /**
   * Mostramos el toltip
   */
  function mostrar($echo = true) 
  {
    if (!$this->mostrar)
      return;
    $oncli = " onclick=\"$( \"#ayuda_{$this->id}\" ).dialog(); return false;\" " ;
    $icono = icono('basicset/help.png', $this->codigo, '15px');
    $link = <<<____TEST
      <a href="#" tooltip="ayuda_{$this->id}"  tabindex="-1" class="ayudatip"> {$icono} </a> 
      <div id="ayuda_{$this->id}" title="{$this->titulo}" style="display:none;">
      <span class="ui-icon ui-icon-circle-check" style="float: left; margin: 0 7px 50px 0;"></span>
        <p>{$this->descripcion}.</p>
      </div>
____TEST;
    if ($echo)
      echo $link;
    else
      return $link;
  }
  
  /**
   * Mostramos el icono correspondiente al estado de la ayuda
   * 
   * @param string(2) $estado_tooltip estado actual del helpdesk
   * @return icon
   */
  function getIconEstadoHD($estado_tooltip = '') 
  {
    if ($estado_tooltip != '')
      $this->estado_tooltip = $estado_tooltip;
    switch ($this->estado_tooltip) {
      case Tooltip::EST01_RECIEN:
        return icono('basicset/Circle_Orange.png', 'Recien Creado', '15px');
        break;
      case Tooltip::EST01_CLONAD:
        return icono('basicset/Circle_Blue.png', 'Clonado', '15px');
        break;
      case Tooltip::EST02_APROBA:
        return icono('basicset/Circle_Green.png', 'Aprobado', '15px');
        break;
      default:
        return icono('basicset/Circle_Orange.png', 'Recien Creado', '15px');
        break;
    }
  }
  
  /**
   * Validamos el tooltip para guardar o actualizar o para crear uno nuevo
   * @param type $es_nuevo
   */
  function validar() {
    leerClase('Formulario');
    Formulario::validar('titulo'     , $this->titulo     , 'texto', 'La T&iacute;tulo ');
    Formulario::validar('descripcion', $this->descripcion, 'texto', 'La Descripci&oacute;n');
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
    $filtro->nombres[] = 'T&iacute;tulo';
    $filtro->valores[] = array('input', 'titulo', $filtro->filtro('titulo'));
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
    $order_array['codigo']          = " {$this->getTableName()}.codigo ";
    $order_array['titulo']          = " {$this->getTableName()}.titulo ";
    $order_array['descripcion']     = " {$this->getTableName()}.descripcion ";
    $order_array['mostrar']         = " {$this->getTableName()}.mostrar ";
    $order_array['id']              = " {$this->getTableName()}.id ";
    $order_array['estado']          = " {$this->getTableName()}.estado ";
    $order_array['estado_tooltip']  = " {$this->getTableName()}.estado_tooltip ";
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
    if ($filtro->filtro('codigo'))
      $filtro_sql .= " AND {$this->getTableName()}.codigo like '%{$filtro->filtro('codigo')}%' ";
    if ($filtro->filtro('titulo'))
      $filtro_sql .= " AND {$this->getTableName()}.titulo like '%{$filtro->filtro('titulo')}%' ";
    if ($filtro->filtro('descripcion'))
      $filtro_sql .= " AND {$this->getTableName()}.descripcion like '%{$filtro->filtro('descripcion')}%' ";
    if ($filtro->filtro('mostrar'))
      $filtro_sql .= " AND {$this->getTableName()}.mostrar like '%{$filtro->filtro('mostrar')}%' ";
    if ($filtro->filtro('estado_tooltip'))
      $filtro_sql .= " AND {$this->getTableName()}.estado_tooltip like '%{$filtro->filtro('estado_tooltip')}%' ";
    if ($filtro->filtro('estado'))
      $filtro_sql .= " AND {$this->getTableName()}.estado like '%{$filtro->filtro('estado')}%' ";
    if ($filtro->filtro('id'))
      $filtro_sql .= " AND {$this->getTableName()}.id like '%{$filtro->filtro('id')}%' ";
    return $filtro_sql;
  }
}


?>