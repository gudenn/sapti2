<table class="tbl_lista">
  <thead>
  <tr>
    <th><a href='?order=titulo_honorifico'   class="tajax"  title='Ordenar por Titulo'           >           {$filtros->iconOrder('titulo_honorifico')}</a></th>
    <th><a href='?order=nombre'              class="tajax"  title='Ordenar por Nombre'           >Nombre           {$filtros->iconOrder('nombre')}</a></th>
    <th><a href='?order=apellido_paterno'    class="tajax"  title='Ordenar por Apellido Paterno' >Apellido Paterno {$filtros->iconOrder('apellido_paterno')}</a></th>
    <th><a href='?order=apellido_materno'    class="tajax"  title='Ordenar por Apellido Materno' >Apellido Materno {$filtros->iconOrder('apellido_materno')}</a></th>
    <th>Quitar</th>
  </tr>
  </thead>
  {section name=ic loop=$objs}
  <tbody>
    <tr  class="{cycle values="light,dark"}">
      <td>{$objs[ic]['usuario_titulo_honorifico']}</td>
      <td>{$objs[ic]['usuario_nombre']}</td>
      <td>{$objs[ic]['usuario_apellido_paterno']}</td>
      <td>{$objs[ic]['usuario_apellido_materno']}</td>
      <td>
        <a href="autoridad.gestion.php?usuario_id_quitar={$objs[ic]['usuario_id']}" >{icono('basicset/quitar.png','Quitar')} Quitar</a>
      </td>
    </tr>
  </tbody>
  {/section}
</table>
