      <div id="content">
        <h1 class="title">Registro de Evento</h1>
        <p>Formulario de registro de Evento-Cronograma</p>
        <h2 class="title">Formulario de Registro</h2>
        <div id="respond">
          <form action="#" method="post" id="registro" name="registro" >
             <p>
              <input type="text" name="nombre" value="{$semestrecod}"  data-validation-engine="validate[required]">
              <label for="codigo"><small>Cod Semestre Actual (*)</small></label>
            </p>
              <p>
              <input type="text" name="nombre_evento" value="{$cronograma->nombre_evento}"  data-validation-engine="validate[required]">
              <label for="codigo"><small>Nombre del Evento (*)</small></label>
            </p>
            <p>
              <input type="text" name="detalle_evento" value="{$cronograma->detalle_evento}"  data-validation-engine="validate[required]">
              <label for="codigo"><small>Detalle del Evento (*)</small></label>
            </p>
             <p> 
            <input type="text" name="fecha_evento" id="fecha_evento" value="{$cronograma->fecha_evento}" size="22">
             <label for="fecha_evento"><small>Fecha de Evento</small></label>
             </p>
            <h2 class="title">Grabar Evento</h2>
            <p>
              <input type="hidden" name="id"    value="{$cronograma->id}">
              <input type="hidden" name="tarea" value="registrar">
              <input type="hidden" name="token" value="{$token}">
              <input name="submit" type="submit" id="submit" value="Grabar">
              &nbsp;
              <input name="reset" type="reset" id="reset" tabindex="5" value="Cancelar">
            </p>
          </form>
       
        <p>{$ERROR}</p>
        <p>Todos los campos con (*) son obligatorios.</p>
        <script type="text/javascript">
        {literal} 
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
       <script type="text/javascript">
        {literal} 
          $(function(){
            $('#fecha_evento').datepicker({
              dateFormat:'dd/mm/yy',
              changeMonth: true,
              changeYear: true,
              yearRange: "1920:2013"
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
        