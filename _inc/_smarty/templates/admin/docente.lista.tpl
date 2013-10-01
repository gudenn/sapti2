<table class="tbl_lista">
  <thead>
    <tr>
      <th><a href='?order=id'                  class="tajax"  title='Ordenar por Id'           >Id           {$filtros->iconOrder('id')}</a></th>
      <th><a href='?order=nombre'              class="tajax"  title='Ordenar por Nombre'       >Nombre       {$filtros->iconOrder('nombre')}</a></th>
      <th><a href='?order=apellido_paterno'           class="tajax"  title='Ordenar por Apellidos'    >Apellidos  Paterno  {$filtros->iconOrder('apellido_paterno')}</a></th>
       <th><a href='?order=apellido_materno'           class="tajax"  title='Ordenar por Apellidos'    >Apellidos Materno   {$filtros->iconOrder('apellido_materno')}</a></th>
      <th><a href='?order=login'               class="tajax"  title='Ordenar por Login'        >Login        {$filtros->iconOrder('login')}</a></th>
      <th><a href='?order=email'               class="tajax"  title='Ordenar por Email'        >Email        {$filtros->iconOrder('email')}</a></th>
     
      <th>Opciones</th>
       <th>Agregar Materia Dicta</th>
    </tr>
  </thead>
  {section name=ic loop=$objs}
  <tbody>
    <tr  class="{cycle values="light,dark"}">
      <td>{$objs[ic]['id']}</td>
      <td>{$objs[ic]['usuario_nombre']}</td>
      <td>{$objs[ic]['usuario_apellido_paterno']}</td>
      <td>{$objs[ic]['usuario_apellido_materno']}</td>
      <td>{$objs[ic]['usuario_login']}</td>
      <td>{$objs[ic]['usuario_email']}</td>
     
      <td>
        <a href="docente.detalle.php?docente_id={$objs[ic]['id']}" target="_blank" >{icono('detalle.png','Detalle')}</a>
        <a href="registro-docente.php?docente_id={$objs[ic]['id']}" target="_blank">{icono('editar.png','Editar')}</a>
        <a href="docente.gestion.php?eliminar=1&docente_id={$objs[ic]['id']}" onclick="return confirm('Eliminar este Estudiante?');"  >{icono('borrar.png','Eliminar')}</a>
      </td>
      <td>
           <a href="materia.docente.php?docente_id={$objs[ic]['id']}" >{icono('basicset/pencil_48.png','Editar')} A&ntildeadir Materia </a>
      </td>
    </tr>
  </tbody>
  {/section}
</table>
