            <p>
              <input type="text" name="ci" id="ci" value="{$usuario->ci}" size="100"  data-validation-engine="validate[required]" >
              <label for="ci"><small>CI (*){getHelpTip('ci')}</small></label>
            </p>
            <p>
              <select name="titulo_honorifico" id="titulo_honorifico" >
              {html_options values=$titulo_h_values selected=$usuario->titulo_honorifico output=$titulo_h_output}
              </select>
              <label for="semestre_id"><small>T&iacute;tulo (*){getHelpTip('titulo_honorifico')}</small></label>
            </p>
            <p>
              <input type="text" name="nombre" id="nombre" value="{$usuario->nombre}" size="100"  data-validation-engine="validate[required]" >
              <label for="nombre"><small>Nombres (*){getHelpTip('nombre')}</small></label>
            </p>
            <p>
              <input type="text" name="apellido_paterno" id="apellido_paterno" value="{$usuario->apellido_paterno}" size="200" data-validation-engine="validate[required]" >
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
              <input type="text" name="email" id="email" value="{$usuario->email}" size="22" data-validation-engine="validate[],custom[email]"  >
              <label for="email"><small> E-Mail {getHelpTip('email')} </small></label>
            </p>
            {if (!$usuario->id)}
            <p>
              <input type="text" name="login" id="login" value="{$usuario->login}"  data-validation-engine="validate[required]"  size="22">
              <label for="login"><small>Nombre de usuario (*){getHelpTip('login')}</small></label>
            </p>
            {else}
            <p>
              <input type="text" name="ingreso" id="ingreso" value="{$usuario->login}" disabled="disabled"  size="22">
              <label for="login"><small>Nombre de usuario (*){getHelpTip('login')}</small></label>
            </p>
            {/if}
            <div class="password-container">
            <p>
              <input class="strong-password" type="password" name="clave" id="clave" value="" data-validation-engine="validate[required,minSize[6]] text-input"  size="22">
              <label for="clave"><small>Clave de Ingreso (*){getHelpTip('clave')}</small></label>
            </p>
            <p>
              <input class="strong-password" type="password" name="clave2" id="clave2" value="" data-validation-engine="validate[required,minSize[6]] text-input"    size="22">
              <label for="clave2"><small>Verifique Clave (*){getHelpTip('clave2')}</small></label>
           
                <div class="meter">
                </div>
              
            </p>
            </div>
    <link href="{$URL_CSS}stylesegu.css" rel="stylesheet" type="text/css" />
    <script src="{$URL_JS}pschecker.js" type="text/javascript"></script>
            
    <script type="text/javascript">
        $(document).ready(function () {
           
            //Demo code
            $('.password-container').pschecker({ onPasswordValidate: validatePassword, onPasswordMatch: matchPassword });

            var submitbutton = $('.submit-button');
            var errorBox = $('.error');
            errorBox.css('visibility', 'hidden');
            submitbutton.attr("disabled", "disabled");

            //this function will handle onPasswordValidate callback, which mererly checks the password against minimum length
            function validatePassword(isValid) {
                if (!isValid)
                    errorBox.css('visibility', 'visible');
                else
                    errorBox.css('visibility', 'hidden');
            }
            //this function will be called when both passwords match
            function matchPassword(isMatched) {
                if (isMatched) {
                    submitbutton.addClass('unlocked').removeClass('locked');
                    submitbutton.removeAttr("disabled", "disabled");
                }
                else {
                    submitbutton.attr("disabled", "disabled");
                    submitbutton.addClass('locked').removeClass('unlocked');
                }
            }
        });
    </script>
    
    