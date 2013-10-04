      <div id="content">
        <h1 class="title">NOTA DE LA DEFENSA</h1>
        <div id="respond">
          <form action="#" method="post" id="registro" name="registro" >
            <p>
               <label for="nombre de proyecto"><small>NOMBRE DE PROYECTO:</small></label>
               <span>{$proyecto->nombre}</span><br/>
               <label for="nombre de estudiante"><small>NOMBRE DE ESTUDIANTE:</small></label>
               <span>{$usuario->nombre} {$usuario->apellido_paterno} {$usuario->apellido_materno}</span>
            </p>
            <br/>
           
            
        
            
              <p>
              <input type="text" name="nota_tribunal" id="nota_tribunal" value="{$nota->nota_tribunal}" size="22"/>
              <label for="Nota"><small>Ingrese la Nota</small></label>
            </p>
           
            
            <h2 class="title">Grabar  Nota</h2>
            <p>
               <input type="hidden" name="estudiante_id" value="{$estudiante->id}">
              <input type="hidden" name="proyecto_id" value="{$proyecto->id}">
              <input type="hidden" name="visto_bueno_id" value="{$usuario->id}">
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
        
        
        <script>
         jQuery.validator.setDefaults({
         debug: true,
         success: "valid"
         });
         $( "#registro" ).validate({
        rules: {
         nota_tribunal: {
         required: true,
         range: [13, 23]
         }
         }
         });
</script>
        
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
        