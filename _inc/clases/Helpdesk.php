<?php
/**
 * Description of Helpdesk
 */
class Helpdesk extends Objectbase
{
  const FOLDER  = "ayuda";
  /** Constante para indicar el estado de la ayuda  */
  const EST01_RECIEN  = "RC";
  const EST02_EDITAD  = "ED";
  const EST03_APROBA  = "AP";
  
 /**
  * codigo
  * @var VARCHAR(100) 
  */
  var $codigo;

 /**
  * descripcion
  * @var VARCHAR(500) 
  */
  var $descripcion;

 /**
  * descripcion
  * @var VARCHAR(500) 
  */
  var $keywords;

 /**
  * descripcion
  * @var VARCHAR(2) 
  */
  var $estado_helpdesk;

  /**
   * Creamos la ayuda
   * @param type $id
   */
  public function __construct($id = '') 
  {
    if ('' == $id)
    {
      $dir    = basename( dirname($_SERVER['SCRIPT_NAME']));
      $script = basename( $_SERVER['SCRIPT_NAME']);
      $this->codigo = sha1($dir.$script);
      $this->getByCodigo($this->codigo);
      if (!$this->id)
      {
        $this->descripcion     = "$dir - $script";
        $this->keywords        = "$dir,".  str_replace('.', ',', str_replace('.php', ',ayuda', $script));
        $this->estado_helpdesk = Helpdesk::EST01_RECIEN;
        $this->estado          = Objectbase::STATUS_AC;
        $this->save ();
      }
    }
    else
      parent::__construct($id);
  }

  /**
   * Guardamos la ayuda como base tendremos el codigo
   *
   * @param string $table puede recivir el valor de la tabla
   * @param int $father_id_value el id del padre  por ejemplo al grabar los hijos de una compania aca se dara el id de la compania
   * @param string $base  asociado a $father_id_value traera la clase del padre para guardar el dato
   * @return boolean
   * @throws Exception 
   */
  public function save($table = false, $father_id_value = false, $base = 'compania') {
    parent::save($table, $father_id_value, $base);
  }
  
  /**
   * Mostramos la ayuda disponible en el sistema
   */
  function getHelp($ancla = '')
  {
    if ( trim($ancla) != '')
      $ancla  = "#$ancla";
    $URL  = URL;
    $icono = icono('basicset/helpdesk_48.png','Ayuda','24px',false,false,false,false);
    $link = <<<____TEST
      <li class="last"><a class="ayudapopup" href="{$URL}ayuda/?codigo={$this->codigo}{$ancla}" target="_blank" >Ayuda {$icono}</a></li>
      <script type="text/javascript">
        $(function() {
            $('a.ayudapopup').click(function(){
              //screen.height;
              var x = screen.width - 510;
              window.open($(this).attr('href'), '_blank', 'location=no,width=500,height=600,left='+x+'top=0');
              //console.log(  );
              return false;
            });
        });
      </script>
____TEST;
    echo $link;
  }
  
  /**
   * Mostramos el icono correspondiente al estado de la ayuda
   * 
   * @param string(2) $estado_helpdesk estado actual del helpdesk
   * @return icon
   */
  function getIconEstadoHD($estado_helpdesk = '') 
  {
    if ($estado_helpdesk != '')
      $this->estado_helpdesk = $estado_helpdesk;
    switch ($this->estado_helpdesk) {
      case Helpdesk::EST01_RECIEN:
        return icono('basicset/Circle_Orange.png', 'Recien Creado', '15px');
        break;
      case Helpdesk::EST02_EDITAD:
        return icono('basicset/Circle_Blue.png', 'Editado', '15px');
        break;
      case Helpdesk::EST03_APROBA:
        return icono('basicset/Circle_Green.png', 'Aprobado', '15px');
        break;
      default:
        return icono('basicset/Circle_Orange.png', 'Recien Creado', '15px');
        break;
    }
  }

  /**
   * Creamos un helpdesk a partir del codigo
   * 
   * @param string $codigo el codigo SAH1 
   * @return Helpdesk
   * @throws Exception 
   */
  public function getByCodigo($codigo) {
    $sql = "select * from " . $this->getTableName() . " where codigo = '$codigo'";
    $result = mysql_query($sql);
    if ($result === false)
      throw new Exception("?" . $this->getTableName() . "&m=Cant getByEmail <br />$sql<br /> " . $this->getTableName() . ' -> ' . mysql_error());

    $help = mysql_fetch_array($result, MYSQL_BOTH);
    if ($help)
    self::__construct($help['id']);
  }
  
  /**
   * Validamos al usuario ya sea para actualizar o para crear uno nuevo
   * @param type $es_nuevo
   */
  function validar($es_nuevo = true) {
    leerClase('Formulario');
    Formulario::validar('descripcion', $this->descripcion, 'texto', 'La descripci&oacute;n');
    Formulario::validar('keywords', $this->keywords, 'texto', 'Las Palabras clave');
  }

  /**
   * Inicia el filtro para el admin
   * @param Filtro $filtro el fitro que se usara en el admin
   */
  function iniciarFiltro(&$filtro) {

    if (isset($_GET['order']))
      $filtro->order($_GET['order']);
    $filtro->nombres[] = 'Codigo';
    $filtro->valores[] = array('input', 'codigo', $filtro->filtro('codigo'));
    $filtro->nombres[] = 'Descripci&oacute;n';
    $filtro->valores[] = array('input', 'descripcion', $filtro->filtro('descripcion'));
    $filtro->nombres[] = 'Palabras Clave';
    $filtro->valores[] = array('input', 'keywords', $filtro->filtro('keywords'));
  }

  /**
   * Devuelve el order para el SQL
   * @param array $order_array arreglo con las claves para el order
   * @return string
   */
  function getOrderString(&$filtro) {
    $order_array = array();
    $order_array['codigo']          = " {$this->getTableName()}.codigo ";
    $order_array['descripcion']     = " {$this->getTableName()}.descripcion ";
    $order_array['keywords']        = " {$this->getTableName()}.keywords ";
    $order_array['id']              = " {$this->getTableName()}.id ";
    $order_array['estado']          = " {$this->getTableName()}.estado ";
    $order_array['estado_helpdesk'] = " {$this->getTableName()}.estado_helpdesk ";
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
    if ($filtro->filtro('descripcion'))
      $filtro_sql .= " AND {$this->getTableName()}.descripcion like '%{$filtro->filtro('descripcion')}%' ";
    if ($filtro->filtro('keywords'))
      $filtro_sql .= " AND {$this->getTableName()}.keywords like '%{$filtro->filtro('keywords')}%' ";
    if ($filtro->filtro('estado_helpdesk'))
      $filtro_sql .= " AND {$this->getTableName()}.estado_helpdesk like '%{$filtro->filtro('estado_helpdesk')}%' ";
    if ($filtro->filtro('estado'))
      $filtro_sql .= " AND {$this->getTableName()}.estado like '%{$filtro->filtro('estado')}%' ";
    if ($filtro->filtro('id'))
      $filtro_sql .= " AND {$this->getTableName()}.id like '%{$filtro->filtro('id')}%' ";
    return $filtro_sql;
  }
  
}

?>
