



<!-- En "onsubmit" escribimos la funci�n 'MostrarConsulta' que creamos en javascript, con su parametro que es el archivo que vamos a mostrar, en este caso 'consulta.php'-->

<div id="resultado"></div>
<div style="width: 100%;float: left;" class="tbl_filtro">
     <Hi> LISTA DE PERFIL </Hi>
    <table class="tbl_lista" id="docentes"  mane="docentes">
  <thead>
  <tr>
    <th><a href='?order=id'                class="tajax"   title='Ordenar por Id'               >NUMERO           </a></th>
    <th><a href='?order=codigo_box'        class="tajax"   title='Ordenar por Codigo'           >NOMBRE       </a></th>
    <th><a href='?order=proveedor'         class="tajax"   title='Ordenar por Proveedor'        >APELLIDOS     </a></th>
    <th><a href='?order=especialidad'         class="tajax"   title='Ordenar por Especialidad'        >TITULO</a></th>
    <th><a href='?order=id'                class="tajax"   title='Ordenar por Id'               >GESTION</a></th>
    <th>CONFIRMAR</th> 
  </tr>
  </thead>
  <tbody>
  {section name=ic loop=$listadocentes}
   
    <tr  class="selectable">
    <tr  class="{cycle values="light,dark"}">
        <td>{$listadocentes[ic]['id']}</td>
        <td>{$listadocentes[ic]['nombre']}</td>
        <td>{$listadocentes[ic]['apellidos']}</td>
        <td>{$listadocentes[ic]['titulo']}</td>
        <td>{$listadocentes[ic]['codigo']}</td>
       
         <td><a href="pendientes.gestion.php?proyecto_id={$listadocentes[ic]['id']}" >{icono('basicset/tick_48.png','Confirmar')} Confirmar</a></td>
      
     
    
     </tr>
   
    
  {/section}
    </tbody> 
    
   
    
    </table>  
     
        
</div> 
</body>
   

