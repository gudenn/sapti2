<table class="tbl_lista">
  <thead>
    <tr>
      <th><a>Id </a></th>
      <th><a>Proyecto </a></th>
      <th><a>Normal</a></th>
      <th><a>Postergado   </a></th>
       <th><a >Prorroga    </a></th>
      <th>Opciones</th>
      <th>Normal</th>
    </tr>
  </thead>
 
  <tbody>
       
    <tr  class="{cycle values="light,dark"}">
      <td>{$proyecto->id}</td>
      <td>{$proyecto->nombre}</td>
       <td>  {if ( $vigencia->estado_vigencia==='NO' )} {icono('basicset/tick_48.png','Normal')}{/if}</td>
       <td>  {if ( $vigencia->estado_vigencia==='PO' )} {icono('basicset/tick_48.png','En Prorroga')}{/if}</td>
       <td>  {if ( $vigencia->estado_vigencia==='PR' )} {icono('basicset/tick_48.png','Postergado')}{/if}</td>
      <td>{if ( $vigencia->estado_vigencia==='NO' )}
           <a href="estado.gestion.php?id_post={$estudiante->id}&postergar">{icono('basicset/tick_48.png','Postergar')} Postergar</a>
           <a href="estado.gestion.php?id_post={$estudiante->id}&prorroga">{icono('basicset/tick_48.png','Prorroga')} Prorroga</a>
      {/if}
        
      </td>
      <td>
         <a href="estado.gestion.php?id_post={$estudiante->id}&normal">{icono('basicset/tick_48.png','Postergar')}Normal</a>
      </td>
      
    </tr>
  
  </tbody>
 
</table>
