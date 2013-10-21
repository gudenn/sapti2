<?php
/**
* @author          Guyen Campero<guyencu@gmail.com>
* @version         0.13.0.02
*/
class Notificacion extends Objectbase
{
 /**
  * Cosntantes para manejar los estados de notificaion
  */
 /** EST_NOLEIDO no leido */
  const EST_NOLEIDO    = 'E01';
 /** EST_LEIDO leido */
  const EST_LEIDO      = 'E02';
 /** EST_ARCHIVO mensaje archivado */
  const EST_ARCHIVO    = 'E03';
 /** EST_ELIMINADO mensaje eliminado */
  const EST_ELIMINADO  = 'E04';
  
 /**
  * Cosntantes para manejar los tipos
  */
 /** TIPO_MENSAJE mensaje normal  */
  const TIPO_MENSAJE    = 'N01';
 /** TIPO_TIEMPO mensaje de tiempo  */
  const TIPO_TIEMPO     = 'N02';
 /** TIPO_MENSAJE mensaje asignacion  */
  const TIPO_ASIGNACION = 'N03';

  //ESTAS VARIABLES SE GUARDAN EN notificacion_XX
  /**
   * estado notificacion NO VISTO
   */
  const EST_SV    = 'SV';
  /**
   * ESTADO NOTIFICACION VISTO
   */
  const EST_VI   = 'VI';
  /**
   * ESTADO NOTIFICACION ARCHIVADO
   */
  const EST_AR   = 'AR';
  
 /**
  * Codigo identificador del Del proyecto
  * @var INT(11)
  */
  var $proyecto_id;
  

 /**
  * Tipo de notificacion
  * Mensaje normal (NR), Mensaje de tiempo se acaba, y otros 
  * consultad contantes
  * @var VARCHAR(45)
  */
  var $tipo;
  
  /**
  * Fecha de notificacion
  * 
  * @var date
  */
  var $fecha_envio;

  

 /**
  * Asunto del mensaje o notificacion
  * @var VARCHAR (200)
  */
  var $asunto;

 /**
  * Contenido del mensaje o notificacion
  * @var TEXT
  */
  var $detalle;
  

 /**
  * La Prioridad del mensaje 
  * siendo: 1  prioridad minima
  *         10 prioridad maxima
  * @var TEXT
  */
  var $prioridad;

  
 /**
  * El estado_notificacion del mensaje si fue leido si esta archivado si fue eliminado
  * Consultar constantes de estado
  * @var TEXT
  *
  var $estado_notificacion;
*/
  
 /**
  * (Arreglo de objetos)  que pertenecen a un consejo
  * @var object|null 
  */
  var $notificacion_consejo_objs;  

 /**
  * (Arreglo de objetos)  que pertenecen a un tribunal
  * @var object|null 
  */
  var $notificacion_tribunal_objs;  
  
 /**
  * (Arreglo de objetos)  que pertenecen a un docente
  * @var object|null 
  */
  var $notificacion_revisor_objs;  

 /**
  * (Arreglo de objetos)  que pertenecen a un docente
  * @var object|null 
  */
  var $notificacion_dicta_objs;  
  
 /**
  * (Arreglo de objetos)  que pertenecen a un tutor
  * @var object|null 
  */
  var $notificacion_tutor_objs;  

  /**
  * (Arreglo de objetos)  que pertenecen a un estudiante
  * @var object|null 
  */
  var $notificacion_estudiante_objs;  
  

  /**
   * Mostramos el icono por el estado del mensaje
   * el estado debe estar el la asociacion en tre la
   * notificacion y el usuario
   * 
   * @param string(2) $id
   * @return icon
   */
  function getIconLeido($estado_notificacion , $width = "25px") 
  {
    $estado_notificacion = (trim($estado_notificacion)=='')?self::EST_SV:$estado_notificacion;
    $icono               = '';
    $descripcion         = '';
    switch ($estado_notificacion) {
      case self::EST_VI: // Mensajes ya vistos
        $icono       = 'basicset/message-already-read.png';
        $descripcion = 'Mensaje ya leido';
        break;
      case self::EST_AR: // Mensajes archivados
        $icono       = 'basicset/message-archived.png';
        $descripcion = 'Mensaje Archivado';
        break;
      case self::EST_SV: //No leido y el resto
      default:
        $icono = "basicset/message-not-read.png";
        $descripcion = 'Mensaje No leido';
        break;
    }
    return icono($icono, $descripcion, $width);
  }

