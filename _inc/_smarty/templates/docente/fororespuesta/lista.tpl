<table class="tbl_lista">
  <thead>
    <tr>
      <th>Publicado por</th>
      <th><a href='?order=nombre'              class="tajax"  title='Ordenar por Respuesta'           >T&iacute;tulo     {$filtros->iconOrder('nombre')}</a></th>
      <th><a href='?order=descripcion'         class="tajax"  title='Ordenar por Descripci&oacute;n' >Descripci&oacute;n {$filtros->iconOrder('descripcion')}</a></th>
    </tr>
  </thead>
  {section name=ic loop=$objs}
  <tbody>
    <tr  class="{cycle values="light,dark"}">
      <td>{$usuario->getNombreCompleto(false , $objs[ic]['usuario_id'])}</td>
      <td>{$objs[ic]['nombre']}</td>
      <td>{$objs[ic]['descripcion']}</td>
    </tr>
  </tbody>
  {/section}
</table>
