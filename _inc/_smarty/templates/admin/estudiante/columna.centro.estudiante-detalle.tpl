      <div id="content">
        <h1 class="title">Edici&oacute;n del Estudiante "<i>{$usuario->nombre} {$usuario->apellidos}</i>"</h1>
        <div id="respond">
          <p>
              <label for="codigo_sis"><small>C&oacute;digo SIS:</small></label>
            <span>{$estudiante->codigo_sis}</span>
          </p>
          <p>
              <label for="ci"><small>CI (*):</small></label>
            <span>{$usuario->ci}</span>
          
          </p>
          <p>
              <label for="nombre"><small>Nombres:</small></label>
            <span>{$usuario->nombre}</span>
          
          </p>
          <p>
            <label for="apellidos"><small>Apellidos Paterno:</small></label>
            <span>{$usuario->apellido_paterno}</span>
            
          </p>
          <p>
            <label for="apellidos"><small>Apellidos Materno:</small></label>
            <span>{$usuario->apellido_materno}</span>
            
          </p>
          <p>
            <label for="fecha_cumple"><small>Fecha de Cumplea&ntilde;os:</small></label>
            <span>{$usuario->fecha_cumple}</span>
         
          </p>
          <p>
            <label for="email"><small>E-Mail:</small></label>
            <span>{$usuario->email}</span>
            
          </p>
          <p>
             <label for="login"><small>Nombre de usuario (*):</small></label>
            <span>{$usuario->login}</span>
           
          </p>
        </div>
        <p>{$ERROR}</p>
      </div>
        