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
  var $menu_items;

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
    leerClase('Administrador');
    $menus = array();
    $thise = new Menu('Docentes');
    $link = Administrador::URL."docente/";
    $thise->agregarItem('Gesti&oacute;n de Docentes','Registro y modificaciones para Docentes','basicset/user4.png',$link);
    $link = Administrador::URL."docente/";
    $thise->agregarItem('Reportes de Docentes','Reportes correspondientes a los Docentes','basicset/graph.png',$link);
    $menus[] = $thise;
    $thise = new Menu('Estudiantes');
    $link = Administrador::URL."estudiante/";
    $thise->agregarItem('Gesti&oacute;n de Estudiantes','Registro y modificaciones para estudiantes','basicset/user5.png',$link);
    $link = Administrador::URL."estudiante/";
    $thise->agregarItem('Reportes de Estudiantes','Reportes correspondientes a los Estudiantes','basicset/graph.png',$link);
    $menus[] = $thise;
    $thise = new Menu('Tutores');
    $link = Administrador::URL."tutor/";
    $thise->agregarItem('Gesti&oacute;n de Tutores','Registro y modificaciones para Tutores','basicset/user1.png',$link);
    $link = Administrador::URL."tutor/";
    $thise->agregarItem('Reportes de Tutores','Reportes correspondientes a los Tutores','basicset/graph.png',$link);
    $menus[] = $thise;
    $thise = new Menu('Autoridades');
    $link = Administrador::URL."autoridad/";
    $thise->agregarItem('Gesti&oacute;n de Autoridades','Registro y modificaciones para Autoridades','basicset/client.png',$link);
    $link = Administrador::URL."autoridad/";
    $thise->agregarItem('Reportes de Autoridades','Reportes correspondientes a los Autoridades','basicset/graph.png',$link);
    $menus[] = $thise;
    $thise = new Menu('Permisos');
    $link = Administrador::URL."seguridad/";
    $thise->agregarItem('Gesti&oacute;n de Permisos','Control y restricciones de los grupos para usuarios del Sistema SAPTI','basicset/login.png',$link);
    $menus[] = $thise;
    $thise = new Menu('Usuarios');
    $link = Administrador::URL."usuario/";
    $thise->agregarItem('Gesti&oacute;n de Usuarios','Registro y modificaciones para Usuarios','basicset/people.png',$link);
    $link = Administrador::URL."usuario/";
    $thise->agregarItem('Reportes de Usuarios','Reportes correspondientes a los Todos los Usuarios','basicset/graph.png',$link);
    $menus[] = $thise;  
    $thise = new Menu('Perfil');
    $link = Administrador::URL."proyeco/";
    $thise->agregarItem('Gesti&oacute;n de Perfiles','Gestionar los perfiles de tesis para los estudiantes','basicset/licence.png',$link);
    $link = Administrador::URL."reportes/";
    $thise->agregarItem('Reportes de Perfiles','Reportes correspondientes a los Perfiles','basicset/graph.png',$link);
    $menus[] = $thise;
    $thise = new Menu('Proyecto Final');
    $link = Administrador::URL."proyecto/";
    $thise->agregarItem('Gesti&oacute;n de Proyectos Finales','Gestionar los proyectos finales de los estudiantes','basicset/briefcase_48.png',$link);
    $link = Administrador::URL."proyecto/";
    $thise->agregarItem('Reportes de Proyectos Finales','Reportes correspondientes a los Proyectos','basicset/graph.png',$link);
    $menus[] = $thise;
    $thise = new Menu('Helpdesk SAPTI');
    $link = Administrador::URL."helpdesk/";
    $thise->agregarItem('Configurar Helpdesk','Gesti&oacute;n de Helpdesk para el sistema SAPTI.','basicset/helpdesk_48.png',$link,0,4);
    $menus[] = $thise;
    $thise = new Menu('Sistema SAPTI');
    $link = Administrador::URL."configuracion/";
    $thise->agregarItem('Configuraciones','Configuraciones para el sistema SAPTI.','basicset/gear_48.png',$link,0,15);
    $menus[] = $thise;
    $thise = new Menu('Notificaciones y Mensajes');
    $link = Administrador::URL."notificacion/";
    $thise->agregarItem('Gesti&oacute;n de Notificaciones','Gestionar Mis notificaciones','basicset/megaphone.png',$link,0,12);
    $link = Administrador::URL."mensajes/";
    $thise->agregarItem('Gesti&oacute;n de Mesajes','Mi correo de Mensajes','basicset/mail.png',$link,14);
    return $menus;
  }
  
  
}

?>