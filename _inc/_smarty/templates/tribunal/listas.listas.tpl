
<div id="content">

    <h1 style="text-align: center;margin: 5px 0;">
    Lista de Proyectos Asignados
    
    </h1>
  
        <form action="" method="get" >
     <table class="tbl_lista">
  <thead>
   <tr>
      <th><a href='?order=id'                    accesskey="" class="tajax"  title='Ordenar por Id'           >ID      </a></th>
      <th><a href='?order=proyecto_id'                        class="tajax"  title='Ordenar por Proyecto'     >ESTUDIANTE    </a></th>
      <th><a href='?order=fecha_observacion'                  class="tajax"  title='Ordenar por Fecha'        >PROYECTO   </a></th>
      <th><a href='?order=revisor'                            class="tajax"  title='Ordenar por Revisor'      >VER TRIBUNALES  </a></th>
    
  </tr>
  </thead>
  
  
  <tbody>
  {section name=ic loop=$arraytribunal}
    <tr  class="selectable">
      <td>{$arraytribunal[ic]['id']}</td>
      <td>{$arraytribunal[ic]['nombre']} {$arraytribunal[ic]['apellidos']}</td>
      <td>{$arraytribunal[ic]['nombreproyecto']}</td>
      <td> <a href="mostrartribunal.php?proyecto_id={$arraytribunal[ic]['id']}" target="_blank" >{icono('detalle.png','Ver Tribunales')}</a>
      </td>
     
        
    </tr>
  {/section}
    </tbody> 
</table> 
      </form>
</div>