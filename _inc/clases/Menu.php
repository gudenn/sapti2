<?php

/**
 * Esta clase es para manejar los menus no interactua con la base de datos
 *
 * @author Guyen Campero <guyencu@gmail.com>
 */
  leerClase('Menu_icono');
  leerClase('Menu_item');
class Menu
{

 /**
  * Nombre del menu
  */
  var $nombre_menu;

 /**
  * Todos los items del menu
  * @var object|null 
  */
  var $thise_items;

  public function __construct($nombre_menu) {
    $this->nombre_menu = $nombre_menu;
  }

  /**
   * Agregamos items al menu
   * @param type $titulo
   * @param type $descripcion
   * @param type $file_icono
   * @param type $link
   * @param int $pendientes
   * @param int $nopendientes
   * @param string $target
   */
  function agregarItem($titulo,$descripcion,$file_icono,$link,$pendientes = 0,$nopendientes = 0,$target = '_self')
  {
    $item               = new Menu_item($titulo,$descripcion,$file_icono,$link,$pendientes,$nopendientes,$target);
    $this->menu_items[] = $item;
    
  }

  function getAdminIndex() {
    leerClase('Grupo');
    leerClase('Usuario');
    leerClase('Administrador');
    $thises   = array();
    $usuario = getSessionUser();
    if (!isset($usuario->id) || (!$usuario->id))
      return;
    // Menu del SUPER ADMINISTRADOR
    if ($usuario->perteneceGrupo(Grupo::GR_AD))
    {
      $thise = new Menu('Docentes');
      $link = Administrador::URL."docente/";
      $thise->agregarItem('Gesti&oacute;n de Docentes','Registro y modificaciones para Docentes','basicset/user4.png',$link);
      $link = Administrador::URL."docente/";
      $thise->agregarItem('Reportes de Docentes','Reportes correspondientes a los Docentes','basicset/graph.png',$link);
      $thises[] = $thise;
      $thise = new Menu('Estudiantes');
      $link = Administrador::URL."estudiante/";
      $thise->agregarItem('Gesti&oacute;n de Estudiantes','Registro y modificaciones para estudiantes','basicset/user5.png',$link);
      $link = Administrador::URL."estudiante/";
      $thise->agregarItem('Reportes de Estudiantes','Reportes correspondientes a los Estudiantes','basicset/graph.png',$link);
      $thises[] = $thise;
      $thise = new Menu('Tutores');
      $link = Administrador::URL."tutor/";
      $thise->agregarItem('Gesti&oacute;n de Tutores','Registro y modificaciones para Tutores','basicset/user1.png',$link);
      $link = Administrador::URL."tutor/";
      $thise->agregarItem('Reportes de Tutores','Reportes correspondientes a los Tutores','basicset/graph.png',$link);
      $thises[] = $thise;
      $thise = new Menu('Autoridades');
      $link = Administrador::URL."autoridad/";
      $thise->agregarItem('Gesti&oacute;n de Autoridades','Registro y modificaciones para Autoridades','basicset/client.png',$link);
      $link = Administrador::URL."autoridad/";
      $thise->agregarItem('Reportes de Autoridades','Reportes correspondientes a los Autoridades','basicset/graph.png',$link);
      $thises[] = $thise;
      $thise = new Menu('Permisos');
      $link = Administrador::URL."seguridad/";
      $thise->agregarItem('Gesti&oacute;n de Permisos','Control y restricciones de los grupos para usuarios del Sistema SAPTI','basicset/login.png',$link);
      $thises[] = $thise;
      $thise = new Menu('Usuarios');
      $link = Administrador::URL."usuario/";
      $thise->agregarItem('Gesti&oacute;n de Usuarios','Registro y modificaciones para Usuarios','basicset/people.png',$link);
      $link = Administrador::URL."usuario/";
      $thise->agregarItem('Reportes de Usuarios','Reportes correspondientes a los Todos los Usuarios','basicset/graph.png',$link);
      $thises[] = $thise;  
      $thise = new Menu('Reprogramaciones');
      $link = Administrador::URL."reprogramacion/";
      $thise->agregarItem('Gesti&oacute;n de Reprogramaciones','Postergar y dar Prorroga a Proyectos','basicset/calendar.png',$link);
      $thises[] = $thise;
      $thise = new Menu('Perfil');
      $link = Administrador::URL."pendientes/";
      $thise->agregarItem('Gesti&oacute;n de Perfiles','Gestionar los perfiles de tesis para los estudiantes','basicset/licence.png',$link);
      $link = Administrador::URL."reportes/";
      $thise->agregarItem('Reportes de Perfiles','Reportes correspondientes a los Perfiles','basicset/graph.png',$link);
      $thises[] = $thise;
      $thise = new Menu('Proyecto Final');
      $link = Administrador::URL."proyecto/";
      $thise->agregarItem('Gesti&oacute;n de Proyectos Finales','Gestionar los proyectos finales de los estudiantes','basicset/briefcase_48.png',$link);
      $link = Administrador::URL."proyecto/";
      $thise->agregarItem('Reportes de Proyectos Finales','Reportes correspondientes a los Proyectos','basicset/graph.png',$link);
      $thises[] = $thise;
      $thise = new Menu('Helpdesk SAPTI');
      $link = Administrador::URL."helpdesk/";
      $thise->agregarItem('Configurar Helpdesk','Gesti&oacute;n de Helpdesk para el sistema SAPTI.','basicset/helpdesk_48.png',$link,0,4);
      $thises[] = $thise;
      $thise = new Menu('Sistema SAPTI');
      $link = Administrador::URL."configuracion/";
      $thise->agregarItem('Configuraciones','Configuraciones para el sistema SAPTI.','basicset/gear_48.png',$link,0,15);
      $thises[] = $thise;
      $thise = new Menu('Notificaciones y Mensajes');
      $link = Administrador::URL."notificacion/";
      $thise->agregarItem('Gesti&oacute;n de Notificaciones','Gestionar Mis notificaciones','basicset/megaphone.png',$link,0,12);
      $link = Administrador::URL."mensajes/";
      $thise->agregarItem('Gesti&oacute;n de Mesajes','Mi correo de Mensajes','basicset/mail.png',$link,14);
      
     
    }
    // Menu de AUTORIDADES
    if ($usuario->perteneceGrupo(Grupo::GR_AU))
    {
      $thise = new Menu('Perfil');
      $link = Administrador::URL."proyeco/";
      $thise->agregarItem('Gesti&oacute;n de Perfiles','Gestionar los perfiles de tesis para los estudiantes','basicset/licence.png',$link);
      $link = Administrador::URL."reportes/";
      $thise->agregarItem('Reportes de Perfiles','Reportes correspondientes a los Perfiles','basicset/graph.png',$link);
      $thises[] = $thise;
      $thise = new Menu('Proyecto Final');
      $link = Administrador::URL."proyecto/";
      $thise->agregarItem('Gesti&oacute;n de Proyectos Finales','Gestionar los proyectos finales de los estudiantes','basicset/briefcase_48.png',$link);
      $link = Administrador::URL."proyecto/";
      $thise->agregarItem('Reportes de Proyectos Finales','Reportes correspondientes a los Proyectos','basicset/graph.png',$link);
      $thises[] = $thise;
      $thise = new Menu('Notificaciones y Mensajes');
      $link = Administrador::URL."notificacion/";
      $thise->agregarItem('Gesti&oacute;n de Notificaciones','Gestionar Mis notificaciones','basicset/megaphone.png',$link,0,12);
      $link = Administrador::URL."mensajes/";
      $thise->agregarItem('Gesti&oacute;n de Mesajes','Mi correo de Mensajes','basicset/mail.png',$link,14);
      $thises[] = $thise;
      
    }
    // Menu de CONSEJO
    if ($usuario->perteneceGrupo(Grupo::GR_CO))
    {
      $thise = new Menu('Notificaciones y Mensajes');
      $link = Administrador::URL."notificacion/";
      $thise->agregarItem('Gesti&oacute;n de Notificaciones','Gestionar Mis notificaciones','basicset/megaphone.png',$link,0,12);
      $link = Administrador::URL."mensajes/";
      $thise->agregarItem('Gesti&oacute;n de Mesajes','Mi correo de Mensajes','basicset/mail.png',$link,14);
      $thises[] = $thise;
      
    } 
    // Notificaciones para todos

    // Notificaciones 
    leerClase('Usuario');
    leerClase('Notificacion');
    $usuario      = getSessionUser();
    $notificacion = new Notificacion();

    $thise = new Menu('Notificaciones y Mensajes');
    $link = Administrador::URL."notificacion/";
    $thise->agregarItem('Notificaciones','Gesti&oacute;n de Notificaciones','basicset/message-archived.png',$link,0,  sizeof($notificacion->getNotificacionTribunal(3)));
    $link = Administrador::URL."notificacion/notificacion.gestion.php?estado_notificacion=SV";
    $counter = $notificacion->getTodasNotificaciones($usuario->id, '', '', ' AND estado_notificacion="SV" ');
    $thise->agregarItem('Notificaciones Pendientes','Todas las notificaciones no leidas','basicset/message-not-read.png',$link,$counter[1]);
    $thises[] = $thise;
    return $thises;
  }
  