  /**
   * Mostramos el icono por el estado del mensaje
   * el estado debe estar el la asociacion en tre la
   * notificacion y el usuario
   * 
   * @param string(2) $id
   * @return icon
   */
  function getIconPrioridad($prioridad = '' , $width = "25px") 
  {
    $prioridad = (trim($prioridad)=='')?$this->prioridad:$prioridad;
    $icono               = '';
    $descripcion         = '';
    switch ($prioridad) {
      case 0:
      default:
        $icono       = 'basicset/prioridad_0.png';
        $descripcion = 'Prioridad muy baja';
        break;
      case 1:
        $icono       = 'basicset/prioridad_1.png';
        $descripcion = 'Prioridad muy baja';
        break;
      case 2:
        $icono       = 'basicset/prioridad_2.png';
        $descripcion = 'Prioridad muy baja';
        break;
      case 3:
        $icono       = 'basicset/prioridad_3.png';
        $descripcion = 'Prioridad baja';
        break;
      case 4:
        $icono       = 'basicset/prioridad_4.png';
        $descripcion = 'Prioridad normal';
        break;
      case 5:
        $icono       = 'basicset/prioridad_5.png';
        $descripcion = 'Prioridad normal';
        break;
      case 6:
        $icono       = 'basicset/prioridad_6.png';
        $descripcion = 'Prioridad normal';
        break;
      case 7:
        $icono       = 'basicset/prioridad_7.png';
        $descripcion = 'Prioridad alta';
        break;
      case 8:
        $icono       = 'basicset/prioridad_8.png';
        $descripcion = 'Prioridad alta';
        break;
      case 9:
        $icono       = 'basicset/prioridad_9.png';
        $descripcion = 'Prioridad muy alta';
        break;
      case 10:
        $icono       = 'basicset/prioridad_10.png';
        $descripcion = 'Prioridad muy alta';
        break;
    }
    return icono($icono, $descripcion, $width);
  }
  
  function marcarVisto() {
    $this->getAllObjects();
    //Consejo
    foreach ($this->notificacion_consejo_objs as $notificacion_consejo)
      $notificacion_consejo->marcarVisto();
    //Dicta
    foreach ($this->notificacion_dicta_objs as $notificacion_consejo)
      $notificacion_consejo->marcarVisto();
    //estudiante
    foreach ($this->notificacion_estudiante_objs as $notificacion_consejo)
      $notificacion_consejo->marcarVisto();
    //Revisor
    foreach ($this->notificacion_revisor_objs as $notificacion_consejo)
      $notificacion_consejo->marcarVisto();
    //tribunal
    foreach ($this->notificacion_tribunal_objs as $notificacion_consejo)
      $notificacion_consejo->marcarVisto();
    //Tutor
    foreach ($this->notificacion_tutor_objs as $notificacion_consejo)
      $notificacion_consejo->marcarVisto();
  }
  
  /**
   * Manda una notificacion a todos los actores de un proyecto
   */
  function notificarTodos() 
  {
    leerClase('Notificacion_consejo');
    leerClase('Notificacion_dicta');
    leerClase('Notificacion_estudiante');
    leerClase('Notificacion_revisor');
    leerClase('Notificacion_tribunal');
    leerClase('Notificacion_tutor');
    
            
    $proyecto = new Proyecto($this->proyecto_id);
    $proyecto->getAllObjects();
    $this->notificarEstudiantes($proyecto);
    $this->notificarDictas($proyecto);
    $this->notificarTutores($proyecto);
    $this->notificarTribunales($proyecto);
    $this->notificarRevisores($proyecto);
  }
  /**
   * Retorna la notificacion del tribunal
   * @return boolean|\Area
   */
  

