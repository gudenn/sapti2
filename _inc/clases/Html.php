<?php
/**
 * Clase de apoyo para generar html
 */
class Html
{ 
  
  /**
   * 
   * @param array $mensaje array('mensaje'=>'ete sera el mensaje mensaje' ,'titulo'=>'ete sera el titulo mensaje' , 'icono'=>'ete sera el icono', 'fecha'=>'ete sera el icono', 'autor'=>'ete sera el icono' , 'tipo'=> 'el tipo de mensaje Error,Bien , Normal ' , y veremos que mas se puede usar)
   * @param type $tipo
   */
  function getMessageBox($mensaje) 
  {
    ob_start();
    ?>
    <div  style='display:none'>
      <div id="comments">
        <h2><?php echo (isset($mensaje['titulo']))?$mensaje['titulo']:'Mensaje'; ?></h2>
        <ul class="commentlist">
          <li class="comment_odd">
            <div class="author"><img class="avatar" src="<?php echo URL_IMG ?>icons/basicset/<?php echo (isset($mensaje['icono']))?$mensaje['icono']:'info_48.png'; ?>" width="32" height="32" alt=""><span class="name"><a href="#"><?php echo (isset($mensaje['autor']))?$mensaje['autor']:'SAPTI'; ?></a></span> <span class="wrote"> informa:</span></div>
            <div class="submitdate"><a href="#"><?php echo (isset($mensaje['fecha']))?$mensaje['fecha']:date('j \d\e F \d\e Y, g:i a'); ?></a></div>
            <p><?php echo (isset($mensaje['mensaje']))?$mensaje['mensaje']:''; ?></p>
          </li>
        </ul>
      </div>
    </div>
    <a class='inline' href="#comments" style="color:#fff">v</a>
    <script type="text/javascript">
      var verificado = false;
      jQuery(function(){
        $(".sClose").click(function (){
          $('#cboxOverlay').click();
        });
      });
      jQuery(function(){
        jQuery(".inline").colorbox({inline:true, width:"600px"});
        jQuery(".inline").click();
      });
    </script>
    <?php
    $mensaje_OUT = ob_get_contents();
    ob_end_clean();
    return $mensaje_OUT;
  }


  /**
   * Graba un template para helpDesk
   * @param type $template
   * @param type $somecontent
   * @param type $path
   * @return type
   */
  function grabarTemplate($filename, $somecontent) {
    fopen($filename, "wb");
    // Let's make sure the file exists and is writable first.
    if (is_writable($filename)) {

      // In our example we're opening $filename in append mode.
      // The file pointer is at the bottom of the file hence
      // that's where $somecontent will go when we fwrite() it.
      if (!$handle = fopen($filename, 'a')) {
        return "No se pudo abrir el archivo ($filename)";
      }

      // Write $somecontent to our opened file.
      if (fwrite($handle, $somecontent) === FALSE) {
        return "No se pudo escribir en el archivo ($filename)";
      }

      //echo "Success, wrote (html) to file ($filename)<br/>";

      fclose($handle);
    } else {
      return "El Archivo $filename tiene permisos de escritura";
    }
  }
  /**
   * Leemos un template para el Helpdesk
   * @param type $template
   * @return string
   */
  static function leerTemplate($template) 
  {
    if (!file_exists($template))
      return '';
    ob_start();
    include $template;
    $template = ob_get_contents();
    ob_end_clean();
    return $template;
  }
}

?>