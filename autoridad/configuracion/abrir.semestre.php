<?php
try {
  require('../_start.php');
  if(!isAdminSession())
    header("Location: ../login.php"); 
  
  leerClase('Administrador');
  leerClase('Semestre');
  leerClase('Dicta');
  leerClase('Configuracion_semestral');
  leerClase('Inscrito');
  leerClase('Evaluacion');
  /** HEADER */
  $smarty->assign('title','Lista de Estudiantes');
  $smarty->assign('description','P&aacute;gina de Lista de Incritos');
  $smarty->assign('keywords','Gestion,Estudiantes');

  //CSS
  $CSS[]  = URL_CSS . "academic/tables.css";
  $CSS[]  = URL_JS . "box/box.css";  
  $smarty->assign('CSS',$CSS);

  //JS
  $JS[]  = URL_JS . "jquery.min.js";
  $JS[]  = URL_JS ."box/jquery.box.js";
  
  //Validation
  $JS[]  = URL_JS . "validate/idiomas/jquery.validationEngine-es.js";
  $JS[]  = URL_JS . "validate/jquery.validationEngine.js";
  $smarty->assign('JS',$JS);
  /**
   * Menu superior
   */
  $menuList[]     = array('url'=>URL . Administrador::URL , 'name'=>'Administraci&oacute;n');
  $menuList[]     = array('url'=>URL . Administrador::URL . 'configuracion/','name'=>'Configuraci&oacute;n');
  $menuList[]     = array('url'=>URL . Administrador::URL . 'configuracion/'.basename(__FILE__),'name'=>'Abrir Semestre');
  $smarty->assign("menuList", $menuList);

  $semestre=new Semestre();
  $semestre->getActivo();
  $smarty->assign("semestre", $semestre);
   
       $sql2 = "SELECT *
                FROM semestre se
                WHERE se.valor != '".$semestre->valor."'
                ORDER BY se.valor";
   $resultsem = mysql_query($sql2);
   
   $semestre_values[] = '';
   $semestre_output[] = '- Seleccione -';
  while ($row2 = mysql_fetch_array($resultsem, MYSQL_ASSOC)) {
       $semestre_values[] = $row2['id'];
       $semestre_output[] = $row2['codigo'];
 }
  $smarty->assign("semestre_values", $semestre_values);
  $smarty->assign("semestre_output", $semestre_output);
  $smarty->assign("semestre_selected", "");

    if (isset($_POST['tarea']) && $_POST['tarea'] == 'registrar' && isset($_POST['token']) && $_SESSION['register'] == $_POST['token'])
  {
    $EXITO = false;
    mysql_query("BEGIN");
    $semestre_id=$_POST['semestre_id'];
    if($semestre_id >0){
        
           $resul = "SELECT di.id
            FROM dicta di, semestre se
            WHERE di.semestre_id=se.id
            AND se.id='".$semestre_id."'";
            $sql = mysql_query($resul);
            while ($fila1 = mysql_fetch_array($sql, MYSQL_ASSOC)) {
                    $arrayobser[]=$fila1;
            }
            if(count($arrayobser)>0){
                foreach ($arrayobser as $array2){
                    $dicta = new Dicta($array2['id']);
                    $dicta->estado=  Inscrito::E_ACTUAL;
                    $dicta->save();
                    }                
            }

            $resulcerrar = "SELECT it.id as insid, ev.id as evaid
                        FROM inscrito it, evaluacion ev
                        WHERE it.evaluacion_id=ev.id
                        AND it.semestre_id='".$semestre_id."'";
            $sqlcerrar = mysql_query($resulcerrar);
            while ($filacerrar = mysql_fetch_array($sqlcerrar, MYSQL_ASSOC)) {
                    $inscritos[]=$filacerrar;
            }
                        if(count($inscritos)>0){
                foreach ($inscritos as $arraycerrar){
                    $inscrito=new Inscrito($arraycerrar['insid']);
                    $evaluacion=new Evaluacion($arraycerrar['evaid']);
                    $inscrito->estado_inscrito=  Inscrito::E_ACTUAL;
                    $inscrito->save();
                    $evaluacion->estado=  Inscrito::E_ACTUAL;
                    $evaluacion->save();
                    }                
            }
           $semestreactivar=new Semestre($semestre_id);
           $semestreactivar->activar();
           $semestreactivar->save();
           $EXITO = TRUE;
           mysql_query("COMMIT");     
    }

  }

  //No hay ERROR
  $ERROR = ''; 
  leerClase('Html');
  $html  = new Html();
  if (isset($EXITO))
  {
    $html = new Html();
    if ($EXITO)
      $mensaje = array('mensaje'=>'Se grab&oacute correctamente la Configuraci&oacuten','titulo'=>'Registro de Configuraci&oacuten' ,'icono'=> 'tick_48.png');
    else
      $mensaje = array('mensaje'=>'Hubo un problema, No se grab&oacute correctamente la Configuraci&oacuten Seleccione los Campos Obligatorios.','titulo'=>'Registro de Configuraci&oacuten' ,'icono'=> 'warning_48.png');
   $ERROR = $html->getMessageBox ($mensaje);
  }
  $smarty->assign("ERROR",$ERROR);

}
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}
$token                = sha1(URL . time());
$_SESSION['register'] = $token;
$smarty->assign('token',$token);
  $smarty->display('admin/copiarsemestre/full-width.abrir.semestre.tpl');
?>