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
  
  /** Constante para definir el minimo tamaño de busqueda de palabras */
  const TAMA_PALA   = 4;
  
  /** url del helpdesk 
   * @todo actualizar esto en todas partes */
  const URL   = 'helpdesk/';
  
 /**
  * modulo_id
  * @var INT(11) 
  */
  var $modulo_id;
  
 /**
  * codigo
  * @var VARCHAR(100) 
  */
  var $codigo;

 /**
  * directorio
  * @var VARCHAR(300) 
  */
  var $directorio;

 /**
  * Titulo del tema de ayuda
  * @var VARCHAR(300) 
  */
  var $titulo;

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
  * El estado de el tema de ayuda
  * @var VARCHAR(2) 
  */
  var $estado_helpdesk;


 /**
  * (Objeto simple)  Todos los tooltips que tenga una pagina
  * @var Tooltip|array
  */
  var $tooltip_objs;
  
  /**
   * Creamos la ayuda
   * @param type $id
   * @param type $autogenerar generaa la autoayuda para la pagina actual
   */
  public function __construct($id = '' ,$modulo_base = '' , $autogenerar = false) 
  {
    $dir_sep = '/';
    if ('' == $id && $autogenerar)
    {
      /**
       * No tomaremos encuenta la carpeta instalada asi sera mas portatil  y mucho
       * mas compatible, haremos un desarrollo especial para servidores
       */
      if (ENDESARROLLO) { // en local
        $dir        = explode($dir_sep, ltrim($_SERVER['SCRIPT_NAME'] , $dir_sep));
        array_shift($dir);
        $script     = $dir_sep.ltrim(implode($dir_sep, $dir), $dir_sep);
     
      }
      else { //para servidores
        $script     = $dir_sep . ltrim($_SERVER['SCRIPT_NAME'] , $dir_sep);
      }
      // ya no usaremos el codigo  del modulo
      $this->codigo = sha1($script);

      $this->getByCodigo($this->codigo);
      if (!$this->id)
      {
        leerClase('Modulo');
        $modulo                = new Modulo('', $modulo_base);
        $this->titulo          = $script;
        $this->estado          = Objectbase::STATUS_AC;
        $this->keywords        = ltrim(str_replace(array('.','/'), ',', str_replace('.php', ',ayuda', $script)),',');
        $this->modulo_id       = $modulo->id;
        $this->directorio      = "$script";
        $this->descripcion     = "$script";
        $this->estado_helpdesk = Helpdesk::EST01_RECIEN;
        $this->save ();
      }
    }
    else
      parent::__construct($id);
  }

  public function rectificarnombredearchivo() {
      $ayudas  = new Helpdesk();
      $recurso = $ayudas->getAll();
      echo "<table><tr><th>id</th><th>dir</th><th>Codigo Actual</th><th>Codigo nuevo</th><th>Son iguales</th><th>Existe el archivo Original</th><th>Existe el archivo nuevo</th><th>Archivo copiado</th><th>Obj save</th><th>Estado</th></tr>";
      while ($row = mysql_fetch_assoc($recurso[0])) {
        $existe = 'Si';
        $template = TEMPLATES_DIR."helpdesk/archivo/{$row['codigo']}.tpl";
        if (!file_exists($template) || !($row['codigo']) )
          $existe = 'No';
        $codnuevo = sha1($row['directorio']);
        $iguales = $codnuevo == $row['codigo'] ? 'Si' : 'No';
        $rectificacion = new Helpdesk($row);
        /*
        if ($row['id'] == '238'){
            var_dump($rectificacion);
            $rectificacion->titulo = $rectificacion->titulo . ' modificado';
            $rectificacion->save();
        }
        */
        $renombrado  = 'No';
        $existenuevo = 'No';
        $guardado    = 'No';
        if ($iguales == 'No' && $existe == 'Si'){
            echo 'renombrando!!! ' . TEMPLATES_DIR."helpdesk/archivo/{$row['codigo']}.tpl";
            //rename
            $renombrado = copy(TEMPLATES_DIR."helpdesk/archivo/{$row['codigo']}.tpl", TEMPLATES_DIR."helpdesk/archivonuevo/{$codnuevo}.tpl");
            if (!$renombrado){
                echo "no se pudo copiar!!!" ;
            }
            $renombrado = $renombrado?'Si':'No';
            //guardar
            if ($renombrado == 'Si') {
                $rectificacion->codigo = $codnuevo;
                if($rectificacion->save()) {$guardado    = 'Si';}
            }
        }
        if (file_exists(TEMPLATES_DIR."helpdesk/archivonuevo/{$codnuevo}.tpl"))
          $existenuevo = 'Si';
        /*
        if ($row['directorio'][0] != '/'){
            echo "porsible error por acaa!!";
        }
         * 
         */

        echo "<tr><td>$row[id]</td><td>$row[directorio]</td><td>$row[codigo]</td><td>$codnuevo</td><td>$iguales</td><td>$existe</td><td>$existenuevo</td><td>$renombrado</td><td>$guardado</td><td>$row[estado]</td></tr>";
        break;
      }
      echo "</table>";
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
            $('a.ayudatip').click(function(){
              $("#" + $(this).attr('tooltip')).dialog({
       position: { my: "left center", at: "left center", of: $(this) },
      buttons: {
        Cerrar: function() {
          $( this ).dialog( "close" );
        }
      }
    });
              return false;
            });
            $('a.ayudapopup').click(function(){
              var x = screen.width - 510;
              window.open($(this).attr('href'), '_blank', 'location=no,width=500,height=600,left='+x+'top=0');
              return false;
            });
        });
      </script>
