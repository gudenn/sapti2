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
   * Actualizamos los tool tips que no esten editados y 
   * que tengan el mismo cogido
   */
  function actualizarPorMismoCodigo() {
    $re100 = Tooltip::EST01_RECIEN;
    $re1no = Tooltip::EST01_CLONAD;
    $sql   = " 
      UPDATE " . $this->getTableName() . " SET 
        titulo         = '{$this->titulo}' ,  
        descripcion    = '{$this->descripcion}' ,
        estado_tooltip = '$re1no' 
      WHERE 
        codigo = '{$this->codigo}' AND estado_tooltip = '{$re100}' ";
      $result = mysql_query($sql);
      if (!$result)
        return false;
      return true;
  }
  
  
  /**
   * Si el usuario puede editar o no online
   * @return BOOL
   */
  function puedeEditar() {
    $editar  = false;
    $usuario = getSessionUser();
    
    if ( isset($usuario->id) && $usuario->id)
    {
      $permiso = $usuario->getPermiso('ADMIN-HELPDESK');
      if ($permiso['ver'] && isset($_SESSION['editor_online']) && ($_SESSION['editor_online']))
      {
        $editar = $this->editarToolTip();
      }
      
    }
    return $editar;
  }
  
  /**
   * Mostramos el toltip
   */
  function mostrar($echo = true) 
  {
    leerClase('Administrador');
    leerClase('Usuario');
    $editar  = $this->puedeEditar();
 
    if (!$this->mostrar && !$editar)
      return;
    $oncli = " onclick=\"$( \"#ayuda_{$this->id}\" ).dialog(); return false;\" " ;
    if ($this->mostrar)
      if (!$editar)
      {
        $icono = icono('basicset/help.png', $this->codigo, '15px');
      }
      else
      {
        switch ($this->estado_tooltip) {
          case Tooltip::EST01_RECIEN:
          default:
            $icono = icono('basicset/help_pendiente.png', $this->titulo . " (Pendiente)", '15px');
            break;
          case Tooltip::EST01_CLONAD:
            $icono = icono('basicset/help_clonado.png', $this->titulo . " (Clonado)", '15px');
            break;
          case Tooltip::EST02_APROBA:
            $icono = icono('basicset/help_verificado.png', $this->titulo . " (Verificado)", '15px');
            break;
        }
        
      }
    else
      $icono = icono('basicset/eyeclose.png', $this->codigo . " (Oculto al p&uacute;blico) ", '15px');
    $link = <<<____TEST
      <a href="#" tooltip="ayuda_{$this->id}"  tabindex="-1" title="{$this->titulo}"  class="ayudatip"> {$icono} </a> 
      <div id="ayuda_{$this->id}" title="{$this->titulo}" style="display:none;">
        <span class="ui-icon ui-icon-circle-check" style="float: left; margin: 0 7px 50px 0;"></span>
        <p id="tooltip_p_{$this->id}">{$this->descripcion}.</p>
        {$editar}
      </div>
____TEST;
    if ($echo)
      echo $link;
    else
      return $link;
  }
  
  /**
   * mostramos un formulario de edicion en todo el sistema para los tooltips
   */
  function editarToolTip($echo = false)  {
    leerClase('Administrador');
    $URL    = URL . Administrador::URL . 'helpdesk/tooltip.registro.ajax.php';
    $loadin = icono('basicset/loading.gif', 'Guardando...' , '50px' , '10px');
    $coculto = (!$this->mostrar)?' checked="checked" ':''; 
    $link   = <<<____TEST
      <a href="#" onclick="$('#tooltip_id_{$this->id}').fadeIn('Slow');$('#tooltip_p_{$this->id}').hide();$(this).hide();return false;" ><span class="ui-icon ui-icon-pencil" style="float: left; margin: 0 7px 50px 0;" ></span> Editar</a>
      <div id="tt_loading_{$this->id}" style="display:none;text-align: center;padding: 50px 0;">{$loadin}<br>Guardando...</div>
      <div id="tooltip_id_{$this->id}" style="display:none;">
        <fieldset>
          <label for="tt_titulo_{$this->id}">T&iacute;tulo de Tooltip (*)</label><br>
          <input type="text" name="tt_titulo_{$this->id}" id="tt_titulo_{$this->id}" class="text ui-widget-content ui-corner-all" value="$this->titulo" /><br><br>
          <label for="tt_descripcion_{$this->id}">Descipci&oacute;n de Tooltip (*)</label><br>
          <input type="text" name="tt_descripcion_{$this->id}" id="tt_descripcion_{$this->id}"  class="text ui-widget-content ui-corner-all" value="$this->descripcion" /><br><br>
          <label for="tt_ocultar_{$this->id}" title="Ocultar este Tooltip.">Ocultar</label>
          <input type="checkbox" name="tt_ocultar_{$this->id}" id="tt_ocultar_{$this->id}" $coculto value="ON" /><br><br>
          <label for="tt_actualizar_{$this->id}" title="Se actualizar&aacute;n todos los tooltips con el mismo c&oacute;digo que no esten editados todav&iacute;a">Actualizar todos</label>
          <input type="checkbox" name="tt_actualizar_{$this->id}" id="tt_actualizar_{$this->id}"  value="ON" /><br><br>
          <button id="tt_save_{$this->id}" type="button" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only" role="button" aria-disabled="false"><span class="ui-button-text">Guardar</span></button>              
          <button id="tt_cancel_{$this->id}" type="button" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only" role="button" aria-disabled="false"><span class="ui-button-text">Cancelar</span></button>              
          <script type="text/javascript">
            $(function() {
              
              $('#tt_cancel_{$this->id}').click(function(){
                $('#tooltip_id_{$this->id}').fadeOut('fast');$('#tooltip_p_{$this->id}').show();return false;
              });
              $('#tt_save_{$this->id}').click(function(){
                $('#tooltip_id_{$this->id}').fadeOut('fast');
                $('#tt_loading_{$this->id}').fadeIn('slow');
                $.post( "{$URL}", { titulo: $('#tt_titulo_{$this->id}').val(), descripcion: $('#tt_descripcion_{$this->id}').val(), actualizar : $('#tt_actualizar_{$this->id}').prop('checked'), ocultar : $('#tt_ocultar_{$this->id}').prop('checked'), tooltip_id : '{$this->id}' } ).done(function( data ) {
                  if (data != 'TRUE')
                  {
                    $('#tooltip_id_{$this->id}').fadeIn('fast');
                    alert(data);
                  }
                  else{
                    $('#tt_loading_{$this->id}').html('Se grabo correctamente la Informaci&oacute;n');
                  }
                });
              });
            });
          </script>
        </fieldset>
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
    $filtro->nombres[] = 'Estado';
    /** Constante para indicar el estado de la ayuda  */
    $filtro->valores[] = array ('select','estado_tooltip'  ,$filtro->filtro('estado_tooltip'),
        array(''      ,'RC'         ,'CL'        ,'AP'        ),
        array('Todos' ,'Pendiente'  ,'Clonado'   ,'Aprobado' ));
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