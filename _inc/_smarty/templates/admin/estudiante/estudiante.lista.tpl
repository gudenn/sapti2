<table class="tbl_lista">
  <thead>
    <tr>
      <th><a href='?order=codigo_sis'          class="tajax"  title='Ordenar por C&oacute;digo Sis'       >C&oacute;digo Sis   {$filtros->iconOrder('codigo_sis')}</a></th>
      <th></th>
      <th><a href='?order=nombre'              class="tajax"  title='Ordenar por Nombre'           >Nombre       {$filtros->iconOrder('nombre')}</a></th>
      <th><a href='?order=apellido_paterno'    class="tajax"  title='Ordenar por Apellido Paterno' >Ap. Paterno  {$filtros->iconOrder('apellido_paterno')}</a></th>
      <th><a href='?order=apellido_materno'    class="tajax"  title='Ordenar por Apellido Materno' >Ap. Materno  {$filtros->iconOrder('apellido_materno')}</a></th>
      <th><a href='?order=login'               class="tajax"  title='Ordenar por Login'            >Login        {$filtros->iconOrder('login')}</a></th>
      <th><a href='?order=email'               class="tajax"  title='Ordenar por Email'            >Email        {$filtros->iconOrder('email')}</a></th>
      <th>Opciones</th>
    </tr>
  </thead>
  {section name=ic loop=$objs}
  <tbody>
    <tr  class="{cycle values="light,dark"}">
      <td>{$objs[ic]['codigo_sis']}</td>
      <td>
        {if ($objs[ic]['usuario_sexo']==Usuario::FEMENINO)}
          {icono('basicset/user2.png','Femenino')}
        {else}
          {icono('basicset/user1.png','Masculino')}
        {/if}
      </td>
      <td>{$objs[ic]['usuario_nombre']}</td>
      <td>{$objs[ic]['usuario_apellido_paterno']}</td>
      <td>{$objs[ic]['usuario_apellido_materno']}</td>
      <td>{$objs[ic]['usuario_login']}</td>
      <td>{$objs[ic]['usuario_email']}</td>
      <td>
        <a href="{$URL}{Estudiante::URL}reporte.proyecto.php?estudiante_id={$objs[ic]['id']}" target="_blank" >{icono('basicset/project.png','Informe de avance')}</a>
        <a href="estudiante.detalle.php?estudiante_id={$objs[ic]['id']}" target="_blank" >{icono('basicset/user_info.png','Detalle')}</a>
        <a href="estudiante.editar.php?estudiante_id={$objs[ic]['id']}" target="_blank">{icono('basicset/pencil_48.png','Editar')}</a>
        <a href="estudiante.gestion.php?eliminar=1&estudiante_id={$objs[ic]['id']}" onclick="return confirm('Eliminar este Estudiante?');"  >{icono('borrar.png','Eliminar')}</a>
      </td>
    </tr>
  </tbody>
  {/section}
</table>
