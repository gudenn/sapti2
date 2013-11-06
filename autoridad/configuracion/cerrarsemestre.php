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
  $menuList[]     = array('url'=>URL . Administrador::URL . 'configuracion/'.basename(__FILE__),'name'=>'Cerrar Semestre');
  $smarty->assign("menuList", $menuList);

  $semestre=new Semestre();
  $semestre->getActivo();
  $smarty->assign("semestre", $semestre);
   
       $sql2 = "SELECT *
                FROM semestre se
                WHERE se.valor > '".$semestre->valor."'
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
  
    if (isset($_POST['seleccion'])) 
  $seleccion=$_POST['seleccion'];
  $smarty->assign("seleccion", $seleccion);

    if (isset($_POST['tarea']) && $_POST['tarea'] == 'registrar' && isset($_POST['token']) && $_SESSION['register'] == $_POST['token'])
  {
    $EXITO = false;
    mysql_query("BEGIN");
    $semestre_id=$_POST['semestre_id'];
    if(count($seleccion)>0 && $semestre_id >0){
        if($seleccion[0]=='mate'|| $seleccion[1]=='mate'){
            $resul0 = "SELECT di.id
            FROM dicta di, semestre se
            WHERE di.semestre_id=se.id
            AND se.id='".$semestre_id."'";
            $sql0 = mysql_query($resul0);
            while ($fila10 = mysql_fetch_array($sql0, MYSQL_ASSOC)) {
                    $arrayobser0[]=$fila10;
            }
            if(count($arrayobser0)>0){
           foreach ($arrayobser0 as $array20){
                    $dicta_aux0 = new Dicta($array20['id']);
                    $dicta_aux0->delete();
                    }
            }         
           $resul = "SELECT di.id
            FROM dicta di, semestre se
            WHERE di.semestre_id=se.id
            AND se.id='".$semestre->id."'";
            $sql = mysql_query($resul);
            while ($fila1 = mysql_fetch_array($sql, MYSQL_ASSOC)) {
                    $arrayobser[]=$fila1;
            }
            if(count($arrayobser)>0){
                foreach ($arrayobser as $array2){
                    $dicta_aux = new Dicta($array2['id']);
                    $dicta = new Dicta();
                    $dicta->objBuidFromPost();
                    $dicta->docente_id=$dicta_aux->docente_id;
                    $dicta->estado=$dicta_aux->estado;
                    $dicta->materia_id=$dicta_aux->materia_id;
                    $dicta->codigo_grupo_id=$dicta_aux->codigo_grupo_id;
                    $dicta->semestre_id=$semestre_id;
                    $dicta->save();
                    }                
            }

        }
        if($seleccion[0]=='conf'|| $seleccion[1]=='conf'){
                $resul11 = "SELECT cs.id
                FROM configuracion_semestral cs, semestre se
                WHERE cs.semestre_id=se.id
                AND se.id='".$semestre_id."'";
            $sql11 = mysql_query($resul11);
            while ($fila21 = mysql_fetch_array($sql11, MYSQL_ASSOC)) {
                    $arrayconf1[]=$fila21;
            }
            if(count($arrayconf1)>0){
                foreach ($arrayconf1 as $array31){
                    $conf_aux1 = new Configuracion_semestral($array31['id']);
                    $conf_aux1->delete();
                    }                
            }
                $resul1 = "SELECT cs.id
                FROM configuracion_semestral cs, semestre se
                WHERE cs.semestre_id=se.id
                AND se.id='".$semestre->id."'";
            $sql1 = mysql_query($resul1);
            while ($fila2 = mysql_fetch_array($sql1, MYSQL_ASSOC)) {
                    $arrayconf[]=$fila2;
            }
            if(count($arrayconf)>0){
                foreach ($arrayconf as $array3){
                    $conf_aux = new Configuracion_semestral($array3['id']);
                    $conf = new Configuracion_semestral();
                    $conf->objBuidFromPost();
                    $conf->nombre=$conf_aux->nombre;
                    $conf->valor=$conf_aux->valor;
                    $conf->estado=$conf_aux->estado;
                    $conf->semestre_id=$semestre_id;
                    $conf->save();
                    }                
            }
        }
            $resulcerrar = "SELECT it.id as insid, ev.id as evaid
                        FROM inscrito it, evaluacion ev
                        WHERE it.evaluacion_id=ev.id
                        AND it.semestre_id='".$semestre->id."'";
            $sqlcerrar = mysql_query($resulcerrar);
            while ($filacerrar = mysql_fetch_array($sqlcerrar, MYSQL_ASSOC)) {
                    $inscritos[]=$filacerrar;
            }
                        if(count($inscritos)>0){
                foreach ($inscritos as $arraycerrar){
                    $inscrito=new Inscrito($arraycerrar['insid']);
                    $evaluacion=new Evaluacion($arraycerrar['evaid']);
                    $inscrito->objBuidFromPost();
                    $inscrito->estado_inscrito=  Inscrito::E_CERRADO;
                    $inscrito->save();
                    $evaluacion->objBuidFromPost();
                    $evaluacion->estado=  Inscrito::E_CERRADO;
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
      $mensaje = array('mensaje'=>'Se grabo correctamente la Configuracion','titulo'=>'Registro de Configuracion' ,'icono'=> 'tick_48.png');
    else
      $mensaje = array('mensaje'=>'Hubo un problema, No se grabo correctamente la Configuracion Seleccione los Campos Obligatorios.','titulo'=>'Registro de Configuracion' ,'icono'=> 'warning_48.png');
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
  $smarty->display('admin/copiarsemestre/full-width.cerrarsemestre.tpl');
?>