  /**
   * Menu principal del Estudiante
   * @param Proyecto $proyecto
   * @return Menu
   */
  function getestudianteIndex($proyecto) {
    leerClase('Grupo');
    leerClase('Estudiante');
   
    $thises = array();
    $thise = new Menu('Proyecto');
    $link = Estudiante::URL."proyecto-final/";
    $thise->agregarItem('Proyecto','Registro de avances y correcciones para el Proyecto Final','basicset/briefcase_48.png',$link);
    if( $proyecto->estado_proyecto==Proyecto::EST2_BUE)
    {
      $link = Estudiante::URL."proyecto/proyecto.registro.php";
      $thise->agregarItem('Registro de Formulario','Geti&oacute;n de las Notificaciones','basicset/survey.png',$link,1);
    }
    $thises[] = $thise;

    // Notificaciones 
   leerClase('Usuario');
   leerClase('Notificacion');
   $usuario      = getSessionUser();
   $notificacion = new Notificacion();

    $thise = new Menu('Notificaciones y Mensajes');
    $link = Estudiante::URL."notificacion/";
    $thise->agregarItem('Notificaciones','Gesti&oacute;n de Notificaciones','basicset/message-archived.png',$link,0,  sizeof($notificacion->getNotificacionTribunal(3)));
    $link = Estudiante::URL."notificacion/notificacion.gestion.php?estado_notificacion=SV";
    $counter = $notificacion->getTodasNotificaciones($usuario->id, '', '', ' AND estado_notificacion="SV" ');
    $thise->agregarItem('Notificaciones Pendientes','Todas las notificaciones no leidas','basicset/message-not-read.png',$link,$counter[1]);
    $thises[] = $thise;
    
    return $thises;
  }
  
