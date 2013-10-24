<?php

/**
 * Esta clase es para guardar los datos tipo Tutor
 *
 * @author Guyen Campero <guyencu@gmail.com>
 */
class Dia extends Objectbase {

  /**
   * varchar 
   * nombre del dia
   */
  var $nombre;

  /**
   * varchar 
   * nombre del dia
   */
  var $descripcion;

  /**
   * El orden de los dias
   * SMALLINT 
   */
  var $orden;

  /**
   * ( simple) Todas las horas  asignadas a un dia
   * @var Hora|null 
   */
  var $hora_objs;

  /**
   * funcion para iniciar horario
   */
  function iniciarHorario() {
    $arryDias = array();
    $arryDias[] = 'Lunes';
    $arryDias[] = 'Martes';
    $arryDias[] = 'Miercoles';
    $arryDias[] = 'Jueves';
    $arryDias[] = 'Viernes';

    $arrahorario = array();
    $arrahorario[] = '08:15';
    $arrahorario[] = '09:45';
    $arrahorario[] = '11:15';
    $arrahorario[] = '12:45';
    $arrahorario[] = '14:15';
    $arrahorario[] = '15:45';
    $arrahorario[] = '17:15';
    $arrahorario[] = '18:45';
    $arrahorario[] = '20:15';

    $contador = 1;
    foreach ($arryDias as $dias) {
      $dia = new Dia();
      $dia->nombre = $dias;
      $dia->orden  = $contador;
      $dia->estado = Objectbase::STATUS_AC;
      $contador ++;

      for ($valor = 0; $valor < (sizeof($arrahorario) - 1); $valor++) {
        $hora = new Hora();
        $hora->hora_inicio = $arrahorario[$valor];
        $hora->hora_fin = $arrahorario[$valor + 1];
        $hora->estado = Objectbase::STATUS_AC;
        $dia->hora_objs[] = $hora;
      }

      $dia->save();
      $dia->saveAllSonObjects(1);
    }
  }

  /**
   *   Recuperar la tabla de horarios
   * @param type $iddocente
   */
  function llemartabla($iddocente=false) {
    leerClase('Dia');
    leerClase('Hora');
    leerClase('Semestre');
    $semestre = new Semestre('',1);
    
    $valor = $semestre->getValor('Iniciar Horarios',1);
    if ($valor)
    {
      $this->iniciarHorario();
      $semestre->setValor('Iniciar Horarios',0);
    }
    
    $hora = new Hora();
    $dia  = new Dia();
    $dias = $dia->getAll('',' ORDER BY orden ASC ');
    while ($row = mysql_fetch_array($dias[0])) {
      
      $dia  = new Dia($row);
      $hora = new Hora();
      if ($dia->nombre == 'Lunes')
        $tdiaextra =  "<div class='horariodia'> Horas";
      $tdia .=  "<div class='horariodia'> {$dia->nombre}";
      $horas = $hora->getAll('',' ORDER BY id ASC '," WHERE dia_id = '{$dia->id}' ");
      while ($rowd = mysql_fetch_array($horas[0])) {
        $hora  = new Hora($rowd); 
        $check = $hora->getAsignada($iddocente, $hora->id)?'checked="checked"':'';
        $tdia .=  "<div class='horariohora'>
                {$hora->id}
                <input type=\"checkbox\" name=\"hora_id[]\" value=\"{$hora->id}\" $check />
                </div>";
        if ($dia->nombre == 'Lunes')
          $tdiaextra .= "<div class='horariohora'> {$hora->hora_inicio} -   {$hora->hora_fin}</div>";
      }
      $tdia .= "</div>";
      if ($dia->nombre == 'Lunes')
        $tdiaextra .=  "</div>";
    }
    echo $tdiaextra.$tdia;
  }

  function validar() {
    leerClase('Formulario');
    Formulario::validar('nombre', $this->nombre, 'texto', 'El Nombre');
    Formulario::validar('descripcion', $this->descripcion, 'texto', 'El Descrpcion');
  }

  /**
   * Inicia el filtro para el admin
   * @param Filtro $filtro el fitro que se usara en el admin
   */
  function iniciarFiltro(&$filtro) {

    if (isset($_GET['order']))
      $filtro->order($_GET['order']);
    $filtro->nombres[] = 'Nombre';
    $filtro->valores[] = array('input', 'nombre', $filtro->filtro('nombre'));
    $filtro->nombres[] = 'descripcion';
    $filtro->valores[] = array('input', 'sigla', $filtro->filtro('descripcion'));
  }

  /**
   * Devuelve el order para el SQL
   * @param array $order_array arreglo con las claves para el order
   * @return string
   */
  function getOrderString(&$filtro) {
    $order_array = array();
    $order_array['id'] = " {$this->getTableName()}.id ";
    $order_array['nombre'] = " {$this->getTableName()}.nombre ";
    $order_array['descripcion'] = " {$this->getTableName()}.descripcion ";
    $order_array['estado'] = " {$this->getTableName()}.estado ";
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
    if ($filtro->filtro('id'))
      $filtro_sql .= " AND {$this->getTableName()}.id like '%{$filtro->filtro('id')}%' ";
    if ($filtro->filtro('nombre'))
      $filtro_sql .= " AND {$this->getTableName()}.nombre like '%{$filtro->filtro('nombre')}%' ";
    if ($filtro->filtro('descripcion'))
      $filtro_sql .= " AND {$this->getTableName()}.descripcion like '%{$filtro->filtro('descripcion')}%' ";

    return $filtro_sql;
  }

  /**
    function getDocentesDictan($semestre_id)
    {
    leerClase('Dicta');
    leerClase('Docente');
    $docentesQueDictan = new Dicta();
    $docentesQueDictan->materia_id  = $this->id;
    $docentesQueDictan->semestre_id = $semestre_id;
    $docentesQueDictan->estado      = Objectbase::STATUS_AC;
    $result =  $docentesQueDictan->getAll();
    if (!$result)
    return false;
    $docentes = array();
    while ($row = mysql_fetch_array($result[0]))
    {
    $docente_aux = new Docente($row['docente_id']);
    $docente_aux->dicta_id = $row['id'];
    $docentes[]  = $docente_aux;
    }
    return $docentes;

    }

   */
}

?>