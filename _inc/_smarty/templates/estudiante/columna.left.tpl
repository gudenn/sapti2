      <div id="left_column">
          <div class="subnav">
            <h2>Menu Estudiante</h2>
            <ul>
              <li><a href="{$URL}estudiante/">Inicio</a></li>
              {if ($proyecto)}
              <li><a href="{$URL}estudiante/">Proyecto Final</a>
                <ul>
                  <li><a href="{$URL}estudiante/proyecto-final/correcion.gestion.php">Registro Correci&oacute;n</a></li>
                  <li><a href="{$URL}estudiante/proyecto-final/archivo.gestion.php">Archivo</a></li>
                  <li><a href="{$URL}estudiante/proyecto-final/notificacion.gestion.php">Notificaciones</a></li>
                </ul>
              </li>
              {/if}
              {if ($vistodoc&$vistotu)}
              <li><a href="{$URL}autoridad/proyecto/proyecto.registro.php">Registro Perfil</a></li>
              {/if}
              <li><a href="editar.cuenta.php">Modificar Cuenta</a></li>
              <li><a href="editar.cuenta.php">Preferencias</a></li>
              <li><a href="{$URL}?salirestudiante=1">Salir</a></li>
            </ul>
          </div>
        <div class="holder"></div>
        <div class="subnav">
          <h2>Cronograma de eventos</h2>

          {include file="cronograma/cronograma.tpl"}
        </div>
      </div>