  /**
   * Notificamos a todos los estudiantes del proyecto
   */
  function notificarEstudiantes($proyecto = false) 
  {
    if (!$proyecto)
    {
      $proyecto = new Proyecto($this->proyecto_id);
      $proyecto->getAllObjects();
    }
    $estudiantes = array();
    foreach ($proyecto->proyecto_estudiante_objs as $proyecto_estudiante)
      $estudiantes[] = $proyecto_estudiante->estudiante_id;
    $usuarios['estudiantes'] = $estudiantes;

    $this->enviarNotificaion($usuarios);
  }
  
  /**
   * Notificamos a todos los dicta del proyecto
   */
  function notificarDictas($proyecto = false) 
  {
    if (!$proyecto)
    {
      $proyecto = new Proyecto($this->proyecto_id);
      $proyecto->getAllObjects();
    }
    $dictas = array();
    foreach ($proyecto->proyecto_dicta_objs as $proyecto_dicta)
      $dictas[] = $proyecto_dicta->dicta_id;
    $usuarios['dictas'] = $dictas;

    $this->enviarNotificaion($usuarios);
  }
  
  /**
   * Notificamos a todos los tutores del proyecto
   */
  function notificarTutores($proyecto = false) 
  {
    if (!$proyecto)
    {
      $proyecto = new Proyecto($this->proyecto_id);
      $proyecto->getAllObjects();
    }
    $tutores = array();
    foreach ($proyecto->proyecto_tutor_objs as $proyecto_tutor)
      $tutores[] = $proyecto_tutor->tutor_id;
    $usuarios['tutores'] = $tutores;

    $this->enviarNotificaion($usuarios);
  }

  /**
   * Notificamos a todos los tribunales del proyecto
   */
  function notificarTribunales($proyecto = false) 
  {
    if (!$proyecto)
    {
      $proyecto = new Proyecto($this->proyecto_id);
      $proyecto->getAllObjects();
    }

    $tribunales = array();
    foreach ($proyecto->tribunal_objs as $tribunal)
      $tribunales[] = $tribunal->id;
    $usuarios['tribunales'] = $tribunales;

    $this->enviarNotificaion($usuarios);
  }

  /**
   * Notificamos a todos los revisores del proyecto
   */
  function notificarRevisores($proyecto = false) 
  {
    if (!$proyecto)
    {
      $proyecto = new Proyecto($this->proyecto_id);
      $proyecto->getAllObjects();
    }

    $revisores = array();
    foreach ($proyecto->proyecto_revisor_objs as $proyecto_revisor)
      $revisores[] = $$proyecto_revisor->revisor_id;
    $usuarios['revisores'] = $revisores;

    $this->enviarNotificaion($usuarios);
  }


  /**
   * Envio de mensajes para el sistema
   * 
   * @param type $usuarios es un Array cons las siguientes claves
   * estudiantes = array();
   * tribunales  = array();
   * revisores   = array();
   * dictas      = array();
   * consejos    = array();
   * tutores     = array();
   * @param Proyecto_tutor $proyecto_tutor si es del tipo asignar tutor mandamos la signacion
   */
  
