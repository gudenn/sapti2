      <div id="content">
        <h1 class="title">Registro de Fecha de formulario de Perfil</h1>
        <p>Formulario de registro de Fecha de formulario de Perfil</p>
        <h2 class="title">Formulario de Registro</h2>
        <div id="respond">
          <form action="#" method="post" id="registro" name="registro" >
             <p>
               <input type="text" name="nombre" id="nombre" value="{$semestrecod}" disabled="disabled">
              <label for="nombre"><small>Cod Semestre Actual {getHelpTip('nombre')}</small></label>
            </p>
             <p> 
            <input type="text" name="fecha_inicio" id="fecha_inicio" value="{$cronograma->fecha_inicio}" size="22"  data-validation-engine="validate[required]">
             <label for="fecha_inicio"><small>Fecha de Inicio {getHelpTip('fecha_inicio')}</small></label>
             </p>
               <p> 
            <input type="text" name="fecha_fin" id="fecha_fin" value="{$cronograma->fecha_fin}" size="22"  data-validation-engine="validate[future[fecha_inicio]]">
             <label for="fecha_fin"><small>Fecha de Fin {getHelpTip('fecha_fin')}</small></label>
             </p>
              <p>
              <textarea name="descripcion" id="descripcion" value="" size="22" style="width: 650px;height: 100px;" data-validation-engine="validate[required]">{$cronograma->detalle_evento}</textarea>
              <label for="descripcion"><small>Detalle del Las Fechas de Registro (*) {getHelpTip('descripcion')}</small></label>
            </p>
            <h2 class="title">Grabar Cronograma</h2>
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
            $('#fecha_inicio').datepicker({
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
           <script type="text/javascript">
        {literal} 
          $(function(){
            $('#fecha_fin').datepicker({
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
        