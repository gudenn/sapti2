      <div id="content"  style="width:685px;min-height: 450px;">
        <h1 class="title"><b>Usuario:</b><br />{$usuario->apellido_paterno|upper} {$usuario->apellido_materno|upper}, {$usuario->nombre|upper}</h1>
        {foreach from=$docmateriassemestre item=matesem}
        {if ($matesem['materia']=="Proyecto Final")}
              <div class="imgholder" style="float: left">
         <h2 class="title"><b>Proyecto Final:</b></h2>

                <a href="{$URL}docente/index.proyecto-final.php?iddicta={$matesem['iddicta']}">
                <img src="{$URL_IMG}icons/estudiante/correccion.png"   width="64px" height="64" alt="Proyecto"><br/>
                Grupo:{$matesem['grupo']}
                </a>
              </div>
        {/if}
                {if ($matesem['materia']=="Perfil")}
              <div class="imgholder" style="float: left">
          <h2 class="title"><b>Perfil:</b></h2>

                <a href="{$URL}docente/">
                <img src="{$URL_IMG}icons/estudiante/correccion.png"   width="64px" height="64" alt="Proyecto"><br/>
                Grupo:{$matesem['grupo']}
                </a>
              </div>
        {/if}
        {/foreach}

        <div  style="clear: both;" ></div>
      </div>