  function enviarNotificaion($usuarios /*$dictas,$estudiantes,$tutores,$tribunales,$revisores,$consejos*/,$proyecto_tutor = false)
  {

    
    $estudiantes = isset($usuarios['estudiantes'])?$usuarios['estudiantes']:array();
    $tribunales  = isset($usuarios['tribunales' ])?$usuarios['tribunales' ]:array();
    $revisores   = isset($usuarios['revisores'  ])?$usuarios['revisores'  ]:array();
    $consejos    = isset($usuarios['consejos'   ])?$usuarios['consejos'   ]:array();
    $tutores     = isset($usuarios['tutores'    ])?$usuarios['tutores'    ]:array();
    $dictas      = isset($usuarios['dictas'     ])?$usuarios['dictas'     ]:array();
   /// leerClase('Notificacion_dicta');
    foreach ($dictas as $dicta_id) 
    {
      $n_obj                      = new Notificacion_dicta();
      $n_obj->dicta_id            = $dicta_id;
      $n_obj->estado_notificacion = self::EST_SV;
      $n_obj->estado              = Objectbase::STATUS_AC;
      $this->notificacion_dicta_objs[] = $n_obj;
    }
    leerClase('Notificacion_tutor');
    //var_dump($usuarios['tutores']);
    //$tutores=$usuarios[0];
    foreach ($tutores as $tutor_id) 
    {
      $n_obj                      = new Notificacion_tutor();
      $n_obj->tutor_id            = $tutor_id;
      if ($proyecto_tutor)
        $n_obj->proyecto_tutor_id = $proyecto_tutor->id;
      $n_obj->estado_notificacion = self::EST_SV;
      $n_obj->estado              = Objectbase::STATUS_AC;

      $this->notificacion_tutor_objs[] = $n_obj;
    }
    leerClase('Notificacion_revisor');
    foreach ($revisores as $revisor_id) 
    {
      $n_obj                      = new Notificacion_revisor();
      $n_obj->revisor_id          = $revisor_id;
      $n_obj->estado_notificacion = self::EST_SV;
      $n_obj->estado              = Objectbase::STATUS_AC;
      $this->notificacion_revisor_objs[] = $n_obj;
    }
    leerClase('Notificacion_estudiante');
    foreach ($estudiantes as $estudiante_id) 
    {
      $n_obj                      = new Notificacion_estudiante();
      $n_obj->estudiante_id       = $estudiante_id;
      $n_obj->estado_notificacion = self::EST_SV;
      $n_obj->estado              = Objectbase::STATUS_AC;
      $this->notificacion_estudiante_objs[] = $n_obj;
    }
    leerClase('Notificacion_tribunal');
    foreach ($tribunales as $tribunal_id) 
    {
      $n_obj                      = new Notificacion_tribunal();
      $n_obj->tribunal_id         = $tribunal_id;
      $n_obj->estado_notificacion = self::EST_SV;
      $n_obj->estado              = Objectbase::STATUS_AC;
      $this->notificacion_tribunal_objs[] = $n_obj;
    }
    leerClase('Notificacion_consejo');
    foreach ($consejos as $consejo_id) 
    {
      $n_obj                      = new Notificacion_consejo();
      $n_obj->consejo_id          = $consejo_id;
      $n_obj->estado_notificacion = self::EST_SV;
      $n_obj->estado              = Objectbase::STATUS_AC;
      $this->notificacion_consejo_objs[] = $n_obj;
    }
    

    $this->save();
    $this->saveAllSonObjects(TRUE);
    
  }
  
  function sendMail() {
    leerClase('Usuario');
    leerClase('Docente');
    leerClase('Tutor');
    leerClase('Notificacion_dicta');
    foreach ($this->notificacion_docente_objs as $notificacion_docente) 
    {
      $docente      = new Docente($notificacion_docente->docente_id);
      $usuario      = $docente->getUsuario();
      $notificacion = $this;
      //enviamos el email
      include DIR_MAILTPL.'/mail_01.php';
    }
    
  }

