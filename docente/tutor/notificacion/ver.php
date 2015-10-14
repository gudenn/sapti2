<?php

try {
    define("MODULO", "DOCENTE");
    require('../../_start.php');
    if (!isDocenteSession())
        header("Location: ../../login.php");
    global $PAISBOX;
    /** HEADER */
    $smarty->assign('title', 'Modificacion de Observaciones');
    $smarty->assign('description', 'Formulario de Modificacion de Observaciones');
    $smarty->assign('keywords', 'SAPTI,Observaciones,Registro');

    //CSS
    $CSS[] = URL_CSS . "academic/3_column.css";
    //$CSS[]  = URL_CSS . "/styleob.css";
    $CSS[] = URL_JS . "/validate/validationEngine.jquery.css";
    $CSS[] = URL_JS . "ui/cafe-theme/jquery-ui-1.10.2.custom.min.css";

    $smarty->assign('CSS', $CSS);

    //JS
    $JS[] = URL_JS . "jquery.1.9.1.js";

    //Datepicker UI
    $JS[] = URL_JS . "ui/jquery-ui-1.10.2.custom.min.js";
    $JS[] = URL_JS . "ui/i18n/jquery.ui.datepicker-es.js";
    $JS[] = URL_JS . "jquery.addfield.js";


    $smarty->assign('JS', $JS);
    $smarty->assign("ERROR", '');
    //// leer las clases 

    leerClase("Usuario");
    leerClase("Docente");
    leerClase("Estudiante");
    leerClase("Tutor");
    leerClase("Proyecto_tutor");
    leerClase("Notificacion");
    leerClase("Consejo");
    leerClase("Proyecto");


    $menuList[] = array('url' => URL . Docente::URL . 'tutor', 'name' => 'Tutor');
    $menuList[] = array('url' => URL . Docente::URL . 'tutor/estudiante.lista.php', 'name' => 'Lista Estudiante');
    $smarty->assign("menuList", $menuList);


    $docente = getSessionDocente();
    $docente_ids = $docente->id;

    //echo $docente_ids;
    if (isset($_GET['proyectotutor_id'])) {
        $smarty->assign('accion', array(
            Proyecto_tutor::ACEPTADO => "Aceptar",
            Proyecto_tutor::RECHADO => "Rechazar"
        ));

        $sql = "select n.`detalle`
from `notificacion` n, `notificacion_tribunal` nt, `tribunal` t
where n.`id`=nt.`notificacion_id` and nt.`tribunal_id`=t.`id` and n.`estado`='AC' and nt.`estado`='AC' and t.`estado`='AC' and t.id=" . $_GET['tribunal_id'] . ";";
        //  $resultado   =  mysql_query($sql);
        $detalle = "";
        /**
          while ($fila = mysql_fetch_array($resultado))
          {
          $detalle=$fila['detalle'];

          }
         */
        //var_dump($notitribunal_id);
        $smarty->assign('detalle', $detalle);
        $smarty->assign('docente', $docente);
        $smarty->assign('proyectotutor', $_GET['proyectotutor_id']);
    }



    if (isset($_POST['tarea']) && $_POST['tarea'] == 'grabar') {
        $idtribuanl = $_POST['ids'];
        $query = "UPDATE notificacion_tribunal nt SET nt.estado_notificacion='V'  WHERE nt.tribunal_id=$idtribuanl";
        mysql_query($query);


        if ($_POST['accion'] == Proyecto_tutor::ACEPTADO) {

            $proyectotutor = new Proyecto_tutor($_POST['idproyectotutor']);
            $proyectotutor->estado_tutoria = $_POST['accion'];
            $proyectotutor->save();

            $notificacions = new Notificacion();
            $notificacions->objBuidFromPost();
            $notificacions->proyecto_id = $proyectotutor->proyecto_id;
            $notificacions->tipo = Notificacion::TIPO_ASIGNACION;
            $notificacions->fecha_envio = date("j/n/Y");
            $notificacions->asunto = "Solicitud de Tutor aceptada";
            $notificacions->detalle = "Su solicitud de Tutor fue Aceptada";
            $notificacions->prioridad = 5;
            $notificacions->estado = Objectbase::STATUS_AC;

            $noticaciones = array('estudiantes' => array(1));

            $proyecto = new Proyecto($proyectotutor->proyecto_id);
            $estudiante = new Estudiante($proyecto->getEstudiante()->id);

            $notificacions->enviarNotificaion($noticaciones);
            $ir = "Location:lista.notificacion.php";
            header($ir);
        } else {
            //  echo "Hola";

            $proyectotutor = new Proyecto_tutor($_POST['idproyectotutor']);
            $proyectotutor->estado_tutoria = $_POST['accion'];
            $proyectotutor->save();

            $notificacions = new Notificacion();
            $notificacions->objBuidFromPost();
            $notificacions->proyecto_id = $proyectotutor->proyecto_id;
            $notificacions->tipo = Notificacion::TIPO_ASIGNACION;
            $notificacions->fecha_envio = date("j/n/Y");
            $notificacions->asunto = "Solicitud de Tutor";
            $notificacions->detalle = "Su solicitud de Tutor fue denegada";
            $notificacions->prioridad = 5;
            $notificacions->estado = Objectbase::STATUS_AC;

            $noticaciones = array('estudiantes' => array(1));

            $proyecto = new Proyecto($proyectotutor->proyecto_id);
            $estudiante = new Estudiante($proyecto->getEstudiante()->id);

            $notificacions->enviarNotificaion($noticaciones);
            $ir = "Location: lista.notificacion.php";
            header($ir);
        }
    }


    $columnacentro = 'docente/tutor/notificacion/ver.tpl';
    $smarty->assign('columnacentro', $columnacentro);

    //No hay ERROR
    $smarty->assign("ERROR", '');
} catch (Exception $e) {
    $smarty->assign("ERROR", handleError($e));
}

$token = sha1(URL . time());
$_SESSION['register'] = $token;
$smarty->assign('token', $token);

$TEMPLATE_TOSHOW = 'docente/docente.3columnas.tpl';
$smarty->display($TEMPLATE_TOSHOW);
?>
