<?php
//require_once("../_sistema.php");
//require_once "Mail.php";
class Mail_enviar
{


  public function __construct() {
   
  }
  
  /**
   * Mostramos el item
   */
  function enviar($usuarios,$titulo,$asunto,$contenido) 
  {
      leerClase('Usuario');

  $style = "font-family: Verdana,Arial;font-size: 12px;"; 
  $date = date("F j, Y, g:i a");  ;
  
  
  $style = "font-family: Verdana,Arial;font-size: 12px;"; 
  $date = date("F j, Y, g:i a");  ;
  
  
    
    
  /** Cuerpo del Email */
 
  /** destinatarios */
 //$url_name = $MATERIA->getTheUrlNAME(1);
 $url_name = "";
  $url_mail = str_replace('www.', '', $url_name);
  
  $to_addrs=array();
  foreach ($usuarios as $key => $value) {
        if (trim($value->email) != '' )
      $to_addrs[]    = $value->email;
  }
 
  $body_html = <<<___MAIL
    <div style="$style">
    Estimado/a <b>$usuario->nombre $usuario->apellidos</b>:<br>
    <br><br>
    {$notificacion->detalle}

    Fecha: {$date}<br>
    </div>
___MAIL;

  $detalleTXT = strip_tags($titulo);
  $body_txt  = "    
    Estimado/a :
    Hemos  {$asunto}
    

    Detalle:
    ------------------------------
    Detalle:\t\t{$contenido}
      Link Doc:\t\t{$contenido}
    ------------------------------
    Fecha:  \t  {$date}";

    
   
  $Subject = $asunto;
  /**
if (ENDESARROLLO)
  {
    echo "<pre>";
    print_r($usuario);
    echo "</pre>";
    echo "<hr>";
    echo "Subject:$Subject";
    echo "<hr>";
    echo "<pre>";
    print_r($to_addrs);
    echo "</pre>";
    echo "<hr>";
    echo $body_html;
    echo "<hr>";
    echo "<pre>".$body_txt."</pre>";
  }else
*/
  {
    require_once(DIR_LIB.'/Mail/mime.php');
    

      $message = new Mail_mime();
      $message->setTXTBody($body_txt);
      $message->setHTMLBody($body_html);
      $body = $message->get();
      $extraheaders = array(
          'From'    => "\"$url_name\"<infosis@cs.umss.edu.bo>",
          'Subject' => $Subject
      );
      $headers = $message->headers($extraheaders);
      $mail    = Mail::factory('sendmail');//, $smtpinfo);

      foreach ($to_addrs as $to_addr)
      {
          $rv1 = $mail->send($to_addr, $headers, $body);
      }

  }


  }


}

