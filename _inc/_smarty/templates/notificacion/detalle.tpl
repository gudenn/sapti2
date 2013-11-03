

<div id="content">
  <div class="clear"></div>
   <div class='contenido'>
  <h1> Fecha de Envio</h1>
  <p>{$notificacion->fecha_envio}</p>

  <p>Asunto</p>
  <p>{$notificacion->asunto}</p>

  <p>Detalle</p>
  <p>{$notificacion->detalle}</p>


  {if ($notificacion->tipo)==$tiponotificacion}
    <form action="" method="post" >
      <select name=accion>
        {html_options options=$accion}
      </select><br/>
      Asunto<br/>
      <input type="text" id="asunto" name="asunto" value="" /><br />

      <div>
        Detalle<br/>
        <textarea name="detalle" rows="4" style="width: 90%"></textarea>
      </div>

      <div style="text-align: center">
        <input type="hidden"  id="id_notificacion" name="id_notificacion" value="{$notificacion->id}" />
        <input type="hidden" name="tarea" value="registrar">
        <input type="hidden" name="token" value="{$token}">
        <input name="submit" type="submit" id="submit" value="Grabar"  style="text-align: center">
      </div>

    </form>
  {/if}
</div>
</div>
     <p>{$ERROR}</p>


