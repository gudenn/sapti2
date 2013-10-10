 <div id="content">

    <center> <strong>Editando</strong></td></center>
     
          
     <form action="" method="post">
      <h1> Detalle Del Proyecto </h1>
        
       <label for="nombre">Nombre:  {$usuario->nombre}</label><br />
        <label for="nombre">Apellidos:  {$usuario->apellido_paterno} {$usuario->apellido_materno}</label><br />
         <label for="nombre">Codigo Sis:  {$estudiante->codigo_sis}</label><br />
          <label for="nombre">Proyecto:  {$proyecto->nombre}</label><br />
            <label for="nombre">Modalidad:  {$modalidad->nombre}</label><br />
       
   
 </form>

    <hr>
       
           
<div >
  
  
   <div >
     <Hi> LISTA DE LOS DOCENTES</Hi>
    <table class="tbl_lista" id="docentes"  mane="docentes">
  <thead>
  <tr>
    <th><a >ID          </a></th>
    <th><a >Nombre      </a></th>
    <th><a  >Apellidos    </a></th>
    <th><a >Area</a></th>
      <th><a >Tiempo</a></th>
     </tr>
  </thead>
  <tbody>
  {section name=ic loop=$listadocentes}
   
    <tr  class="selectable">
   
      <td>{$listadocentes[ic][0]}
        <input type="hidden" name="ids[]" value="{$listadocentes[ic][0]}">
      </td>
      <td>
        {$listadocentes[ic][1]}
      </td>
      <td>{$listadocentes[ic][2]}</td>
  <td>     <a  class="tooltip"> VER
  <span>
  <b>
 </b>
{foreach name=outer item=contact from=$listadocentes[ic][3]}
  <hr />
  {foreach key=key item=item from=$contact}
  {$item}<br />
  {/foreach}
{/foreach}
 </span> 
        
       </a>
</td>
<td>     <a  class="tooltip"> DIS
  <span>
  <b>
 </b>
{foreach name=outer item=contact from=$listadocentes[ic][4]}
  <hr />
  {foreach key=key item=item from=$contact}
  {$item}
  {/foreach}
{/foreach}
 </span> 
    </a>
</td>
     
    </tr>
  {/section}
    </tbody> 
</table>
   </div>          
    
      
       <form action="" method="post" id="pedido_form" >
 <div  >
   <Hi> LISTA DE LOS DOCENTES ASIGNADOS</Hi>
     
      
       <table  multiple id="asignados" >
        <thead>
          <tr>
            <th>ID          </th>
            <th>Nnombre     </th>
            <th>Apellidos   </th>
             <th>Area</th>
             <th>Tiempo</th>
           
          </tr>
        </thead>
        <tbody>
   {section name=ic loop=$listadocenteselec}
   
    <tr  class="selectable">
   
      <td>{$listadocenteselec[ic][0]}
        <input type="hidden" name="ids[]" value="{$listadocenteselec[ic][0]}">
      </td>
      <td>
        {$listadocenteselec[ic][1]}
      </td>
      <td>{$listadocenteselec[ic][2]}</td>
  <td>     <a  class="tooltip"> VER
  <span>
  <b>
 </b>
{foreach name=outer item=contact from=$listadocenteselec[ic][3]}
  <hr />
  {foreach key=key item=item from=$contact}
  {$item}<br />
  {/foreach}
{/foreach}
 </span> 
        
       </a>
</td>
<td>     <a  class="tooltip"> DIS
  <span>
  <b>
 </b>
{foreach name=outer item=contact from=$listadocenteselec[ic][4]}
  <hr />
  {foreach key=key item=item from=$contact}
  {$item}
  {/foreach}
{/foreach}
 </span> 
    </a>
</td>
     
    </tr>
  {/section}
        </tbody>
      </table>
        
     
      <input type="hidden" id="proyecto_id" name="proyecto_id" value="{$proyecto->id}" /><br />
       <input type="hidden" id="proyecto_id" name="estudiante_id" value="{$estudiantebuscado->codigo_sis}" /><br />
      
        </div>
       <div style ="clear:both;"></div>
      <div>
        Mensaje<br/>
        <textarea name="detalle" rows="5" style="width: 90%"></textarea>
      </div>
      <div>
        Observaci&oacute;n<br/>
        <textarea name="comentario" rows="4" style="width: 90%"></textarea>
      </div>
      
      
      <div style="text-align: center">
        <input type="hidden" name="id" value="" />
        <input type="hidden" name="salida_id" value="25" />
        <input type="submit" value="grabar" name="tarea" class="sendme"  />
         
 
      </div>
 
 </form>
    </div>
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