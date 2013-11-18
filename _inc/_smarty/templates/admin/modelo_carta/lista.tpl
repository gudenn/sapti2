<table class="tbl_lista">
  <thead>
    <tr>
      <th><a href='?order=tipo_proyecto'       class="tajax"  title='Ordenar por Tipo'               >Tipo               {$filtros->iconOrder('tipo_proyecto')}</a></th>
      <th><a href='?order=estado_proyecto'     class="tajax"  title='Ordenar por Estado'             >Estado             {$filtros->iconOrder('estado_proyecto')}</a></th>
      <th><a href='?order=titulo'              class="tajax"  title='Ordenar por T&iacute;tulo'      >T&iacute;tulo      {$filtros->iconOrder('titulo')}</a></th>
      <th><a href='?order=descripcion'         class="tajax"  title='Ordenar por Descripci&oacute;n' >Descripci&oacute;n {$filtros->iconOrder('descripcion')}</a></th>
      <th>Opciones</th>
    </tr>
  </thead>
  {section name=ic loop=$objs}
  <tbody>
    <tr  class="{cycle values="light,dark"}">
      <td>{$objs[ic]['tipo_proyecto']}</td>
      <td>{$objs[ic]['estado_proyecto']}</td>
      <td>{$objs[ic]['titulo']}</td>
      <td>{$objs[ic]['descripcion']}</td>
      <td>
        <a href="modelo_carta.registro.php?modelo_carta_id={$objs[ic]['id']}" >{icono('basicset/pencil_48.png','Editar')} Editar</a>
      </td>
    </tr>
  </tbody>
  {/section}
</table>
