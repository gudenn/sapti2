<?php
/**
 * Esta clase es para guardar los tribunales de cada proyecto
 */
class Automatico extends Objectbase 
{ 
 /**
  * Id del tribunal
  * @var INT(11)
  */
  var $area_id;
  
 /**
  * Id del docente
  * @var INT(11)
  */
  var $docente_id;
  
  
 /**
  * Id del docente
  * @var INT(11)
  */
  var $valor;

  
 /**
  * Id del docente
  * @var INT(11)
  */
  var $numero_aceptados;
  /** 
   * el constructor con el parametro de id docente
   * para sumar puntos a los docentes
   * 
   * @param type $id
   * @param type $docente_id
   * @return type
   * 
   */
  public function __construct($id = '',$docente_id = false) {
    if ($docente_id != '')
    {
      $activo = Objectbase::STATUS_AC;

      $sql = "select * from " . $this->getTableName() . " where docente_id = '$docente_id' AND estado = '$activo'";
      //echo $sql;
      $resultado = mysql_query($sql);
      if (!$resultado)
        return;
      $fila = mysql_fetch_array($resultado, MYSQL_ASSOC);
        $id = $fila['id'];
    }
    parent::__construct($id);
  }
  
  function getListaParaProyecto($proyecto_id) {
    leerClase('Proyecto');
    $proyecto = new Proyecto($proyecto_id);
    $proyecto->getAllObjects();
    // vaciamos la tabla
    $this->iniciarTablaAutomatico();
    $this->ingresarDocentes();
    //dar valor por area
    $this->darPuntosPorArea($proyecto);
    //dar valor por horarios
    $this->darPuntosPorHorario();
    // aumentamos o reducioms por veces asignados
    $this->darPuntosPorAsignado();

    
  } 
  
  /**
   * Damos valores por el area a los docentes en automatico
   * @param Proyecto $proyecto
   */
  function darPuntosPorArea($proyecto)
  {
    //var_dump($proyecto);
    leerClase('Semestre');
    $semestre = new Semestre();
    $puntos   = $semestre->getValor('Puntos por area', 100);
    //para cada area del proyecto agregamos un x puntos a los docentes
    foreach ($proyecto->proyecto_area_objs as $proyecto_area) {
      
      $sql  = "SELECT * FROM apoyo WHERE area_id = '{$proyecto_area->area_id}' ";
      $resp = mysql_query($sql); 
      if (!$resp)
        return false;
      
      while ($row = mysql_fetch_array($resp)) {
        $this->aumentarPuntosDocente($row['docente_id'], $puntos);
      }
    }
  }
  
  /**
   * aumentamos puntos segun las coinsidencias de horario
   * @return boolean
   */
  function darPuntosPorHorario() {
    leerClase('Semestre');
    $semestre = new Semestre();
    $puntos   = $semestre->getValor('Puntos por horario', 10);
    $sql  = "SELECT count(hd.docente_id) as total, hd.hora_id FROM `horario_docente` as hd , hora as h WHERE hd.hora_id = h.id GROUP BY hora_id ORDER BY  total DESC  ";
    $resp = mysql_query($sql); 
    if (!$resp)
      return false;

    while ($row = mysql_fetch_array($resp)) {
      if ($row['total'] <= 1 )
        continue;
      $puntos_aumentar = $puntos * $row['total'];
      $sql = "SELECT * FROM  `horario_docente` WHERE  `hora_id` =  '{$row['hora_id']}' ";
      $resp = mysql_query($sql); 
      if ($resp)
      {
        while ($row1 = mysql_fetch_array($resp)) {
          $this->aumentarPuntosDocente($row1['docente_id'], $puntos_aumentar);
        }
      }
    }    
  }
  
  /**
   * Damos valores por el veces asignado
   */
  function darPuntosPorAsignado()
  {
    //aumentamos puntos a los que no tienes asignacion
    leerClase('Semestre');
    $semestre = new Semestre();
    $puntos   = $semestre->getValor('Puntos por no asignado', 50);
    
    //buscamos todos los docentes que hayan sido tribunales este semestre
    $sql  = " SELECT id as docente_id FROM docente WHERE id NOT IN ( SELECT docente_id FROM tribunal Where semestre = '{$semestre->codigo}' ) ";
    $resp = mysql_query($sql); 
    if ($resp)
    {
      while ($row1 = mysql_fetch_array($resp)) {
        $this->aumentarPuntosDocente($row1['docente_id'], $puntos);
      }
    }
    //disminuimos puntos a los que tienen asignacion
    leerClase('Semestre');
    $semestre = new Semestre();
    $puntos   = $semestre->getValor('Puntos menos por ya asignado', '-6');
    
    //buscamos todos los docentes que hayan sido tribunales este semestre
    $sql  = " SELECT docente_id FROM tribunal Where semestre = '{$semestre->codigo}'  ";
    $resp = mysql_query($sql); 
    if ($resp)
    {
      while ($row1 = mysql_fetch_array($resp)) {
        $this->aumentarPuntosDocente($row1['docente_id'], $puntos);
      }
    }
    return;
  }
  
  /**
   * Aumentamos puntos a un docente por x motivo
   * @param type $docente_id
   * @param type $puntos
   */
  function aumentarPuntosDocente($docente_id ,$puntos = 10) {
    $automatico = new Automatico('',$docente_id);
    $automatico->valor = $automatico->valor + $puntos;
    $automatico->save();
  }

  /**
   * Iniciamos la tabla automatico
   */
  function iniciarTablaAutomatico() {
    $sqldelite = 'DELETE FROM automatico';
    mysql_query($sqldelite);
    
  }
  
  /**
   * Ingresamos todos los docentes en la tabla de automatico 
   * para presentarlos como una lista despues
   */
  function ingresarDocentes() {
    $sql = " INSERT INTO automatico 
             (            `docente_id` , `area_id` , `valor` , `numero_aceptados` , `estado` )
             SELECT id as docente_id   , 0         , 0       , 0                  ,'AC' 
             FROM docente where estado = 'AC'  ";
    mysql_query($sql);
  }
  
  
  
}

?>