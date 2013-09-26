

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
              <input type="hidden" name="usuario_id"    value="{$usuario->id}">
              <input type="hidden" name="estudiante_id" value="{$estudiante->id}">
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
    <th><a href='?order=id'                class="tajax"   title='Ordenar por Id'               >NUMERO           </a></th>
    <th><a href='?order=codigo_box'        class="tajax"   title='Ordenar por Codigo'           >NOMBRE       </a></th>
    <th><a href='?order=proveedor'         class="tajax"   title='Ordenar por Proveedor'        >APELLIDOS     </a></th>
    <th><a href='?order=especialidad'         class="tajax"   title='Ordenar por Especialidad'        >TITULO</a></th>
    <th><a href='?order=id'                class="tajax"   title='Ordenar por Id'               >GESTION</a></th>
    <th>ESTADO</th>    
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
         <td>{$listadocentes[ic]['estadop']}</td>
      
     
    
     </tr>
    </tr>
    
  {/section}
    </tbody> 
    
</table>
      <a href="prorroga-pdf.php?id_p={$semestre->id}" target="_blank" >{icono('filepd.png','descargar')}</a>
   </div> 
</body>
   


