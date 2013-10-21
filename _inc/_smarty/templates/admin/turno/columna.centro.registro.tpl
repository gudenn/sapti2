      <div id="content">
        <h1 class="title">Registro de Turno</h1>
        <p>Formulario de registro de Turno</p>
        <h2 class="title">Formulario de Registro</h2>
        <div id="respond">
          <form action="#" method="post" id="registro" name="registro" >
              <p>
              <input type="text" name="nombre" id="nombre" value="{$turno->nombre}"  data-validation-engine="validate[required]">
              <label for="nombre"><small>Nombre de Turno(*) {getHelpTip('nombre')}</small></label>
            </p>
           
             <p>
              <textarea name="descripcion" id="descripcion"  size="22" style="width: 650px;height: 100px;" data-validation-engine="validate[required]">{$turno->descripcion}</textarea>
              <label for="descripcion"><small>Detalle de Turno (*) {getHelpTip('descripcion')}</small></label>
            </p>
            
            <h2 class="title">Grabar Turno</h2>
            <p>
              <input type="hidden" name="id"    value="{$turno->id}">
              <input type="hidden" name="tarea" value="registrar">
              <input type="hidden" name="token" value="{$token}">
              <input name="submit" type="submit" id="submit" value="Grabar">
              &nbsp;
              <input name="reset" type="reset" id="reset" tabindex="5" value="Cancelar">
            </p>
          </form>
        </div>
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
      </div>
        