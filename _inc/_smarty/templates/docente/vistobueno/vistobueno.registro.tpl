      <div id="content">
        <h1 class="title">REGISTRO DE OBSERVACIONES</h1>
        <div id="respond">
          <form action="#" method="post" id="registro" name="registro" >
            <p>
               <label for="nombre de proyecto"><small>NOMBRE DE PROYECTO:</small></label>
               <span>{$proyecto->nombre}</span><br/>
               <label for="nombre de estudiante"><small>NOMBRE DE ESTUDIANTE:</small></label>
               <span>{$usuario->nombre} {$usuario->apellido_paterno} {$usuario->apellido_materno}</span>
            </p>
            <br/>
            <object data="/sapti/ARCHIVO/proyecto.pdf" type="application/pdf" width="900" height="300">
            <p> Al parecer usted no tiene un plugin PDF para este navegador.
            No hay problema ... puedes <a href="/sapti/ARCHIVO/proyecto.pdf"> clic aquí para descargar el archivo PDF. </ a> </ p>
            </object>
            
        
           
            <p>
              <input type="text" name="fecha_revision" id="fecha_revision" value="{$revision->fecha_revision}" size="22"/>
              <label for="fecha_revision"><small>FECHA DE REVISION</small></label>
            </p>

            <h2 class="title">Grabar Revision</h2>
            <p>
              <input type="hidden" id="proyecto_id" name="proyecto_id" value="{$proyecto->id}">
              <input type="hidden"  id="visto_bueno_id"  name="visto_bueno_id" value="{$usuario->id}">
               <input type="hidden"  id="estudiante_id"  name="estudiante_id" value="{$estudiante->id}">
              <input type="hidden" name="tarea" value="registrar">
              <input type="hidden" name="token" value="{$token}">

              <input name="submit" type="submit" id="submit" value="Grabar">
              &nbsp;
              <input name="reset" type="reset" id="reset" tabindex="5" value="Resetear">
            </p>
          </form>
        </div>
        <p>{$ERROR}</p>
        <p>Todos los campos con (*) son obligatorios.</p>
        <script type="text/javascript">
        {literal} 
          $(function(){
            $('#fecha_revision').datepicker({
              dateFormat:'dd/mm/yy',
              changeMonth: true,
              changeYear: true,
              yearRange: "2000:2050"
            });
          });
          jQuery(document).ready(function(){
            jQuery("#registro").validationEngine();
            var wo = 'bottomRight';
            jQuery('input').attr('data-prompt-position',wo);
            jQuery('input').data('promptPosition',wo);
            jQuery('textarea').attr('data-prompt-position',wo);
            jQuery('textarea').data('promptPosition',wo);
            jQuery('select').attr('data-prompt-position',wo);
            jQuery('select').data('promptPosition',wo);
          });
        {/literal} 
        </script>
      </div>
        