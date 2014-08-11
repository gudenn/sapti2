      <div id="content">
        <h1 class="title">Registro de Sub-&Aacute;rea para la &Aacute;rea <b>{strtoupper($area->nombre)}</b></h1>
        <p>Formulario de registro de Sub-&Aacuterea;</p>
        <h2 class="title">Formulario de Sub-&Aacuterea;</h2>
        <div id="respond">
          <form action="#" method="post" id="registro" name="registro" >
            <p>
              <input type="text" name="nombre" id="nombre" value="{$subarea->nombre}"  data-validation-engine="validate[required,funcCall[checkSubArea]]">
              <label for="nombre"><small>Nombre del Sub-&Aacuterea; (*) {getHelpTip('nombre')}</small></label>
            </p>
            <p>
              <input type="text" name="descripcion" id="descripcion" value="{$subarea->descripcion}"  data-validation-engine="validate[required]">
              <label for="descripcion"><small>Descripci&oacute;n del Sub-&Aacuterea; (*) {getHelpTip('descripcion')}</small></label>
            </p>
            <h2 class="title">Grabar Sub-&Aacuterea;</h2>
            <p>
              <input type="hidden" name="id"    value="{$subarea->id}">
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
          function checkSubArea(field, rules, i, options){
        {/literal} 
              if (field.val() === "{$area->nombre}")
        {literal} 
              {
                  // this allows to use i18 for the error msgs
                  return "Por favor el nombre de la Sub-&Aacute;rea no puede ser igual que el &Aacute;rea";
              }
          }

        {/literal} 
        </script>
      </div>
        