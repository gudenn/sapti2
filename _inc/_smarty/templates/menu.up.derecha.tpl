    <div class="fl_right">
      <ul>
        <li><a href="{$URL}estudiante">Estudiantes</a></li>
        <li><a href="{$URL}docente">Tutores</a></li>
        {if (isUserSession())}
        <li><a href="{$URL}docente">Docentes</a></li>
        <li><a href="{$URL}?salir=1">Cerrar Sesion</a></li>
        {include file="helpdesk/help.tpl"}
        {else}
        <li><a href="{$URL}docente">Docentes</a></li>
        {include file="helpdesk/help.tpl"}
        {/if}
      </ul>
      {if (getSessionUser())}
      <ul>
          <li class="last"><a>Usuario: {$UsuarioSesion}</a></li>
      </ul>
      {/if}
    </div>