      <div id="content">
        <div  class="notacontenido">
        <h1 class="title">Registro de Visto  Bueno</h1>
        <div id="respond">
          <form action="#" method="post" id="registro" name="registro" >
            <p>
               <label for="nombre de proyecto"><small>Nombre de Proyecto:</small></label>
               <span>{$proyecto->nombre}</span><br/>
               <label for="nombre de estudiante"><small>Nnmbre de Estudiante:</small></label>
               <span>{$usuario->nombre} {$usuario->apellido_paterno} {$usuario->apellido_materno}</span>
            </p>
            <br/>
                   
            <p>
              <input type="text" name="fecha_visto_bueno" id="fecha_visto_bueno" value="{$vistobueno->fecha_visto_buena}" size="22"/>
              <label for="fecha_revision"><small>Fecha De Visto Bueno</small></label>
            </p>
            <h2 class="title">Grabar</h2>
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
            $('#fecha_visto_bueno').datepicker({
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
      </div>
        