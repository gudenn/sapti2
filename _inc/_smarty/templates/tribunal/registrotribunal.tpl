
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
       <a href="../autoridad/detalle/proyecto.pdf.php?estudiante_id={$estudiantebuscado->id}" target="_blank" >{icono('basicset/filepd.png','Descargar Pdf')} Pdf ver Tema</a>
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
      <label  style="font-size: 13px; color: black;"for="txtBuscar">Buscar: </label>
     <input  style="width: 590px; height: 30px; color: #000;" type="search" id="txtBuscar" name="txtBuscar" placeholder="Digite el nombre que desea encontrar. Para cancelar presione  la tecla ESCAPE."></br>
                    <p style="color: black; font-size: 13px;"> Lista de Docentes</p>  
 <div style='height: 200px; width: 100%; font-size: 12px; overflow: auto;'>
    

     <table style="color: #000;" class="tbl_lista" id="docentes"  mane="docentes">
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
<td><div id="1{$listadocentes[ic][0]}">
     <img src="{$URL}images/add.png" border="1" alt="Agregar" width="30">
      </div>
     </td>
   
    </tr>
    
  {/section}
    </tbody> 
</table>
   </div> <br>         
<div style="width: 100%;float: left; padding-left:0px"> 
 <form action="" method="post" id="consejo" >
     <p style="color: black; font-size: 14px;"> Lista de Docentes Asignados</p>  
     <table  style="color: #000;" multiple id="asignados" >
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

   <td>
       <div id="1{$asignados[ic][0]}">
       <img src="{$URL}images/remove.png" border="1" alt="Agregar" width="30">
         </div>
       </td>
     

    </tr>
    
  {/section}
          
  
        </tbody>
      </table>
      <input type="hidden" id="proyecto_id" name="proyecto_id" value="{$proyectobuscado->id}" />
      <input type="hidden" id="estudiante_id" name="estudiante_id" value="{$estudiantebuscado->id}" />
      <div style ="clear"></div>
       <div>
       
      <div>
          <p style="color: black; font-size: 13px;">
                 Detalle<br/>
          </p>
     
        <textarea name="detalle" rows="5" style="width: 90%; color: #000">
Se le Asignó  Tribunal  correspondientes al proyecto:{$proyectobuscado->nombre}  del UNIV.:  {$usuariobuscado->getNombreCompleto()} para que usted realize las funciones como tribunal al proyecto ya mencionado esperamos su pronta respuesta 
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
   
    //cali rojas
//lewebmonster.com
 
