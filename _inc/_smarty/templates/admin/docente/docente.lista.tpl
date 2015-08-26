<table class="tbl_lista">
  <thead>
    <tr>
      <th><a href='?order=titulo_honorifico'   class="tajax"  title='Ordenar por T&iacute;tulo' >             {$filtros->iconOrder('id')}</a></th>
      <th><a href='?order=nombre'              class="tajax"  title='Ordenar por Nombre'        >Nombre       {$filtros->iconOrder('nombre')}</a></th>
      <th><a href='?order=apellido_paterno'    class="tajax"  title='Ordenar por Apellidos'     >Ap. Paterno  {$filtros->iconOrder('apellido_paterno')}</a></th>
       <th><a href='?order=apellido_materno'   class="tajax"  title='Ordenar por Apellidos'     >Ap. Materno  {$filtros->iconOrder('apellido_materno')}</a></th>
      <th><a href='?order=login'               class="tajax"  title='Ordenar por Login'         >Login        {$filtros->iconOrder('login')}</a></th>
    
      <th><a href='?order=email'               class="tajax"  title='Ordenar por Email'         >Email        {$filtros->iconOrder('email')}</a></th>
       <th><a href='?order=Codigo Sis'               class="tajax"  title='Ordenar por Sis'         >C&oacute;digo Sis        {$filtros->iconOrder('codigo_sis')}</a></th>
      <th>Opciones</th>
     
    </tr>
  </thead>
  {section name=ic loop=$objs}
  <tbody>
    <tr  class="{cycle values="light,dark"}">
      <td>{$objs[ic]['usuario_titulo_honorifico']}</td>
      <td>{$objs[ic]['usuario_nombre']}</td>
      <td>{$objs[ic]['usuario_apellido_paterno']}</td>
      <td>{$objs[ic]['usuario_apellido_materno']}</td>
      <td>{$objs[ic]['usuario_login']}</td>
      <td>{$objs[ic]['usuario_email']}</td>
      <td>{$objs[ic]['codigo_sis']}</td>
     
      <td>
        <a href="docente.detalle.php?docente_id={$objs[ic]['id']}" target="_self" >{icono('detalle.png','Detalle')}</a>
        <a href="docente.registro.php?docente_id={$objs[ic]['id']}" target="_self">{icono('editar.png','Editar')}</a>
        <a href="docente.gestion.php?eliminar=1&docente_id={$objs[ic]['id']}" onclick="return confirm('Eliminar este Docente?');"  >{icono('borrar.png','Eliminar')}</a>
      </td>
     
    </tr>
  </tbody>
  {/section}
</table>
