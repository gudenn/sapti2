
<div id="content">
  

    <h1 style="text-align: center;margin: 5px 0;">
    LISTA DE PROYECTOS ASIGNADOS
    </h1>
  
        <form action="" method="get" >
     <table class="tbl_lista">
  <thead>
    <tr>
      <th><a href='?order=id'                    accesskey="" class="tajax"  title='Ordenar por Id'           >ID      </a></th>
      <th><a href='?order=proyecto_id'                        class="tajax"  title='Ordenar por Proyecto'     >ESTUDIANTE    </a></th>
      <th><a href='?order=fecha_observacion'                  class="tajax"  title='Ordenar por Fecha'        >PROYECTO   </a></th>
      <th><a href='?order=revisor'                            class="tajax"  title='Ordenar por Revisor'      >VER TRIBUNALES  </a></th>
      <th>OPCIONES</th>
      
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
    <a href="eliminartribunal.php?eliminar&tribunaleliminar_id={$arraytribunal[ic]['id']}" onclick="return confirm('Eliminar la Asignacion de Tribunales?');"  >{icono('borrar.png','Eliminar')}</a>
  
      </td>
        
    </tr>
  {/section}
    </tbody> 
</table> 
      </form>
</div>