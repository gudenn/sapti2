<div id="content">
  <h1 class="title">Buscar Docente por Codigo Sis.</h1>     
  
  <div id="respond">
          <form action="#" method="post" id="registro" name="buscar" >
            
            <p>
              <input type="text" name="codigosis" id="codigosis" value="" size="100"  data-validation-engine="validate[required]" >
              <label for="codigosis"><small>Ingrese Codigo Sis del Docente (*){getHelpTip('codigosis')}</small></label>
            </p>

            <h2 class="title">Registrar Consejo</h2>
            <p>
              <input type="hidden" name="id" value="{$tutor->id}">
              <input type="hidden" name="buscar" value="buscar">
              <input type="hidden" name="token" value="{$token}">
              <input name="submit" type="submit" id="submit" value="Buscar">
            </p>
          </form>
        </div>
          <h1 class="title">Registro del Encargado del Consejo</h1>
       
        <h2 class="title">Formulario de registro de Encargado Consejo</h2>
        
        
        <div id="respond">
          <form action="#" method="post" id="registro" name="registro" >
            
            <p>
              <input type="text" name="nombre" id="nombre" value="{$usuario->nombre}" size="100"  data-validation-engine="validate[required]" >
              <label for="nombre"><small>Nombre (*)</small></label>
            </p>
            <p>
              <input type="text" name="apellido_paterno" id="apellido_paterno" value="{$usuario->apellido_paterno}" size="200">
              <label for="apellidos"><small>Apellido Paterno</small></label>
            </p>
            
            <p>
              <input type="text" name="apellido_materno" id="apellido_materno"  value="{$usuario->apellido_materno}" size="200">
              <label for="apellido_materno"><small>Apellido Materno</small></label>
            </p>
            <p>
              <input type="text" name="ci" id="ci" value="{$usuario->ci}" size="100"  data-validation-engine="validate[required]" >
              <label for="ci"><small>CI (*)</small></label>
            </p>
            <p>
              <input type="text" name="email" id="email" value="{$usuario->email}" size="22" data-validation-engine="validate[],custom[email]"  >
              <label for="email"><small>E-Mail</small></label>
            </p>
            <p>
              <input type="text" name="fecha_nacimiento" id="fecha_nacimiento" value="{$usuario->fecha_nacimiento}" size="22">
              <label for="fecha_nacimiento"><small>Fecha de Nacimiento</small></label>
            </p>
            
            <h2 class="title">Registrar Consejo</h2>
            <p>
              {if (isset($estudiante))}
              <input type="hidden" name="usuario_id" id="usuario_id" value="{$usuario->id}" size="22">
              {/if}
              <input type="hidden" name="id" value="{$usuario->id}">
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
            $('#fecha_nacimiento').datepicker({
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