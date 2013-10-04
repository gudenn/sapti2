 <div id="content">

    <div >
        
   <form action="" method="post">
      <h1> Detalle del Proyecto </h1>
        
       <label for="nombre">Nombre:  {$usuario->nombre}</label><br />
        <label for="nombre">Apellidos:  {$usuario->apellido_paterno} {$usuario->apellido_materno}</label><br />
         <label for="nombre">Codigo Sis:  {$estudiante->codigo_sis}</label><br />
          <label for="nombre">Proyecto:  {$proyecto->nombre}</label><br />
            <label for="nombre">Modalidad:  {$modalidad->nombre}</label><br />
       
   
 </form>
  <div style="width: 50%;float: left;" class="tbl_filtro">  </div>
   <h1> Tribunales </h1>
</div>  

        <table class="tbl_lista">
  <thead>
    <tr>
      <th><a  >ID          </a></th>
      <th><a  >NOMBRE  </a></th>
      <th><a  >APELLIDOS    </a></th>
      <th><a  >CARTA </a></th>
       </tr>
  </thead>
  
  
  <tbody>
  {section name=ic loop=$arraytribunal}
    <tr  class="selectable">
     <td>{$arraytribunal[ic]['id']} </td>
      <td>{$arraytribunal[ic]['nombre']} </td>
       <td>{$arraytribunal[ic]['apellidos']}</td>
      <td> <a href="carta.php?tribunal_id={$arraytribunal[ic]['id']}" target="_self" >{icono('detalle.png','PDF')}</a>
    
        </td>
      
        
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