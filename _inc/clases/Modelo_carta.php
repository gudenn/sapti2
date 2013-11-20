<?php
/**
 * Modelo de carta
 */
class Modelo_carta extends Objectbase
{
  
 /**
  * codigo
  * @var VARCHAR(100) 
  */
  var $codigo;

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
  * El estado del proyecto
  * TIPO_PERFIL =  PE, TIPO_PROYECTO =  PR
  * @see Proyecto
  * @var VARCHAR(2) 
  */
  var $tipo_proyecto;

 /**
  * El estado del proyecto
  * Iniciado (IN), 
  * Form Perfil Pendiente (PD), 
  * Form Perfil Confirmaddo (CO), 
  * Visto Bueno de Docente Tutores y Revisores (VB), 
  * Estado de proyecto con tribunal (TA), 
  * Tribunales Visto Bueno (TV), 
  * Con defensa Asignada(LD), 
  * Estado Proyecto  finalizado (PF)
  * @see Proyecto
  * @var VARCHAR(2) 
  */
  var $estado_proyecto;

  
  /**
   * Buscamos Todos los modelos de carta que correspondan a un tipo de proyecto y 
   * su estado
   * @param String $tipo_proyecto
   * @param String $estado_proyecto
   * @return Modelo_carta
   */
  public function buscarModelos($tipo_proyecto = false , $estado_proyecto = false) 
  {
    $arraglo_modelos = array();
    if ($tipo_proyecto && $estado_proyecto)
    {
      //buscamos 
      $activo = Objectbase::STATUS_AC;
      $sql = "select * from " . $this->getTableName('Modelo_carta') . " where tipo_proyecto = '$tipo_proyecto' AND  estado_proyecto = '$estado_proyecto' AND estado = '$activo' ";
      //echo $sql;
      $result = mysql_query($sql);
      if ($result === false)
        throw new Exception("?" . $this->getTableName('Modelo_carta') . "&m=Cant Get Modelo <br />$sql<br /> " . $this->getTableName('Modelo_carta') . ' -> ' . mysql_error());
        
      while ($row = mysql_fetch_array($result,MYSQLI_ASSOC)) {
        $arraglo_modelos[] = new Modelo_carta($row);
      }
    }
    return $arraglo_modelos;
  }
  
  public function save($table = false, $father_id_value = false, $base = 'compania') {
    if (!isset($this->codigo) || !$this->codigo || trim($this->codigo) == '' )
      $this->codigo = sha1( $this->titulo . time());
    parent::save($table, $father_id_value, $base);
  }

  /**
   * Asignamos los valores que se ayan elegido antes
   * @param String $template
   * @return String
   */
  function asignarFormulario($template) {
    //[fecha]
    if (isset($_POST['fecha']))
    foreach ($_POST['fecha'] as $str)
      $template = preg_replace('/\[fecha\]/', $str , $template, 1);

    //[director]
    if (isset($_POST['director']))
    foreach ($_POST['director'] as $str)
      $template = preg_replace('/\[director\]/', $str , $template, 1);

    //[proyecto]
    if (isset($_POST['proyecto']))
    foreach ($_POST['proyecto'] as $str)
      $template = preg_replace('/\[proyecto\]/', $str , $template, 1);

    //[estudiante]
    if (isset($_POST['estudiante']))
    foreach ($_POST['estudiante'] as $str)
      $template = preg_replace('/\[estudiante\]/', $str , $template, 1);

    //[responsable]
    if (isset($_POST['responsable']))
    foreach ($_POST['responsable'] as $str)
      $template = preg_replace('/\[responsable\]/', $str , $template, 1);

    //[docente]
    if (isset($_POST['docente']))
    foreach ($_POST['docente'] as $str)
      $template = preg_replace('/\[docente\]/', $str , $template, 1);

    //[tutores]
    if (isset($_POST['tutor']))
    foreach ($_POST['tutor'] as $str)
      $template = preg_replace('/\[tutor\]/', $str , $template, 1);

    //[tribunal]
    if (isset($_POST['tribunal']))
    foreach ($_POST['tribunal'] as $str)
      $template = preg_replace('/\[tribunal\]/', $str , $template, 1);

    //[extra]
    if (isset($_POST['extra']))
    foreach ($_POST['extra'] as $str)
      $template = preg_replace('/\[extra\]/', $str , $template, 1);

    return $template;
  }

