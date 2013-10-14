      <div id="content">
        <h1 class="title">Registro de Evento</h1>
        <p>Formulario de registro de Evento-Cronograma</p>
        <h2 class="title">Formulario de Registro</h2>
        <div id="respond">
          <form action="#" method="post" id="registro" name="registro" >
             <p>
               <input type="text" name="nombre" id="nombre" value="{$semestrecod}" disabled="disabled">
              <label for="nombre"><small>Cod Semestre Actual {getHelpTip('nombre')}</small></label>
            </p>
              <p>
              <input type="text" name="nombre_evento" id="nombre_evento" value="{$cronograma->nombre_evento}"  data-validation-engine="validate[required]">
              <label for="nombre_evento"><small>Nombre del Evento (*) {getHelpTip('nombre_evento')}</small></label>
            </p>
          
            <p>
              <textarea name="detalle_evento" id="detalle_evento" value="" size="22" style="width: 650px;height: 100px;" data-validation-engine="validate[required]">{$cronograma->detalle_evento}</textarea>
              <label for="detalle_evento"><small>Detalle del Evento (*) {getHelpTip('detalle_evento')}</small></label>
            </p>
             <p> 
            <input type="text" name="fecha_evento" id="fecha_evento" value="{$cronograma->fecha_evento}" size="22"  data-validation-engine="validate[required]">
             <label for="fecha_evento"><small>Fecha de Evento {getHelpTip('fecha_evento')}</small></label>
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
        {/literal} 
              yearRange: "2010:{date('Y')+3}"
        {literal}
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
        