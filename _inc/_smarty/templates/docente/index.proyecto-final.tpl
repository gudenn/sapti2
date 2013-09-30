      <div id="content">
        <h1 class="title"><b>Docente:</b><br />{$usuario->apellido_paterno|upper} {$usuario->apellido_materno|upper}, {$usuario->nombre|upper}</h1>
        <div class="dashboard">
          <h2>Gestion de Estudiantes</h2>
          <a href="{$URL}docente/estudiante/inscripcion.estudiante-cvs.php?iddicta={$iddicta}">
            <img src="{$URL_IMG}icons/docente/correccion.png"   width="64px" height="64" alt="Correciones">
            <h3>Registro de Estudiantes</h3>
            <p>Registro de Estudiantes Inscritos en la Materia de Proyecto Final</p>
          </a>
          <a href="{$URL}docente/estudiante/estudiante.lista.php?iddicta={$iddicta}">
            <img src="{$URL_IMG}icons/docente/inscritos.png"   width="64px" height="64" alt="Correciones">
            <h3>Estudiantes Registrados</h3>
            <p>Estudiantes Registrados en la Materia de Proyecto Final</p>
          </a>
          <a href="{$URL}docente/evaluacion/estudiante.evaluacion-editar.php?iddicta={$iddicta}">
            <img src="{$URL_IMG}icons/docente/evaluacion.png"   width="64px" height="64" alt="Correciones">
            <h3>Evaluacion de Estudiantes</h3>
            <p>Evaluacion de Estudiantes Registrados en la Materia de Proyecto Final</p>
          </a>            
        </div>
        <div class="dashboard">
          <h2>Calendario</h2>
          <a href="{$URL}docente/calendario/calendario.evento.php">
            <img src="{$URL_IMG}icons/docente/calendar.png"   width="64px" height="64" alt="Correciones">
            <h3>Calendario de Eventos</h3>
            <p>Calendario con todos los Eventos presentadas por Tutor(es), Docente(s) y Tribunales para el Proyecto Final</p>
          </a>
          <a href="{$URL}docente/calendario/evento.registro.php?iddicta={$iddicta}">
            <img src="{$URL_IMG}icons/docente/registroeve.png"   width="64px" height="64" alt="Correciones">
            <h3>Registro de Eventos</h3>
            <p>Registro de Eventos y en la Materia de Proyecto Final</p>
          </a>
          <a href="{$URL}docente/calendario/evento.lista.php?iddicta={$iddicta}">
            <img src="{$URL_IMG}icons/docente/edicion.png"   width="64px" height="64" alt="Correciones">
            <h3>Edici&oacute;n de Eventos</h3>
            <p>Edici&oacute;n de Eventos de la Materia de Proyecto Final</p>
          </a>            
        </div>
        <div class="dashboard">
          <h2>Notificaciones y Mensajes</h2>
          <a href="{$URL}docente/proyecto-final/avance.registro.php">
            <img src="{$URL_IMG}icons/docente/notificacion.png"   width="64px" height="64" alt="Correciones">
            <h3>Notificaiones</h3>
            <p>Notificaciones para el Proyecto Final</p>
          </a>
          <a href="{$URL}docente/proyecto-final/avance.registro.php">
            <img src="{$URL_IMG}icons/docente/notificacion.png"   width="64px" height="64" alt="Correciones">
            <h3>Mensajes</h3>
            <p>Mensajes para el Proyecto Final</p>
          </a>
        </div>
        
          <div class="dashboard">
          <h2>Configuracion y Vistos Buienos</h2>
          <a href="{$URL}docente/disponibilidad.php">
            <img src="{$URL_IMG}icons/docente/notificacion.png"   width="64px" height="64" alt="Correciones">
            <h3>Tiempo</h3>
            <p>Agregue Disponibilidad de tiempo</p>
          </a>
          <a href="{$URL}docente/configuracion.php">
            <img src="{$URL_IMG}icons/docente/notificacion.png"   width="64px" height="64" alt="Correciones">
            <h3>Areas</h3>
            <p>Agregue las de interes para ser tribunal</p>
          </a>
            
             <a href="{$URL}docente_tutor/estudiante.lista.php">
            <img src="{$URL_IMG}icons/docente/notificacion.png"   width="64px" height="64" alt="Correciones">
            <h3>Tutor</h3>
            <p>Lista de Estudiantes</p>
          </a>
             <a href="{$URL}docente_tribunal/estudiante.lista.php">
            <img src="{$URL_IMG}icons/docente/notificacion.png"   width="64px" height="64" alt="Correciones">
            <h3>Tribunal</h3>
            <p>Lista de Estudiantes</p>
          </a>
        </div>
        
        
        <div  style="clear: both;" ></div>
      </div>