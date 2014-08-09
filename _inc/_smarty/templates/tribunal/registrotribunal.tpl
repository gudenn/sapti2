
<div id="content">
   <center> <strong> <h1>Formulario De Asignación De Tribunales </h1></strong></td></center>
   
<div >
        <label for="nombre">Estudiante:  {$usuariobuscado->nombre}</label><br />
        <label for="nombre">C&oacute;digo Sis:   {$estudiantebuscado->codigo_sis}</label><br />
        <label for="nombre">Proyecto:   {$proyectobuscado->nombre}</label><br />
    
         <label for="nombre">&Aacute;rea(as):   {foreach from=$proyectoarea item=curr_id}
                                     {$curr_id->nombre}<br />
                                   {/foreach}</label>
     
</div>   
          <div style ="clear:both;"></div>
  <hr>
<div >
  <h1 style="text-align: center" > Modo De Asignaci&oacute;n</h1>
  
   <form action="" method="post">
 
        <input type="hidden" id="proyecto_id" name="proyecto_id" value="{$proyectobuscado->id}" />
        <input type="hidden" id="proyecto_id" name="estudiante_id" value="{$estudiantebuscado->id}" />
         <div style="text-align: center">
         <input type="submit" name="manual" value ="Manual">
         <input type="submit" name="automatico" value ="Automático">
        
        <input type="hidden" name="token" value="{$token}">
       
                  &nbsp;
         </div>
   </form>
 
 </div>
    <div style ="clear:both;"></div>  
  <hr>
         
<div>
 <div style='height: 200px; width: 100%; font-size: 12px; overflow: auto;'>
     <Hi> <B>Lista de Docentes </B></Hi>
<table class="tbl_lista" id="docentes"  mane="docentes">
  <thead>
    <tr>
    <th><a >ID          </a></th>
    <th><a >NOMBRE      </a></th>
    <th><a  >APELLIDOS     </a></th>
    <th><a  >CANTIDAD DE TRIBUNALES ASIGNADOS ACTIVOS    </a></th>
    <th><a >&Aacute;REA</a></th>
    <th><a >AGREGAR</a></th>
        </tr>
  </thead>
  <tbody>
  
    
  {section name=ic loop=$listadocentes}
    
    <tr  class="selectable" id="{$listadocentes[ic][0]}" >
   
      <td>{$listadocentes[ic][0]}
        <input type="hidden" name="ids[]" value="{$listadocentes[ic][0]}">
      </td>
      <td>
        {$listadocentes[ic][1]}
      </td>
      <td>{$listadocentes[ic][2]}</td>
      <td>{$listadocentes[ic][3]}</td>
  <td> <a  class="tooltip"> VER
  <span>
  <b>
 </b>
{foreach name=outer item=contact from=$listadocentes[ic][4]}
  <hr />
  {foreach key=key item=item from=$contact}
  {$key}{$item}<br />
  {/foreach}
{/foreach}
 </span> 
 </a>
</td>
 <td><img src="{$URL}images/click.png" border="1" alt="Agregar" width="30"></td>
     
    </tr>
    
  {/section}
    </tbody> 
</table>
   </div>          
<div style="width: 100%;float: left; padding-left:0px"> 
 <form action="" method="post" id="consejo" >
   <Hi> Lista de Docentes Asignados</Hi>
     <table  multiple id="asignados" >
        <thead>
          <tr>
            <th>ID          </th>
            <th>NOMBRE       </th>
            <th>APELLIDOS   </th>
            <th><a >CANTIDAD DE TRIBUNALES ASIGNADOS ACTIVOS</a></th>
             <th>&Aacute;REA</th>
              <th>QUITAR</th>
            
          </tr>
        </thead>
        <tbody>
   
  {section name=ic loop=$asignados}
    
    <tr  class="selectable" id="{$asignados[ic][0]}" >
   
      <td>{$asignados[ic][0]}
        <input type="hidden" name="ids[]" value="{$asignados[ic][0]}">
      </td>
      <td>
        {$asignados[ic][1]}
      </td>
      <td>{$asignados[ic][2]}</td>
       <td>{$asignados[ic][3]}</td>
  <td>     <a  class="tooltip"> VER
  <span>
  <b>
 </b>
{foreach name=outer item=contact from=$asignados[ic][4]}
  <hr />
  {foreach key=key item=item from=$contact}
  {$item}<br />
  {/foreach}
{/foreach}
 </span> 
        
       </a>
</td>

     <td><img src="{$URL}images/click.png" border="1" alt="Agregar" width="30"></td>

    </tr>
    
  {/section}
          
  
        </tbody>
      </table>
      <input type="hidden" id="proyecto_id" name="proyecto_id" value="{$proyectobuscado->id}" />
      <input type="hidden" id="estudiante_id" name="estudiante_id" value="{$estudiantebuscado->id}" />
      <div style ="clear"></div>
       <div>
       
      <div>
        Detalle<br/>
        <textarea name="detalle" rows="5" style="width: 90%">
Se le Asigno los Tribunales  correspondientes al proyecto:{$proyectobuscado->nombre}  del estudiante:{$usuariobuscado->getNombreCompleto()} para que usted realize las funciones como tribunal al proyecto ya mencionado esperamos su pronta respuesta 
      </textarea>
        <script>
          CKEDITOR.replace('detalle'{$editores});
        </script>
      </div>
     
      
      <div style="text-align: center">
              <input type="hidden" name="tarea" value="registrar">
              <input type="hidden" name="token" value="{$token}">

              <input name="submit" type="submit" id="submit" value="Guardar">
        
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
     alert ( "Solo se Permiten tres Docentes como Tribunales!!" );
      } else
        {
      var  trid = $(this).attr('id'); // table row ID 
      
        var fila=     $(this).html()
                                       
                             $.ajax({
				url: 'verificar.php',
				type: "GET",
				data: "id="+trid,
				success: function(datos){
                               
                               if(datos=="1")
                               {
                                    $("#asignados").append('<tr>' +fila + '</tr>');
                                        $("#"+trid).remove(); 
                               }else
                               {
                                   alert(datos)
                               }
                                        
           
                             }
			});              
       
        
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
        <p>{$ERROR}</p>
  
