
<div id="resultado"></div>
<div style="width: 100%;float: left;" class="tbl_filtro">
     <Hi> LISTA DE PENDIENTES </Hi>
    <table class="tbl_lista" id="docentes"  mane="docentes">
       <thead>
      <tr>
    <th><a>NUMERO</a></th>
    <th><a>NOMBRE</a></th>
    <th><a>APELLIDOS</a></th>
    <th><a>T&Iacute;TULO</a></th>
    <th><a>GESTI&Oacute;N</a></th>
    <th>DETALLE</th> 
    <th>CONFIRMAR</th> 
      </tr>
  </thead>
  <tbody>
  {section name=ic loop=$listadocentes}
   
    <tr  class="selectable">
    <tr  class="{cycle values="light,dark"}">
          <td>{$listadocentes[ic]['pid']}</td>
          <td>{$listadocentes[ic]['nombre']}</td>
          <td>{$listadocentes[ic]['apellidos']}</td>
          <td>{$listadocentes[ic]['titulo']}</td>
          <td>{$listadocentes[ic]['codigo']}</td>
          
          
    <td><a href="../detalle/proyecto.detalle.php?estudiante_id={$listadocentes[ic]['eid']}" >{icono('basicset/document.png','Detalle')} Ver Detalle</a></td> 
    <td><a href="pendientes.gestion.php?proyecto_id={$listadocentes[ic]['pid']}" >{icono('basicset/tick_48.png','Confirmar')} Confirmar</a></td>
    
    
     </tr>
   
    
  {/section}
    </tbody> 
    
   
    
    </table>  
     
        
</div> 
</body>
   