  /**
   * Retorna todas las notificaciones de cualquier Usuario de cualquier tipo
   * puede ser tutor tribunal docente o estudiante
   * @param type $usuario_id
   * @param string $limit the limit in the sql
   * @param string $orderby the ORDER BY sentence, in the sql
   * @param string $filter  some firlter to the sql, like: KEY LIKE "%"
   * @param bool $just_mysql  if just need myql recurse
   * @return array array(the sql result,the number of afected rows) or (null,0)
   */
  function getTodasNotificaciones($usuario_id,$limit = "",$orderby = "",$filter = "" ,$just_mysql = false)
  {
    
    $activo = Objectbase::STATUS_AC;
    // Ordenamos por prioridad DESC fecha DESC
    if (trim($orderby) == '')
    {
      $orderby = " ORDER BY notificacion.prioridad DESC, notificacion.fecha_envio DESC ";
    }
    

    //Notificaciones si es Revisor
    $sql_revisor = " SELECT n.*  , nr.estado_notificacion "
            . " FROM " 
            . $this->getTableName('Notificacion') . " as n , " 
            . $this->getTableName('Notificacion_revisor') . " as nr , " 
            . $this->getTableName('Revisor') . " as r  "
            . " WHERE "
            . " n.id = nr.notificacion_id  and "
            . " nr.revisor_id = r.id  "
            . " and  r.usuario_id = '$usuario_id' "
            . " and n.estado = '$activo' and  nr.estado = '$activo'  and r.estado = '$activo' ";

    //Notificaiones si es Consejo
    $sql_consejo = " SELECT n.*  , nr.estado_notificacion "
            . " FROM " 
            . $this->getTableName('Notificacion') . " as n , " 
            . $this->getTableName('Notificacion_consejo') . " as nr , " 
            . $this->getTableName('Consejo') . " as r  "
            . " WHERE "
            . " n.id = nr.notificacion_id  and "
            . " nr.consejo_id = r.id  "
            . " and  r.usuario_id = '$usuario_id' "
            . " and n.estado = '$activo' and  nr.estado = '$activo'  and r.estado = '$activo' ";

    //Notificaiones si es Tribunal
    $sql_tribunal = " SELECT n.* , nr.estado_notificacion "
            . " FROM " 
            . $this->getTableName('Notificacion') . " as n , " 
            . $this->getTableName('Notificacion_tribunal') . " as nr , " 
            . $this->getTableName('Tribunal') . " as r , "
            . $this->getTableName('Docente') . " as d  "
            . " WHERE "
            . " n.id = nr.notificacion_id  and "
            . " nr.tribunal_id = r.id  and "
            . " d.id = r.docente_id  and "
            . " d.usuario_id = '$usuario_id' "
            . " and n.estado = '$activo' and  nr.estado = '$activo'  and r.estado = '$activo' ";

    //Notificaiones si es Tutor
    $sql_tutor = " SELECT n.*  , nr.estado_notificacion "
            . " FROM " 
            . $this->getTableName('Notificacion') . " as n , " 
            . $this->getTableName('Notificacion_tutor') . " as nr , " 
            . $this->getTableName('Tutor') . " as r  "
            . " WHERE "
            . " n.id = nr.notificacion_id  and "
            . " nr.tutor_id = r.id  "
            . " and  r.usuario_id = '$usuario_id' "
            . " and n.estado = '$activo' and  nr.estado = '$activo'  and r.estado = '$activo' ";

    //Notificaiones si es Estudiante
    $sql_estudiante = " SELECT n.*  , nr.estado_notificacion "
            . " FROM " 
            . $this->getTableName('Notificacion') . " as n , " 
            . $this->getTableName('Notificacion_estudiante') . " as nr , " 
            . $this->getTableName('Estudiante') . " as r  "
            . " WHERE "
            . " n.id = nr.notificacion_id  and "
            . " nr.estudiante_id = r.id  "
            . " and  r.usuario_id = '$usuario_id' "
            . " and n.estado = '$activo' and  nr.estado = '$activo'  and r.estado = '$activo' ";

    //Notificaiones si es Docente
    $sql_docente = " SELECT n.*  , nr.estado_notificacion "
            . " FROM " 
            . $this->getTableName('Notificacion') . " as n , " 
            . $this->getTableName('Notificacion_dicta') . " as nr , " 
            . $this->getTableName('Dicta') . " as r  ,"
            . $this->getTableName('Docente') . " as d  "
            . " WHERE "
            . " n.id = nr.notificacion_id  and "
            . " r.id = nr.dicta_id  and "
            . " d.id = r.docente_id  and "
            . " d.usuario_id = '$usuario_id' "
            . " and n.estado = '$activo' and nr.estado = '$activo'  and r.estado = '$activo' and d.estado = '$activo' ";
    
    //Juntamos todas las notificaciones, las filtramos y las procesamos
    $sql    = " select * , DATE_FORMAT(fecha_envio,'%d %b %Y') as fecha_envio_toshow " 
            . " FROM ( "
            . " ($sql_revisor) UNION "              // Revisor
            . " ($sql_consejo) UNION "              // Consejo
            . " ($sql_tutor) UNION "                // Tutor
            . " ($sql_tribunal) UNION "             // Tribunal
            . " ($sql_estudiante) UNION "           // Estudiante
            . " ($sql_docente) ) as notificacion "  // Docente
            . " WHERE 1 "                           // 
            . " $filter $orderby $limit ";          // Limites y lineamientos!
    

    $result = mysql_query($sql);
    if (!$result)
      return array(false,0,$sql);
    if ($just_mysql)
      return $result;
    $num_rows = mysql_num_rows($result);
    return array($result,$num_rows,$sql);
  }
  
