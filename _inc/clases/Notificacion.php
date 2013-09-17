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

 /**
  * Codigo identificador del Del proyecto
  * @var INT(11)
  */
  var $proyecto_id;
  

 /**
  * Tipo de notificacion
  * Mensaje normal, Mensaje de tiempo se acaba, y otros 
  * consultad contantes
  * @var VARCHAR(45)
  */
  var $tipo;

  

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
  */
  var $estado_notificacion;

  
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
   * Manda una notificacion a todos los actores de un proyecto
   */
  function notificarTodos() 
  {
    $proyecto = new Proyecto($this->proyecto_id);
    $proyecto->getAllObjects();
    $this->notificarEstudiantes($proyecto);
    $this->notificarDictas($proyecto);
    $this->notificarTutores($proyecto);
    $this->notificarTribunales($proyecto);
    $this->notificarRevisores($proyecto);
  }
  
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
   */
  
  function enviarNotificaion($usuarios /*$dictas,$estudiantes,$tutores,$tribunales,$revisores,$consejos*/)
  {
    $estudiantes = isset($usuarios['estudiantes'])?$usuarios['estudiantes']:array();
    $tribunales  = isset($usuarios['tribunales' ])?$usuarios['tribunales' ]:array();
    $revisores   = isset($usuarios['revisores'  ])?$usuarios['revisores'  ]:array();
    $consejos    = isset($usuarios['consejos'   ])?$usuarios['consejos'   ]:array();
    $tutores     = isset($usuarios['tutores'    ])?$usuarios['tutores'    ]:array();
    $dictas      = isset($usuarios['dictas'     ])?$usuarios['dictas'     ]:array();

    leerClase('Notificaion_dicta');
    foreach ($dictas as $dicta_id) 
    {
      $n_obj             = new Notificacion_dicta();
      $n_obj->docente_id = $dicta_id;
      $this->notificacion_dicta_objs[] = $n_obj;
    }
    leerClase('Notificaion_tutor');
    foreach ($tutores as $tutor_id) 
    {
      $n_obj           = new Notificacion_tutor();
      $n_obj->tutor_id = $tutor_id;
      $this->notificacion_tutor_objs[] = $n_obj;
    }
    leerClase('Notificacion_revisor');
    foreach ($revisores as $revisor_id) 
    {
      $n_obj             = new Notificacion_revisor();
      $n_obj->revisor_id = $revisor_id;
      $this->notificacion_revisor_objs[] = $n_obj;
    }
    leerClase('Notificacion_estudiante');
    foreach ($estudiantes as $estudiante_id) 
    {
      $n_obj                = new Notificacion_estudiante();
      $n_obj->estudiante_id = $estudiante_id;
      $this->notificacion_estudiante_objs[] = $n_obj;
    }
    leerClase('Notificacion_tribunal');
    foreach ($tribunales as $tribunal_id) 
    {
      $n_obj               = new Notificacion_tribunal();
      $n_obj->tribunal_id  = $tribunal_id;
      $this->notificacion_tribunal_objs[] = $n_obj;
    }
    leerClase('Notificacion_consejo');
    foreach ($consejos as $consejo_id) 
    {
      $n_obj               = new Notificacion_consejo();
      $n_obj->consejo_id   = $consejo_id;
      $this->notificacion_consejo_objs[] = $n_obj;
    }
    $this->estado_notificacion = self::EST_NOLEIDO;
    $this->save();
    $this->saveAllSonObjects();
    
  }
  
  function sendMail() {
    leerClase('Usuario');
    leerClase('Docente');
    leerClase('Tutor');
    leerClase('Notificacion_docente');
    foreach ($this->notificacion_docente_objs as $notificacion_docente) 
    {
      $docente      = new Docente($notificacion_docente->docente_id);
      $usuario      = $docente->getUsuario();
      $notificacion = $this;
      //enviamos el email
      include DIR_MAILTPL.'/mail_01.php';
    }
    
  }
} 
