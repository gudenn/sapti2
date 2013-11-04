    <div class="fl_right">
      <ul>
        <li><a href="{$URL}docente/editar.cuenta.php">Modificar Cuenta</a></li>
           <li><a href="{$URL}?salir=1">Cerrar Sesi&oacute;n</a></li>
        <li class="last"><a href="{$URL}ayuda/estudiante.pdf" target="_blank">Ayuda {icono('basicset/helpdesk_48.png','Ayuda')}</a></li>
      </ul>
            {if (getSessionUser())}
      <ul>
          <li class="last"><a>Usuario: {$UsuarioSesion}</a></li>
      </ul>
      {/if}
    </div>