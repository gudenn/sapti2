<?php
header('Content-type: text/json');
require('../_inc/_sistema.php');
conectar_db();
leerClase("Evento");
leerClase("Semestre");
leerClase("Cronograma");
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
  $limitCrono  = str_replace( '#tabla#',$cronograma->getTableName(), $limit);
  $orderCrono  = str_replace( '#tabla#',$cronograma->getTableName(), $order);
  $filterCrono = str_replace( '#tabla#',$cronograma->getTableName(), $filter);
  $respCrono   = $cronograma->getAll($limitCrono, $orderCrono, $filterCrono);
  if ($respCrono[0])
  while ($row = mysql_fetch_array($respCrono[0])) 
  {
  	$rsal .= <<<______SALIDAS
      \n{ "date": "{$row['fecha_evento']} 08:00:00", "type": "Evento", "title": "{$row['fecha_evento']}", "description": "{$row['detalle_evento']}", "url": "" },
______SALIDAS;
  }
  $limitCrono  = str_replace( '#tabla#',$cronograma->getTableName(), $limit);
  $orderCrono  = str_replace( '#tabla#',$cronograma->getTableName(), $order);
  $filterCrono = str_replace( '#tabla#',$cronograma->getTableName(), $filter);
  $respCrono   = $cronograma->getAll($limitCrono, $orderCrono, $filterCrono);
  if ($respCrono[0])
  while ($row = mysql_fetch_array($respCrono[0])) 
  {
  	$rsal .= <<<______SALIDAS
      \n{ "date": "{$row['fecha_evento']} 08:00:00", "type": "Evento", "title": "{$row['fecha_evento']}", "description": "{$row['detalle_evento']}", "url": "" },
______SALIDAS;
  }
  
  /*
      $sql1="
            SELECT *
            FROM evento
            WHERE evento.dicta_id=4
            ".$filter."
            ".$order."
            ";
  $result = mysql_query($sql1);
    $i=2;
  if ($result)
  while ($row = mysql_fetch_array($result)) 
  {
      $separador='';
      if($i<=mysql_num_rows($result)){
      $separador=',';
      }
  	$rsal .= <<<______SALIDAS
      \n{ "date": "{$row['fecha_evento']} 08:00:00", "type": "Evento", "title": "{$row['asunto']}", "description": "{$row['descripcion']}", "url": "" }{$separador}
______SALIDAS;
      $i++;
  }
   */
  $rsal = rtrim($rsal, ',');
  echo "[{$rsal}]";
}



/*
if ( isset($_GET['year']) && isset($_GET['month']) && isset($_GET['day']) )
{
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
    $evento->fecha_evento = "{$_GET['day']}/{$month}/{$_GET['year']}";
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
    $filter     = " AND evento.fecha_evento  >=  '{$date_start}' AND evento.fecha_evento  <=  '{$date_end}' ";

    }
  // para la primera carga de pagina
  else
  {
    $order      = ' ORDER BY evento.fecha_evento ASC ';
    $month      = date('m');
    $year       = date('Y');
    $day        = date('d',  mktime(0, 0, 0, $month, 1, $year));
    $date_start = Objectbase::dateHumanToSQl("{$day}/{$month}/{$year}");
    $filter     = " AND evento.fecha_evento  >=  '{$date_start}' ";
  }
      $sql1="
            SELECT *
            FROM evento
            WHERE evento.dicta_id=4
            ".$filter."
            ".$order."
            ";
  $result = mysql_query($sql1);
    $i=2;
  if ($result)
  while ($row = mysql_fetch_array($result)) 
  {
      $separador='';
      if($i<=mysql_num_rows($result)){
      $separador=',';
      }
  	$rsal .= <<<______SALIDAS
      \n{ "date": "{$row['fecha_evento']} 08:00:00", "type": "Evento", "title": "{$row['asunto']}", "description": "{$row['descripcion']}", "url": "" }{$separador}
______SALIDAS;
      $i++;
  }
  echo "[{$rsal}]";
}
*/

?>