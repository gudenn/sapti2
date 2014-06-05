<table class="tbl_lista">
    <thead>
        <tr>
            <th><a href='?order=id'                  class="tajax"  title='Ordenar por Id'                 >Id                 {$filtros->iconOrder('id')}</a></th>
            <th><a href='?order=fecha_inicio'              class="tajax"  title='Ordenar por Fecha Inicio'             >Fecha de Inicio          {$filtros->iconOrder('fecha_inicio')}</a></th>
            <th><a href='?order=fecha_fin'         class="tajax"  title='Ordenar por Fecha Fin' >Fecha de Fin {$filtros->iconOrder('fecha_fin')}</a></th>
            <th><a href='?order=descripcion'         class="tajax"  title='Ordenar por Descripcion' >Descripcion {$filtros->iconOrder('descripcion')}</a></th>
            <th>Opciones</th>
        </tr>
    </thead>
    {section name=ic loop=$objs}
        <tbody>
            <tr  class="{cycle values="light,dark"}">
                <td>{$objs[ic]['id']}</td>
                <td>{$objs[ic]['fecha_inicio']}</td>
                <td>{$objs[ic]['fecha_fin']}</td>
                <td>{$objs[ic]['descripcion']}</td>
                <td>
                    <a href="fechaperfil.registro.php?cronograma_id={$objs[ic]['id']}" >{icono('basicset/pencil_48.png','Editar')} Editar</a>
                    <a href="fechaperfil.gestion.php?eliminar=1&cronograma_id={$objs[ic]['id']}" onclick="return confirm('Eliminar este Evento?');"  >{icono('borrar.png','Eliminar')}</a>
                </td>
            </tr>
        </tbody>
    {/section}
</table>