____TEST;
    echo $link;
  }
  
  
  /**
   * Mostramos la ayuda disponible en el sistema
   */
  function getTooltip($codigo)
  {
    $existe = FALSE;
    foreach ($this->tooltip_objs as $tooltip) {
      if ($tooltip->codigo == $codigo)
      {
        $tooltip->mostrar();
        $existe = TRUE;
      }
    }
    if (!$existe)
    {
      // Creamos el tooltip
      leerClase('Tooltip');
      $tooltip = new Tooltip();
      $tooltip->helpdesk_id    = $this->id;
      $tooltip->codigo         = $codigo;
      // Clonamos si es que hay algunno ya aprobado con el mismo codigo
      // sino solo se graba
      $tooltip->clonarPorCodigo($codigo);
      $tooltip->save();
      $tooltip->mostrar();
      $this->getAllObjects();
    }
  }
  
  /**
   * Buscamos el codigo de un helpdesk basados en el directorio de este
   * y tambein el directorio del actual helpdesk
   * @param string $parte_de_directorio
   * @return string
   */
  function getCodeByDirectory($parte_de_directorio,$echo = true) 
  {
    $pos = strpos($this->directorio, $parte_de_directorio);
    $dir = substr($this->directorio,0 ,$pos + strlen($parte_de_directorio) + 1).'index.php';
    $sql = " SELECT * FROM {$this->getTableName()} WHERE directorio = '$dir' ";
    $result = mysql_query($sql);
    if (!$result)
      return '';
    $helpdesk   = array();
    while ($row = mysql_fetch_array($result, MYSQL_ASSOC)) 
      $helpdesk = new Helpdesk($row);
    if ($echo)
      echo $helpdesk->codigo;
    else
      return $helpdesk->codigo;
  }
  
  /**
   * Hacemos el indice de navegacion para el sistema de ayuda
   * @param Grupo $misGrupos con todos mis grupos
   */
  function getTodosTemasAyuda($misGrupos) {
    $temas   = $this->buscarAyudaParaUsuario('',$misGrupos);
    $dir     = 'Inicio';
    $URL_IMG = URL_IMG;
    $lista   = '';
    $conta   = 0;
    foreach ($temas as $tema) {
      $actual = '';
      if ($tema->id == $this->id)
        $actual = 'actual';
      if ( dirname($tema->directorio) != $dir )
      {
        $conta ++;
        //{cycle values="comment_odd,comment_even"}
        $oculto = 'noexpandido';
        if ($tema->estado == 'ACMISMO')
          $oculto = '';
          
        
        $dir    = dirname($tema->directorio);
        // contenedor
        $lista .= <<<________LISTA
        </ul></li>
        <li class="comment_odd" ><div class="author"> <span class="name"><a href="#"  onclick="$('#sublist$conta').toggle();return false;" >{$tema->titulo}</a></span></div>
          <ul class="$oculto" id="sublist$conta">
________LISTA;
        // normal
        $lista .= <<<________LISTA
          <li class="comment_even $actual"><div class="author"><span class="name"><a href="index.php?codigo={$tema->codigo}">{$tema->titulo}</a></span></div></li>
________LISTA;
      }
      else
      {
        $lista .= <<<________LISTA
          <li class="comment_even $actual"><div class="author"><span class="name"><a href="index.php?codigo={$tema->codigo}">{$tema->titulo}</a></span></div></li>
________LISTA;
      }
        
    }
    $lista  = ltrim($lista,'        </ul></li>');
    $lista .= <<<____LISTA
          </ul>
        </li>
____LISTA;
    return $lista; 
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
   * Mostramos el total de Tooltips pendiesntes
   * 
   * @param INT(11) $helpdesk_id el id del helpdesk
   * @return icon
   */
  function getContadorTooltipsLita($helpdesk_id = '', $estado_tooltip = 'RC',$link = 'tooltip.gestion.php',$conicono = true) 
  {
    /**
    const EST01_RECIEN  = "RC";
    const EST01_CLONAD  = "CL";
    const EST02_APROBA  = "AP";
    */
    
    
    if ($helpdesk_id == '')
      $helpdesk_id = $this->id;
    leerClase('Tooltip');
    $tooltips    = new Tooltip();
    $where       = "  helpdesk_id = '{$helpdesk_id}' AND estado_tooltip = '{$estado_tooltip}' ";
    $pendientes  = $tooltips->contar($where);
    
    if ($conicono)
      $conicono = $tooltips->getIconEstadoHD($estado_tooltip);
    
    if (!$link)
      $resp = " {$conicono} $pendientes"; 
    else
      $resp = "<a href='{$link}?helpdesk_id=$helpdesk_id&estado_tooltip=$estado_tooltip' >{$conicono} $pendientes</a>"; 
    return $resp;
  }

  
  /**
   * Si el usuario puede editar o no online copia fiel del mismo metodo en tooltip
   * @see Tooltip::puedeEditar()
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
        $editar = true;
      }
      
    }
    return $editar;
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
   * Buscamos ayuda en el sistema para el usuario actual
   * teniendo en cuenta su grupo y sus permisos
   * @param String $busqueda
   * @param Grupo $misGrupos
   * @return Helpdesk todos los temas de ayuda encontrados
   */
  function buscarAyudaParaUsuario($busqueda,$misGrupos)
  {
    leerClase('Permiso');
    if (!sizeof($misGrupos))
      return array();
    $activo = Objectbase::STATUS_AC;
    // Tomamos en cuenta
    // descripcion claves y permisos

    // Buscamos tdos los grupos a los que 
    // pertenezca este usuario
    $grupos_id = "";
    foreach ($misGrupos as $grupo) {
      $grupos_id .= $grupo->id . ',';
    }
    $grupos_id = rtrim($grupos_id, ',');
    
    // buscamos todos los modulos en los 
    // que tiene permisos por sus grupos
    $puede_ver = Permiso::SI;
    $sql       = " SELECT DISTINCT modulo_id FROM {$this->getTableName('Permiso')} ";
    $sql      .= " WHERE grupo_id IN ($grupos_id) AND ver = '$puede_ver' AND modulo_id > 0 AND estado = '{$activo}' ";

    // buscamos todos los temas de ayuda a 
    // los que puede acceder este usuario
    $sql       = " SELECT * FROM {$this->getTableName()} WHERE modulo_id IN ($sql)";
    
    // Buscamos el string dentro todos los temas de ayuda 
    // en los keywords y las descripciones
    // dividimos la busqueda por palabras
    $sql       = " SELECT * FROM ($sql) as busqueda WHERE "; 
    // buscamos por cada palabra mayor a x caracteres
    if (trim ($busqueda) != '') 
    {
      $busqueda  = explode(" ", $busqueda);
      foreach ($busqueda as $palabra) 
      {
        // no tomamos en cuenta parabras menores "TAMA_PALA" 
        if (strlen($palabra)< Helpdesk::TAMA_PALA )
          continue;
        $subsql      .= " busqueda.keywords LIKE '%$palabra%' ";
        $subsql      .= " OR busqueda.descripcion LIKE '%$palabra%'   ";
        $subsql      .= " OR busqueda.titulo LIKE '%$palabra%'   ";
        $subsql      .= " OR ";
      }
      $subsql         = rtrim($subsql, " OR ");
    }
    else //buscamos todo!!
      $subsql       = " 1 ";
    $sql           .= $subsql;
    // Ordenamos por modulo y por el directorio
    $sql           .= " ORDER BY modulo_id ASC, directorio DESC";

    $result = mysql_query($sql);
    if (!$result)
      return array();
    $helpdesks  = array();
    $directorio = dirname($this->directorio); 
    while ($row = mysql_fetch_array($result, MYSQL_ASSOC)) 
    {
      // OJO CON ESTO SERA UNA CLAVE PARA VER SI ES UN
      // TEMA DEL MISMO NIVEL QUE EL ACTUAL 
      if ($directorio == dirname($row['directorio']) )
        $row['estado'] = 'AC'.'MISMO';
      else
        $row['estado'] = 'AC'.'OTRO';
      $helpdesks[]   = new Helpdesk($row);
    }
    return $helpdesks;
  }

  /**
   * Mostramos el resumen del la ayuda
   * resaltando la busqueda y cortando la descripcion
   * antes y despues de la palabra buscada
   * @param STRING $busqueda
   */
  function getDescripcionResumen($busqueda,$cortar = 50 , $echo = true) {
    $pos = stripos($this->descripcion, $busqueda);
    $pui = ($pos<$cortar)?'':'...';
    $puf = ( strlen($this->descripcion) - $pos < $cortar)?'':'...';
    $res = $pui . substr($this->descripcion, ($pos - $cortar)<0?0:($pos - $cortar)  , $cortar * 2 + strlen($busqueda)  ) . $puf;
    // resaltamos por cada palabra
    // buscamos por cada palabra
    $busqueda  = explode(" ", $busqueda);
    foreach ($busqueda as $palabra) 
    {
      // no tomamos en cuenta parabras menores "TAMA_PALA" 
      if (strlen($palabra)< Helpdesk::TAMA_PALA )
        continue;
      $res = str_replace($palabra, "<span class='resumen'>$palabra</span>", $res);
    }

    if ($echo)
      echo   $res;
    else 
      return $res;
  }
  
  /**
   * Iniciamos los permisos para visitar las ayudas
   * @param INT(11) $grupo_id Id del grupo
   */
  function iniciarPermisos($grupo_id = false)
  {
    leerClase('Permiso');
    $permiso = new Permiso();
    if (!$grupo_id)
      $permiso->grupo_id  = Grupo::SUPERADMINGRUOP;
    else
      $permiso->grupo_id  = $grupo_id;
    $permiso->ver       = Permiso::SI;
    $permiso->crear     = Permiso::SI;
    $permiso->editar    = Permiso::SI;
    $permiso->eliminar  = Permiso::SI;
    $permiso->helpdesk_id = $this->id;
    $permiso->estado      = Objectbase::STATUS_AC;
    $permiso->save();
  }
  
  /**
   * Validamos al helpdesk ya sea para actualizar o para crear uno nuevo
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
    $filtro->nombres[] = 'Estado';
    /** Constante para indicar el estado de la ayuda  */
    $filtro->valores[] = array ('select','estado_helpdesk'  ,$filtro->filtro('estado_helpdesk'),
        array(''      ,'RC'         ,'ED'           ,'AP'        ),
        array('Todos' ,'Pendiente'  ,'Ya Editado'   ,'Aprobado' ));
    $filtro->nombres[] = 'Descripci&oacute;n';
    $filtro->valores[] = array('input', 'descripcion', $filtro->filtro('descripcion'));
    $filtro->nombres[] = 'Claves';
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

