    <div class="fl_right">
        
        <ul>   
          <li><a href="{$URL}estudiante">Proyectos en Curso</a></li>
          <li><a href="{$URL}estudiante">Proyectos Finalizados</a></li>
          <li><a href="{$URL}tutor">Estadisticas</a></li>
          <li><a href="{$URL}?salir=1">Cerrar Sesion</a></li>   
          <li class="last"><a href="{$URL}ayuda/tutor.pdf" target="_blank">Ayuda {icono('basicset/helpdesk_48.png','Ayuda')}</a></li>
      </ul>
            {if (getSessionUser())}
      <ul>
          <li class="last"><a>Usuario: {$UsuarioSesion}</a></li>
      </ul>
      {/if}
    </div>