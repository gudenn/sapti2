    <div class="fl_right">
      <ul>
        <li><a href="{$URL}docente/editar.cuenta.php">Modificar Cuenta</a></li>
        <li><a href="{$URL}?salir=1">Cerrar Sesion</a></li>
        {include file="helpdesk/help.tpl"}
      </ul>
      {if (getSessionUser())}
      <ul>
          <li class="last"><a>Usuario: {$UsuarioSesion}</a></li>
      </ul>
      {/if}
      <div  class="boxsession">
        <p class ='boxsessiontexto'>  Usuario :{} </p>
       </div>
    </div>