  /**
   * retorna todas las notificaciones  de un docente  tribunal  dado el id del usuario
   * @param type $iddocente
   * @return Tribunal
   */
  function getNotificacionTribunal($usuario_id) 
  {
    leerClase('Tribunal');
    $activo = Objectbase::STATUS_AC;
    /**
    select  t.*
                                                                                                                                                                                                    from   `docente`  d, `tribunal`  t, `notificacion_tribunal`  nt
                                                                                                                                                                                                    where d.`id`=t.`docente_id`  and t.`id`=nt.`tribunal_id` and nt.`notificacion_id`=1  and d.`usuario_id`=5     */
   
    $sql = "select t.* from " . $this->getTableName('Tribunal') . " as t , " . $this->getTableName('Notificacion_tribunal') . " as nt , " . $this->getTableName('Docente') . " as d  where d.id=t.docente_id  and t.id=nt.tribunal_id and t.docente_id= d.id and nt.notificacion_id='$this->id' and  d.usuario_id='$usuario_id' and t.estado = '$activo' and  nt.estado = '$activo'  and d.estado = '$activo'";
    $resultado = mysql_query($sql);

    // var_dump($resultado);
    if (!$resultado) 
      return false;
    while ($fila = mysql_fetch_array($resultado, MYSQL_ASSOC)) 
    {
      $tribunal = new Tribunal($fila);
    }
    
    return  $tribunal;
  }
  
  
  /**
   * retorna todas las notificaciones  de un docente  tribunal  dado el id del usuario
   * @param type $iddocente
   * deprecated!
   */
  function getProyectoTutor($usuario_id) 
  {
    leerClase('Proyecto_tutor');
     $activo = Objectbase::STATUS_AC;
    /**
    select  t.*
                                                                                                                                                                                                    from   `docente`  d, `tribunal`  t, `notificacion_tribunal`  nt
                                                                                                                                                                                                    where d.`id`=t.`docente_id`  and t.`id`=nt.`tribunal_id` and nt.`notificacion_id`=1  and d.`usuario_id`=5     */
   
    $sql = "select pt.* from " . $this->getTableName('Proyecto_tutor') . " as pt , " . $this->getTableName('Notificacion_tutor') . " as nt , " . $this->getTableName('Tutor') . " as t  where   pt.proyecto_id='$this->proyecto_id'  and  nt.notificacion_id='$this->id' nt.tutor_id=t.id and t.id=pt.tutor_id  and nt.estado_notificacion='SV' and  t.usuario_id='$usuario_id' and t.estado = '$activo' and  nt.estado = '$activo'  and t.estado = '$activo'";
    $resultado = mysql_query($sql);

    // var_dump($resultado);
    if (!$resultado) 
      return false;
      while ($fila = mysql_fetch_array($resultado, MYSQL_ASSOC)) 
      {

       $proyectotutor= new Proyecto_tutor($fila);
      }
    
    return   $proyectotutor;
  }
  
  
  
  
  

