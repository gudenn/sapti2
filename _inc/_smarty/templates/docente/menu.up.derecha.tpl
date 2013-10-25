    <div class="fl_right">
      <ul>
        <li><a href="{$URL}docente/editar.cuenta.php">Modificar Cuenta</a></li>
        <li><a href="{$URL}?salir=1">Cerrar Sesion</a></li>
        {include file="helpdesk/help.tpl"}
      </ul>
      
      <div  class="boxsession">
        <p class ='boxsessiontexto'>  Usuario :{$docente->getNombreCompleto()} </p>
       </div>
    </div>