

 <div id="content">
   <div class="clear"></div>
    <h1 style="text-align: center;margin: 5px 0;">
    LISTA DE PROYECTOS ASIGNADOS
    </h1>
    <div class="clear"></div>
        <form action="" method="get" >
     <table class="tbl_lista">
  <thead>
    <tr>
      <th><a href=''                    accesskey="" class="tajax"  title='Ordenar por Id'           >ID </a></th>
      <th><a href=''                        class="tajax"  title='Ordenar por Proyecto'     >ESTUDIANTE  </a></th>
      <th><a href=''                  class="tajax"  title='Ordenar por Fecha'        >PROYECTO  </a></th>
      <th><a href=''                            class="tajax"  title='Ordenar por Revisor'      >VER TRIBUNALES    </a></th>
      <th>Editar</th>
    </tr>
  </thead>
  
  
  <tbody>
  {section name=ic loop=$arraytribunal}
    <tr  class="selectable">
      <td>{$arraytribunal[ic]['id']}</td>
      <td>{$arraytribunal[ic]['nombre']} {$arraytribunal[ic]['apellidos']}</td>
      <td>{$arraytribunal[ic]['nombreproyecto']}</td>
      <td> <a href="mostrartribunal.php?proyecto_id={$arraytribunal[ic]['id']}" target="_self" >{icono('detalle.png','Ver Tribunales')}</a>
      </td>
      <td>
   <a href="editartribunal.php?editar&proyecto_id={$arraytribunal[ic]['id']}" target="_self">{icono('editar.png','Editar')}</a>
      </td>
        
    </tr>
  {/section}
    </tbody> 
</table> 
      </form>

 </div>