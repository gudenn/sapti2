<table class="tbl_lista">
  <thead>
    <tr>
      <th><a href='?order=estado_notificacion' class="tajax"  title='Ordenar por Estado'             >Est.    {$filtros->iconOrder('estado_notificacion')}</a></th>
      <th><a href='?order=prioridad'           class="tajax"  title='Ordenar por Prioridad'          >Prio.   {$filtros->iconOrder('prioridad')}</a></th>
      <th><a href='?order=fecha_envio'         class="tajax"  title='Ordenar por Fecha'              >Fecha   {$filtros->iconOrder('fecha_envio')}</a></th>
      <th><a href='?order=asunto'              class="tajax"  title='Ordenar por Asunto'             >Asunto  {$filtros->iconOrder('asunto')}</a></th>
      <th><a href='?order=detalle'             class="tajax"  title='Ordenar por Detalle'            >Detalle {$filtros->iconOrder('descripcion')}</a></th>
      <th></th>
    </tr>
  </thead>
  {section name=ic loop=$objs}
  <tbody>
    <tr  class="{cycle values="light,dark"}">
      <td>{$notificacion->getIconLeido($objs[ic]['estado_notificacion'])}</td>
      <td>{$notificacion->getIconPrioridad($objs[ic]['prioridad'])}</td>
      <td>{$objs[ic]['fecha_envio_toshow']}</td>
      <td title="{$objs[ic]['asunto']}">{cortar($objs[ic]['asunto'])}</td>
      <td title="{$objs[ic]['detalle']}">{cortar($objs[ic]['detalle'],60)}</td>
      <td>
        <a href="notificacion.detalle.php?notificacion_id={$objs[ic]['id']}" >{icono('basicset/download.png','Leer Mensaje')} Leer</a>
      </td>
    </tr>
  </tbody>
  {/section}
</table>