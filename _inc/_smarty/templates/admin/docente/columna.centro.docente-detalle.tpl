      <div id="content">
          <div align="right">
              <a href="docente.gestion.php">{icono('close.png','Cerrar')}</a>
          </div>
        <h1 class="title">Detalle "<i>{$usuario->nombre} {$usuario->apellidos}</i>"</h1>
        <div id="respond">
  
          <p>
              <label for="ci"><small>CI (*):</small></label>
            <span>{$usuario->ci}</span>
            
          </p>
          <p>
            <label for="nombre"><small>Nombres(*):</small></label>
            <span>{$usuario->nombre}</span>
          </p>
          <p>
            <label for="apellido_paterno"><small>Apellido Paterno(*):</small></label>
            <span>{$usuario->apellido_paterno}</span>
          </p>
          <p>
            <label for="apellido_materno"><small>Apellido Materno(*):</small></label>
            <span>{$usuario->apellido_materno}</span>
          </p>
          <p>
            
            <label for="fecha_cumple"><small>Fecha de Nacimiento(*):</small></label>
            <span>{$usuario->fecha_nacimiento}</span>
          </p>
          <p>
            
            <label for="email"><small>E-Mail(*):</small></label>
            <span>{$usuario->email}</span>
          </p>
          <p>
           
            <label for="login"><small>Nombre de usuario (*):</small></label>
             <span>{$usuario->login}</span>
          </p>
        </div>
        <p>{$ERROR}</p>
      </div>
        