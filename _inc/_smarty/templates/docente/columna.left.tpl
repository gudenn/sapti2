      <div id="left_column">
          <div class="subnav">
            <h2>Menu Docente</h2>
            <ul id="accordion">
              <li><a href="{$URL}docente/">Inicio</a></li>
              <li><a href="{$URL}docente/">Proyecto Final</a></li>
                <ul>
                  <li><a href="inscripcion.estudiante-cvs.php">Registro de Estudiantes</a></li>
                  <li><a href="estudiante.lista.php">Estudiantes Registrados</a></li>
                  <li><a href="estudiante.evaluacion-editar.php">Evaluacion de Estudiantes</a></li>
                </ul>
              
              <li><a href="{$URL}docente/">Calendario</a></li>
                <ul>
                  <li><a href="calendario.evento.php">Calendario de Eventos</a></li>
                  <li><a href="evento.registro.php">Registro de Eventos</a></li>
                  <li><a href="evento.lista.php">Edici&oacute;n de Eventos</a></li>
                </ul>
              

              <li><a href="reportes.sistema.php">Reportes del Sistema</a></li>
              <li><a href="editar.cuenta.php">Modificar Cuenta</a></li>
              <li><a href="editar.cuenta.php">Preferencias</a></li>
              <li><a href="{$URL}?salirdocente=1">Salir</a></li>
            </ul>
          </div>
        <div class="holder"></div>
        <div class="subnav">
          <h2>Cronograma de eventos</h2>

          {include file="cronograma/cronograma.tpl"}
        </div>
      </div>
            <script type="text/javascript">
                $("#accordion > li").click(function(){

                        if(false == $(this).next().is(':visible')) {
                                $('#accordion > ul').slideUp(300);
                        }
                        $(this).next().slideToggle(300);
                });
                $('#accordion > ul:eq(0)').show();
            </script>

