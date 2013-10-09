<table class="tbl_lista">
  <thead>
  <tr>
    <th><a href='?order=codigo'              class="tajax"  title='Ordenar por Codigo'       >Codigo       {$filtros->iconOrder('codigo')}</a></th>
    <th><a href='?order=descripcion'         class="tajax"  title='Ordenar por Descipcion'   >Descripcion  {$filtros->iconOrder('descripcion')}</a></th>
    <th><a href='?order=ver'                 class="tajax"  title='Ordenar por Ver'          >Ver          {$filtros->iconOrder('ver')}</a></th>
    <th><a href='?order=crear'               class="tajax"  title='Ordenar por Crear'        >Crear        {$filtros->iconOrder('crear')}</a></th>
    <th><a href='?order=editar'              class="tajax"  title='Ordenar por Editar'       >Editar       {$filtros->iconOrder('editar')}</a></th>
    <th><a href='?order=eliminar'            class="tajax"  title='Ordenar por Eliminar'     >Eliminar     {$filtros->iconOrder('eliminar')}</a></th>
  </tr>
  </thead>
  <tbody>
  {section name=ic loop=$objs}
    <tr>
      <td>{$objs[ic]['modulo_codigo']}</td>
      <td>{$objs[ic]['modulo_descripcion']}</td>
      <td>
        <div id="loading_{$objs[ic]['id']}_ver" style="display: none" >{icono('basicset/loadingcircle.gif','Guardando...')}</div>
        <div id="hidme_{$objs[ic]['id']}_ver" >
        {if ($objs[ic]['ver'])}
          <a href="?ver=0&permiso_id={$objs[ic]['id']}&pg={$objs_pg->ses_pg}" class="tajax" onclick="$('#hidme_{$objs[ic]['id']}_ver').hide();$('#loading_{$objs[ic]['id']}_ver').show();" >
          {icono('basicset/tick_48.png','Denegar acceso')}
          </a>
        {else}
          <a href="?ver=1&permiso_id={$objs[ic]['id']}&pg={$objs_pg->ses_pg}" class="tajax" onclick="$('#hidme_{$objs[ic]['id']}_ver').hide();$('#loading_{$objs[ic]['id']}_ver').show();" >
          {icono('basicset/DeleteRed.png','Denegar acceso')}
          </a>
        {/if}
        </div>
      </td>
      <td>
        <div id="loading_{$objs[ic]['id']}_crear" style="display: none" >{icono('basicset/loadingcircle.gif','Guardando...')}</div>
        <div id="hidme_{$objs[ic]['id']}_crear" >
        {if ($objs[ic]['crear'])}
          <a href="?crear=0&permiso_id={$objs[ic]['id']}&pg={$objs_pg->ses_pg}" class="tajax" onclick="$('#hidme_{$objs[ic]['id']}_crear').hide();$('#loading_{$objs[ic]['id']}_crear').show();" >
          {icono('basicset/tick_48.png','Denegar acceso')}
          </a>
        {else}
          <a href="?crear=1&permiso_id={$objs[ic]['id']}&pg={$objs_pg->ses_pg}" class="tajax" onclick="$('#hidme_{$objs[ic]['id']}_crear').hide();$('#loading_{$objs[ic]['id']}_crear').show();" >
          {icono('basicset/DeleteRed.png','Denegar acceso')}
          </a>
        {/if}
        </div>
      </td>
      <td>
        <div id="loading_{$objs[ic]['id']}_editar" style="display: none" >{icono('basicset/loadingcircle.gif','Guardando...')}</div>
        <div id="hidme_{$objs[ic]['id']}_editar" >
        {if ($objs[ic]['editar'])}
          <a href="?editar=0&permiso_id={$objs[ic]['id']}&pg={$objs_pg->ses_pg}" class="tajax" onclick="$('#hidme_{$objs[ic]['id']}_editar').hide();$('#loading_{$objs[ic]['id']}_editar').show();" >
          {icono('basicset/tick_48.png','Denegar acceso')}
          </a>
        {else}
          <a href="?editar=1&permiso_id={$objs[ic]['id']}&pg={$objs_pg->ses_pg}" class="tajax" onclick="$('#hidme_{$objs[ic]['id']}_editar').hide();$('#loading_{$objs[ic]['id']}_editar').show();" >
          {icono('basicset/DeleteRed.png','Denegar acceso')}
          </a>
        {/if}
        </div>
      </td>
      <td>
        <div id="loading_{$objs[ic]['id']}_eliminar" style="display: none" >{icono('basicset/loadingcircle.gif','Guardando...')}</div>
        <div id="hidme_{$objs[ic]['id']}_eliminar" >
        {if ($objs[ic]['eliminar'])}
          <a href="?eliminar=0&permiso_id={$objs[ic]['id']}&pg={$objs_pg->ses_pg}" class="tajax" onclick="$('#hidme_{$objs[ic]['id']}_eliminar').hide();$('#loading_{$objs[ic]['id']}_eliminar').show();" >
          {icono('basicset/tick_48.png','Denegar acceso')}
          </a>
        {else}
          <a href="?eliminar=1&permiso_id={$objs[ic]['id']}&pg={$objs_pg->ses_pg}" class="tajax" onclick="$('#hidme_{$objs[ic]['id']}_eliminar').hide();$('#loading_{$objs[ic]['id']}_eliminar').show();" >
          {icono('basicset/DeleteRed.png','Denegar acceso')}
          </a>
        {/if}
        </div>
      </td>
    </tr>
  {/section}
  </tbody>
</table>