    <div class="fl_right">
      <ul>
        <li><a href="{$URL}docente/editar.cuenta.php">Modificar Cuenta</a></li>
        <li><a href="{$URL}docente/editar.cuenta.php">Preferencias</a></li>
        <li><a href="{$URL}?salirdocente=1">Cerrar Sesion</a></li>
        <li class="last"><a href="{$URL}ayuda/estudiante.pdf" target="_blank">Ayuda {icono('basicset/helpdesk_48.png','Ayuda')}</a></li>
      </ul>
      <form action="#" method="post" id="sitesearch">
        <fieldset>
          <strong>Buscar:</strong>
          <input type="text" value="Buscar en SAPTI" onfocus="this.value=(this.value=='Buscar en SAPTI')? '' : this.value ;" />
          <input type="image" src="{$URL_IMG}/academic/search.gif" id="search" alt="Buscar" width="23px" height="23px" />
        </fieldset>
      </form>
    </div>