  /**
   * retorna todas las notificaciones no visto de un estudiante dado el id del usuario
   * del estudiante
   * 
   * @param type $idusuario
   */
  function getNotificacionEstudiante($idusuario) {
    leerClase('Notificacion');
    $notificacion = array();
    $activo = Objectbase::STATUS_AC;
    /**
     * select  n.*
      from  `notificacion`  n, `notificacion_estudiante`  ne , `estudiante`  e
      where  n.`id`=ne.`notificacion_id`  and ne.`estudiante_id`=e.`id` and ne.`estado_notificacion`='SV' and e.`usuario_id`=1                                                                                                           where   n.`id`=nt.`notificacion_id`  and nt.`tutor_id`= t.`id`  and nt.`estado_notificacion`='SV' and t.`usuario_id`=1
     */
    $vars = 0;
    $sql = "select n.* from " . $this->getTableName('Notificacion') . " as n , " . $this->getTableName('notificacion_estudiante') . " as ne , " . $this->getTableName('estudiante') . " as e where  n.id=ne.notificacion_id  and ne.estudiante_id=e.id and  ne.estado_notificacion='SV' and  e.usuario_id='$idusuario' and n.estado = '$activo' and  ne.estado = '$activo'  and e.estado = '$activo'";
    $resultado = mysql_query($sql);
    if ($resultado)
      while ($fila = mysql_fetch_array($resultado, MYSQL_ASSOC)) {

        $vars = $vars + 1;
        $notificacion[] = new Notificacion($fila);
      }

    return $notificacion;
  }

  /**
   * Retorna todas las  notificaciones q se enviaron al consejo
   * 
   * @param type $idusuario
   * @return \Notificacion
   */
  function getNotificacionConsejo($idusuario) {

    leerClase('Notificacion');
    $notificacion = array();
    $activo = Objectbase::STATUS_AC;
    $vars = 0;/**
     * select  n.*
      from  `notificacion`  n , `notificacion_consejo`  nc, `consejo`  c
      where   n.`id`= nc.`notificacion_id`  and nc.`consejo_id`= c.`id`  and nc.`estado_notificacion`='SV' and nc.`estado`='AC' and  c.`estado`='AC' and n.`estado`='AC' and c.`usuario_id`=2
     * 
     */
    $sql = "select n.* from " . $this->getTableName('Notificacion') . " as n , " . $this->getTableName('Notificacion_consejo') . " as nc , " . $this->getTableName('Consejo') . " as e where  n.id= nc.notificacion_id  and nc.consejo_id= c.id and  nc.estado_notificacion='SV' and  c.usuario_id='$idusuario'and n.estado = '$activo' and  nc.estado = '$activo'  and c.estado = '$activo'";
    /**
      $sql="select  n.*
      from  notificacion  n , notificacion_consejo  nc, consejo  c
      where   n.id= nc.notificacion_id  and nc.consejo_id= c.id  and nc.estado_notificacion='SV' and nc.estado='AC' and  c.estado='AC' and n.estado='AC' and c.usuario_id=2;";
     */
    $resultado = mysql_query($sql);
    if ($resultado) {
      while ($fila = mysql_fetch_array($resultado, MYSQL_ASSOC)) {

        $vars = $vars + 1;
        $notificacion[] = new Notificacion($fila);
      }
    }
    echo sizeof($notificacion);
    return $vars;
  }

  /**
   * retorna todas  las notificaciones de un tutor dado el id del usuario
   * 
   * @param type $idusuario
   */
  function getNotificacionTutor($idusuario) {
    leerClase('Notificacion');
    $notificacion = array();
    $activo = Objectbase::STATUS_AC;
    /**
     * select n.*
      from  `notificacion` n, `notificacion_tutor`  nt , `tutor`  t
      where   n.`id`=nt.`notificacion_id`  and nt.`tutor_id`= t.`id`  and nt.`estado_notificacion`='SV' and t.`usuario_id`=1
     */
    $vars = 0;
    $sql = "select n.* from " . $this->getTableName('Notificacion') . " as n , " . $this->getTableName('Notificacion_tutor') . " as nt , " . $this->getTableName('Tutor') . " as t where n.id=nt.notificacion_id  and nt.tutor_id= t.id and  nt.estado_notificacion='SV' and  t.usuario_id='$idusuario' and n.estado = '$activo' and  nt.estado = '$activo'  and t.estado = '$activo'";
    $resultado = mysql_query($sql);
    if ($resultado) {
      while ($fila = mysql_fetch_array($resultado, MYSQL_ASSOC)) {

        $vars = $vars + 1;
        $notificacion[] = new Notificacion($fila);
      }
    }
    return $notificacion;
  }

