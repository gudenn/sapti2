<?php
/**
* @author          Guyen Campero<guyencu@gmail.com>
* @version         0.13.0.02
*/
class Notificacion extends Objectbase
{

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
  var $notificacion_docente_objs;  
  
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
   * Envio de mensajes para el sistema
   * 
   * @param string $mensaje
   * @param Objetos $docentes
   * @param Objetos $estudiantes
   * @param Objetos $tutores
   * @param Objetos $tribunales
   * @param Objetos $revisores
   * @param Objetos $consejos
   */
  function enviar($mensaje,$docentes,$estudiantes,$tutores,$tribunales,$revisores,$consejos) 
  {
    leerClase('Notificacion_docente');
    foreach ($docentes as $docente_id) 
    {
      $n_obj             = new Notificacion_docente();
      $n_obj->docente_id = $docente_id;
      $this->notificacion_docente_objs[] = $n_obj;
    }
    leerClase('Notificacion_tutor');
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
    /* Pendiente Tribunal
    leerClase('Notificacion_tribunal');
    foreach ($tribunales as $tribunal_id) 
    {
      $n_obj               = new Notificacion_tribunal();
      $n_obj->tribunal_id  = $tribunal_id;
      $this->notificacion_tribunal_objs[] = $n_obj;
    }
    */
    leerClase('Notificacion_consejo');
    foreach ($consejos as $consejo_id) 
    {
      $n_obj               = new Notificacion_consejo();
      $n_obj->consejo_id   = $consejo_id;
      $this->notificacion_consejo_objs[] = $n_obj;
    }
    $this->detalle = $mensaje;
    $this->estado_notificacion = self::EST_NOLEIDO;
    $this->save();
    $this->saveAllSonObjects();
    
  }
} 
