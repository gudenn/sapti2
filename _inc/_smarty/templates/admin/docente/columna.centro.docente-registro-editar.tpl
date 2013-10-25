      <div id="content">
        <h1 class="title">Edici&oacute;n del Usuario "<i>{$usuario->getNombreCompleto()}</i>"</h1>
        <p>Formulario de Edici&oacute;n de Usuario</p>
        <h2 class="title">Formulario de Edici&oacute;n</h2>
        <div id="respond">
          <form action="#" method="post" id="registro" name="registro" >
            <p>
              <input type="text" name="codigo_sis" id="codigo_sis" value="{$docente->codigo_sis}" size="100"  data-validation-engine="validate[required]">
              <label for="codigo_sis"><small>C&oacute;digo SIS (*){getHelpTip('codigo_sis')}</small></label>
            </p>
            <p>
              <input type="text" name="ci" id="ci" value="{$usuario->ci}" size="100"  data-validation-engine="validate[required]" >
              <label for="ci"><small>CI (*){getHelpTip('ci')}</small></label>
            </p>
            <p>
              <input type="text" name="nombre" id="nombre" value="{$usuario->nombre}" size="100"  data-validation-engine="validate[required]" >
              <label for="nombre"><small>Nombres (*){getHelpTip('nombre')}</small></label>
            </p>
            <p>
              <input type="text" name="apellido_paterno" id="apellido_paterno" value="{$usuario->apellido_paterno}" size="200">
              <label for="apellido_paterno"><small>Apellido Paterno{getHelpTip('apellido_paterno')}</small></label>
            </p>
            <p>
              <input type="text" name="apellido_materno" id="apellido_materno" value="{$usuario->apellido_materno}" size="200">
              <label for="apellido_materno"><small>Apellido Materno{getHelpTip('apellido_materno')}</small></label>
            </p>
            <p>
              <input type="text" name="fecha_nacimiento" id="fecha_nacimiento" value="{$usuario->fecha_nacimiento}" size="22">
              <label for="fecha_nacimiento"><small>Fecha de Nacimiento{getHelpTip('fecha_nacimiento')}</small></label>
            </p>
            <p>
              {html_radios name="sexo" options=$sexo selected=$sexo_selected separator="<br>"}
            </p>
            <p>
          <select name="numero_horas" id="numero_horas">
          <option>-Seleccione-</option>
          <option>3</option>
          <option>4</option>
          <option>5</option>
          <option>6</option>
          <option>7</option>
          <option>8</option>
          <option>9</option>
          <option>10</option>
          <option>11</option>
          <option>12</option>
          </select>
          <label for="numero_horas"><small>Numero de Horas Asignadas (*){getHelpTip('Numero de Horas disponibles')}</small></label>
          
           </p>
            <p>
              <input type="text" name="email" id="email" value="{$usuario->email}" size="22" data-validation-engine="validate[],custom[email]"  >
              <label for="email"><small>E-Mail{getHelpTip('email')}</small></label>
            </p>
            <p>
              <input type="text" name="ingreso" id="ingreso" value="{$usuario->login}"  disabled="disabled" size="22">
              <label for="ingreso"><small>Nombre de usuario actual</small></label>
            </p>
            <p class="camno">
              <input type="button" id="cambiar" value="Cambiar Clave" onclick="$('.camno').hide();$('.camcl').fadeIn('slow');" />
              <label for="cambiar"><small>Cambiar la clave de acceso actual{getHelpTip('cambiar_clave')}</small></label>
            </p>
            <p class="camcl">
              <input type="button" id="cambiarno" value="Conservar Clave" onclick="$('.camcl').hide();$('.camno').fadeIn('slow');" />
              <label for="cambiarno"><small>Conservar la clave de acceso actual{getHelpTip('cambiar_clave')}</small></label>
            </p>
            <p class="camcl">
              <input type="password" name="clave1" id="clave1" value="" data-validation-engine="validate[required]"  size="22">
              <label for="clave1"><small>Clave de Ingreso actual (*){getHelpTip('clave')}</small></label>
            </p>
            <p class="camcl">
              <input type="password" name="clave2" id="clave2" value="" data-validation-engine="validate[required]"   size="22">
              <label for="clave2"><small>Clave de Ingreso nueva (*){getHelpTip('clave2')}</small></label>
            </p>
            <p class="camcl">
              <input type="password" name="clave3" id="clave3" value="" data-validation-engine="validate[required,equals[clave2]]"   size="22">
              <label for="clave3"><small>Verifique la nueva Clave (*){getHelpTip('clave3')}</small></label>
            </p>
            <br>
            <h2 class="title">Grabar Modificaciones</h2>
            <p>
              <input type="hidden" name="usuario_id"    value="{$usuario->id}">
              <input type="hidden" name="estudiante_id" value="{$estudiante->id}">
              <input type="hidden" name="tarea" value="registrar">
              <input type="hidden" name="token" value="{$token}">

              <input name="submit" type="submit" id="submit" value="Modificar">
              &nbsp;
            </p>
          </form>
        </div>
        <p>{$ERROR}</p>
        <p>Todos los campos con (*) son obligatorios.</p>
        <script type="text/javascript">
        {literal} 
          $(function(){
            $('#fecha_nacimiento').datepicker({
              dateFormat:'dd/mm/yy',
              changeMonth: true,
              changeYear: true,
        {/literal} 
              yearRange: "1920:{date('Y')}"
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
        