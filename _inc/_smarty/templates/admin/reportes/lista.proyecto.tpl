

<p>Generar Reporte</p>

<!-- En "onsubmit" escribimos la funci�n 'MostrarConsulta' que creamos en javascript, con su parametro que es el archivo que vamos a mostrar, en este caso 'consulta.php'-->
 <form action="#" method="post" id="registro" name="registro" >
              <p>
              <select name="semestre_selec" id="semestre_selec" >
              {html_options values=$semestre_values selected=$semestre_selected output=$semestre_output}
              </select>
              <label for="semestre_selec"><small>Seleccione Semestre(*)</small></label>
              </p>
            
            
              <h2 class="title">Generar </h2>
             <p>
              <input type="hidden" name="tarea" value="registrar">
              <input type="hidden" name="token" value="{$token}">
              <input name="submit" type="submit" id="submit" value="Generar">
              </p>
          </form>
<div id="resultado"></div>
<div style="width: 100%;float: left;" class="tbl_filtro">
     <Hi> LISTA DE PROYECTOS</Hi>
    <table class="tbl_lista" id="docentes"  mane="docentes">
  <thead>
  <tr>
    
    <th><a>NOMBRE       </a></th>
    <th><a>APELLIDOS     </a></th>
    <th><a>T&Iacute;TULO</a></th>
    <th>ESTADO</th>  
    <th><a>GESTI&Oacute;N</a></th>
      
  </tr>
  </thead>
  <tbody>
  {section name=ic loop=$listaproyectos}
   
    <tr  class="selectable">
    <tr  class="{cycle values="light,dark"}">
       
        <td>{$listaproyectos[ic]['NOMBRE']}</td>
        <td>{$listaproyectos[ic]['APELLIDO']}</td>
        <td>{$listaproyectos[ic]['PROYECTO']}</td>
        <td>{$listaproyectos[ic]['ESTADO']}</td>
         <td>{$listaproyectos[ic]['GESTION']}</td>
      
     
    
     </tr>
   
    
  {/section}
    </tbody> 
    
   
    
    </table>  
     
 <center> 
<a href="../reportesistema/reportes.sistema.pdf.php?sql={$sqlr}" target="_blank" >{icono('filepd.png','descargar')}descargar pdf</a>
<a href="../reportesistema/reporte.sistema.excel.php?sql={$sqlr}" target="_blank" >{icono('boton_excel.png','descargar')}descargar excel</a>
</center>
</div> 
</body>
   


