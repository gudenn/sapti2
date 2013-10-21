    <div class="fl_right">
      <ul>
        <li><a href="{$URL}estudiante">Estudiantes</a></li>
        <li><a href="{$URL}tutor">Tutores</a></li>
        {if (isUserSession())}
        <li><a href="{$URL}docente">Docentes</a></li>
        <li class="last"><a href="{$URL}?salir=1">Cerrar Sesion</a></li>
        {else}
        <li class="last"><a href="{$URL}docente">Docentes</a></li>
        {/if}
      </ul>
    </div>