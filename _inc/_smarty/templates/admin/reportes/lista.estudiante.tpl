

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
     <Hi> LISTA DE PERFIL </Hi>
    <table class="tbl_lista" id="docentes"  mane="docentes">
  <thead>
  <tr>
 
    <th><a>NOMBRE       </a></th>
    <th><a>APELLIDOS     </a></th>
    <th><a>MATERIA</a></th>
    <th><a>ESTADO</a></th>
  
  </tr>
  </thead>
  <tbody>
  {section name=ic loop=$estudiante}
   
    <tr  class="selectable">
    <tr  class="{cycle values="light,dark"}">
        
        <td>{$estudiante[ic]['NOMBRE']}</td>
        <td>{$estudiante[ic]['APELLIDO']}</td>
        <td>{$estudiante[ic]['MATERIA']}</td>
        <td>{$estudiante[ic]['ESTADO']}</td>
    
      
     
    
     </tr>
   
    
  {/section}
    </tbody> 
    
   
    
    </table>  
     
<center> 
<a href="../../reportesistema/reportes.sistema.pdf.php?sql={$sqlr}" target="_blank" >{icono('filepd.png','descargar')}</a>
<a href="../../reportesistema/reporte.sistema.excel.php?sql={$sqlr}" target="_blank" >{icono('boton_excel.png','descargar')}</a>
</center>
</div> 
</body>
   


