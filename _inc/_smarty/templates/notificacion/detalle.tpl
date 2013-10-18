

<div id="content">
 <div class="clear"></div>
 <form action="" method="post" >
   <h1> Fecha de Envio</h1>
    <p>{$notificacion->fecha_envio}</p>
  
    <h1> Asunto</h1>
   <p>{$notificacion->asunto}</p>
  
    <p>Detalle</p>
   <p>{$notificacion->detalle}</p>
  
    <p>SEÑOR</p>
   <p>{$notificacion->fecha_envio}</p>
 
    <select name=accion>
    {html_options options=$accion}
    </select>
  
       <div>
        Observaci&oacute;n<br/>
        <textarea name="descripcion" rows="4" style="width: 90%"></textarea>
      </div>
   
        <div style="text-align: center">
        <input type="hidden" name="id" value="" />
        <input type="hidden" name="salida_id" value="25" />
        <input type="submit" value="grabar" name="tarea" class="sendme"  />
        </div>
 </form>
  </div>    