  /**
   * 
   * @param type $idusuario
   * 
   */
  function getNotificacionDicta($idusuario) {
    leerClase('Usuario');
    $usuario = new Usuario($idusuario);
    $notificaciondicta = array();

    foreach ($usuario->docente_objs as $docen) {
      $dicta = new Dicta();
      foreach ($docen->dicta_objs as $dicta) {
        $dicta->getAllObjects();
        $dicta->notificacion_dicta_objs;
        foreach ($dicta->notificacion_dicta_objs as $notidicta) {
          if ($notidicta->estado_notificacion = 'SV') {
            $notificaciondicta[] = $notidicta;
          }
        }
      }
    }
    return $notificaciondicta;
  }
  
  
  /**
   * Inicia el filtro para las notificaciones
   * @param Filtro $filtro el fitro que se usara
   */
  function iniciarFiltro(&$filtro) {

    if (isset($_GET['order']))
      $filtro->order($_GET['order']);
    $filtro->nombres[] = 'Estado';
    $filtro->valores[] = array ('select','estado_notificacion'  ,$filtro->filtro('estado_notificacion'),
        array(''      ,'SV'          , 'VI'       , 'AR'         ),
        array('Todos' ,'Sin Revisar' , 'Revisados', 'Archivados' ));
    $filtro->nombres[] = 'Tipo Mensaje';
    $filtro->valores[] = array ('select','tipo'  ,$filtro->filtro('tipo'),
        array(''      , self::TIPO_MENSAJE  , self::TIPO_TIEMPO   , self::TIPO_ASIGNACION  ),
        array('Todos' ,'Normal'             ,'Fin de Plazo'       ,'Asignaci&oacute;n'     ));
    $filtro->nombres[] = 'Asunto';
    $filtro->valores[] = array('input', 'asunto', $filtro->filtro('asunto'));
    $filtro->nombres[] = 'Mensaje';
    $filtro->valores[] = array('input', 'detalle', $filtro->filtro('detalle'));
  }

  /**
   * Devuelve el order para el SQL
   * @param array $order_array arreglo con las claves para el order
   * @return string
   */
  function getOrderString(&$filtro) {
    $order_array = array();
    $order_array['id']                  = " {$this->getTableName()}.id ";
    $order_array['tipo']                = " {$this->getTableName()}.tipo ";
    $order_array['asunto']              = " {$this->getTableName()}.asunto ";
    $order_array['detalle']             = " {$this->getTableName()}.detalle ";
    $order_array['fecha_envio']         = " {$this->getTableName()}.fecha_envio ";
    $order_array['prioridad']           = " {$this->getTableName()}.prioridad ";
    $order_array['estado']              = " {$this->getTableName()}.estado ";
    $order_array['estado_notificacion'] = " {$this->getTableName()}.estado_notificacion "; // un poco de codigo hard aca
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
    if ($filtro->filtro('estado_notificacion'))
      $filtro_sql .= " AND {$this->getTableName()}.estado_notificacion like '%{$filtro->filtro('estado_notificacion')}%' ";
    if ($filtro->filtro('detalle'))
      $filtro_sql .= " AND {$this->getTableName()}.detalle like '%{$filtro->filtro('detalle')}%' ";
    if ($filtro->filtro('asunto'))
      $filtro_sql .= " AND {$this->getTableName()}.asunto like '%{$filtro->filtro('asunto')}%' ";
    if ($filtro->filtro('tipo'))
      $filtro_sql .= " AND {$this->getTableName()}.tipo like '%{$filtro->filtro('tipo')}%' ";
    return $filtro_sql;
  }
  
  
} 
