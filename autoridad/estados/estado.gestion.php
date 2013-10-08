<?php
try {
  define ("MODULO", "SEMESTRE-GESTION");
  require('../_start.php');
  if(!isAdminSession())
    header("Location: ../login.php");  

  leerClase("Semestre");
  leerClase("Formulario");
  leerClase("Pagination");
  leerClase("Filtro");


  $ERROR = '';

  /** HEADER */
  $smarty->assign('title','Gestion de Estado');
  $smarty->assign('description','Pagina de gestion de Estados');
  $smarty->assign('keywords','Gestion,estados');
  leerClase('Administrador');
  leerClase('Estudiante');
  leerClase('Proyecto');
  leerClase('Usuario');
  leerClase('Vigencia');
  /**
   * Menu superior
   */
  $menuList[]     = array('url'=>URL . Administrador::URL , 'name'=>'Administrador');
  $menuList[]     = array('url'=>URL . Administrador::URL . 'estados/','name'=>'Estado');
  $menuList[]     = array('url'=>URL . Administrador::URL . 'estados/'.basename(__FILE__),'name'=>'Gestion de Estados');
  $smarty->assign("menuList", $menuList);

  //CSS
  $CSS[]  = URL_CSS . "academic/tables.css";
  //$CSS[]  = URL_CSS . "pg.css";
  $smarty->assign('CSS',$CSS);

  //JS
  $JS[]  = URL_JS . "jquery.min.js";
  $smarty->assign('JS',$JS);

  $id_es=$_GET['id_post'];
  $estudiante=new Estudiante($id_es);
  
  $proyecto=$estudiante->getProyecto();
  $p=new Proyecto($proyecto->id);
  $v=$p->getVigencia();
  $a=$p->getArea();
  $p->nombre;
  $a->nombre;
  $vigencia= new Vigencia($proyecto->id);

 
  

 
  
 
 $smarty->assign('proyecto'     ,$proyecto);
 $smarty->assign('vigencia'     ,$vigencia);
 $smarty->assign('estudiante'     ,$estudiante);

  
  //////////////////////////////////////////////////////////////////
  //////////////////////////////////////////////////////////////////
  //////////////////////////////////////////////////////////////////
 $ERROR = ''; 
  leerClase('Html');
  $html  = new Html();
  leerClase('Html');
  $html  = new Html();
 
 

  if (isset($_GET['postergar']) )
  {
      
 
 
    $fechafin=$vigencia->fecha_fin;

    echo date("Y-m-d",strtotime("$fechafin +6 month") );;;
 $vigencia->fecha_fin=  date("d/m/Y",strtotime("$fechafin +12 month") );;
     
     $vigencia->estado_vigencia='PO';
     $vigencia->save();
  }
  

       if (isset($_GET['prorroga']) )
  {
       
     $fechafin=$vigencia->fecha_fin;
     $vigencia->fecha_fin=  date("d/m/Y",strtotime("$fechafin +6 month") );
     $vigencia->estado_vigencia='PR';
     $vigencia->save();
 }
      
            
        
 
  

  
 
  
 

  $smarty->assign('mascara'     ,'admin/listas.mascara.tpl');
  $smarty->assign('lista'       ,'admin/estado/lista.tpl');

 



  //No hay ERROR
  $smarty->assign("ERROR",'');
  $smarty->assign("URL",URL);  

}
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}

if (isset($_GET['tlista']) && $_GET['tlista']) //recargamos la tabla central
  $smarty->display('admin/listas.lista.tpl'); 
else
  $smarty->display('admin/full-width_1.tpl');


?>