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
leerClase('Fecha_registro');
$semestre = new Semestre();
$semestre->getActivo();

// Del cronograma  principal
if ( isset($_GET['year']) && isset($_GET['month']) && isset($_GET['day']) )
{
  $cronograma              = new Cronograma();
  $cronograma->semestre_id = $semestre->id;
          
          
  $evento = new Evento();
  $evento->estado = 'AC';
  
  $fecharegistro=new Fecha_registro();
  $fecharegistro->semestre_id = $semestre->id;
  
  
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
    $filter2     = " AND #tabla#.fecha_inicio  >=  '{$date_start}' AND #tabla#.fecha_inicio  <=  '{$date_end}' ";
    $filter1     = " AND #tabla#.fecha_fin  >=  '{$date_start}' AND #tabla#.fecha_fin  <=  '{$date_end}' ";
   
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
  
   //Para fechas de registro de Perfil Fecha inicio
  $limitFormu1 = str_replace( '#tabla#',$fecharegistro->getTableName(), $limit2);
  $orderFormu1   = str_replace( '#tabla#',$fecharegistro->getTableName(), $order2);
  $filterFormu1  = str_replace( '#tabla#',$fecharegistro->getTableName(), $filter2);
  $respFormu1    = $fecharegistro->getAll($limitFormu1, $orderFormu1, $filterFormu1);
 
  if ($respFormu1[0])
  while ($row = mysql_fetch_array($respFormu1[0])) 
  {
  	$rsal .= <<<______SALIDAS
      \n{ "date": "{$row['fecha_inicio']} 08:00:00", "type": "Evento", "title": "Inicio Registro de Formulario Perfil", "description": "{$row['descripcion']}", "url": "" },
______SALIDAS;
  }
  
  //Para fechas de registro de Perfil Fecha Fin
  $limitFormu = str_replace( '#tabla#',$fecharegistro->getTableName(), $limit);
  $orderFormu   = str_replace( '#tabla#',$fecharegistro->getTableName(), $order1);
  $filterFormu  = str_replace( '#tabla#',$fecharegistro->getTableName(), $filter1);
  $respFormu    = $fecharegistro->getAll($limitFormu, $orderFormu, $filterFormu);
 
  if ($respFormu[0])
  while ($row = mysql_fetch_array($respFormu[0])) 
  {
  	$rsal .= <<<______SALIDAS
      \n{ "date": "{$row['fecha_fin']} 08:00:00", "type": "Evento", "title": "Fecha Limite Registro de Formulario Perfil", "description": "{$row['descripcion']}", "url": "" },
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