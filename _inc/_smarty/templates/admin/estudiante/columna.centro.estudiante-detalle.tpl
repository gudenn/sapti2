      <div id="content">
          <div align="right">
              <a href="estudiante.gestion.php">{icono('close.png','Cerrar')}</a>
          </div>
        <h1 class="title">Edici&oacute;n del Estudiante "<i>{$usuario->nombre} {$usuario->apellidos}</i>"</h1>
        <div id="respond">
          <p>
              <label for="codigo_sis"><strong>C&oacute;digo SIS:</strong></label>
            <span>{$estudiante->codigo_sis}</span>
          </p>
          <p>
              <label for="ci"><strong>CI (*):</strong></label>
            <span>{$usuario->ci}</span>
          
          </p>
          <p>
              <label for="nombre"><strong>Nombres:</strong></label>
            <span>{$usuario->nombre}</span>
          
          </p>
          <p>
            <label for="apellidos"><strong>Apellidos Paterno:</strong></label>
            <span>{$usuario->apellido_paterno}</span>
            
          </p>
          <p>
            <label for="apellidos"><strong>Apellidos Materno:</strong></label>
            <span>{$usuario->apellido_materno}</span>
            
          </p>
          <p>
            <label for="fecha_cumple"><strong>Fecha de Cumplea&ntilde;os:</strong></label>
            <span>{$usuario->fecha_nacimiento}</span>
         
          </p>
          <p>
            <label for="email"><strong>E-Mail:</strong></label>
            <span>{$usuario->email}</span>
            
          </p>
          <p>
             <label for="login"><strong>Nombre de usuario (*):</strong></label>
            <span>{$usuario->login}</span>
           
          </p>
        </div>
        <p>{$ERROR}</p>
      </div>
        