  /**
   * Generamos el formulario para imprimir las cartas
   * @param String $template
   * @param Proyecto $proyecto
   * @return String
   */
  function generarFormulario($template,$proyecto) {
    leerClase('Semestre');
    leerClase('Estudiante');
    leerClase('Dicta');
    leerClase('Docente');
    $estudiante_id = '';
    if (count($proyecto->proyecto_estudiante_objs) > 0)
    {
      $proyecto_estudiante = $proyecto->proyecto_estudiante_objs[0];
      $estudiante_id       = $proyecto_estudiante->estudiante_id;
    }
    $estudiante  = new Estudiante($estudiante_id);
    $estudiante->getAllObjects();
    // Buscamos al docente
    $docentes[] = new Docente();
    if (count($estudiante->inscrito_objs)> 0)
    {
      foreach ($estudiante->inscrito_objs as $inscrito) {
        $dicta      = new Dicta($inscrito->dicta_id);
        $docentes[] = new Docente($dicta->docente_id);
      }
    }
    $semestre    = new Semestre();
    //Tutores
    $tutores  = $proyecto->getTutores();
    //Tribunales (ids de docentes)
    $t_do_ids = $proyecto->getIdTribunles();
    
    //[fecha]
    $ckmodulos[] = '[fecha]';
    $value       = "Cochabamba, ".date('j')." de ".date('F')." de ".date('Y')." ";
    $ckinputs[]  = '<input type="text" name="fecha[]" value="'.$value.'" />';
    //[director]
    $ckmodulos[] = '[director]';
    $value       = $semestre->getValor('Director carrera Sistemas','Director Sistemas');
    $ckinputs[]  = '<input type="text" name="director[]" value="'.$value.'" />';
    //[proyecto]
    $ckmodulos[] = '[proyecto]';
    $value       = $proyecto->nombre;
    $ckinputs[]  = '<input type="text" name="proyecto[]" value="'.$value.'" />';
    //[estudiante]
    $ckmodulos[] = '[estudiante]';
    $value       = $estudiante->getNombreCompleto();
    $ckinputs[]  = '<input type="text" name="estudiante[]" value="'.$value.'" />';
    //[responsable]
    $ckmodulos[] = '[responsable]';
    $value       = $proyecto->responsable;
    $ckinputs[]  = '<input type="text" name="responsable[]" value="'.$value.'" />';
    //[docente]
    $ckmodulos[] = '[docente]';
    $value       = '<option>-- Seleccione --</option>';
    foreach ($docentes as $docente) {
      $value    .= '<option>' . $docente->getNombreCompleto() . '</option>';
    }
    $ckinputs[]  = '<select name="docente[]" >'.$value.'</select>';
    //[tutores]
    $ckmodulos[] = '[tutor]';
    $value       = '<option>-- Seleccione --</option>';
    foreach ($tutores as $tutor) {
      $value    .= '<option>' . $tutor->getNombreCompleto() . '</option>';
    }
    $ckinputs[]  = '<select name="tutor[]" >'.$value.'</select>';
    //[tribunal]
    $ckmodulos[] = '[tribunal]';
    $value       = '<option>-- Seleccione --</option>';
    foreach ($t_do_ids as $tribunal_docente_id) {
      $tribunal_docente = new Docente($tribunal_docente_id);
      $value    .= '<option>' . $tribunal_docente->getNombreCompleto() . '</option>';
    }
    $ckinputs[]  = '<select name="tribunal[]" >'.$value.'</select>';
    //[extra]
    $ckmodulos[] = '[extra]';
    $ckinputs[]  = '<input type="text" name="extra[]" value="" />';

    $template    = str_replace($ckmodulos, $ckinputs, $template);
    return $template;
  }
  
  
  /**
   * Mostramos el icono correspondiente al estado del proyecto
   * 
   * @param string(2) $estado_proyecto estado proyecto
   * @return icon
   */
  function getIconEstadoHD($estado_proyecto = '') 
  {
    if ($estado_proyecto != '')
      $this->estado_proyecto = $estado_proyecto;
    switch ($this->estado_proyecto) {
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
   * Creamos un modelo de carta a partir del codigo
   * 
   * @param string $codigo el codigo SAH1 
   * @return Modelo_carta
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
   * Mostramos el resumen del la carta
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
   * Validamos al modelo de carta ya sea para actualizar o para crear uno nuevo
   * @param type $es_nuevo
   */
  function validar($es_nuevo = true) {
    leerClase('Formulario');
    Formulario::validar('titulo', $this->titulo, 'texto', 'El T&iacute;tulo');
    Formulario::validar('descripcion', $this->descripcion, 'texto', 'La descripci&oacute;n');
  }

  /**
   * Inicia el filtro para el admin
   * @param Filtro $filtro el fitro que se usara en el admin
   */
  function iniciarFiltro(&$filtro) {

    if (isset($_GET['order']))
      $filtro->order($_GET['order']);
    $filtro->nombres[] = 'Tipo';
    $filtro->valores[] = array ('select','tipo_proyecto'  ,$filtro->filtro('tipo_proyecto'),
        array(''      ,'PE'          ,'PR'             ),
        array('Todos' ,'Tipo PErfil' ,'Tipo Proyecto' ));
    $filtro->nombres[] = 'Estado';
    $filtro->valores[] = array ('select','estado_proyecto'  ,$filtro->filtro('estado_proyecto'),
        array(''      ,'VB'          ,'TA'                ,'TV'                  ,'LD'               ,'PF'                    ),
        array('Todos' ,'Visto Bueno' ,'Tribunal Asignado' ,'Visto Bueno Tribunal','Defensa Asignada' ,'Proyecto Finalizado'  ));
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
    $order_array['id']              = " {$this->getTableName()}.id ";
    $order_array['estado']          = " {$this->getTableName()}.estado ";
    $order_array['tipo_proyecto']   = " {$this->getTableName()}.tipo_proyecto ";
    $order_array['estado_proyecto'] = " {$this->getTableName()}.estado_proyecto ";
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
    if ($filtro->filtro('titulo'))
      $filtro_sql .= " AND {$this->getTableName()}.titulo like '%{$filtro->filtro('titulo')}%' ";
    if ($filtro->filtro('tipo_proyecto'))
      $filtro_sql .= " AND {$this->getTableName()}.tipo_proyecto like '%{$filtro->filtro('tipo_proyecto')}%' ";
    if ($filtro->filtro('estado_proyecto'))
      $filtro_sql .= " AND {$this->getTableName()}.estado_proyecto like '%{$filtro->filtro('estado_proyecto')}%' ";
    if ($filtro->filtro('estado'))
      $filtro_sql .= " AND {$this->getTableName()}.estado like '%{$filtro->filtro('estado')}%' ";
    if ($filtro->filtro('id'))
      $filtro_sql .= " AND {$this->getTableName()}.id like '%{$filtro->filtro('id')}%' ";
    return $filtro_sql;
  }
  
}

?>