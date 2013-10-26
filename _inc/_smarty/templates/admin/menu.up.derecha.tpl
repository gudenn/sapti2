    <div class="fl_right">
      <ul>
        <li><a href="{$URL}autoridad/editar.cuenta.php">Modificar Cuenta</a></li>
        <li><a href="{$URL}?salir=1">Cerrar Sesion</a></li>
        {include file="helpdesk/help.tpl"}
      </ul>
            {if (getSessionUser())}
      <ul>
          <li class="last"><a>Usuario: {$UsuarioSesion}</a></li>
      </ul>
      {/if}
    </div>