  /**
   * Menu principal del Estudiante para el proyecto final
   * @param Proyecto $proyecto
   * @return Menu
   */
  function getestudianteProyectoFinalIndex($proyecto) {
    leerClase('Grupo');
    leerClase('Avance');
    leerClase('Revision');
    leerClase('Estudiante');
   
    $thises = array();
    $thise = new Menu('Avances');
    $link = Estudiante::URL."proyecto-final/avance.registro.php";
    $thise->agregarItem('Registro de Avances','Registrar Archivos y la descripci&oacute;n del avance presentado','basicset/document_pencil.png',$link);
    $avance = new Avance();
    $link = Estudiante::URL."proyecto-final/avance.gestion.php";
    $thise->agregarItem('Archivo de Avances','Compendio de todos los avances presentados','basicset/cabinet.png',$link,'',$avance->contar( " proyecto_id = '{$proyecto->id}'  " ));
    $thises[] = $thise;
    $thise = new Menu('Correciones');
    $revision = new Revision();
    $pendiente = Revision::E1_CREADO;
    $pendiente = $revision->contar( " proyecto_id = '{$proyecto->id}' AND estado_revision = '{$pendiente}'  " );
    $link = Estudiante::URL."proyecto-final/revision.gestion.php?estado_revision=CR";
    $thise->agregarItem('Correcciones Pendientes','Todas las correcciones pendientes presentadas por Tutor(es), Docente(s) y Tribunales','basicset/document_pencil.png',$link,$pendiente);
    $pendiente = $revision->contar( " proyecto_id = '{$proyecto->id}' " );
    $link = Estudiante::URL."proyecto-final/revision.gestion.php?estado_revision=";
    $thise->agregarItem('Archivo de Correciones','Compendio de todas las correciones presentadas','basicset/cabinet.png',$link,'',$pendiente);

    $thises[] = $thise;
    return $thises;
  }
  
