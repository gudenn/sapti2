<table class="tbl_lista">
  <thead>
    <tr>
      <th><a href='?order=id'                  class="tajax"  title='Ordenar por Id'                 >Id                 {$filtros->iconOrder('id')}</a></th>
      <th><a href='?order=nombre'              class="tajax"  title='Ordenar por Nombre'             >Nombre            {$filtros->iconOrder('nombre')}</a></th>
      
      <th>Opciones</th>
    </tr>
  </thead>
  {section name=ic loop=$objs}
  <tbody>
    <tr  class="{cycle values="light,dark"}">
      <td>{$objs[ic]['id']}</td>
      <td>{$objs[ic]['nombre']}</td>
      
      <td>
        <a href="codigo_grupo.registro.php?grupo_id={$objs[ic]['id']}" >{icono('basicset/pencil_48.png','Editar')} Editar</a>
        <a href="codigo_grupo.gestion.php?eliminar=1&grupo_id={$objs[ic]['id']}" onclick="return confirm('Eliminar este Grupo?');"  >{icono('borrar.png','Eliminar')}</a>
      </td>
    </tr>
  </tbody>
  {/section}
</table>
