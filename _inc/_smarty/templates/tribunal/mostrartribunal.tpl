 <div id="content">

    <div >
        
   <form action="" method="post">
      <h1> Detalle </h1>
        
       <label for="nombre">Estudiante:  {$usuario->getNombreCompleto()}</label><br />
           <label for="nombre">C&oacute;digo Sis:  {$estudiante->codigo_sis}</label><br />
          <label for="nombre">Proyecto:  {$proyecto->nombre}</label><br />
    
 </form>
               <a href="../autoridad/detalle/proyecto.pdf.php?estudiante_id={$estudiante->id}" target="_blank" >{icono('basicset/filepd.png','Descargar Pdf')} Pdf ver Tema</a>

  <div style="width: 50%;float: left;" class="tbl_filtro">  </div>
   <h1> Tribunales </h1>
</div>  

        <table class="tbl_lista">
  <thead>
    <tr>
      <th><a  >Nro.        </a></th>
      <th><a  >Nombre  </a></th>
      <th><a  >Apellidos    </a></th>
      <th><a  >Estado  </a></th>
       <th><a  >Tiempo restante  </a></th>
    </tr>
  </thead>
  
  
  <tbody>
  {section name=ic loop=$arraytribunal}
    <tr  class="selectable">
     <td>{$arraytribunal[ic][0]} </td>
     <td>{$arraytribunal[ic][1]} </td>
     <td>{$arraytribunal[ic][2]}</td>
      <td>{($arraytribunal[ic][3])}</td>
     {if $arraytribunal[ic][3]=='Aceptado'}
         
          <td></td>
          {else}
              
               <td>{($arraytribunal[ic][4])}</td>
                {/if}
     
    
     
         </tr>
  {/section}
    </tbody> 
</table> 

 
<script type="text/javascript">

  jQuery(function(){
    $("#docentes tbody").on("click", "tr", function(event){
 if ($('#asignados > tbody >tr').length==3)
    {
     alert ( "Solo se Permitern tres Tribunales!!" );
      } else
        {
           $("#asignados").append('<tr>' + $(this).html() + '</tr>');
         $(this).remove();
          }
        return false;
      
      
     
      
    
    
    });
  });
</script>

<script type="text/javascript">

  jQuery(function(){
    $("#asignados tbody").on("click", "tr", function(event){
    
      $("#docentes tbody").append('<tr>' + $(this).html() + '</tr>');
      $(this).remove();
      return false;
    });
  });


</script>
              
 </div>