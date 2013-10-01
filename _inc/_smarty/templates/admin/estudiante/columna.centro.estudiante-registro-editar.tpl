      <div id="content">
        <h1 class="title">Edici&oacute;n del Estudiante "<i>{$usuario->nombre} {$usuario->apellidos}</i>"</h1>
        <p>Formulario de Edici&oacute;n de estudiantes</p>
        <h2 class="title">Formulario de Edici&oacute;n</h2>
        <div id="respond">
          <form action="#" method="post" id="registro" name="registro" >
            <p>
              <input type="text" name="codigo_sis" id="codigo_sis" value="{$estudiante->codigo_sis}" size="100"  data-validation-engine="validate[required]">
              <label for="codigo_sis"><small>C&oacute;digo SIS (*)</small></label>
            </p>
            <p>
              <input type="text" name="ci" id="ci" value="{$usuario->ci}" size="100"  data-validation-engine="validate[required]" >
              <label for="ci"><small>CI (*)</small></label>
            </p>
            <p>
              <input type="text" name="nombre" id="nombre" value="{$usuario->nombre}" size="100"  data-validation-engine="validate[required]" >
              <label for="nombre"><small>Nombres (*)</small></label>
            </p>
            <p>
              <input type="text" name="apellido_paterno" id="apellido_paterno" value="{$usuario->apellido_paterno}" size="200">
              <label for="apellido_paterno"><small>Apellido Paterno</small></label>
            </p>
            <p>
              <input type="text" name="apellido_materno" id="apellido_materno" value="{$usuario->apellido_materno}" size="200">
              <label for="apellido_materno"><small>Apellido Materno</small></label>
            </p>
            <p>
              <input type="text" name="fecha_nacimiento" id="fecha_nacimiento" value="{$usuario->fecha_nacimiento}" size="22">
              <label for="fecha_nacimiento"><small>Fecha de Nacimiento</small></label>
            </p>
            <p>
              {html_radios name="sexo" options=$sexo selected=$sexo_selected separator="<br>"}
            </p>
            <p>
              <input type="text" name="email" id="email" value="{$usuario->email}" size="22" data-validation-engine="validate[],custom[email]"  >
              <label for="email"><small>E-Mail</small></label>
            </p>
            <p>
              <input type="text" name="login" id="login" value="{$usuario->login}"  data-validation-engine="validate[required]"  size="22">
              <label for="login"><small>Nombre de usuario (*)</small></label>
            </p>
            <p>
              <input type="password" name="clave" id="clave" value="" data-validation-engine="validate[required]"  size="22">
              <label for="password"><small>Clave de Ingreso (*)</small></label>
            </p>
            <p>
              <input type="password" name="clave2" id="clave2" value="" data-validation-engine="validate[equals[clave]]"   size="22">
              <label for="password"><small>Verifique Clave (*)</small></label>
            </p>
            <h2 class="title">Grabar Estudiante</h2>
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
        