<table class="tbl_lista">
  <thead>
  <tr>
    <th><a href='?order=id'                  class="tajax"  title='Ordenar por Id'           >Id           {$filtros->iconOrder('id')}</a></th>
    <th><a href='?order=estado'              class="tajax"  title='Ordenar por Estado'       >Estado       {$filtros->iconOrder('estado')}</a></th>
    <th><a href='?order=codigo'              class="tajax"  title='Ordenar por Codigo'       >Codigo       {$filtros->iconOrder('codigo')}</a></th>
    <th><a href='?order=descripcion'         class="tajax"  title='Ordenar por Descipcion'   >Descripcion  {$filtros->iconOrder('descripcion')}</a></th>
    <th>Tools</th>
  </tr>
  </thead>
  {section name=ic loop=$objs}
    <tbody>
    <tr>
      <td>{$objs[ic]['id']}</td>
      <td>{$objs[ic]['estado']}</td>
      <td>{$objs[ic]['codigo']}</td>
      <td>{$objs[ic]['descripcion']}</td>
      <td><a href='grupo.permiso.php?grupo_id={{$objs[ic]['id']}}' title='Agregar'       >{icono('basicset/key.png','Permisos')} Permisos</a></td>
    </tr>
  {/section}
  </tbody>
</table>