<?php

try {
    if (!defined('MODULO')) {
        define("MODULO", "NOTIFICACION");
        require('../_start.php');
    }
    if (!isUserSession())
        header("Location: ../login.php");

    /** HEADER */
    $smarty->assign('title', 'Detalle de Mis Notificaciones');
    $smarty->assign('description', 'Detalle de Mis Notificaciones');
    $smarty->assign('keywords', 'Gesti&oacute;n,Notificaciones');
    /**
     * Menu superior
     * hay que declarar esta variable en cada pagina para que esto funcione bien
     */
    if (!isset($menuList)) {
        $menuList[] = array('url' => URL . Administrador::URL, 'name' => 'Administraci&oacute;n');
        $menuList[] = array('url' => URL . Administrador::URL . 'notificacion/', 'name' => 'Notificaciones');
        $menuList[] = array('url' => URL . Administrador::URL . 'notificacion/notificacion.gestion.php', 'name' => 'Archivo de Notificaiones');
        $menuList[] = array('url' => URL . Administrador::URL . 'notificacion/notificacion.detalle.php', 'name' => 'Detalle de Notificaciones');
    }
    $smarty->assign("menuList", $menuList);

    $smarty->assign('header_ui', '1');
    //BOX
    $CSS[] = URL_JS . "box/box.css";
    $JS[] = URL_JS . "box/jquery.box.js";
    $smarty->assign('CSS', $CSS);
    $smarty->assign('JS', $JS);



    $smarty->assign("ERROR", '');

    $smarty->assign('columnacentro', 'notificacion/detalle.tpl');

    //CREAR UN TUTOR
    leerClase('Tutor');
    leerClase('Usuario');
    leerClase('Estudiante');
    leerClase('Notificacion');
    leerClase('Avance');
    leerClase('Proyecto');
    leerClase('Tribunal');
    leerClase('html');
    leerClase("Semestre");
    leerClase('Docente');
    leerClase('Dicta');
    //no hay error
    $ERROR = '';

    //Sexo del usuario
    $smarty->assign('sexo', array(
        Usuario::FEMENINO => 'Femenino',
        Usuario::MASCULINO => 'Masculino'));
    $smarty->assign('sexo_selected', ($usuario->sexo == Usuario::FEMENINO) ? Usuario::FEMENINO : Usuario::MASCULINO);

    if (isset($_GET['notificacion_id']) && is_numeric($_GET['notificacion_id'])) {

        $semestre = new Semestre('', 1);
        $valorh = $semestre->getValor('Lapso de tiempo para el rechazo a ser tribunal hras.', 72);
        if (!$valorh) {
            //  echo $valorh;
            $semestre->setValor('Lapso de tiempo para el rechazo a ser tribunal hras.', 72);
        }

        $smarty->assign('accion', array(
            Tribunal::ACCION_AC => "ACEPTAR",
            Tribunal::ACCION_RE => "RECHAZAR"
        ));
        $notificacion = new Notificacion($_GET['notificacion_id']);
        $notificacion->marcarVisto();
        $proyecto = new Proyecto($notificacion->proyecto_id);
        $estudiante = $proyecto->getEstudiante();
        //if()
        $tribunal = $proyecto->getTribunal(getSessionDocente()->id);

        //$fechainicio=  date("d-m-Y", strtotime($tribunal->fecha_asignacion));
        // echo $tribunal->fecha_asignacion;
        $temp1 = strtotime($tribunal->fecha_asignacion); //segs desde fecha unix
        $temp2 = strtotime(date("Y-m-d H:i:s"));
        // echo $temp1.' '.$temp2;
        //; //segs desde la fecha unix
        $diferencia = abs($temp1 - $temp2); //abs=valor absoluto :D
        $horas = floor($diferencia / 60 / 60); //floor=redondea hacia arriba :D
//echo $horas;
//
      //  if ($horas >= $valorh) {
       //     $tribunal->accion = Tribunal::ACCION_AC;
       //     $tribunal->save();
       // }
function tipoconsulta($mat, $pro, $doc){
   switch ($mat) {
      case 'PR':
  $resul = "
SELECT av.id as id, pr.nombre as nombrep, av.descripcion as descripcion, av.fecha_avance as fecha, re.id as correcionrevision, av.estado_avance as estoavance
FROM proyecto pr, avance av, revision re
WHERE av.proyecto_id=pr.id
AND av.id=re.avance_id
AND re.estado_revision='RE'
AND av.proyecto_id='".$pro."'
AND re.revisor_tipo='DO'
AND re.revisor='".$doc."'
ORDER BY id DESC
          ";
        break;
      case 'PE':
  $resul = "
SELECT av.id as id, pr.nombre as nombrep, av.descripcion as descripcion, av.fecha_avance as fecha, re.id as correcionrevision, av.estado_avance as estoavance
FROM proyecto pr, avance av, revision re
WHERE av.proyecto_id=pr.id
AND av.id=re.avance_id
AND re.estado_revision='RE'
AND av.proyecto_id='".$pro."'
AND re.revisor_tipo='DP'
AND re.revisor='".$doc."'
ORDER BY id DESC
          ";
        break;
      default:
        break;
    } 
    return $resul;
}
        $array=  explode(';SPT;', $notificacion->detalle);
        $mensaje=$array[0];
        $link1=$array[1];
        $tip='';

  if (getSessionEstudiante()){
$user='ES';
$tip=$array[2];
  }
  $tutor1=getSessionTutor();
  $arrayTutor=$proyecto->getTutores();
  foreach ( $arrayTutor as $tut){
  if ($tut->id==$tutor1->id){
$usert='TU';
  $resul_tu = "
SELECT av.id as id, pr.nombre as nombrep, av.descripcion as descripcion, av.fecha_avance as fecha, re.id as correcionrevision, av.estado_avance as estoavance
FROM proyecto pr, avance av, revision re
WHERE av.proyecto_id=pr.id
AND av.id=re.avance_id
AND re.estado_revision='RE'
AND av.proyecto_id='".$proyecto->id."'
AND re.revisor_tipo='TU'
AND re.revisor='".$tutor1->id."'
ORDER BY id DESC
          ";
   $sql_tu = mysql_query($resul_tu);
   if(mysql_num_rows($sql_tu)>0){
       $tip=$array[2];
   }
  }  
  }

  if ($tribunal1=$proyecto->getTribunal(getSessionDocente()->id)->id>0){
$usertr='TR';
  $resul_tr = "
SELECT av.id as id, pr.nombre as nombrep, av.descripcion as descripcion, av.fecha_avance as fecha, re.id as correcionrevision, av.estado_avance as estoavance
FROM proyecto pr, avance av, revision re
WHERE av.proyecto_id=pr.id
AND av.id=re.avance_id
AND re.estado_revision='RE'
AND av.proyecto_id='".$proyecto->id."'
AND re.revisor_tipo='TR'
AND re.revisor='".$tribunal1->id."'
ORDER BY id DESC
          ";
   $sql_tr = mysql_query($resul_tr);
      if(mysql_num_rows($sql_tu)>0){
       $tip=$array[2];
   }
  }
  if($docente=getSessionDocente()){      
    $resulrev = "SELECT di.id
FROM proyecto_dicta pd, dicta di, semestre se
WHERE pd.dicta_id=di.id
AND di.semestre_id=se.id
AND se.activo=1
AND pd.proyecto_id=$proyecto->id
";
   $sqlrev = mysql_query($resulrev);
while ($fila1rev = mysql_fetch_array($sqlrev, MYSQL_ASSOC)) {
   $iddicta=$fila1rev['id'];
 }
 $dicta=new Dicta($iddicta);
 if($iddicta>0){
     $userd='DO';
   $sql = mysql_query(tipoconsulta($dicta->getTipoMateria(), $proyecto->id,$docente->id));
   if(mysql_num_rows($sql)>0){
       $tip=$array[2];
   }
 }
}
        
//echo $horas;
        //echo $_GET['notificacion_id'];
        //$notificacion
        $tipo = Notificacion::TIPO_ASIGNACION;
        $tipo1 = Notificacion::TIPO_NOTIFICACION;
        // echo $tipo;
        $smarty->assign("proyecto", $proyecto);
        $smarty->assign("estudiante", $estudiante);
        $smarty->assign("notificacion", $notificacion);
        $smarty->assign("mensaje", $mensaje);
        $smarty->assign("link1", $link1);
        $smarty->assign('secionUser', $user);
        $smarty->assign('secionUserd', $userd);
        $smarty->assign('secionUsert', $usert);
        $smarty->assign('secionUsertr', $usertr);
        $smarty->assign('idicta', $iddicta);
        $smarty->assign("estadonotificacion", $proyecto->getTribunalEstado(getSessionDocente()->id));
        $smarty->assign("tiponotificacion", $tipo);
        $smarty->assign("tiponotificacion1", $tipo1);
        $smarty->assign("tip", $tip);
         $smarty->assign("tribunales", $proyecto->getTribunalDocenteLista() );
       
    }


    if (isset($_POST['tarea']) && $_POST['tarea'] == 'registrar' && isset($_POST['token']) && $_SESSION['register'] == $_POST['token']) {
        $stado = 0;

        if (isset($_POST['id_notificacion'])) {

            $notificacion = new Notificacion($_POST['id_notificacion']);
            $notificacion->getAllObjects();
            $tribunal = $notificacion->getNotificacionTribunal(getSessionUser()->id);
            $proyecto = new Proyecto($notificacion->proyecto_id);

            if ($tribunal->id != 0) {
                $tribunal->visto = Tribunal::VISTO;
                $tribunal->accion = ( $_POST['accion'] == Tribunal::ACCION_AC) ? Tribunal::ACCION_AC : Tribunal::ACCION_RE;
                $tribunal->detalle = $_POST['detalle'];
                $tribunal->fecha_aceptacion = date("j/n/Y");
                $tribunal->save();
                $action_trin='rechazo';
      if($_POST['accion']=='AC')
          $action_trin='acepto';
                //Enviar notificacion
                $notificacions = new Notificacion();
                $notificacions->objBuidFromPost();
                $notificacions->proyecto_id = $proyecto->id;
                $notificacions->fecha_envio = date("j/n/Y");
                $notificacions->prioridad = 7;
                $notificacions->asunto = "Tribunal";
                $notificacions->detalle     =  ' Su solicitud fue '. $action_trin .' por '. getSessionUser()->getNombreCompleto() .'<br>'.$tribunal->detalle ;
                $notificacions->tipo = Notificacion::TIPO_NOTIFICACION;
                $notificacions->estado = Objectbase::STATUS_AC;

                $noticaciones = array('estudiantes' => array($proyecto->getEstudiante()->id));
                $notificacions->enviarNotificaion($noticaciones);
            } else { // notificaiones para asignar tutor
                leerClase('Proyecto_tutor');
                $id = '';
                if (isset($notificacion->notificacion_tutor_objs[0]))
                    $id = $notificacion->notificacion_tutor_objs[0]->proyecto_tutor_id;

                // Aceptamos o rechasamos la tutoria
                $proyectotutor = new Proyecto_tutor($id);
                $proyectotutor->estado_tutoria = ( $_POST['accion'] == Proyecto_tutor::ACEPTADO ) ? Proyecto_tutor::ACEPTADO : Proyecto_tutor::RECHADO;
                $proyectotutor->fecha_acepta = date("j/n/Y");
                $proyectotutor->save();

                $tutor = new Tutor($proyectotutor->tutor_id);

                //Enviamos un mensaje
                $notificacions = new Notificacion();
                $notificacions->objBuidFromPost();
                $notificacions->proyecto_id = $proyecto->id;
                $notificacions->tipo = Notificacion::TIPO_NOTIFICACION;
                $notificacions->fecha_envio = date("j/n/Y");

                $aceptado = $proyectotutor->estado_tutoria == Proyecto_tutor::ACEPTADO ? 'Acepto' : 'Rechaso';
                $notificacions->asunto = "Nombramiento de tutor: $aceptado";
                $notificacions->detalle = "Tutor : " . $tutor->getNombreCompleto() . ", " . $_POST['detalle'];

                $notificacions->prioridad = 7;
                $notificacions->estado = Objectbase::STATUS_AC;

                $noticaciones = array('estudiantes' => array($proyecto->getEstudiante()->id));
                $notificacions->enviarNotificaion($noticaciones);
            }
        }



        $stado = 1;
    }

    $ERROR = '';
    leerClase('Html');
    $html = new Html();
    //$moderador=0;
    if (isset($stado)) {
        if ($stado == 1) {

            $_SESSION['estado'] = $stado;
            //    header("Location: docente/notificacion");
            echo "<script>window.location.href='index.php'</script>";
        } else {
            $mensaje = array('mensaje' => 'Hubo un problema, No se grab&oacute; correctamente el Area', 'titulo' => 'Registro de Area', 'icono' => 'warning_48.png');
            $ERROR = $html->getMessageBox($mensaje);
        }
    }



    $token = sha1(URL . time());
    $_SESSION['register'] = $token;
    $smarty->assign('token', $token);

    $smarty->assign("ERROR", $ERROR);
} catch (Exception $e) {
    mysql_query("ROLLBACK");
    $smarty->assign("ERROR", handleError($e));
}

$TEMPLATE_TOSHOW = 'admin/2columnas.tpl';
$smarty->display($TEMPLATE_TOSHOW);
?>