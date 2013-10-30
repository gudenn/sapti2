    <div class="fl_right">
      {if (getSessionUser())}
      <ul>
        <li><a href="{$URL}autoridad/editar.cuenta.php">Modificar Cuenta</a></li>
        <li><a href="{$URL}?salir=1">Cerrar Sesion</a></li>
        {include file="helpdesk/help.tpl"}
      </ul>
      <ul>
          <li class="last"><a>Usuario: {$UsuarioSesion}</a></li>
      </ul>
      {else}
       <ul>
        <li><a href="{$URL}estudiante">Estudiantes</a></li>
        <li><a href="{$URL}docente">Tutores</a></li>
        <li class="last"><a href="{$URL}docente">Docentes</a></li>
      </ul>
      {/if}
    </div>