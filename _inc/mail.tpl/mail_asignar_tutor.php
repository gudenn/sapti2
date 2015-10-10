<?php
  require_once dirname(dirname(__FILE__))."/_sistema.php";

  global  $tutor,$notificacion;
  if (!isset($tutor) || !isset($tutor->id) || !($tutor->id)){$tutor  = new Tutor(1);}
  if (!isset($notificacion) || !isset($notificacion->id) || !($notificacion->id) ){$notificacion = new Notificacion(1);}

  $usuario = $tutor->getUsuario();
  $style   = "font-family: Verdana,Arial;font-size: 12px;"; 
  $date    = date("F j, Y, g:i a");  ;


  $body_html = <<<___MAIL
    <div style="$style">
    Estimado/a <b>$usuario->nombre $usuario->apellidos</b>:<br>
    <br><br>
    {$notificacion->detalle}

    Fecha: {$date}<br>
    </div>
___MAIL;

  $detalleTXT = strip_tags($notificacion->detalle);
  $body_txt  = "    
    Estimado/a $usuario->nombre $usuario->apellidos:

    {$notificacion->detalle}

    Fecha:  \t  {$date}";

  /** Cuerpo del Email */

  /** destinatarios */
  $to_addrs[]    = $usuario->email;
  // me mandara una copia solo por motivos de testeo y control!!
  if (ENDESARROLLO) {$to_addrs[] = 'guyencu@gmail.com';}

  $Subject = $notificacion->asunto;

  if (ENDESARROLLO && defined('IMPRIMIR_EMAIL_EN_PANTALLA') && IMPRIMIR_EMAIL_EN_PANTALLA)
  {
    echo "<pre>";
    print_r($notificacion);
    echo "</pre>";
    echo "<hr>";
    echo "Subject:$Subject";
    echo "<hr>";
    echo "<pre> DESTINATARIOS <br>";
    print_r($to_addrs);
    echo "</pre>";
    echo "<hr> EN HTML:<br>";
    echo $body_html;
    echo "<hr> EN TXT:<br> ";
    echo "<pre>".$body_txt."</pre>";
  }
  /** Enviamos el email */
  else if (defined('ENVIAR_EMAIL') && ENVIAR_EMAIL){
    require_once(DIR_LIB.'/Mail/mime.php');
    

      $message = new Mail_mime();
      $message->setTXTBody($body_txt);
      $message->setHTMLBody($body_html);
      $body = $message->get();
      $extraheaders = array(
          'From'    => "\"".EMAIL_SISTEMA_NOMBRE."\"<".EMAIL_SISTEMA_EMAIL.">",
          'Subject' => $Subject
      );
      $headers = $message->headers($extraheaders);
      $mail    = Mail::factory('sendmail');//, $smtpinfo);

      foreach ($to_addrs as $to_addr){
          $rv1 = $mail->send($to_addr, $headers, $body);
      }

  }

?>