 <div id="content">
     
    <center> <strong>FORMULARIO DE REGISTRO DE TRIBUNALES</strong></td></center>
    
    <div style="width: 50%;float: left;"  class="tbl_filtro">
    <form action="" method="post" >
             <h1>  BUSQUEDA POR ESTUDIANTE</h1>
          <table >
          <tr>
              <th><label for="estado_lugar">CODIGO SIS</label></th>
               
          </tr>
           <tr>
            
                 <td>
                      <input type="text" name="codigosis"  id="codigosis" value="{$estudiantebuscado->codigo_sis}" />
                  </td>
        <td><input type="submit" value="Buscar" name="buscar" class="sendme" /></td>
           </tr>
          
          </table>
     </form>

  </div>
<div style="width: 50%;float: left;" class="tbl_filtro">
        
      <h1> Resultado </h1>
        <label for="nombre">Nombre:  {$usuariobuscado->nombre}</label><br />
        <label for="nombre">Apellidos:   {$usuariobuscado->apellido_paterno}{$usuariobuscado->apellido_materno}</label><br />
         <label for="nombre">Codigo Sis:   {$estudiantebuscado->codigo_sis}</label><br />
         <label for="nombre">Proyecto:   {$proyectobuscado->nombre}</label><br />
    
         <label for="nombre">Area(as):   {foreach from=$proyectoarea item=curr_id}
                                     {$curr_id->nombre}<br />
                                   {/foreach}</label><br />
        <label for="nombre">Tutor:   {foreach from=$tutores item=curr_id}
                                     {$curr_id->nombre}<br />
                                      {$curr_id->apellido_paterno}<br />
                                   {/foreach}</label><br />
</div>   
          <div style ="clear:both;"></div>
  <hr>
<div >
  <h1 style="text-align: center" > Modo De Asignaci&oacute;n</h1>
   <form action="" method="post">
 
      <input type="hidden" id="proyecto_id" name="proyecto_id" value="{$proyectobuscado->id}" /><br />
      <input type="hidden" id="proyecto_id" name="estudiante_id" value="{$estudiantebuscado->codigo_sis}" /><br />
      
    
     <div style="text-align: center">
       
       <input type="submit" name="a" value ="A">
        <input type="submit" name="ma" value ="Ma">
        <input type="hidden" name="token" value="{$token}">
       
                  &nbsp;
     </div>
   </form>
 
 </div>
    <div style ="clear:both;"></div>  
  <hr>
         
<div >
  
  
   <div style='height: 200px; width: 100%; font-size: 12px; overflow: auto;'>
     <Hi> Lista de Docentes</Hi>
<table class="tbl_lista" id="docentes"  mane="docentes">
  <thead>
    <tr>
    <th><a >ID          </a></th>
    <th><a >NOMBRE      </a></th>
    <th><a  >APELLIDOS     </a></th>
    <th><a >AREA</a></th>
    <th><a  >TIEMPO  </a></th>
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
<div style="width: 100%;float: left; padding-left:0px"> 
 <form action="" method="post" id="pedido_form" >
   <Hi> Lista de Docentes Asignados</Hi>
     <table  multiple id="asignados" >
        <thead>
          <tr>
            <th>ID          </th>
            <th>NOMBRE       </th>
            <th>APELLIDOS   </th>
             <th>AREA</th>
             <th>TIEMPO</th>
           
          </tr>
        </thead>
        <tbody>
   
  {section name=ic loop=$asignados}
    
    <tr  class="selectable">
   
      <td>{$asignados[ic][0]}
        <input type="hidden" name="ids[]" value="{$asignados[ic][0]}">
      </td>
      <td>
        {$asignados[ic][1]}
      </td>
      <td>{$asignados[ic][2]}</td>
  <td>     <a  class="tooltip"> VER
  <span>
  <b>
 </b>
{foreach name=outer item=contact from=$asignados[ic][3]}
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
{foreach name=outer item=contact from=$asignados[ic][4]}
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
        
     
      <input type="hidden" id="proyecto_id" name="proyecto_id" value="{$proyectobuscado->id}" /><br />
      <input type="text" id="proyecto_id" name="estudiante_id" value="{$estudiantebuscado->codigo_sis}" /><br />
      
    
       <div style ="clear"></div>
       <div>
       
      <div>
        Mensaje<br/>
        <textarea name="detalle" rows="5" style="width: 90%"></textarea>
        <script>
          CKEDITOR.replace('detalle'{$editores})
        </script>
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
   </div>
 </form>
            </div>
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
