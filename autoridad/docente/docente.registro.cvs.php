<?php
try {
  define ("MODULO", "ADMIN-DOCENTE");
  require('../_start.php');
  if(!isAdminSession())
    header("Location: ../login.php");  

  /** HEADER */
  $smarty->assign('title', 'Registro de Docentes');
  $smarty->assign('description', 'P&aacute;gina de Registro de Docentes Por CVS');
  $smarty->assign('keywords', 'Registro,Docentes');
  /**
   * Menu superior
   */
  $menuList[] = array('url' => URL . Administrador::URL, 'name' => 'Administraci&oacute;n');
  $menuList[] = array('url' => URL . Administrador::URL . 'docente/', 'name' => ' Docentes');
  $menuList[] = array('url' => URL . Administrador::URL . 'docente/' . basename(__FILE__), 'name' => 'Registro de Docente');
  $smarty->assign("menuList", $menuList);

  $smarty->assign('header_ui','1');
  $smarty->assign('CSS','');
  $smarty->assign('JS','');


  $smarty->assign("ERROR", '');


  //CREAR UN DOCENTE
  leerClase('Docente');
  leerClase('Usuario');
  leerClase('Grupo');


  $columnacentro = 'admin/docente/columna.centro.registro-docente.cvs.tpl';
  $smarty->assign('columnacentro',$columnacentro);


  $ERROR = ''; 
  if (isset($_POST['tarea']) && $_POST['tarea'] == 'registrar' && isset($_POST['token']) && $_SESSION['register'] == $_POST['token']) {
    
    $EXITO    = false;
    $aux      = str_replace(array("\r\n", "\r", "\n"), '#CODIGOX#', trim($_POST['cvs'])); 
    $docentes = explode('#CODIGOX#', $aux);
    $cotador  = 0;
    if (count($docentes)>=1)
      foreach ($docentes as $docente_array) {
        $docente_array = explode(';', $docente_array);
        if (count($docente_array)>=3 && is_numeric($docente_array[0]) )
        {
          mysql_query("BEGIN");
          //si ya esta puesto el docente continuamos
          $neo_docente = new Docente('', trim ($docente_array[0]) );
          if ($neo_docente->id)
            continue;
          $cotador++;
          $usuario                    = new Usuario();
          $usuario->titulo_honorifico = trim($docente_array[1]);
          $usuario->apellido_paterno  = trim($docente_array[2]);
          $usuario->apellido_materno  = trim($docente_array[3]);
          $usuario->nombre            = trim($docente_array[4]);
          $usuario->ci                = trim($docente_array[0]);
          $usuario->login             = trim($docente_array[0]);
          $usuario->clave             = trim($docente_array[0]);
          $usuario->fecha_nacimiento  = date('j/m/Y');
          $usuario->estado            = Objectbase::STATUS_AC;
          $usuario->puede_ser_tutor   = 1;
          $usuario->validar(1);
          $usuario->save();
          //asignamos grupo docente
          $usuario->asignarGrupo(Grupo::GR_DO);
          //creamos el docente
          $docente_neo                        = new Docente();
          $docente_neo->codigo_sis            = trim($docente_array[0]);
          $docente_neo->estado                = Objectbase::STATUS_AC;
          $docente_neo->usuario_id            = $usuario->id;
          $docente_neo->configuracion_area    = 0;
          $docente_neo->configuracion_horario = 0;
          $docente_neo->save();

          
          
          mysql_query("COMMIT");
          
        }
      }
      //No hay ERROR
      $_SESSION['estado'] = $cotador;
      header("Location: docente.gestion.php");
  }
  $smarty->assign("ERROR",$ERROR);

} catch (Exception $e) {
  mysql_query("ROLLBACK");
  $smarty->assign("ERROR", handleError($e));
}

$token = sha1(URL . time());
$_SESSION['register'] = $token;
$smarty->assign('token', $token);


$TEMPLATE_TOSHOW = 'admin/2columnas.tpl';
$smarty->display($TEMPLATE_TOSHOW);
?>