  /**
   * Menu principal del Docente
   * @param Docente $docente
   * @return Menu
   */
  function getDocenteIndex($docente) {
      leerClase('Docente');
      leerClase('Usuario');
      leerClase('Notificacion');
      if (getSessionDocente()){
    $materias = "SELECT DISTINCT ma.id as idmat, ma.nombre as nombre
FROM dicta di, semestre se, materia ma
WHERE di.materia_id=ma.id
AND di.semestre_id=se.id
AND se.activo=1
AND di.docente_id=".$docente->id."
ORDER BY ma.nombre";
  $mate = mysql_query($materias);
        while ($row = mysql_fetch_array($mate, MYSQL_ASSOC)) {
       $materiassemestre[] = $row;
 }
  $docmaterias = "SELECT di.id as iddicta, ma.id as idmat, ma.nombre as materia, cg.nombre as grupo, ma.tipo as tipo
FROM dicta di, semestre se, materia ma, codigo_grupo cg
WHERE di.materia_id=ma.id
AND di.semestre_id=se.id
AND di.codigo_grupo_id=cg.id
AND se.activo=1
AND di.docente_id=".$docente->id."
ORDER BY ma.id";
  $resultmate = mysql_query($docmaterias);

  while ($row2 = mysql_fetch_array($resultmate, MYSQL_ASSOC)) {
       $docmateriassemestre[] = $row2;
  }
  if(mysql_num_rows($resultmate)>0)
      {
          $thises = array();
  foreach ($materiassemestre as $value) 
   {
        $thise = new Menu($value['nombre']);
        for($i=0; $i < count($docmateriassemestre);$i++ )
        {
            if($value['idmat']==$docmateriassemestre[$i]['idmat']&&$docmateriassemestre[$i]['tipo']=='PR'){
                  $link = Docente::URL."index.proyecto-final.php?iddicta=".$docmateriassemestre[$i]['iddicta']."";
                  $thise->agregarItem('Gesti&oacute;n de Estudiantes Codigo:'.$docmateriassemestre[$i]['grupo'].'','Gesti&oacute;n de Estudiantes Inscritos en la Materia Proyecto Final.','basicset/project.png',$link);
            }elseif ($value['idmat']==$docmateriassemestre[$i]['idmat']&&$docmateriassemestre[$i]['tipo']=='PE') {
                        $link = Docente::URL."index.proyecto-final.php?iddicta=".$docmateriassemestre[$i]['iddicta']."";
                        $thise->agregarItem('Gesti&oacute;n de Estudiantes Codigo:'.$docmateriassemestre[$i]['grupo'].'','Gesti&oacute;n de Estudiantes Inscritos en la Materia de Perfil.','basicset/profile.png',$link);
            }
         };
         $thises[] = $thise;
  };
      }  
      }
  $notificacion = new Notificacion();
  $thise = new Menu('Tutor');
  $link = Docente::URL."tutor/index.php";
  $thise->agregarItem('Notificaciones','Notificaciones para el Proyecto Final','basicset/tutor.png',$link,0,  sizeof($notificacion->getNotificacionTribunal(3)));
  $thises[] = $thise;
  
  $thise = new Menu('Tribunal');
  $link = Docente::URL."tribunal/index.php";
  $thise->agregarItem('Notificaciones','Notificaciones para el Proyecto Final','basicset/user3.png',$link,0,  sizeof($notificacion->getNotificacionTribunal(3)));
  $thises[] = $thise;
  
  $thise = new Menu('Tiempo');
  $link = Docente::URL."configuracion/generar.horario.php";
  $thise->agregarItem('Disponibilidad','Disponibilidad de Tiempo','basicset/clock.png',$link,0,  sizeof($notificacion->getNotificacionTribunal(3)));
  $thises[] = $thise;
  
  $thise = new Menu('Agregar &Aacute;reas');
  $link = Docente::URL."configuracion/configuracion.php";
  $thise->agregarItem('Configuraci&oacute;n','Agregar &Aacute;reas de Disponibilidad','basicset/add.png',$link,0,  sizeof($notificacion->getNotificacionTribunal(3)));
  $thises[] = $thise;
   
   // Notificaciones 
  $usuario      = getSessionUser();
  $notificacion = new Notificacion();

   $thise = new Menu('Notificaciones y Mensajes');
   $link = Docente::URL."notificacion/";
   $thise->agregarItem('Notificaciones','Gesti&oacute;n de Notificaciones','basicset/message-archived.png',$link,0,  sizeof($notificacion->getNotificacionTribunal(3)));
   $link = Docente::URL."notificacion/notificacion.gestion.php?estado_notificacion=SV";
   $counter = $notificacion->getTodasNotificaciones($usuario->id, '', '', ' AND estado_notificacion="SV" ');
   $thise->agregarItem('Notificaciones Pendientes','Todas las notificaciones no leidas','basicset/message-not-read.png',$link,$counter[1]);
   $thises[] = $thise;
   
   $thise = new Menu('Reportes del Sistema');
   $link = Docente::URL."reportes.sistema.php";
   $thise->agregarItem('Reportes de Usuario','Gesti&oacute;n de reportes del sistema.','basicset/diagram_48.png',$link);
   $thises[] = $thise;
  
    return $thises;
  }
  
  
}

?>