<?php
/**
 * Esta clase es para guardar los datos tipo Estudiante
 *
 * @author Guyen Campero <guyencu@gmail.com>
 */
class Proyecto extends Objectbase 
{

  /** constant to add in the begin of the key to find the date values   */
  const URL                  = "proyecto-final/";
  /** constant to add in the begin of the key to find the date values   */
  const ARCHIVO_PATH         = "archivo";
  /** constant to add in the begin of the key to find the date values   */
  const ARCHIVO_PREFOLDER    = "proyecto_";
  /** constant to add in the begin of the key to find the date values   */
  const ARCHIVO_CORRECIONES  = "/CORRECIONES";

  /** Constante para el tipo de trabajo en grupo o en conjunto  */
  const TRABAJO_CONJUNTO_SI  = "TC";
  /** Constante para el tipo de trabajo solo */
  const TRABAJO_CONJUNTO_NO  = "TS";


 /**
  * Codigo iden de la carrera
  * @var INT(11)
  */
  var $carrera_id;

 /**
  * Nombre del proyecto
  * @var VARCHAR(300)
  */
  var $nombre;

  
 /**
  * Numero asignado al proyecto
  * @var VARCHAR(45)
  */
  var $numero_asignado;
  
 /**
  * titulo del proyecto
  * @var TEXT
  */
  var $titulo;
  
 /**
  * Objetivo General del proyecto
  * @var TEXT
  */
  var $objetivo_general;
  
 /**
  * descripcion del proyecto
  * @var TEXT
  */
  var $descripcion;
  
 /**
  * Si es trabajo conjunto (TC) o no (TS) consultar constantes de esta  clase
  * @var VARCHAR(2)
  */
  var $trabajo_conjunto;

 /**
  * director_carrera que aprobo el inicio del proyecto
  * @var VARCHAR(300)
  */
  var $director_carrera;

 /**
  * docente_materia que aprobo el inicio del proyecto
  * @var VARCHAR(300)
  */
  var $docente_materia;

 /**
  * Fecha que se aprobo el inicio del proyecto
  * @var VARCHAR(300)
  */
  var $fecha_registro;

 /**
  * Quien registro el proyecto
  * @var VARCHAR(300)
  */
  var $registrado_por;

 /**
  * Quien es reponsable por el proyecto en caso de adcripcion o trabajo dirigido
  * @var VARCHAR(300)
  */
  var $responsable;

 /**
  * (Objeto simple)  Todos los Objetivos Especificos del proyecto
  * @var object|null 
  */
  var $objetivo_especifico_objs;

 /**
  * (Objeto simple) todas las reviciones que tiene este proyecto
  * @var object|null 
  */
  var $revision_objs;


 /**
  * (Objeto simple) Todos los proyecto_estudiante que tiene este proyecto
  * @var object|null 
  */
  var $proyecto_estudiante_objs;

 /**
  * (Objeto simple) Todos los proyecto_docente que tiene este proyecto
  * @var object|null 
  */
  var $proyecto_dicta_objs;

 /**
  * (Objeto simple) Todos los proyecto_tutor que tiene este proyecto
  * @var object|null 
  */
  
  
  var $proyecto_tutor_objs;

 /**
  * (Objeto simple) Todos los proyecto_revisor que tiene este proyecto
  * @var object|null 
  */
  var $proyecto_revisor_objs;

 /**
  * (Objeto simple) Todos los tribunales que tiene este proyecto
  * @var object|null 
  */
  var $tribunal_objs;

 /**
  * (Objeto simple) Todas las areas asignadas a este proyecto
  * @var object|null 
  */
  var $proyecto_area_objs;

 /**
  * (Objeto simple) Todas las subareas asignadas a este proyecto
  * @var object|null 
  */
  var $proyecto_sub_area_objs;

  
  
  
  
  
  /**
   * 
   * @param string $codigo_sis el codigo_sis
   * @param type $verSiEstaDisponible para solo verificar si es que se puede usar este email
   * @return boolean
   * @throws Exception 
   */
 
  
  function getProyectoAprobados()
  {
    //@TODO revisar
    //leerClase('Proyecto_area');
    leerClase('Area');
    
    $activo = Objectbase::STATUS_AC;
   $sql = "select p.* from ".$this->getTableName('Proyecto_estudiante')." as pe , ".$this->getTableName('Proyecto')." as p   where pe.estudiante_id = '$this->id' and pe.proyecto_id = p.id and pe.estado = '$activo' and p.estado = '$activo'  ";
   
 //$sql = "select a.* from ".$this->getTableName('Proyecto_area')." as pa , ".$this->getTableName('Area')." as a   where pa.proyecto_id = '$this->id' and pa.area_id = a.id and pa.estado = '$activo' and a.estado = '$activo'  ";
      
//echo $sql;
    $resultado = mysql_query($sql);
    if (!$resultado)
      return false;
    $proyecto = mysql_fetch_array($resultado);
    $proyecto = new Proyecto($proyecto);
    return $proyecto;
  }
  
    function getProyectoAsignados()
  {
   //leerClase('Proyecto');
    $activo = Objectbase::STATUS_AC;
   // $sql = "select p.* from ".$this->getTableName('Proyecto_estudiante')." as pe , ".$this->getTableName('Proyecto')." as p   where pe.estudiante_id = '$this->id' and pe.proyecto_id = p.id and pe.estado = '$activo' and p.estado = '$activo'  ";
   
 $sql = "select p.* from ".$this->getTableName('Proyecto_estudiante')." as pe , ".$this->getTableName('Proyecto')." as p   where pe.estudiante_id = '$this->id' and pe.proyecto_id = p.id and pe.estado = '$activo' and p.estado = '$activo'  ";
      
//echo $sql;
    $resultado = mysql_query($sql);
    if (!$resultado)
      return false;
    $proyecto = mysql_fetch_array($resultado);
    var_dump($proyecto);
    $proyecto = new Proyecto($proyecto);
    return $proyecto;
  }
  
  function getFolder()
  {
    return self::ARCHIVO_PREFOLDER.$this->id;
    
  }
  
  
   function getArea()
    {
    //@TODO revisar
   //  leerClase('Proyecto_area');
    leerClase('Area');
    
    $activo = Objectbase::STATUS_AC;
   $sql = "select a.* from ".$this->getTableName('Proyecto_area')." as pa , ".$this->getTableName('Area')." as a   where pa.proyecto_id = '$this->id' and pa.area_id = a.id and pa.estado = '$activo' and a.estado = '$activo'  ";
     $resultado = mysql_query($sql);
    if (!$resultado)
      return false;
    $areas = mysql_fetch_array($resultado);
    $area = new Area($areas);
    return $area;
    }
  
  
  
}

?>