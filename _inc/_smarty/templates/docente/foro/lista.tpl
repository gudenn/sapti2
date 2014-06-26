<table class="tbl_lista">
  <thead>
    <tr>
      <th></th>
      <th>Publicado por</th>
      <th><a href='?order=nombre'              class="tajax"  title='Ordenar por Tema'               >Tema               {$filtros->iconOrder('nombre')}</a></th>
      <th><a href='?order=descripcion'         class="tajax"  title='Ordenar por Descripci&oacute;n' >Descripci&oacute;n {$filtros->iconOrder('descripcion')}</a></th>
      <th>Respuestas</th>
      <th>Opciones</th>
    </tr>
  </thead>
  {section name=ic loop=$objs}
  <tbody>
    <tr  class="{cycle values="light,dark"}">
      <td>{icono('basicset/chat.png','Tema')}</td>
      <td>{$usuario->getNombreCompleto(false , $objs[ic]['usuario_id'])}</td>
      <td>{$objs[ic]['nombre']}</td>
      <td>{$objs[ic]['descripcion']}</td>
      <td>{icono('basicset/bubble_48.png','Respuestas')} {$forotema->contarRespuestas($objs[ic]['id'])}</td>
      <td>
        <a href="respuesta.gestion.php?forotema_id={$objs[ic]['id']}" >{icono('basicset/search_48.png','Ver')} Ver Tema</a>
      </td>
    </tr>
  </tbody>
  {/section}
</table>
           