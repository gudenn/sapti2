<table class="tbl_lista">
  <thead>
    <tr>
      <th><a href='?order=id'                  class="tajax"  title='Ordenar por Id'           >Id            </a></th>
      <th><a href='?order=codigo'              class="tajax"  title='Ordenar por Codigo'       >Proyecto </a></th>
      <th><a href='?order=codigo'              class="tajax"  title='Ordenar por Codigo'       >Normal</a></th>
      <th><a href='?order=activo'              class="tajax"  title='Ordenar por Activo'       >Postergado   </a></th>
       <th><a href='?order=activo'              class="tajax"  title='Ordenar por Activo'       >Prorroga    </a></th>
      <th>Opciones</th>
    </tr>
  </thead>
 
  <tbody>68510575
       
    <tr  class="{cycle values="light,dark"}">
      <td>{$id}</td>
      <td>{$nombre}</td>
       <td>  {if ( $vigencia->estado_vigencia==='NO' )} {icono('basicset/tick_48.png','Normal')}{/if}</td>
       <td>  {if ( $vigencia->estado_vigencia==='PO' )} {icono('basicset/tick_48.png','En Prorroga')}{/if}</td>
       <td>  {if ( $vigencia->estado_vigencia==='PR' )} {icono('basicset/tick_48.png','Postergado')}{/if}</td>
      <td>{if ( $vigencia->estado_vigencia==='NO' )}
           <a href="estado.gestion.php?id_post={$estudiante->id}&postergar">{icono('basicset/tick_48.png','Postergar')} Postergar</a>
           <a href="estado.gestion.php?id_post={$estudiante->id}&prorroga">{icono('basicset/tick_48.png','Prorroga')} Prorroga</a>
      {/if}
      </td>
    </tr>
  
  </tbody>
 
</table>
