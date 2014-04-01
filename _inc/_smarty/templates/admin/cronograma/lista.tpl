<table class="tbl_lista">
    <thead>
        <tr>
            <th><a href='?order=id'                  class="tajax"  title='Ordenar por Id'                 >Id                 {$filtros->iconOrder('id')}</a></th>
            <th><a href='?order=nombre'              class="tajax"  title='Ordenar por Nombre'             >Nombre  Evento           {$filtros->iconOrder('nombre_evento')}</a></th>
            <th><a href='?order=detalle_evento'         class="tajax"  title='Ordenar por Detalle' >Detalle {$filtros->iconOrder('detalle_evento')}</a></th>
            <th><a href='?order=fecha_evento'         class="tajax"  title='Ordenar por Fecha' >Fecha {$filtros->iconOrder('fecha_evento')}</a></th>
            <th>Opciones</th>
        </tr>
    </thead>
    {section name=ic loop=$objs}
        <tbody>
            <tr  class="{cycle values="light,dark"}">
                <td>{$objs[ic]['id']}</td>
                <td>{$objs[ic]['nombre_evento']}</td>
                <td>{$objs[ic]['detalle_evento']}</td>
                <td>{$objs[ic]['fecha_evento']}</td>
                <td>
                    <a href="cronograma.registro.php?cronograma_id={$objs[ic]['id']}" >{icono('basicset/pencil_48.png','Editar')} Editar</a>
                    <a href="cronograma.gestion.php?eliminar=1&cronograma_id={$objs[ic]['id']}" onclick="return confirm('Eliminar este Evento?');"  >{icono('borrar.png','Eliminar')}</a>
                </td>
            </tr>
        </tbody>
    {/section}
</table>
