 <div id="content">
   <h1> Lista   De Solicitudes de Tutor </h1>

        <table class="tbl_lista">
  <thead>
    <tr>
      <th><a href='?order=id'                    accesskey="" class="tajax"  title='Ordenar por Id'           >ID      </a></th>
      <th><a href='?order=proyecto_id'                        class="tajax"  title='Ordenar por Proyecto'     >ETUDIANTE   </a></th>
      <th><a href='?order=fecha_observacion'                  class="tajax"  title='Ordenar por Fecha'        >PROYECTO </a></th>
      <th><a href='?order=fecha_observacion'                  class="tajax"  title='Ordenar por Fecha'        >VER</a></th>
     </tr>
  </thead>
  
  
  <tbody>
  {section name=ic loop=$tutorlista}
    <tr  class="selectable">
     <td>{$tutorlista[ic]['id']} </td>
      <td>{$tutorlista[ic]['nombre']}{$tutorlista[ic]['apellidos']}</td>
       <td>{$tutorlista[ic]['nombreproyecto']} </td>
       
      <td> <a href="ver.php?proyectotutor_id={$tutorlista[ic]['idproyectotutor']}" target="_blank" >{icono('detalle.png','PDF')}</a>
    
        </td>
      
        
    </tr>
  {/section}
    </tbody> 
</table>               
 </div>