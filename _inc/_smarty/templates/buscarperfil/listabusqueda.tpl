


 
    
      
        <div class="clear"></div>
    <center> <td bgcolor="#F7F7F7" style="text-align:center"><strong>RESULTADO DE LA BUSQUEDA</strong></td></center>
    
    <div class="clear"></div>
    
    
          
  
       
       
<div style="width: 80%;float: left;" class="tbl_filtro"></div>
<hr>


<div style="width: 80%;float: left;" class="tbl_filtro"></div>
   
      
           
<div >
  
  
   <div style="width: 100%;float: left;" class="tbl_filtro">
     <Hi> LISTA DE PERFIL </Hi>
    <table class="tbl_lista" id="docentes"  mane="docentes">
  <thead>
  <tr>
    <th><a href='?order=id'                class="tajax"   title='Ordenar por Id'               >ID           </a></th>
    <th><a href='?order=codigo_box'        class="tajax"   title='Ordenar por Codigo'           >NOMBRE       </a></th>
    <th><a href='?order=proveedor'         class="tajax"   title='Ordenar por Proveedor'        >APELLIDOS     </a></th>
    <th><a href='?order=especialidad'         class="tajax"   title='Ordenar por Especialidad'        >TITULO</a></th>
    <th><a href='?order=id'                class="tajax"   title='Ordenar por Id'               >GESTION</a></th>
    <th>Opciones</th>    
  </tr>
  </thead>
  <tbody>
  {section name=ic loop=$listadocentes}
   
    <tr  class="selectable">
    <tr  class="{cycle values="light,dark"}">
        <td>{str_replace($q,"<span style='background-color: #88AAEE'>$q</span>",$listadocentes[ic]['id'])}</td>

        <td>{str_replace($q,"<span style='background-color: #88AAEE'>$q</span>",$listadocentes[ic]['nombre'])}</td>
        <td>{str_replace($q,"<span style='background-color: #88AAEE'>$q</span>",$listadocentes[ic]['apellidos'])}</td>
        <td>{str_replace($q,"<span style='background-color: #88AAEE'>$q</span>",$listadocentes[ic]['titulo'])}</td>
        <td>{str_replace($q,"<span style='background-color: #88AAEE'>$q</span>",$listadocentes[ic]['codigo'])}</td>
      
     
     <td>
        <a href="perfil.detalle.php?id_perfil={$listadocentes[ic]['id']}" target="_blank" >{icono('detalle.png','Detalle')}</a>
   
          </td>
     </tr>
    </tr>
    
  {/section}
    </tbody> 
    
</table>
   </div>          
    
 
    </div>

  

  
    
 

 


    
