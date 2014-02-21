<?php
header('Content-type: text/json');
require('../_inc/_sistema.php');
conectar_db();
leerClase("Evento");
leerClase("Semestre");
leerClase("Cronograma");
leerClase('Estudiante');
leerClase('Dicta');
leerClase('Docente');
leerClase('Materia');
$semestre = new Semestre();
$semestre->getActivo();

// Del cronograma  principal
if ( isset($_GET['year']) && isset($_GET['month']) && isset($_GET['day']) )
{
  $cronograma              = new Cronograma();
  $cronograma->semestre_id = $semestre->id;
          
          
  $evento = new Evento();
  $evento->estado = 'AC';
  $filter = '';
  $order  = '';
  $limit  = '';
  $rsal   = '';
  if ( isset($_GET['limit']) && $_GET['limit'] )
    $limit  = " limit {$_GET['limit']} ";
    
  if ( $_GET['year'] && $_GET['month'] && $_GET['day'] )
  {
    $month      = $_GET['month'] + 1;
    $cronograma->fecha_evento = "{$_GET['day']}/{$month}/{$_GET['year']}";
    $evento->fecha_evento     = "{$_GET['day']}/{$month}/{$_GET['year']}";
  }
  // para un solo mes
  elseif ( $_GET['year'] && $_GET['month'] && !$_GET['day'] )
  {
    $month      = $_GET['month']+1;
    $year       = $_GET['year'];
    $day        = date('d',  mktime(0, 0, 0, $month, 1, $year));
    $day_end    = date('t',  mktime(0, 0, 0, $month, 1, $year));
    $date_start = Objectbase::dateHumanToSQl("{$day}/{$month}/{$year}");
    $date_end   = Objectbase::dateHumanToSQl("{$day_end}/{$month}/{$year}");
    $filter     = " AND #tabla#.fecha_evento  >=  '{$date_start}' AND #tabla#.fecha_evento  <=  '{$date_end}' ";

    }
  // para la primera carga de pagina
  else
  {
    $order      = ' ORDER BY #tabla#.fecha_evento ASC ';
    $month      = date('m');
    $year       = date('Y');
    $day        = date('d',  mktime(0, 0, 0, $month, 1, $year));
    $date_start = Objectbase::dateHumanToSQl("{$day}/{$month}/{$year}");
    $filter     = " AND #tabla#.fecha_evento  >=  '{$date_start}' ";
  }
  // Para el cronograma general
  $limitCrono  = str_replace( '#tabla#',$cronograma->getTableName(), $limit);
  $orderCrono  = str_replace( '#tabla#',$cronograma->getTableName(), $order);
  $filterCrono = str_replace( '#tabla#',$cronograma->getTableName(), $filter);
  $respCrono   = $cronograma->getAll($limitCrono, $orderCrono, $filterCrono);
  if ($respCrono[0])
  while ($row = mysql_fetch_array($respCrono[0])) 
  {
  	$rsal .= <<<______SALIDAS
      \n{ "date": "{$row['fecha_evento']} 08:00:00", "type": "Evento", "title": "{$row['nombre_evento']}", "description": "{$row['detalle_evento']}", "url": "" },
______SALIDAS;
  }
  // Si es estudiante para todas las materias que tiene inscrito
  if(isEstudianteSession())
  {
    $estudiante = getSessionEstudiante();
    $estudiante->getAllObjects();
    $evento = new Evento();
    $evento->estado = 'AC';
    $limitEvent  = str_replace( '#tabla#',$evento->getTableName(), $limit);
    $orderEvent  = str_replace( '#tabla#',$evento->getTableName(), $order);
    $filterEvent = str_replace( '#tabla#',$evento->getTableName(), $filter);

    foreach ($estudiante->inscrito_objs as $inscrito) 
    {
      $evento->dicta_id = $inscrito->dicta_id;
      $dicta            = new Dicta($inscrito->dicta_id);
      $materia          = new Materia($dicta->materia_id);
      $respEvent   = $evento->getAll($limitEvent, $orderEvent, $filterEvent);
      if ($respEvent[0])
      while ($row = mysql_fetch_array($respEvent[0])) 
      {
        $rsal .= <<<________SALIDAS
          \n{ "date": "{$row['fecha_evento']} 08:00:00", "type": "Evento", "title": "{$materia->nombre}: {$row['asunto']}", "description": "{$materia->nombre} [{$materia->sigla}]:{$row['descripcion']}", "url": "" },
________SALIDAS;
      }
    }
  }
  // Si es docente para todas las materias que dicta
  if(isDocenteSession())
  {
    $docente    = getSessionDocente();
    $docente->docente_id;
    $docente->getAllObjects();

    $evento = new Evento();
    $evento->estado = 'AC';
    $limitEvent  = str_replace( '#tabla#',$evento->getTableName(), $limit);
    $orderEvent  = str_replace( '#tabla#',$evento->getTableName(), $order);
    $filterEvent = str_replace( '#tabla#',$evento->getTableName(), $filter);

    foreach ($docente->dicta_objs as $dicta) 
    {
      $evento->dicta_id = $dicta->id;
      $materia          = new Materia($dicta->materia_id);
      $respEvent   = $evento->getAll($limitEvent, $orderEvent, $filterEvent);
      if ($respEvent[0])
      while ($row = mysql_fetch_array($respEvent[0])) 
      {
        $rsal .= <<<________SALIDAS
          \n{ "date": "{$row['fecha_evento']} 08:00:00", "type": "Evento", "title": "{$materia->nombre}: {$row['asunto']}", "description": "{$materia->nombre} [{$materia->sigla}]:{$row['descripcion']}", "url": "" },
________SALIDAS;
      }
    }
  }
  $rsal = rtrim($rsal, ',');
  echo "[{$rsal}]";
}


?>