$(function(){
//funcion para buscar en una tabla con jQuery
    $.fntBuscarEnTabla=function(strCadena,strIDdeTabla){
        //seleccionamos la tabla en la que vamos a buscar
        var $objTabla=$('#'+strIDdeTabla);
        //eliminamos la fila temporal que contiene una leyenda cuando
        //la busqueda no devuelve resultados
        $objTabla.find('#trFilaConMensaje').remove();
         
        //iteramos en todas las filas del body de la tabla
        $objTabla.find('tbody tr').each(function(iIndiceFila,objFila){
            //obtenemos todas las celdas de la fila
            var $objCeldas=$(objFila).find('td');
             
            //verificamos que la fila tenga celdas
            if($objCeldas.length>0){
                var blnLaCadenaExiste=false;
                //recorremos todas las celdas de la fila actual
                $objCeldas.each(function(iIndiceCelda,objCeldaFila){
                    //limpiamos la cadena que el usuario esta buscando (de caracteres que puedan chocar con
                    //codigo JavaScript, lo cual genera un error en runtime)
                    var objRegEx=new RegExp(RegExp.escape(strCadena),'i');
                    //comparamos si la cadena buscada esta en la celda
                    if(objRegEx.test($(objCeldaFila).text())){
                        //indicamos que hemos encontrado la cadena
                        blnLaCadenaExiste=true;
                        //salimos del bucle (el de las celdas o columnas)
                        return false;
                    }
                });
                //si la cadena fue encontrada, entonces mostramos el contenido de la fila,
                //sino, se oculta la fila por completo
                if(blnLaCadenaExiste===true)$(objFila).show();else $(objFila).hide();
            }
        });
         
        //si no hay resultados agregamos una fila temporal para decirle al usuario que
        //no hemos encontrado lo que busca
        if($objTabla.find('tbody tr:visible').length==0){
            //obtenemos la cantidad de columnas para hacer un colspan
            var iColumnas=$objTabla.find('tbody tr:first-child td').length;
            //agregamos al cuerpo de la tabla la fila con el mensaje            
                $('<tr>',{
                    id: 'trFilaConMensaje'
                }).append(
                    //agregamos a la fila una celda con el mensaje
                    $('<td>',{
                        colspan: iColumnas,
                        align: 'center',
                        html: '<em>No hay resultados, intente otra b&uacute;squeda</em>'
                    })
                ).appendTo($objTabla.find('tbody'));
        }
    }
     
//extendemos RegEx y agregamos un metodo que nos permita limpiar los caracteres
//que el usuario busca en la tabla, esto es para evitar errores de sintaxis en
//tiempo de ejecucion
    RegExp.escape=function(strCadena){
        var strCaracteresEspeciales=new RegExp("[.*+?|()\\[\\]{}\\\\]", "g");
        //devolvemos la cadena limpia
        return strCadena.replace(strCaracteresEspeciales, "\\$&");
    };
     
//hacemos la busqueda en el evento search del control de busqueda
    $('#txtBuscar').on('search',function(){
        //le decimos a la funcion que busque en la tabla tblTabla el
        //valor que contiene el campo actual
        $.fntBuscarEnTabla($(this).val(),'docentes');
    });

$("#txtBuscar").keyup(function(){
    $.fntBuscarEnTabla($(this).val(),'docentes');
}); 
});
</script>
<script type="text/javascript">



  jQuery(function(){
    $("#docentes tbody").on("click", "tr", function(event){
 if ($('#asignados > tbody >tr').length==3)
    {
     alert ( "Solo se Permiten tres Docentes como Tribunales!!" );
      } else
        {
            
        var contenido='';
        var conta=0;
        var iddocente=0;
        var tamani=$(this).find('td').length-1;
        $(this).find('td').each(function(){
            if(conta < tamani)
            {
             
                contenido=contenido+'<td>'+$(this).html() +'</td>';
                
           
            }
             else{
             contenido= contenido+'<td> '+'<img src="{$URL}images/remove.png" border="1" alt="Agregar" width="30">'+'</td>';
            }
  
         conta++;
        });
        var docenteId = $(this).find("td:first").text(); 

        var fila=     $(this).html();
         $("#"+docenteId).remove(); 
                                 $.ajax({
				url: 'verificar.php',
				type: "GET",
				data: "id="+docenteId,
				success: function(datos){
                               
                               if(datos=="1")
                               {
                                   
  
                      
                                    $("#asignados").append('<tr id="'+docenteId+'" >' +contenido + '</tr>');
                                    
                                    $("#"+docenteId).remove(); 
                                        
                               }else
                               {
                                   alert(datos);
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
 var docenteId =parseInt($(this).find("td:first").text()); 
        var contenido='';
        var conta=0;
        var tamani=$(this).find('td').length-1;
        $(this).find('td').each(function(){
            if(conta < tamani)
            {
                  
                 contenido=contenido+'<td>'+$(this).html()+'</td>';
            
            }
             else{
             contenido= contenido+'<td>'+'<img src="{$URL}images/add.png" border="1" alt="Agregar" width="30">'+'</td>';
            }
  
         conta++;
        });
      
      $("#docentes tbody").append('<tr class="selectable" id="'+docenteId+'" >' +contenido + '</tr>');
    
      $(this).remove();
      return false;
    });
  });


</script>

      </div>     
        <p>{$ERROR}</p>
  
